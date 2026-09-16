"""Exact small-instance oracle for acyclic e-graph live extraction.

Standard-library only.  The implementation is deliberately exponential and is
only suitable for the Stage A bounds frozen in EXPERIMENT_CONTRACT.yaml.
"""

from __future__ import annotations

import heapq
import itertools
from dataclasses import dataclass
from typing import Dict, Iterable, Iterator, List, Mapping, Sequence, Tuple


@dataclass(frozen=True)
class Node:
    node_id: str
    eclass: int
    children: Tuple[int, ...]
    cost: int
    size: int
    op: str


@dataclass(frozen=True)
class Extraction:
    selected: Tuple[Tuple[int, str], ...]
    static_cost: int
    one_shot_peak: int
    reachable: Tuple[int, ...]

    @property
    def signature(self) -> str:
        return ";".join(f"{c}={n}" for c, n in self.selected)


def parse_instance(raw: Mapping) -> Tuple[Dict[int, Tuple[Node, ...]], Tuple[int, ...]]:
    classes: Dict[int, Tuple[Node, ...]] = {}
    for key, vals in raw["classes"].items():
        eclass = int(key)
        nodes = tuple(
            Node(
                node_id=str(v["id"]),
                eclass=eclass,
                children=tuple(int(x) for x in v.get("children", [])),
                cost=int(v["cost"]),
                size=int(v["size"]),
                op=str(v.get("op", v["id"])),
            )
            for v in vals
        )
        classes[eclass] = nodes
    roots = tuple(int(x) for x in raw["roots"])
    validate_graph(classes, roots)
    return classes, roots


def validate_graph(classes: Mapping[int, Sequence[Node]], roots: Sequence[int]) -> None:
    if not roots or len(set(roots)) != len(roots):
        raise ValueError("roots must be nonempty and unique")
    for root in roots:
        if root not in classes:
            raise ValueError(f"missing root eclass {root}")
    for eclass, nodes in classes.items():
        if not nodes:
            raise ValueError(f"empty eclass {eclass}")
        ids = set()
        for node in nodes:
            if node.node_id in ids:
                raise ValueError(f"duplicate node id {node.node_id}")
            ids.add(node.node_id)
            if node.eclass != eclass:
                raise ValueError("node/eclass mismatch")
            if node.cost < 0 or node.size < 0:
                raise ValueError("negative cost or size")
            if not node.children and (node.cost != 0 or node.size != 0):
                raise ValueError("leaves must have zero cost and size")
            for child in node.children:
                if child not in classes:
                    raise ValueError(f"missing child eclass {child}")
                if child >= eclass:
                    raise ValueError("contract requires child rank < parent rank")
    # Roots cannot also be intermediates under the frozen emit-without-residency rule.
    parented = {child for nodes in classes.values() for n in nodes for child in n.children}
    if any(root in parented for root in roots):
        raise ValueError("a root cannot also be an intermediate")


def _closure(selected: Mapping[int, Node], roots: Sequence[int]) -> Tuple[int, ...]:
    seen = set()
    stack = list(roots)
    while stack:
        eclass = stack.pop()
        if eclass in seen:
            continue
        seen.add(eclass)
        stack.extend(selected[eclass].children)
    return tuple(sorted(seen))


def enumerate_extractions(classes: Mapping[int, Sequence[Node]], roots: Sequence[int]) -> List[Extraction]:
    keys = tuple(sorted(classes))
    unique: Dict[str, Extraction] = {}
    for choices in itertools.product(*(classes[k] for k in keys)):
        full = dict(zip(keys, choices))
        reachable = _closure(full, roots)
        selected_map = {c: full[c] for c in reachable}
        selected = tuple((c, selected_map[c].node_id) for c in reachable)
        signature = ";".join(f"{c}={n}" for c, n in selected)
        if signature in unique:
            continue
        static_cost = sum(n.cost for n in selected_map.values() if n.children)
        one_shot_peak = exact_one_shot_peak(selected_map, roots)
        unique[signature] = Extraction(selected, static_cost, one_shot_peak, reachable)
    return [unique[k] for k in sorted(unique)]


def selected_map(classes: Mapping[int, Sequence[Node]], extraction: Extraction) -> Dict[int, Node]:
    by_id = {n.node_id: n for nodes in classes.values() for n in nodes}
    return {c: by_id[nid] for c, nid in extraction.selected}


def exact_one_shot_peak(selected: Mapping[int, Node], roots: Sequence[int]) -> int:
    """Enumerate legal one-shot topological orders and return minimum peak."""
    nonleaf = tuple(c for c, n in selected.items() if n.children)
    nonleaf_set = set(nonleaf)
    deps = {c: {x for x in selected[c].children if x in nonleaf_set} for c in nonleaf}
    parents = {c: set() for c in nonleaf}
    for parent, children in deps.items():
        for child in children:
            parents[child].add(parent)
    roots_set = set(roots)
    best = None

    def visit(done: frozenset[int], peak: int) -> None:
        nonlocal best
        if best is not None and peak >= best:
            return
        if len(done) == len(nonleaf):
            best = peak if best is None else min(best, peak)
            return
        resident = {
            c
            for c in done
            if c not in roots_set and any(parent not in done for parent in parents[c])
        }
        resident_bytes = sum(selected[c].size for c in resident)
        ready = sorted(c for c in nonleaf if c not in done and deps[c] <= done)
        for c in ready:
            visit(done | {c}, max(peak, resident_bytes + selected[c].size))

    visit(frozenset(), 0)
    if best is None:
        raise ValueError("no one-shot schedule")
    return best


def exact_schedule(selected: Mapping[int, Node], roots: Sequence[int], budget: int) -> Mapping | None:
    """Dijkstra search over (emitted roots, resident values)."""
    nonleaf = tuple(sorted(c for c, n in selected.items() if n.children))
    index = {c: i for i, c in enumerate(nonleaf)}
    root_index = {c: i for i, c in enumerate(roots)}
    all_roots = (1 << len(roots)) - 1

    # score = (execution cost, compute action count, lexicographic action tuple)
    start_state = (0, 0)
    start_score = (0, 0, ())
    best = {start_state: start_score}
    queue = [(0, 0, (), start_state)]
    explored = 0

    while queue:
        cost, computes, actions, state = heapq.heappop(queue)
        score = (cost, computes, actions)
        if best.get(state) != score:
            continue
        explored += 1
        done_roots, resident = state
        if done_roots == all_roots:
            replay = replay_schedule(selected, roots, actions)
            if replay["peak_live"] > budget or replay["total_execution_cost"] != cost:
                raise AssertionError("internal replay mismatch")
            replay.update({"explored_schedule_states": explored, "actions": list(actions)})
            return replay

        resident_classes = {c for c, i in index.items() if resident & (1 << i)}
        resident_bytes = sum(selected[c].size for c in resident_classes)

        for c in nonleaf:
            node = selected[c]
            if c in resident_classes:
                continue
            if c in root_index and (done_roots & (1 << root_index[c])):
                continue
            if any(child in index and child not in resident_classes for child in node.children):
                continue
            if resident_bytes + node.size > budget:
                continue
            if c in root_index:
                next_state = (done_roots | (1 << root_index[c]), resident)
            else:
                next_state = (done_roots, resident | (1 << index[c]))
            action = f"C:{c}"
            next_score = (cost + node.cost, computes + 1, actions + (action,))
            if next_score < best.get(next_state, (10**18, 10**18, ("~",))):
                best[next_state] = next_score
                heapq.heappush(queue, (*next_score, next_state))

        for c in sorted(resident_classes):
            next_state = (done_roots, resident & ~(1 << index[c]))
            action = f"D:{c}"
            next_score = (cost, computes, actions + (action,))
            if next_score < best.get(next_state, (10**18, 10**18, ("~",))):
                best[next_state] = next_score
                heapq.heappush(queue, (*next_score, next_state))
    return None


def replay_schedule(selected: Mapping[int, Node], roots: Sequence[int], actions: Sequence[str]) -> Dict[str, int]:
    resident = set()
    done = set()
    roots_set = set(roots)
    peak = 0
    total_cost = 0
    compute_counts = {c: 0 for c, n in selected.items() if n.children}
    deletes = 0
    for action in actions:
        parts = action.split(":")
        if parts[0] == "D":
            c = int(parts[1])
            if c not in resident:
                raise ValueError("delete of nonresident value")
            resident.remove(c)
            deletes += 1
            continue
        if parts[0] != "C":
            raise ValueError("unknown action")
        c = int(parts[1])
        node = selected[c]
        if c in resident or c in done:
            raise ValueError("duplicate resident/root computation")
        for child in node.children:
            if selected[child].children and child not in resident:
                raise ValueError("missing resident child")
        peak = max(peak, sum(selected[x].size for x in resident) + node.size)
        total_cost += node.cost
        compute_counts[c] += 1
        if c in roots_set:
            done.add(c)
        else:
            resident.add(c)
    if done != roots_set:
        raise ValueError("not all roots emitted")
    distinct_executed = sum(1 for v in compute_counts.values() if v)
    computes = sum(compute_counts.values())
    return {
        "peak_live": peak,
        "total_execution_cost": total_cost,
        "emitted_operation_count": computes,
        "selected_distinct_nonleaf_count": len(compute_counts),
        "recomputation_count": computes - distinct_executed,
        "materialized_value_actions": computes - len(done),
        "delete_actions": deletes,
    }


def extraction_for_signature(extractions: Sequence[Extraction], signature: str) -> Extraction:
    return next(x for x in extractions if x.signature == signature)
