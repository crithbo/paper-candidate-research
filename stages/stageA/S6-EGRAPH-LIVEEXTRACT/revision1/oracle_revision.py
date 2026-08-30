"""Exact small-object oracle for the frozen natural Stage A revision."""

from __future__ import annotations

import heapq
import itertools
from dataclasses import dataclass
from typing import Dict, Mapping, Sequence, Tuple


@dataclass(frozen=True)
class Node:
    node_id: str
    eclass: str
    children: Tuple[str, ...]
    op: str
    cost: int
    size: int


@dataclass(frozen=True)
class Extraction:
    selected: Tuple[Tuple[str, str], ...]
    reachable: Tuple[str, ...]
    static_cost: int
    one_shot_peak: int

    @property
    def signature(self) -> str:
        return ";".join(f"{c}={n}" for c, n in self.selected)


def parse_projection(raw: Mapping) -> Tuple[Dict[str, Tuple[Node, ...]], Tuple[str, ...]]:
    classes: Dict[str, Tuple[Node, ...]] = {}
    for eclass, values in raw["classes"].items():
        classes[eclass] = tuple(
            Node(
                node_id=value["id"],
                eclass=eclass,
                children=tuple(value["children"]),
                op=value["op"],
                cost=int(value["cost_milli"]),
                size=int(value["output_bytes"]),
            )
            for value in values
        )
    roots = tuple(raw["roots"])
    validate_projection(classes, roots)
    return classes, roots


def validate_projection(classes: Mapping[str, Sequence[Node]], roots: Sequence[str]) -> None:
    if not roots or len(set(roots)) != len(roots):
        raise ValueError("roots must be nonempty and unique")
    if any(root not in classes for root in roots):
        raise ValueError("missing root")
    graph = {c: set() for c in classes}
    for eclass, nodes in classes.items():
        if not nodes:
            raise ValueError(f"empty eclass {eclass}")
        seen = set()
        vector_flags = set()
        for node in nodes:
            if node.node_id in seen or node.eclass != eclass:
                raise ValueError("node identity violation")
            seen.add(node.node_id)
            if node.cost < 0 or node.size < 0:
                raise ValueError("negative mapping")
            if not node.children and (node.cost != 0 or node.size != 0):
                raise ValueError("external leaves must be free and unmaterialized")
            if node.children and node.size not in (4, 16):
                raise ValueError("invalid mapped output size")
            vector_flags.add(node.size == 16 if node.children else None)
            for child in node.children:
                if child not in classes:
                    raise ValueError(f"missing child eclass {child}")
                graph[eclass].add(child)
        nonleaf_flags = {x for x in vector_flags if x is not None}
        if len(nonleaf_flags) > 1:
            raise ValueError(f"inconsistent output type in eclass {eclass}")

    visiting, done = set(), set()
    def visit(c: str) -> None:
        if c in visiting:
            raise ValueError("projection union graph is cyclic")
        if c in done:
            return
        visiting.add(c)
        for child in graph[c]:
            visit(child)
        visiting.remove(c)
        done.add(c)
    for c in classes:
        visit(c)


def _closure(selected: Mapping[str, Node], roots: Sequence[str]) -> Tuple[str, ...]:
    seen, stack = set(), list(roots)
    while stack:
        eclass = stack.pop()
        if eclass in seen:
            continue
        seen.add(eclass)
        stack.extend(selected[eclass].children)
    return tuple(sorted(seen))


def enumerate_extractions(classes: Mapping[str, Sequence[Node]], roots: Sequence[str]) -> list[Extraction]:
    keys = tuple(sorted(classes))
    unique: Dict[str, Extraction] = {}
    for choices in itertools.product(*(classes[k] for k in keys)):
        full = dict(zip(keys, choices))
        reachable = _closure(full, roots)
        selected = {c: full[c] for c in reachable}
        pairs = tuple((c, selected[c].node_id) for c in reachable)
        signature = ";".join(f"{c}={n}" for c, n in pairs)
        if signature in unique:
            continue
        static_cost = sum(node.cost for node in selected.values())
        unique[signature] = Extraction(
            selected=pairs,
            reachable=reachable,
            static_cost=static_cost,
            one_shot_peak=exact_one_shot_peak(selected, roots),
        )
    return [unique[k] for k in sorted(unique)]


def selected_map(classes: Mapping[str, Sequence[Node]], extraction: Extraction) -> Dict[str, Node]:
    by_id = {node.node_id: node for nodes in classes.values() for node in nodes}
    return {c: by_id[node_id] for c, node_id in extraction.selected}


def exact_one_shot_peak(selected: Mapping[str, Node], roots: Sequence[str]) -> int:
    nonleaf = tuple(sorted(c for c, node in selected.items() if node.children))
    nonleaf_set = set(nonleaf)
    deps = {c: {x for x in selected[c].children if x in nonleaf_set} for c in nonleaf}
    parents = {c: set() for c in nonleaf}
    for parent, children in deps.items():
        for child in children:
            parents[child].add(parent)
    roots_set = set(roots)
    best = None

    def visit(done: frozenset[str], peak: int) -> None:
        nonlocal best
        if best is not None and peak >= best:
            return
        if len(done) == len(nonleaf):
            best = peak if best is None else min(best, peak)
            return
        resident = {
            c for c in done
            if c not in roots_set and any(parent not in done for parent in parents[c])
        }
        resident_bytes = sum(selected[c].size for c in resident)
        for c in sorted(x for x in nonleaf if x not in done and deps[x] <= done):
            visit(done | {c}, max(peak, resident_bytes + selected[c].size))

    visit(frozenset(), 0)
    if best is None:
        raise ValueError("no legal one-shot schedule")
    return best


def exact_schedule(selected: Mapping[str, Node], roots: Sequence[str], budget: int) -> Mapping | None:
    nonleaf = tuple(sorted(c for c, node in selected.items() if node.children))
    index = {c: i for i, c in enumerate(nonleaf)}
    root_index = {c: i for i, c in enumerate(roots)}
    all_roots = (1 << len(roots)) - 1
    start_state = (0, 0)
    best = {start_state: (0, 0, ())}
    queue = [(0, 0, (), start_state)]
    explored = 0

    while queue:
        cost, computes, actions, state = heapq.heappop(queue)
        score = (cost, computes, actions)
        if best.get(state) != score:
            continue
        explored += 1
        emitted, resident_mask = state
        if emitted == all_roots:
            replay = replay_schedule(selected, roots, actions)
            if replay["peak_live_bytes"] > budget or replay["total_target_operation_millicost"] != cost:
                raise AssertionError("internal replay mismatch")
            return {**replay, "explored_schedule_states": explored, "actions": list(actions)}

        resident = {c for c, i in index.items() if resident_mask & (1 << i)}
        resident_bytes = sum(selected[c].size for c in resident)
        for c in nonleaf:
            node = selected[c]
            if c in resident or (c in root_index and emitted & (1 << root_index[c])):
                continue
            if any(child in index and child not in resident for child in node.children):
                continue
            if resident_bytes + node.size > budget:
                continue
            if c in root_index:
                next_state = (emitted | (1 << root_index[c]), resident_mask)
            else:
                next_state = (emitted, resident_mask | (1 << index[c]))
            action = f"C:{c}"
            next_score = (cost + node.cost, computes + 1, actions + (action,))
            if next_score < best.get(next_state, (10**18, 10**18, ("~",))):
                best[next_state] = next_score
                heapq.heappush(queue, (*next_score, next_state))

        for c in sorted(resident):
            next_state = (emitted, resident_mask & ~(1 << index[c]))
            next_score = (cost, computes, actions + (f"D:{c}",))
            if next_score < best.get(next_state, (10**18, 10**18, ("~",))):
                best[next_state] = next_score
                heapq.heappush(queue, (*next_score, next_state))
    return None


def replay_schedule(selected: Mapping[str, Node], roots: Sequence[str], actions: Sequence[str]) -> dict:
    resident, emitted = set(), set()
    roots_set = set(roots)
    peak = total = deletes = 0
    counts = {c: 0 for c, node in selected.items() if node.children}
    for action in actions:
        kind, c = action.split(":", 1)
        if kind == "D":
            if c not in resident:
                raise ValueError("delete of nonresident value")
            resident.remove(c)
            deletes += 1
            continue
        if kind != "C" or c in resident or c in emitted:
            raise ValueError("invalid compute action")
        node = selected[c]
        if any(selected[ch].children and ch not in resident for ch in node.children):
            raise ValueError("missing resident child")
        peak = max(peak, sum(selected[x].size for x in resident) + node.size)
        total += node.cost
        counts[c] += 1
        if c in roots_set:
            emitted.add(c)
        else:
            resident.add(c)
    if emitted != roots_set:
        raise ValueError("not all roots emitted")
    computes = sum(counts.values())
    distinct = sum(v > 0 for v in counts.values())
    return {
        "peak_live_bytes": peak,
        "total_target_operation_millicost": total,
        "emitted_operations": computes,
        "materializations": computes - len(emitted),
        "deletions": deletes,
        "recomputations": computes - distinct,
    }
