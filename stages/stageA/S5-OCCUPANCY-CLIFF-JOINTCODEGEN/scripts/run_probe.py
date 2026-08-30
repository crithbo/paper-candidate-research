#!/usr/bin/env python3
"""Stage A static scheduling/register-pressure probe.

This is deliberately a MIR-excerpt analytical model, not LLVM code generation.
It parses virtual-register SSA dependencies and compares deterministic orderings.
"""

from __future__ import annotations

import argparse
import hashlib
import heapq
import json
import math
import re
import time
from collections import Counter
from dataclasses import dataclass
from pathlib import Path


VREG = re.compile(r"%(\d+)")
DEF = re.compile(r"^\s*%(\d+)(?:\.[A-Za-z0-9_]+)?(?::([A-Za-z0-9_]+))?\s*=\s*([A-Z][A-Z0-9_]*)\s*(.*)$")

TIER_CAPS = {
    8: {"SGPR": 12, "VGPR": 4, "AGPR": 4},
    4: {"SGPR": 20, "VGPR": 8, "AGPR": 8},
    2: {"SGPR": 32, "VGPR": 16, "AGPR": 16},
    1: {"SGPR": 10**9, "VGPR": 10**9, "AGPR": 10**9},
}
SPILL_CAPS = {"SGPR": 24, "VGPR": 12, "AGPR": 12}


@dataclass(frozen=True)
class Node:
    idx: int
    text: str
    opcode: str
    define: str | None
    bank: str | None
    units: int
    uses: tuple[str, ...]
    deps: tuple[int, ...]
    latency: int


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def bank_units(regclass: str | None) -> tuple[str | None, int]:
    if not regclass:
        return None, 0
    low = regclass.lower()
    if "agpr" in low:
        bank = "AGPR"
    elif "vgpr" in low or "vreg" in low:
        bank = "VGPR"
    elif "sgpr" in low or "sreg" in low:
        bank = "SGPR"
    else:
        return None, 0
    widths = re.findall(r"(32|64|128|256|512|1024)", low)
    return bank, max(1, int(widths[-1]) // 32) if widths else 1


def latency(opcode: str) -> int:
    if "LOAD" in opcode:
        return 6
    if "RCP" in opcode:
        return 8
    if "READFIRSTLANE" in opcode:
        return 4
    if "MUL" in opcode:
        return 3
    if "CVT" in opcode or "CMP" in opcode:
        return 2
    return 1


def parse_mir(path: Path) -> list[Node]:
    lines = path.read_text(encoding="utf-8").splitlines()
    in_body = False
    raw: list[tuple[str, str | None, str | None, int, tuple[str, ...], str]] = []
    for line in lines:
        if line.startswith("body:"):
            in_body = True
            continue
        if not in_body or not line.strip() or line.lstrip().startswith(("#", ";")):
            continue
        stripped = line.strip()
        if stripped in {"bb.0:", "..."} or stripped.startswith("liveins:"):
            continue
        match = DEF.match(line)
        if match:
            define = match.group(1)
            regclass = match.group(2)
            opcode = match.group(3)
            tail = match.group(4)
        else:
            define = None
            regclass = None
            parts = stripped.split()
            if "=" in parts:
                eq = parts.index("=")
                opcode = parts[eq + 1] if eq + 1 < len(parts) else "UNKNOWN"
                tail = " ".join(parts[eq + 2 :])
            else:
                opcode = parts[0]
                tail = " ".join(parts[1:])
        uses = tuple(VREG.findall(tail))
        bank, units = bank_units(regclass)
        raw.append((opcode, define, bank, units, uses, stripped))

    def_to_node: dict[str, int] = {}
    nodes: list[Node] = []
    last_side_effect: int | None = None
    for idx, (opcode, define, bank, units, uses, text) in enumerate(raw):
        deps = {def_to_node[u] for u in uses if u in def_to_node}
        side_effect = any(token in opcode for token in ("STORE", "ENDPGM")) or text.startswith("$exec")
        if side_effect and last_side_effect is not None:
            deps.add(last_side_effect)
        nodes.append(Node(idx, text, opcode, define, bank, units, uses, tuple(sorted(deps)), latency(opcode)))
        if define is not None:
            def_to_node[define] = idx
        if side_effect:
            last_side_effect = idx
    if not nodes:
        raise ValueError(f"no instructions parsed from {path}")
    return nodes


def ready_nodes(nodes: list[Node], scheduled: frozenset[int]) -> list[int]:
    return [n.idx for n in nodes if n.idx not in scheduled and all(d in scheduled for d in n.deps)]


def evaluate(nodes: list[Node], order: tuple[int, ...]) -> dict:
    remaining_uses = Counter(u for n in nodes for u in n.uses)
    live: dict[str, tuple[str, int]] = {}
    peaks = {"SGPR": 0, "VGPR": 0, "AGPR": 0}
    ready_time: dict[int, int] = {}
    issue_cursor = 0
    finish = 0
    for idx in order:
        n = nodes[idx]
        dep_ready = max((ready_time[d] for d in n.deps), default=0)
        issue = max(issue_cursor, dep_ready)
        ready_time[idx] = issue + n.latency
        issue_cursor = issue + 1
        finish = max(finish, ready_time[idx])
        if n.define is not None and n.bank is not None and remaining_uses[n.define] > 0:
            live[n.define] = (n.bank, n.units)
        for use in n.uses:
            remaining_uses[use] -= 1
            if remaining_uses[use] <= 0:
                live.pop(use, None)
        pressure = {b: sum(u for bank, u in live.values() if bank == b) for b in peaks}
        for b in peaks:
            peaks[b] = max(peaks[b], pressure[b])
    tier = max(t for t, caps in TIER_CAPS.items() if all(peaks[b] <= caps[b] for b in peaks))
    spills = sum(max(0, peaks[b] - SPILL_CAPS[b]) for b in peaks)
    return {"tier": tier, "peak": peaks, "spill_units": spills, "cycle_proxy": finish}


def original_order(nodes: list[Node]) -> tuple[int, ...]:
    return tuple(n.idx for n in nodes)


def greedy_pressure_order(nodes: list[Node]) -> tuple[int, ...]:
    order: tuple[int, ...] = ()
    scheduled: frozenset[int] = frozenset()
    while len(order) < len(nodes):
        candidates = ready_nodes(nodes, scheduled)
        if not candidates:
            raise ValueError("cyclic dependency graph")
        scored = []
        for idx in candidates:
            metric = evaluate(nodes, order + (idx,))
            score = (-metric["tier"], metric["spill_units"], sum(metric["peak"].values()), metric["cycle_proxy"], idx)
            scored.append((score, idx))
        idx = min(scored)[1]
        order += (idx,)
        scheduled = frozenset(order)
    return order


def frontier_order(nodes: list[Node], expansion_budget: int, beam_width: int) -> tuple[tuple[int, ...], dict]:
    start_ns = time.perf_counter_ns()
    frontier: list[tuple[int, ...]] = [()]
    expansions = 0
    max_frontier = 1
    exhausted = False
    while frontier and len(frontier[0]) < len(nodes):
        next_by_set: dict[frozenset[int], tuple[tuple, tuple[int, ...]]] = {}
        for order in frontier:
            scheduled = frozenset(order)
            for idx in ready_nodes(nodes, scheduled):
                if expansions >= expansion_budget:
                    exhausted = True
                    break
                child = order + (idx,)
                metric = evaluate(nodes, child)
                score = (-metric["tier"], metric["spill_units"], metric["cycle_proxy"], sum(metric["peak"].values()), child)
                key = frozenset(child)
                old = next_by_set.get(key)
                if old is None or score < old[0]:
                    next_by_set[key] = (score, child)
                expansions += 1
            if exhausted:
                break
        if not next_by_set:
            break
        frontier = [item[1] for item in heapq.nsmallest(beam_width, next_by_set.values(), key=lambda x: x[0])]
        max_frontier = max(max_frontier, len(frontier))
        if exhausted:
            break

    best = min(frontier, key=lambda o: (-evaluate(nodes, o)["tier"], evaluate(nodes, o)["spill_units"], evaluate(nodes, o)["cycle_proxy"]))
    if len(best) < len(nodes):
        scheduled = frozenset(best)
        order = best
        while len(order) < len(nodes):
            candidates = ready_nodes(nodes, scheduled)
            idx = min(candidates, key=lambda i: (-evaluate(nodes, order + (i,))["tier"], evaluate(nodes, order + (i,))["spill_units"], evaluate(nodes, order + (i,))["cycle_proxy"], i))
            order += (idx,)
            scheduled = frozenset(order)
        best = order
    elapsed_ms = (time.perf_counter_ns() - start_ns) / 1e6
    return best, {"expansions": expansions, "beam_width": beam_width, "budget_exhausted": exhausted, "max_frontier": max_frontier, "elapsed_ms": elapsed_ms}


def run_case(path: Path, candidate_budget: int, ceiling_budget: int) -> dict:
    nodes = parse_mir(path)
    methods: dict[str, dict] = {}
    for name, build in (("input_order_staged_proxy", original_order), ("pressure_list_proxy", greedy_pressure_order)):
        start = time.perf_counter_ns()
        order = build(nodes)
        cost_ms = (time.perf_counter_ns() - start) / 1e6
        methods[name] = {**evaluate(nodes, order), "order": list(order), "search": {"elapsed_ms": cost_ms}}
    candidate, search = frontier_order(nodes, candidate_budget, beam_width=8)
    methods["tier_frontier_candidate"] = {**evaluate(nodes, candidate), "order": list(candidate), "search": search}
    ceiling, ceiling_search = frontier_order(nodes, ceiling_budget, beam_width=64)
    methods["offline_beam_ceiling_8x"] = {**evaluate(nodes, ceiling), "order": list(ceiling), "search": ceiling_search}
    base = methods["input_order_staged_proxy"]
    cand = methods["tier_frontier_candidate"]
    ceiling_m = methods["offline_beam_ceiling_8x"]
    return {
        "source": str(path.as_posix()),
        "source_sha256": sha256(path),
        "instruction_count": len(nodes),
        "methods": methods,
        "candidate_vs_input_proxy": {
            "tier_delta": cand["tier"] - base["tier"],
            "spill_delta": cand["spill_units"] - base["spill_units"],
            "cycle_proxy_delta": cand["cycle_proxy"] - base["cycle_proxy"],
            "non_dominated": cand["tier"] >= base["tier"] and cand["spill_units"] <= base["spill_units"] and cand["cycle_proxy"] <= base["cycle_proxy"] and (cand["tier"], -cand["spill_units"], -cand["cycle_proxy"]) != (base["tier"], -base["spill_units"], -base["cycle_proxy"]),
            "matches_ceiling_tier": cand["tier"] == ceiling_m["tier"],
        },
    }


def deterministic_projection(result: dict) -> dict:
    clone = json.loads(json.dumps(result))
    for case in clone["cases"]:
        for method in case["methods"].values():
            method["search"].pop("elapsed_ms", None)
    return clone


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--inputs", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--candidate-budget", type=int, default=4096)
    parser.add_argument("--ceiling-budget", type=int, default=32768)
    args = parser.parse_args()
    cases = [run_case(p, args.candidate_budget, args.ceiling_budget) for p in sorted(args.inputs.glob("*.mir"))]
    result = {
        "schema": "s5-stagea-static-probe-v1",
        "evidence_class": "ANALYTICAL_SOFTWARE_MIR_EXCERPT_MODEL",
        "claim_ceiling": "STATIC_MODEL_ONLY_NOT_LLVM_NOT_GPU",
        "candidate_expansion_budget": args.candidate_budget,
        "ceiling_expansion_budget": args.ceiling_budget,
        "tier_caps_are_normalized_not_hardware_limits": TIER_CAPS,
        "cases": cases,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    projection_hash = hashlib.sha256(json.dumps(deterministic_projection(result), sort_keys=True).encode()).hexdigest()
    print(json.dumps({"output": str(args.output), "case_count": len(cases), "deterministic_projection_sha256": projection_hash}))


if __name__ == "__main__":
    main()
