from __future__ import annotations

import argparse
from collections import Counter, defaultdict
import hashlib
import heapq
import json
import math
from pathlib import Path
import shutil
import statistics
import sys
import time
import tracemalloc

from git_pack_lib import (
    ProcessFailure,
    batch_access_timing,
    current_process_peak_rss_bytes,
    custom_pack_bytes,
    deterministic_sample,
    directory_bytes,
    git_run,
    git_text,
    git_native_zlib_compress,
    make_git_2_55_delta,
    read_batch_objects,
    reconstruction_span,
    sha256_bytes,
    sha256_file,
    write_json,
)


MAX_WORKSPACE_BYTES = 4 * 1024 * 1024 * 1024
MAX_CPU_SECONDS = 4 * 60 * 60
MAX_CANDIDATE_OBJECTS = 64
MAX_DEPTH = 8
EDGE_CAP = 6
PACK_TIMEOUT = 300
RANDOM_ACCESS_COUNT = 48
ROOT_NODE = "__SUPER_ROOT__"


GIT_CONFIGURATIONS = [
    ("git_default_reuse", []),
    ("git_default_no_reuse", ["--no-reuse-object"]),
    ("git_w20_d50_m64", ["--no-reuse-object", "--window=20", "--depth=50", "--window-memory=64m"]),
    ("git_w40_d50_m64", ["--no-reuse-object", "--window=40", "--depth=50", "--window-memory=64m"]),
    ("git_w80_d50_m64", ["--no-reuse-object", "--window=80", "--depth=50", "--window-memory=64m"]),
    ("git_namehash_v1", ["--no-reuse-object", "--name-hash-version=1"]),
    ("git_namehash_v2", ["--no-reuse-object", "--name-hash-version=2"]),
    ("git_pathwalk_nhv1", ["--no-reuse-object", "--path-walk", "--name-hash-version=1"]),
    ("git_pathwalk_nhv2", ["--no-reuse-object", "--path-walk", "--name-hash-version=2"]),
    ("git_islands_single_ref", ["--no-reuse-object", "--delta-islands"]),
]


def load_manifest(root: Path, lock: dict) -> list[dict]:
    path = root / lock["manifest_path"]
    rows = [json.loads(line) for line in path.read_text(encoding="utf-8").splitlines() if line]
    if sha256_file(path) != lock["manifest_sha256"]:
        raise ProcessFailure(f"manifest hash mismatch: {path}")
    return rows


def content_tokens(data: bytes) -> set[bytes]:
    if len(data) < 32:
        return set()
    return {
        hashlib.blake2b(data[offset : offset + 32], digest_size=8).digest()
        for offset in range(0, len(data) - 31, 64)
    }


def representation_costs(objects: dict[str, dict]) -> dict[str, int]:
    return {
        oid: len(git_native_zlib_compress(obj["content"], 6)) + 8
        for oid, obj in objects.items()
    }


def build_candidate_graph(objects: dict[str, dict], manifest: dict[str, dict]) -> tuple[list[dict], list[str], dict]:
    started_wall = time.perf_counter()
    started_cpu = time.process_time()
    eligible = [
        oid
        for oid, obj in objects.items()
        if obj["type"] == "blob" and 64 <= obj["size"] <= 131072
    ]
    tokens = {oid: content_tokens(objects[oid]["content"]) for oid in eligible}
    postings: dict[bytes, list[str]] = defaultdict(list)
    for oid, values in tokens.items():
        for token in values:
            postings[token].append(oid)
    collision_score = {
        oid: sum(max(0, len(postings[token]) - 1) for token in values)
        for oid, values in tokens.items()
    }
    chosen = sorted(
        eligible,
        key=lambda oid: (-collision_score[oid], manifest[oid].get("path") or "", oid),
    )[:MAX_CANDIDATE_OBJECTS]
    chosen_set = set(chosen)
    shared: dict[tuple[str, str], int] = Counter()
    for token, members in postings.items():
        members = sorted(chosen_set.intersection(members))
        for target in members:
            for base in members:
                if target != base:
                    shared[(base, target)] += 1
    full_cost = representation_costs({oid: objects[oid] for oid in chosen})
    edges: list[dict] = []
    for target in chosen:
        ranked_bases = sorted(
            (base for base in chosen if base != target and shared[(base, target)] > 0),
            key=lambda base: (-shared[(base, target)], base),
        )[:EDGE_CAP]
        for base in ranked_bases:
            delta = make_git_2_55_delta(objects[base]["content"], objects[target]["content"])
            delta_cost = len(git_native_zlib_compress(delta, 6)) + 28
            saving = full_cost[target] - delta_cost
            if saving > 0:
                edges.append(
                    {
                        "base": base,
                        "target": target,
                        "delta_cost": delta_cost,
                        "full_cost": full_cost[target],
                        "saving": saving,
                        "shared_blocks": shared[(base, target)],
                    }
                )
    metrics = {
        "eligible_object_count": len(eligible),
        "selected_candidate_object_count": len(chosen),
        "useful_directed_edge_count": len(edges),
        "wall_seconds": time.perf_counter() - started_wall,
        "cpu_seconds": time.process_time() - started_cpu,
    }
    return edges, chosen, metrics


def edge_maps(edges: list[dict]) -> tuple[dict[str, list[dict]], dict[tuple[str, str], dict]]:
    incoming: dict[str, list[dict]] = defaultdict(list)
    lookup: dict[tuple[str, str], dict] = {}
    for edge in edges:
        incoming[edge["target"]].append(edge)
        lookup[(edge["base"], edge["target"])] = edge
    for target in incoming:
        incoming[target].sort(key=lambda edge: (-edge["saving"], edge["base"]))
    return incoming, lookup


def simple_order(objects: dict[str, dict], manifest: dict[str, dict]) -> list[str]:
    return sorted(
        objects,
        key=lambda oid: (
            objects[oid]["type"],
            manifest[oid].get("path") or "~" + oid,
            -objects[oid]["size"],
            oid,
        ),
    )


def simple_prior_forest(order: list[str], edges: list[dict]) -> dict[str, str | None]:
    incoming, _ = edge_maps(edges)
    parents: dict[str, str | None] = {oid: None for oid in order}
    depths = {oid: 0 for oid in order}
    placed = set()
    for target in order:
        for edge in incoming.get(target, []):
            if edge["base"] in placed and depths[edge["base"]] < MAX_DEPTH:
                parents[target] = edge["base"]
                depths[target] = depths[edge["base"]] + 1
                break
        placed.add(target)
    return parents


def _find_cycle(parents: dict[str, str | None], nodes: set[str], root: str) -> list[str] | None:
    globally_seen: set[str] = set()
    for start in nodes:
        if start == root or start in globally_seen:
            continue
        trail: list[str] = []
        position: dict[str, int] = {}
        node: str | None = start
        while node is not None and node != root and node not in globally_seen:
            if node in position:
                return trail[position[node] :]
            position[node] = len(trail)
            trail.append(node)
            node = parents.get(node)
        globally_seen.update(trail)
    return None


def edmonds_max_branching(nodes: set[str], weighted_edges: list[dict], root: str) -> list[dict]:
    incoming: dict[str, list[dict]] = defaultdict(list)
    for edge in weighted_edges:
        if edge["target"] != root:
            incoming[edge["target"]].append(edge)
    chosen: dict[str, dict] = {}
    for node in nodes:
        if node == root:
            continue
        choices = incoming[node]
        if not choices:
            raise ProcessFailure(f"no incoming edge for Edmonds node {node}")
        chosen[node] = max(choices, key=lambda edge: (edge["weight"], edge["base"], edge["target"]))
    parents = {node: edge["base"] for node, edge in chosen.items()}
    cycle = _find_cycle(parents, nodes, root)
    if not cycle:
        return list(chosen.values())

    cycle_set = set(cycle)
    contracted = "__CYCLE__" + hashlib.sha256("|".join(sorted(cycle)).encode()).hexdigest()[:16]
    new_nodes = (nodes - cycle_set) | {contracted}
    new_root = contracted if root in cycle_set else root
    new_edges: list[dict] = []
    for edge in weighted_edges:
        base_comp = contracted if edge["base"] in cycle_set else edge["base"]
        target_comp = contracted if edge["target"] in cycle_set else edge["target"]
        if base_comp == target_comp:
            continue
        adjusted = edge["weight"]
        if edge["target"] in cycle_set:
            adjusted -= chosen[edge["target"]]["weight"]
        new_edges.append(
            {
                "base": base_comp,
                "target": target_comp,
                "weight": adjusted,
                "origin": edge,
                "enter_target": edge["target"],
            }
        )
    selected_contracted = edmonds_max_branching(new_nodes, new_edges, new_root)
    selected = list(chosen.values())
    for contracted_edge in selected_contracted:
        origin = contracted_edge.get("origin", contracted_edge)
        target = contracted_edge.get("enter_target", origin["target"])
        if target in chosen:
            selected.remove(chosen[target])
        selected.append(origin)
    return selected


def classic_branching_forest(oids: list[str], edges: list[dict]) -> tuple[dict[str, str | None], dict]:
    nodes = set(oids) | {ROOT_NODE}
    weighted = [
        {"base": ROOT_NODE, "target": oid, "weight": 0, "saving": 0}
        for oid in oids
    ] + [
        {**edge, "weight": edge["saving"]}
        for edge in edges
    ]
    selected = edmonds_max_branching(nodes, weighted, ROOT_NODE)
    parents: dict[str, str | None] = {oid: None for oid in oids}
    savings: dict[tuple[str, str], int] = {}
    for edge in selected:
        if edge["target"] in parents and edge["base"] != ROOT_NODE:
            parents[edge["target"]] = edge["base"]
            savings[(edge["base"], edge["target"])] = int(edge["saving"])

    cuts = 0
    while True:
        violating_path = None
        for node in oids:
            path = []
            cursor = node
            while parents[cursor] is not None:
                parent = parents[cursor]
                assert parent is not None
                path.append((parent, cursor))
                cursor = parent
                if len(path) > MAX_DEPTH:
                    violating_path = path
                    break
            if violating_path:
                break
        if not violating_path:
            break
        cut = min(violating_path, key=lambda pair: (savings.get(pair, 0), pair))
        parents[cut[1]] = None
        cuts += 1
    return parents, {"depth_repair_cut_count": cuts}


def family_order(
    parents: dict[str, str | None], objects: dict[str, dict], manifest: dict[str, dict], edge_lookup: dict[tuple[str, str], dict]
) -> list[str]:
    children: dict[str, list[str]] = defaultdict(list)
    roots = []
    for child, parent in parents.items():
        if parent is None:
            roots.append(child)
        else:
            children[parent].append(child)

    def key(oid: str) -> tuple:
        parent = parents[oid]
        saving = edge_lookup.get((parent, oid), {}).get("saving", 0) if parent else 0
        return (
            objects[oid]["type"],
            manifest[oid].get("path") or "~" + oid,
            -saving,
            oid,
        )

    for parent in children:
        children[parent].sort(key=key)
    order: list[str] = []

    def visit(node: str) -> None:
        order.append(node)
        for child in children.get(node, []):
            visit(child)

    for root in sorted(roots, key=key):
        visit(root)
    if len(order) != len(parents):
        raise ProcessFailure("family order is not a complete legal topological order")
    return order


def joint_constructor(
    all_order: list[str],
    edges: list[dict],
    objects: dict[str, dict],
    manifest: dict[str, dict],
) -> tuple[dict[str, str | None], list[str], dict]:
    incoming, lookup = edge_maps(edges)
    full_cost = representation_costs(objects)
    order = list(all_order)
    previous_signature = None
    iterations = 0
    locality_lambda = 2.0
    for iteration in range(8):
        positions = {oid: index for index, oid in enumerate(order)}
        parents: dict[str, str | None] = {oid: None for oid in order}
        depths = {oid: 0 for oid in order}
        for target in order:
            best = (full_cost[target], None)
            for edge in incoming.get(target, []):
                base = edge["base"]
                if positions[base] >= positions[target] or depths[base] >= MAX_DEPTH:
                    continue
                locality_cost = locality_lambda * (positions[target] - positions[base])
                score = edge["delta_cost"] + locality_cost
                if (score, base) < (best[0], best[1] or "~"):
                    best = (score, base)
            if best[1] is not None:
                parents[target] = best[1]
                depths[target] = depths[best[1]] + 1

        children: dict[str, list[str]] = defaultdict(list)
        roots = []
        for child, parent in parents.items():
            if parent is None:
                roots.append(child)
            else:
                children[parent].append(child)
        ready: list[tuple[float, str]] = []

        def priority(oid: str) -> float:
            parent = parents[oid]
            own = lookup.get((parent, oid), {}).get("delta_cost", full_cost[oid]) if parent else full_cost[oid]
            unlock = sum(lookup[(oid, child)]["saving"] for child in children.get(oid, []) if (oid, child) in lookup)
            return own - 0.35 * unlock

        for root in roots:
            heapq.heappush(ready, (priority(root), root))
        new_order: list[str] = []
        while ready:
            _, node = heapq.heappop(ready)
            new_order.append(node)
            for child in children.get(node, []):
                heapq.heappush(ready, (priority(child), child))
        if len(new_order) != len(order):
            raise ProcessFailure("joint constructor failed legal-order closure")
        signature = (tuple(sorted((child, parent) for child, parent in parents.items() if parent)), tuple(new_order))
        iterations = iteration + 1
        order = new_order
        if signature == previous_signature:
            break
        previous_signature = signature
    return parents, order, {"iterations": iterations, "locality_lambda": locality_lambda}


def exact_tiny_ceiling(
    nodes: list[str], edges: list[dict], objects: dict[str, dict]
) -> dict:
    # Five nodes keep the exact joint order/parent enumeration bounded while
    # remaining within the preregistered "at most six" ceiling.
    nodes = nodes[:5]
    if len(nodes) < 2:
        return {"node_count": len(nodes), "status": "INSUFFICIENT_GRAPH"}
    node_set = set(nodes)
    incoming, _ = edge_maps([edge for edge in edges if edge["base"] in node_set and edge["target"] in node_set])
    full = representation_costs({oid: objects[oid] for oid in nodes})
    best_cost = math.inf
    best_order = None
    best_parents = None

    def search(order: list[str], remaining: set[str], parents: dict[str, str | None], depths: dict[str, int], cost: float) -> None:
        nonlocal best_cost, best_order, best_parents
        if cost >= best_cost:
            return
        if not remaining:
            best_cost = cost
            best_order = list(order)
            best_parents = dict(parents)
            return
        position = len(order)
        placed_position = {oid: index for index, oid in enumerate(order)}
        for target in sorted(remaining):
            options: list[tuple[float, str | None, int]] = [(full[target], None, 0)]
            for edge in incoming.get(target, []):
                base = edge["base"]
                if base in placed_position and depths[base] < MAX_DEPTH:
                    local = 2.0 * (position - placed_position[base])
                    options.append((edge["delta_cost"] + local, base, depths[base] + 1))
            for increment, parent, depth in sorted(options, key=lambda value: (value[0], value[1] or "")):
                parents[target] = parent
                depths[target] = depth
                search(order + [target], remaining - {target}, parents, depths, cost + increment)
                parents.pop(target, None)
                depths.pop(target, None)

    search([], set(nodes), {}, {}, 0.0)
    return {
        "node_count": len(nodes),
        "status": "EXACT_CEILING_ONLY",
        "objective_cost": best_cost,
        "order": best_order,
        "parents": best_parents,
    }


def parse_verify_pack(git: Path, repo: Path, index_path: Path) -> tuple[dict[str, dict], set[tuple[str, str]]]:
    text = git_text(git, repo, ["verify-pack", "-v", str(index_path)])
    entries: dict[str, dict] = {}
    edges: set[tuple[str, str]] = set()
    for line in text.splitlines():
        parts = line.split()
        if len(parts) < 5 or len(parts[0]) != 40 or parts[1] not in {"commit", "tree", "blob", "tag"}:
            continue
        oid = parts[0]
        entry = {
            "type": parts[1],
            "canonical_size": int(parts[2]),
            "packed_entry_bytes": int(parts[3]),
            "offset": int(parts[4]),
            "parent": None,
        }
        if len(parts) >= 7:
            entry["depth"] = int(parts[5])
            entry["parent"] = parts[6]
            edges.add((parts[6], oid))
        entries[oid] = entry
    return entries, edges


def validate_pack(
    git: Path,
    source_repo: Path,
    commit: str,
    pack: Path,
    index: Path,
    manifest_rows: list[dict],
    validation_root: Path,
) -> dict:
    strict = git_run(git, source_repo, ["index-pack", "--verify", "--strict", str(pack)], timeout=PACK_TIMEOUT)
    validation_repo = validation_root / "verify.git"
    validation_repo.parent.mkdir(parents=True, exist_ok=True)
    if validation_repo.exists():
        raise ProcessFailure(f"immutable validation directory already exists: {validation_repo}")
    git_run(git, validation_root, ["init", "--bare", "--quiet", str(validation_repo)])
    pack_dir = validation_repo / "objects" / "pack"
    pack_copy = pack_dir / pack.name
    index_copy = pack_dir / index.name
    shutil.copy2(pack, pack_copy)
    shutil.copy2(index, index_copy)
    fsck = git_run(git, validation_repo, ["fsck", "--strict", "--no-reflogs", commit], timeout=PACK_TIMEOUT)
    expected = {row["oid"]: row for row in manifest_rows}
    actual = read_batch_objects(git, validation_repo, sorted(expected))
    mismatches = []
    for oid, row in expected.items():
        obj = actual.get(oid)
        if obj is None:
            mismatches.append({"oid": oid, "reason": "MISSING"})
            continue
        canonical = f"{obj['type']} {obj['size']}\0".encode("ascii") + obj["content"]
        actual_sha = sha256_bytes(canonical)
        if obj["type"] != row["type"] or obj["size"] != row["size"] or actual_sha != row["canonical_sha256"]:
            mismatches.append({"oid": oid, "reason": "CANONICAL_MISMATCH", "actual_sha256": actual_sha})
    access_oids = deterministic_sample(expected, RANDOM_ACCESS_COUNT, commit)
    access = batch_access_timing(git, validation_repo, access_oids)
    parsed_entries, parsed_edges = parse_verify_pack(git, validation_repo, index_copy)
    if len(parsed_entries) != len(expected):
        mismatches.append({"reason": "PACK_OBJECT_COUNT", "expected": len(expected), "actual": len(parsed_entries)})
    span_entries = {
        oid: {"offset": entry["offset"], "parent": entry.get("parent")}
        for oid, entry in parsed_entries.items()
    }
    return {
        "index_pack_verify_strict_exit": strict["exit_code"],
        "fsck_strict_exit": fsck["exit_code"],
        "strict_verification_wall_seconds": strict["wall_seconds"] + fsck["wall_seconds"],
        "strict_verification_child_cpu_seconds": (strict["child_cpu_seconds"] or 0) + (fsck["child_cpu_seconds"] or 0),
        "strict_verification_peak_rss_bytes": max(strict["peak_rss_bytes"], fsck["peak_rss_bytes"]),
        "canonical_equality_mismatch_count": len(mismatches),
        "canonical_equality_mismatches": mismatches[:20],
        "object_count": len(parsed_entries),
        "delta_edge_count": len(parsed_edges),
        "access": access,
        "reconstruction_span": reconstruction_span(span_entries),
        "observed_edges": sorted([list(edge) for edge in parsed_edges]),
    }


def git_pack_method(
    git: Path,
    repo: Path,
    commit: str,
    method_dir: Path,
    method_name: str,
    options: list[str],
) -> tuple[Path, Path, dict]:
    method_dir.mkdir(parents=True, exist_ok=False)
    prefix = method_dir / "pack"
    config = ["-c", "pack.island=refs/stagea/.*"] if "--delta-islands" in options else []
    run = git_run(
        git,
        repo,
        [
            *config,
            "pack-objects",
            "--revs",
            "--delta-base-offset",
            "--compression=6",
            *options,
            str(prefix),
        ],
        input_bytes=(commit + "\n").encode("ascii"),
        timeout=PACK_TIMEOUT,
    )
    pack_hash = run["stdout"].decode("ascii", "replace").strip().splitlines()[-1]
    pack = method_dir / f"pack-{pack_hash}.pack"
    index = method_dir / f"pack-{pack_hash}.idx"
    if not pack.exists() or not index.exists():
        raise ProcessFailure(f"pack-objects output missing for {method_name}")
    return pack, index, run


def custom_pack_method(
    git: Path,
    repo: Path,
    method_dir: Path,
    order: list[str],
    objects: dict[str, dict],
    parents: dict[str, str | None],
) -> tuple[Path, Path, dict, dict]:
    method_dir.mkdir(parents=True, exist_ok=False)
    tracemalloc.start()
    started_wall = time.perf_counter()
    started_cpu = time.process_time()
    pack_data, logical_entries = custom_pack_bytes(order, objects, parents)
    pack = method_dir / "candidate.pack"
    pack.write_bytes(pack_data)
    python_pack_cpu_seconds = time.process_time() - started_cpu
    python_tracemalloc_peak_bytes = tracemalloc.get_traced_memory()[1]
    construction = {
        "wall_seconds": time.perf_counter() - started_wall,
        "child_cpu_seconds": python_pack_cpu_seconds,
        "peak_rss_bytes": current_process_peak_rss_bytes(),
        "python_pack_cpu_seconds": python_pack_cpu_seconds,
        "python_tracemalloc_peak_bytes": python_tracemalloc_peak_bytes,
        "command": ["python-internal", "custom_pack_bytes"],
    }
    tracemalloc.stop()
    indexed = git_run(git, repo, ["index-pack", "--strict", str(pack)], timeout=PACK_TIMEOUT)
    construction["wall_seconds"] += indexed["wall_seconds"]
    construction["child_cpu_seconds"] += indexed["child_cpu_seconds"] or 0
    construction["peak_rss_bytes"] = max(
        construction["peak_rss_bytes"], indexed["peak_rss_bytes"]
    )
    construction["index_construction_wall_seconds"] = indexed["wall_seconds"]
    construction["index_construction_child_cpu_seconds"] = indexed["child_cpu_seconds"] or 0
    construction["index_construction_peak_rss_bytes"] = indexed["peak_rss_bytes"]
    index = pack.with_suffix(".idx")
    if not index.exists():
        raise ProcessFailure(f"index-pack did not create {index}")
    return pack, index, construction, logical_entries


def method_record(
    name: str,
    kind: str,
    pack: Path,
    index: Path,
    construction: dict,
    validation: dict,
    extra: dict | None = None,
) -> dict:
    record = {
        "method": name,
        "kind": kind,
        "pack_bytes": pack.stat().st_size,
        "index_bytes": index.stat().st_size,
        "pack_plus_index_bytes": pack.stat().st_size + index.stat().st_size,
        "pack_sha256": sha256_file(pack),
        "index_sha256": sha256_file(index),
        "construction_wall_seconds": construction["wall_seconds"],
        "construction_child_cpu_seconds": construction.get("child_cpu_seconds"),
        "construction_peak_rss_bytes": construction.get("peak_rss_bytes", 0),
        "construction_python_pack_cpu_seconds": construction.get("python_pack_cpu_seconds"),
        "construction_python_tracemalloc_peak_bytes": construction.get("python_tracemalloc_peak_bytes"),
        "index_construction_wall_seconds": construction.get("index_construction_wall_seconds"),
        "index_construction_child_cpu_seconds": construction.get("index_construction_child_cpu_seconds"),
        "index_construction_peak_rss_bytes": construction.get("index_construction_peak_rss_bytes"),
        "validation": validation,
    }
    if extra:
        record.update(extra)
    return record


def conservative_action_coverage(
    edge: tuple[str, str],
    union_edges: set[tuple[str, str]],
    objects: dict[str, dict],
    manifest: dict[str, dict],
) -> tuple[bool, str]:
    if edge in union_edges:
        return True, "OBSERVED_UNION_EDGE"
    base, target = edge
    base_path = manifest[base].get("path")
    target_path = manifest[target].get("path")
    if base_path and target_path and base_path == target_path:
        return True, "PATH_WALK_SAME_PATH_SUPERSET"
    proxy_orders = [
        sorted(objects, key=lambda oid: (objects[oid]["type"], -objects[oid]["size"], manifest[oid].get("path") or oid, oid)),
        sorted(objects, key=lambda oid: (objects[oid]["type"], manifest[oid].get("path") or oid, -objects[oid]["size"], oid)),
        sorted(objects, key=lambda oid: (objects[oid]["type"], hashlib.sha1((manifest[oid].get("path") or oid).encode()).digest(), -objects[oid]["size"], oid)),
    ]
    for index, order in enumerate(proxy_orders):
        positions = {oid: position for position, oid in enumerate(order)}
        if abs(positions[base] - positions[target]) <= 80:
            return True, f"CONSERVATIVE_WINDOW80_PROXY_{index + 1}"
    return False, "OUTSIDE_CONSERVATIVE_UNION_SUPERSET"


def quantile(values: list[float], p: float) -> float | None:
    if not values:
        return None
    ordered = sorted(values)
    index = (len(ordered) - 1) * p
    lower = math.floor(index)
    upper = math.ceil(index)
    if lower == upper:
        return ordered[lower]
    return ordered[lower] * (upper - index) + ordered[upper] * (index - lower)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--git", required=True, type=Path)
    parser.add_argument("--root", required=True, type=Path)
    parser.add_argument("--replay", action="store_true")
    parser.add_argument("--native", action="store_true")
    parser.add_argument("--run-label")
    args = parser.parse_args()
    root = args.root.resolve()
    git = args.git.resolve()
    if root.drive.upper() != "D:":
        raise SystemExit(f"write root must be D:, got {root}")
    version = git_text(git, root, ["--version"]).strip()
    if version != "git version 2.55.0.windows.1":
        raise SystemExit(f"Git freeze mismatch: {version}")
    lock_file = root / "inputs" / "corpus.lock.json"
    corpus = json.loads(lock_file.read_text(encoding="utf-8"))
    if not args.native:
        raise SystemExit("formal pilot requires --native Git-2.55 codec parity")
    default_label = "native-replay" if args.replay else "native-initial"
    run_label = args.run_label or default_label
    if not all(character.isalnum() or character in "-_" for character in run_label):
        raise SystemExit(f"invalid immutable run label: {run_label}")
    output_root = root / "work" / run_label
    result_root = root / "results" / run_label
    output_root.mkdir(parents=True, exist_ok=True)
    result_root.mkdir(parents=True, exist_ok=True)
    started_cpu = time.process_time()
    all_results = []
    for repo_index, lock in enumerate(corpus["repositories"], start=1):
        repo_id = lock["id"]
        repo = root / "work" / "repos" / f"{repo_id}.git"
        repo_out = output_root / repo_id
        if repo_out.exists():
            raise ProcessFailure(f"immutable run directory exists: {repo_out}")
        repo_out.mkdir(parents=True)
        rows = load_manifest(root, lock)
        row_map = {row["oid"]: row for row in rows}
        oids = sorted(row_map)
        objects = read_batch_objects(git, repo, oids)
        graph_wall_start = time.perf_counter()
        graph_cpu_start = time.process_time()
        edges, chosen, graph_metrics = build_candidate_graph(objects, row_map)
        graph_metrics["outer_wall_seconds"] = time.perf_counter() - graph_wall_start
        graph_metrics["outer_cpu_seconds"] = time.process_time() - graph_cpu_start
        incoming, edge_lookup = edge_maps(edges)
        base_order = simple_order(objects, row_map)
        methods = []
        union_edges: set[tuple[str, str]] = set()

        for method_name, options in GIT_CONFIGURATIONS:
            method_dir = repo_out / method_name
            try:
                pack, index, construction = git_pack_method(git, repo, lock["commit"], method_dir, method_name, options)
                validation = validate_pack(git, repo, lock["commit"], pack, index, rows, method_dir / "validation")
                record = method_record(method_name, "CURRENT_GIT_UNION", pack, index, construction, validation, {"options": options})
                union_edges.update(tuple(edge) for edge in validation["observed_edges"])
            except ProcessFailure as error:
                record = {"method": method_name, "kind": "CURRENT_GIT_UNION", "status": "INAPPLICABLE_OR_FAILED", "error": str(error), "options": options}
            methods.append(record)

        # Full-object deterministic constructor.
        full_parents = {oid: None for oid in base_order}
        pack, index, construction, logical = custom_pack_method(git, repo, repo_out / "simple_full_objects", base_order, objects, full_parents)
        validation = validate_pack(git, repo, lock["commit"], pack, index, rows, repo_out / "simple_full_objects" / "validation")
        methods.append(method_record("simple_full_objects", "DETERMINISTIC_SIMPLE", pack, index, construction, validation))

        simple_parents = simple_prior_forest(base_order, edges)
        pack, index, construction, logical = custom_pack_method(git, repo, repo_out / "simple_prior", base_order, objects, simple_parents)
        validation = validate_pack(git, repo, lock["commit"], pack, index, rows, repo_out / "simple_prior" / "validation")
        methods.append(method_record("simple_prior", "DETERMINISTIC_SIMPLE", pack, index, construction, validation))
        union_edges.update((parent, child) for child, parent in simple_parents.items() if parent)

        classic_started_wall = time.perf_counter()
        classic_started_cpu = time.process_time()
        classic_parents, classic_meta = classic_branching_forest(base_order, edges)
        classic_order = family_order(classic_parents, objects, row_map, edge_lookup)
        classic_opt_wall = time.perf_counter() - classic_started_wall
        classic_opt_cpu = time.process_time() - classic_started_cpu
        pack, index, construction, logical = custom_pack_method(git, repo, repo_out / "classic_branching", classic_order, objects, classic_parents)
        construction["wall_seconds"] += graph_metrics["wall_seconds"] + classic_opt_wall
        construction["child_cpu_seconds"] += graph_metrics["cpu_seconds"] + classic_opt_cpu
        validation = validate_pack(git, repo, lock["commit"], pack, index, rows, repo_out / "classic_branching" / "validation")
        methods.append(
            method_record(
                "classic_branching",
                "CLASSIC_EDMONDS_GIT_FAMILY_ORDER",
                pack,
                index,
                construction,
                validation,
                {**classic_meta, "optimization_wall_seconds": classic_opt_wall, "optimization_cpu_seconds": classic_opt_cpu},
            )
        )
        union_edges.update((parent, child) for child, parent in classic_parents.items() if parent)

        candidate_started_wall = time.perf_counter()
        candidate_started_cpu = time.process_time()
        candidate_parents, candidate_order, candidate_meta = joint_constructor(base_order, edges, objects, row_map)
        candidate_opt_wall = time.perf_counter() - candidate_started_wall
        candidate_opt_cpu = time.process_time() - candidate_started_cpu
        pack, index, construction, logical = custom_pack_method(git, repo, repo_out / "candidate_joint", candidate_order, objects, candidate_parents)
        construction["wall_seconds"] += graph_metrics["wall_seconds"] + candidate_opt_wall
        construction["child_cpu_seconds"] += graph_metrics["cpu_seconds"] + candidate_opt_cpu
        validation = validate_pack(git, repo, lock["commit"], pack, index, rows, repo_out / "candidate_joint" / "validation")
        candidate_record = method_record(
            "candidate_joint",
            "CANDIDATE_JOINT_FOREST_ORDER",
            pack,
            index,
            construction,
            validation,
            {
                **candidate_meta,
                "optimization_wall_seconds": candidate_opt_wall,
                "optimization_cpu_seconds": candidate_opt_cpu,
                "selected_parent_count": sum(parent is not None for parent in candidate_parents.values()),
                "forest_differs_from_classic": candidate_parents != classic_parents,
                "order_differs_from_classic": candidate_order != classic_order,
            },
        )
        methods.append(candidate_record)

        candidate_selected = [(parent, child) for child, parent in candidate_parents.items() if parent]
        coverage_rows = []
        outside = 0
        for edge in candidate_selected:
            covered, reason = conservative_action_coverage(edge, union_edges, objects, row_map)
            coverage_rows.append({"base": edge[0], "target": edge[1], "covered": covered, "reason": reason})
            if not covered:
                outside += 1
        residual_fraction = outside / len(candidate_selected) if candidate_selected else 0.0
        exact = exact_tiny_ceiling(chosen, edges, objects)

        valid_union = [
            method
            for method in methods
            if method.get("method") != "candidate_joint"
            and method.get("status") != "INAPPLICABLE_OR_FAILED"
            and method["validation"]["canonical_equality_mismatch_count"] == 0
        ]
        best_bytes = min(method["pack_plus_index_bytes"] for method in valid_union)
        best_cold = min(method["validation"]["access"]["cold_process_seconds"] for method in valid_union)
        best_warm = min(method["validation"]["access"]["warm_same_process_seconds"] for method in valid_union)
        size_residual_fraction = (best_bytes - candidate_record["pack_plus_index_bytes"]) / best_bytes
        cold_access_residual_fraction = (best_cold - candidate_record["validation"]["access"]["cold_process_seconds"]) / best_cold
        warm_access_residual_fraction = (best_warm - candidate_record["validation"]["access"]["warm_same_process_seconds"]) / best_warm
        primary_benefit = size_residual_fraction > 0 or cold_access_residual_fraction > 0.05 or warm_access_residual_fraction > 0.05
        correctness_pass = all(
            method.get("status") == "INAPPLICABLE_OR_FAILED"
            or (
                method["validation"]["index_pack_verify_strict_exit"] == 0
                and method["validation"]["fsck_strict_exit"] == 0
                and method["validation"]["canonical_equality_mismatch_count"] == 0
            )
            for method in methods
        )
        repo_result = {
            "repo_id": repo_id,
            "category": lock["category"],
            "commit": lock["commit"],
            "object_count": len(oids),
            "canonical_bytes": lock["canonical_bytes"],
            "graph": graph_metrics,
            "methods": methods,
            "residual": {
                "selected_useful_edge_count": len(candidate_selected),
                "outside_conservative_union_count": outside,
                "outside_fraction": residual_fraction,
                "coverage_rows": coverage_rows,
            },
            "tiny_exact_ceiling": exact,
            "candidate_vs_union": {
                "best_union_pack_plus_index_bytes": best_bytes,
                "size_residual_fraction": size_residual_fraction,
                "best_union_cold_seconds": best_cold,
                "cold_access_residual_fraction": cold_access_residual_fraction,
                "best_union_warm_seconds": best_warm,
                "warm_access_residual_fraction": warm_access_residual_fraction,
                "primary_benefit": primary_benefit,
            },
            "correctness_pass": correctness_pass,
        }
        write_json(result_root / f"{repo_id}.json", repo_result)
        all_results.append(repo_result)
        print(
            f"[{repo_index:02d}/20] {repo_id} edges={len(candidate_selected)} residual={residual_fraction:.3f} "
            f"size={size_residual_fraction:+.4f} cold={cold_access_residual_fraction:+.4f} correct={correctness_pass}",
            flush=True,
        )
        if directory_bytes(root) > MAX_WORKSPACE_BYTES:
            raise ProcessFailure("4 GiB disk budget exceeded")
        if time.process_time() - started_cpu > MAX_CPU_SECONDS:
            raise ProcessFailure("4 CPU-hour budget exceeded")

    residuals = [item["residual"]["outside_fraction"] for item in all_results]
    size_benefits = [item["candidate_vs_union"]["size_residual_fraction"] for item in all_results]
    cold_benefits = [item["candidate_vs_union"]["cold_access_residual_fraction"] for item in all_results]
    warm_benefits = [item["candidate_vs_union"]["warm_access_residual_fraction"] for item in all_results]
    summary = {
        "schema_version": "git-pack-forest-stagea-summary-v1",
        "run": run_label.upper().replace("-", "_"),
        "delta_codec": "GIT_V2_55_0_DIFF_DELTA_SEMANTIC_PORT",
        "delta_source_commit": "e9019fcafe0040228b8631c30f97ae1adb61bcdc",
        "representation_compressor": "GIT_FOR_WINDOWS_2_55_ZLIB1_DLL_1_3_2_LEVEL_6",
        "git_version": version,
        "repository_count": len(all_results),
        "correctness_pass_count": sum(item["correctness_pass"] for item in all_results),
        "candidate_forest_differs_from_classic_count": sum(
            next(method for method in item["methods"] if method["method"] == "candidate_joint")["forest_differs_from_classic"]
            for item in all_results
        ),
        "residual_edge_fraction": {
            "aggregate": sum(item["residual"]["outside_conservative_union_count"] for item in all_results)
            / max(1, sum(item["residual"]["selected_useful_edge_count"] for item in all_results)),
            "p50": quantile(residuals, 0.50),
            "p90": quantile(residuals, 0.90),
        },
        "candidate_vs_union": {
            "size_residual_fraction_p50": quantile(size_benefits, 0.50),
            "size_residual_fraction_p90": quantile(size_benefits, 0.90),
            "cold_access_residual_fraction_p50": quantile(cold_benefits, 0.50),
            "cold_access_residual_fraction_p90": quantile(cold_benefits, 0.90),
            "warm_access_residual_fraction_p50": quantile(warm_benefits, 0.50),
            "warm_access_residual_fraction_p90": quantile(warm_benefits, 0.90),
            "primary_benefit_repo_count": sum(item["candidate_vs_union"]["primary_benefit"] for item in all_results),
        },
        "workspace_bytes": directory_bytes(root),
        "driver_cpu_seconds": time.process_time() - started_cpu,
        "driver_peak_rss_bytes": current_process_peak_rss_bytes(),
    }
    write_json(result_root / "SUMMARY.json", summary)
    print(json.dumps(summary, sort_keys=True), flush=True)
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except Exception as error:
        print(f"PILOT_FAILED: {error}", file=sys.stderr)
        raise
