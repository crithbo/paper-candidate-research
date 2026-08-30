from __future__ import annotations

import argparse
import hashlib
import json
import time
from collections import defaultdict
from decimal import Decimal
from pathlib import Path


EXPECTED_SHA256 = "8301352a6b70d0d79bd0eeecfdff39081e3f565b000ccabc8ba5ca63653b05d8"
EXPECTED_BYTES = 17477
VECTOR_OPS = {"Vec", "LitVec", "VecAdd", "VecMinus", "VecMul", "VecMAC"}


def strongly_connected_components(graph: dict[str, set[str]]) -> list[set[str]]:
    index = 0
    stack: list[str] = []
    on_stack: set[str] = set()
    indices: dict[str, int] = {}
    low: dict[str, int] = {}
    output: list[set[str]] = []

    def visit(v: str) -> None:
        nonlocal index
        indices[v] = low[v] = index
        index += 1
        stack.append(v)
        on_stack.add(v)
        for w in graph.get(v, set()):
            if w not in indices:
                visit(w)
                low[v] = min(low[v], low[w])
            elif w in on_stack:
                low[v] = min(low[v], indices[w])
        if low[v] == indices[v]:
            component = set()
            while True:
                w = stack.pop()
                on_stack.remove(w)
                component.add(w)
                if w == v:
                    break
            output.append(component)

    for v in graph:
        if v not in indices:
            visit(v)
    return output


def project(source: dict) -> dict:
    raw_nodes = source["nodes"]
    malformed = []
    candidates: dict[str, dict] = {}
    for node_id, node in raw_nodes.items():
        expected_class = node_id.rsplit(".", 1)[0]
        if str(node["eclass"]) != expected_class:
            malformed.append(node_id)
            continue
        candidates[node_id] = node

    removed_cycle = []
    removed_missing = []
    while True:
        by_class: dict[str, list[tuple[str, dict, tuple[str, ...]]]] = defaultdict(list)
        available_classes = {str(node["eclass"]) for node in candidates.values()}
        for node_id, node in candidates.items():
            child_classes = []
            missing = False
            for child_id in node.get("children", []):
                # Serialized edges name a canonical node only to identify its
                # e-class.  Removing that representative does not remove the
                # e-class when another representative remains.
                child = raw_nodes.get(child_id)
                if child is None or str(child["eclass"]) not in available_classes:
                    missing = True
                    break
                child_classes.append(str(child["eclass"]))
            if missing:
                removed_missing.append(node_id)
            else:
                by_class[str(node["eclass"])].append((node_id, node, tuple(child_classes)))
        missing_ids = set(candidates) - {nid for rows in by_class.values() for nid, _, _ in rows}
        for nid in missing_ids:
            candidates.pop(nid, None)
        graph = {c: set() for c in by_class}
        for c, rows in by_class.items():
            for _, _, children in rows:
                graph[c].update(ch for ch in children if ch in graph)
        components = strongly_connected_components(graph)
        component_of = {c: comp for comp in components for c in comp}
        bad = set()
        for c, rows in by_class.items():
            comp = component_of[c]
            for node_id, _, children in rows:
                if any(ch == c or (len(comp) > 1 and ch in comp) for ch in children):
                    bad.add(node_id)
        if not bad and not missing_ids:
            break
        for nid in sorted(bad):
            removed_cycle.append(nid)
            candidates.pop(nid, None)

    by_class = defaultdict(list)
    for node_id, node in candidates.items():
        children = tuple(str(raw_nodes[ch]["eclass"]) for ch in node.get("children", []))
        by_class[str(node["eclass"])].append((node_id, node, children))

    roots = tuple(str(x) for x in source["root_eclasses"])
    reachable, stack = set(), list(roots)
    while stack:
        c = stack.pop()
        if c in reachable:
            continue
        if c not in by_class:
            raise ValueError(f"root/closure eclass {c} has no retained nodes")
        reachable.add(c)
        for _, _, children in by_class[c]:
            stack.extend(children)

    classes = {}
    vector_classes = set()
    for c in sorted(reachable):
        rows = by_class[c]
        if any(node["op"] in VECTOR_OPS for _, node, _ in rows):
            vector_classes.add(c)
        mapped = []
        for node_id, node, children in sorted(rows):
            is_leaf = not children
            milli = 0 if is_leaf else int(Decimal(str(node["cost"])) * 1000)
            mapped.append({
                "id": node_id,
                "children": list(children),
                "op": node["op"],
                "source_cost": str(node["cost"]),
                "cost_milli": milli,
                "output_bytes": 0 if is_leaf else (16 if c in vector_classes else 4),
            })
        classes[c] = mapped

    return {
        "schema_version": "natural-diospyros-acyclic-projection-v1",
        "source": {
            "repository_commit": "903ba0f818b50608fe20ae9e0f03c35cb27bc50a",
            "artifact_path": "data/diospyros/simple_vec_add_root_7.json",
            "raw_sha256": EXPECTED_SHA256,
            "raw_bytes": EXPECTED_BYTES,
        },
        "roots": list(roots),
        "mapping": {
            "scalar_bytes": 4,
            "vector_bytes": 16,
            "vector_ops": sorted(VECTOR_OPS),
            "cost_scale": 1000,
            "external_leaf_cost_and_temporary_bytes": 0,
        },
        "projection_audit": {
            "source_nodes": len(raw_nodes),
            "malformed_nodes_removed": sorted(set(malformed)),
            "cycle_nodes_removed": sorted(set(removed_cycle)),
            "missing_dependency_nodes_removed": sorted(set(removed_missing)),
            "retained_eclasses": len(classes),
            "retained_enodes": sum(len(v) for v in classes.values()),
            "vector_eclasses": sorted(vector_classes),
        },
        "classes": classes,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--source", required=True)
    parser.add_argument("--output", required=True)
    args = parser.parse_args()
    source_path, output_path = Path(args.source), Path(args.output)
    raw = source_path.read_bytes()
    if len(raw) != EXPECTED_BYTES or hashlib.sha256(raw).hexdigest() != EXPECTED_SHA256:
        raise ValueError("pinned source byte/hash mismatch")
    started = time.perf_counter()
    payload = project(json.loads(raw))
    payload["nondeterministic_full_cost"] = {"projection_time_ms": round((time.perf_counter() - started) * 1000, 3)}
    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(payload["projection_audit"], sort_keys=True))


if __name__ == "__main__":
    main()
