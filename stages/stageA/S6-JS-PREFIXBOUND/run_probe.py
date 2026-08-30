#!/usr/bin/env python3
"""Finite Stage-A counterexample search for S6-JS-PREFIXBOUND.

The model is intentionally small and explicit.  It preserves the paper-level
merge-join join-and-sort object frozen in EXPERIMENT_CONTRACT.yaml, but it is
not a DPomega source-code reproduction and does not prove a theorem.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import math
import pathlib
import re
import sys
import time
import tracemalloc
from dataclasses import dataclass
from typing import Dict, Iterable, Iterator, Mapping, Sequence, Tuple


Order = Tuple[str, ...]
Edge = Tuple[int, int]
EPS = 1.0e-9


@dataclass(frozen=True)
class Instance:
    name: str
    relations: Tuple[str, ...]
    edges: Tuple[Tuple[int, int, Tuple[str, ...]], ...]
    omega: Order
    source_class: str

    @property
    def n(self) -> int:
        return len(self.relations)

    @property
    def full_mask(self) -> int:
        return (1 << self.n) - 1

    def edge_map(self) -> Dict[Edge, Tuple[str, ...]]:
        return {(i, j): attrs for i, j, attrs in self.edges}


def popcount(mask: int) -> int:
    return mask.bit_count()


def mask_members(mask: int, n: int) -> Tuple[int, ...]:
    return tuple(i for i in range(n) if mask & (1 << i))


def proper_partitions(mask: int) -> Iterator[Tuple[int, int]]:
    """Yield unordered nonempty bipartitions exactly once."""
    anchor = mask & -mask
    sub = (mask - 1) & mask
    while sub:
        other = mask ^ sub
        if other and sub & anchor:
            yield sub, other
        sub = (sub - 1) & mask


def cross_keys(instance: Instance, left: int, right: int) -> Tuple[str, ...]:
    attrs = set()
    for i, j, labels in instance.edges:
        if ((left >> i) & 1 and (right >> j) & 1) or (
            (left >> j) & 1 and (right >> i) & 1
        ):
            attrs.update(labels)
    return tuple(sorted(attrs))


def is_connected(instance: Instance, mask: int) -> bool:
    members = mask_members(mask, instance.n)
    if len(members) <= 1:
        return bool(members)
    edge_map = instance.edge_map()
    seen = {members[0]}
    stack = [members[0]]
    while stack:
        u = stack.pop()
        for v in members:
            if v in seen:
                continue
            key = (u, v) if u < v else (v, u)
            if key in edge_map:
                seen.add(v)
                stack.append(v)
    return len(seen) == len(members)


def demands_for_keys(keys: Sequence[str]) -> Tuple[Order, ...]:
    if not keys:
        return ()
    return tuple(itertools.permutations(tuple(sorted(keys))))


def lcp(left: Order, right: Order) -> Order:
    size = 0
    while size < min(len(left), len(right)) and left[size] == right[size]:
        size += 1
    return left[:size]


def cardinality(mask: int) -> int:
    return 32 + 7 * mask + 3 * popcount(mask)


def ndv(mask: int, attr: str) -> int:
    c = cardinality(mask)
    digest = int(hashlib.sha256(attr.encode("utf-8")).hexdigest()[:8], 16)
    value = 2 + ((mask * (digest % 11 + 1) + digest) % 13)
    return min(c, value)


def sort_cost(mask: int, current: Order, demand: Order) -> float:
    """Uniform-segment realization of DPomega Eq. (5)."""
    if not demand or current == demand:
        return 0.0
    prefix = lcp(current, demand)
    c = cardinality(mask)
    groups = 1
    for attr in prefix:
        groups = min(c, groups * ndv(mask, attr))
    if groups >= c:
        return 0.0
    return c * math.log2(c / groups)


def connected_masks(instance: Instance) -> Tuple[int, ...]:
    return tuple(
        mask
        for mask in range(1, instance.full_mask + 1)
        if is_connected(instance, mask)
    )


def future_demands(instance: Instance, mask: int) -> Tuple[Order, ...]:
    if mask == instance.full_mask:
        return (instance.omega,) if instance.omega else ()
    outside = instance.full_mask ^ mask
    result = set()
    sub = outside
    while sub:
        if is_connected(instance, sub):
            keys = cross_keys(instance, mask, sub)
            result.update(demands_for_keys(keys))
        sub = (sub - 1) & outside
    return tuple(sorted(result))


def signature(instance: Instance, mask: int, order: Order) -> Tuple[Tuple, ...]:
    return tuple(
        (demand, lcp(order, demand), round(sort_cost(mask, order, demand), 12))
        for demand in future_demands(instance, mask)
    )


def naive_signature(instance: Instance, order: Order) -> Order:
    return lcp(order, instance.omega)


def exact_dp(instance: Instance) -> Tuple[Dict[int, Dict[Order, float]], int]:
    dp: Dict[int, Dict[Order, float]] = {}
    transitions = 0
    connected = set(connected_masks(instance))
    for mask in sorted(connected, key=lambda m: (popcount(m), m)):
        if popcount(mask) == 1:
            dp[mask] = {(): 0.0}
            continue
        states: Dict[Order, float] = {}
        for left, right in proper_partitions(mask):
            if left not in connected or right not in connected:
                continue
            demands = demands_for_keys(cross_keys(instance, left, right))
            for lo, lc in dp[left].items():
                for ro, rc in dp[right].items():
                    for demand in demands:
                        transitions += 1
                        cost = (
                            lc
                            + rc
                            + sort_cost(left, lo, demand)
                            + sort_cost(right, ro, demand)
                            + cardinality(mask)
                        )
                        prior = states.get(demand)
                        if prior is None or cost < prior:
                            states[demand] = cost
        if states:
            dp[mask] = states
    return dp, transitions


def quotient_dp(instance: Instance) -> Tuple[Dict[int, Dict[Tuple, Tuple[float, Order]]], int]:
    dp: Dict[int, Dict[Tuple, Tuple[float, Order]]] = {}
    transitions = 0
    connected = set(connected_masks(instance))
    for mask in sorted(connected, key=lambda m: (popcount(m), m)):
        if popcount(mask) == 1:
            sig = signature(instance, mask, ())
            dp[mask] = {sig: (0.0, ())}
            continue
        states: Dict[Tuple, Tuple[float, Order]] = {}
        for left, right in proper_partitions(mask):
            if left not in connected or right not in connected:
                continue
            demands = demands_for_keys(cross_keys(instance, left, right))
            for lc, lo in dp[left].values():
                for rc, ro in dp[right].values():
                    for demand in demands:
                        transitions += 1
                        cost = (
                            lc
                            + rc
                            + sort_cost(left, lo, demand)
                            + sort_cost(right, ro, demand)
                            + cardinality(mask)
                        )
                        sig = signature(instance, mask, demand)
                        prior = states.get(sig)
                        if prior is None or cost < prior[0]:
                            states[sig] = (cost, demand)
        if states:
            dp[mask] = states
    return dp, transitions


def final_exact_cost(instance: Instance, states: Mapping[Order, float]) -> float:
    return min(
        cost + sort_cost(instance.full_mask, order, instance.omega)
        for order, cost in states.items()
    )


def final_quotient_cost(instance: Instance, states: Mapping[Tuple, Tuple[float, Order]]) -> float:
    return min(
        cost + sort_cost(instance.full_mask, order, instance.omega)
        for cost, order in states.values()
    )


def completion_cost(instance: Instance, start_mask: int, start_order: Order, with_sort: bool) -> float:
    """Exact completion with start_mask treated as an indivisible available atom."""
    outside = mask_members(instance.full_mask ^ start_mask, instance.n)
    atoms = (start_mask,) + tuple(1 << i for i in outside)
    atom_n = len(atoms)
    full_atom_mask = (1 << atom_n) - 1
    union_cache = {
        atom_mask: sum(
            (atoms[i] for i in range(atom_n) if atom_mask & (1 << i)), 0
        )
        for atom_mask in range(1, full_atom_mask + 1)
    }
    dp: Dict[int, Dict[Order, float]] = {}
    for atom_mask in range(1, full_atom_mask + 1):
        if popcount(atom_mask) == 1:
            idx = (atom_mask & -atom_mask).bit_length() - 1
            dp[atom_mask] = {start_order if idx == 0 else (): 0.0}
            continue
        states: Dict[Order, float] = {}
        for left, right in proper_partitions(atom_mask):
            left_rel = union_cache[left]
            right_rel = union_cache[right]
            demands = demands_for_keys(cross_keys(instance, left_rel, right_rel))
            if not demands:
                continue
            for lo, lc in dp.get(left, {}).items():
                for ro, rc in dp.get(right, {}).items():
                    for demand in demands:
                        extra_sort = 0.0
                        if with_sort:
                            extra_sort = sort_cost(left_rel, lo, demand) + sort_cost(
                                right_rel, ro, demand
                            )
                        cost = lc + rc + extra_sort + cardinality(left_rel | right_rel)
                        prior = states.get(demand)
                        if prior is None or cost < prior:
                            states[demand] = cost
        dp[atom_mask] = states
    states = dp[full_atom_mask]
    if not states:
        return math.inf
    return min(
        cost
        + (
            sort_cost(instance.full_mask, order, instance.omega)
            if with_sort
            else 0.0
        )
        for order, cost in states.items()
    )


def bound_value(instance: Instance, mask: int, order: Order) -> Tuple[float, float, float, float]:
    exact_remaining = completion_cost(instance, mask, order, with_sort=True)
    join_lb = completion_cost(instance, mask, order, with_sort=False)
    demands = future_demands(instance, mask)
    sort_lb = min((sort_cost(mask, order, d) for d in demands), default=0.0)
    return max(join_lb, sort_lb), exact_remaining, join_lb, sort_lb


def graph_connected(n: int, edge_pairs: Sequence[Edge]) -> bool:
    if n == 1:
        return True
    seen = {0}
    stack = [0]
    while stack:
        u = stack.pop()
        for a, b in edge_pairs:
            if a == u and b not in seen:
                seen.add(b)
                stack.append(b)
            elif b == u and a not in seen:
                seen.add(a)
                stack.append(a)
    return len(seen) == n


def formal_instances() -> Iterator[Instance]:
    key_choices = (("A",), ("B",), ("A", "B"))
    omegas = ((), ("A",), ("B",), ("A", "B"), ("B", "A"))
    for n in (3, 4):
        all_edges = tuple(itertools.combinations(range(n), 2))
        for graph_bits in range(1, 1 << len(all_edges)):
            chosen = tuple(
                edge for idx, edge in enumerate(all_edges) if graph_bits & (1 << idx)
            )
            if not graph_connected(n, chosen):
                continue
            for labels in itertools.product(key_choices, repeat=len(chosen)):
                frozen_edges = tuple(
                    (a, b, tuple(label)) for (a, b), label in zip(chosen, labels)
                )
                graph_id = f"n{n}-g{graph_bits:x}-l" + "_".join(
                    "".join(label) for label in labels
                )
                for omega in omegas:
                    yield Instance(
                        name=graph_id + "-o" + ("".join(omega) or "EMPTY"),
                        relations=tuple(f"R{i}" for i in range(n)),
                        edges=frozen_edges,
                        omega=omega,
                        source_class="EXHAUSTIVE_FORMAL",
                    )


class UnionFind:
    def __init__(self) -> None:
        self.parent: Dict[str, str] = {}

    def find(self, item: str) -> str:
        self.parent.setdefault(item, item)
        if self.parent[item] != item:
            self.parent[item] = self.find(self.parent[item])
        return self.parent[item]

    def union(self, left: str, right: str) -> None:
        a, b = self.find(left), self.find(right)
        if a != b:
            self.parent[max(a, b)] = min(a, b)


def parse_job_sql(path: pathlib.Path) -> Instance:
    sql = path.read_text(encoding="utf-8")
    from_match = re.search(r"\bFROM\b(.*?)\bWHERE\b", sql, flags=re.I | re.S)
    if not from_match:
        raise ValueError("JOB SQL lacks FROM/WHERE")
    table_specs = [x.strip() for x in from_match.group(1).split(",")]
    aliases = []
    for spec in table_specs:
        match = re.match(r"[A-Za-z_][\w]*\s+(?:AS\s+)?([A-Za-z_][\w]*)$", spec, re.I)
        if not match:
            raise ValueError(f"Cannot parse table alias: {spec!r}")
        aliases.append(match.group(1))
    index = {alias: i for i, alias in enumerate(aliases)}
    equalities = re.findall(
        r"\b([A-Za-z_]\w*)\.([A-Za-z_]\w*)\s*=\s*([A-Za-z_]\w*)\.([A-Za-z_]\w*)\b",
        sql,
        flags=re.I,
    )
    uf = UnionFind()
    valid = []
    for la, lc, ra, rc in equalities:
        if la not in index or ra not in index or la == ra:
            continue
        left_col, right_col = f"{la}.{lc}", f"{ra}.{rc}"
        uf.union(left_col, right_col)
        valid.append((la, left_col, ra, right_col))
    roots = sorted({uf.find(col) for _, l, _, r in valid for col in (l, r)})
    root_label = {root: f"EC{idx}" for idx, root in enumerate(roots)}
    edge_attrs: Dict[Edge, set[str]] = {}
    for la, left_col, ra, _right_col in valid:
        a, b = sorted((index[la], index[ra]))
        edge_attrs.setdefault((a, b), set()).add(root_label[uf.find(left_col)])
    edges = tuple((a, b, tuple(sorted(attrs))) for (a, b), attrs in sorted(edge_attrs.items()))
    return Instance(
        name="JOB_4a",
        relations=tuple(aliases),
        edges=edges,
        omega=(),
        source_class="NATURAL_SQL_STRUCTURE_PROXY_COST",
    )


def instance_summary(instance: Instance) -> Dict:
    return {
        "name": instance.name,
        "relations": list(instance.relations),
        "edges": [
            {"left": instance.relations[a], "right": instance.relations[b], "keys": list(attrs)}
            for a, b, attrs in instance.edges
        ],
        "omega": list(instance.omega),
        "source_class": instance.source_class,
    }


def analyze_instance(instance: Instance, check_bounds: bool = True) -> Dict:
    exact, exact_transitions = exact_dp(instance)
    quotient, quotient_transitions = quotient_dp(instance)
    exact_cost = final_exact_cost(instance, exact[instance.full_mask])
    quotient_cost = final_quotient_cost(instance, quotient[instance.full_mask])

    exact_states = sum(len(states) for states in exact.values())
    quotient_states = sum(len(states) for states in quotient.values())
    signature_pairs = 0
    continuation_actions = 0
    candidate_counterexamples = 0
    naive_counterexamples = 0
    first_candidate_witness = None
    first_naive_witness = None
    signature_builds = 0
    bound_checks = 0
    admissibility_violations = 0
    first_bound_witness = None

    for mask, states in exact.items():
        orders = sorted(states)
        candidate_groups: Dict[Tuple, list[Order]] = {}
        naive_groups: Dict[Order, list[Order]] = {}
        for order in orders:
            sig = signature(instance, mask, order)
            signature_builds += 1
            candidate_groups.setdefault(sig, []).append(order)
            naive_groups.setdefault(naive_signature(instance, order), []).append(order)
        demands = future_demands(instance, mask)
        for group in candidate_groups.values():
            for left, right in itertools.combinations(group, 2):
                signature_pairs += 1
                for demand in demands:
                    continuation_actions += 1
                    lc = sort_cost(mask, left, demand)
                    rc = sort_cost(mask, right, demand)
                    if abs(lc - rc) > EPS:
                        candidate_counterexamples += 1
                        if first_candidate_witness is None:
                            first_candidate_witness = {
                                "mask": mask,
                                "left_order": list(left),
                                "right_order": list(right),
                                "demand": list(demand),
                                "left_cost": lc,
                                "right_cost": rc,
                            }
        for group in naive_groups.values():
            for left, right in itertools.combinations(group, 2):
                for demand in demands:
                    lc = sort_cost(mask, left, demand)
                    rc = sort_cost(mask, right, demand)
                    if abs(lc - rc) > EPS:
                        naive_counterexamples += 1
                        if first_naive_witness is None:
                            first_naive_witness = {
                                "mask": mask,
                                "left_order": list(left),
                                "right_order": list(right),
                                "demand": list(demand),
                                "left_cost": lc,
                                "right_cost": rc,
                                "naive_signature": list(naive_signature(instance, left)),
                            }
        if check_bounds:
            for order in orders:
                bound, exact_remaining, join_lb, sort_lb = bound_value(instance, mask, order)
                bound_checks += 1
                if bound > exact_remaining + EPS:
                    admissibility_violations += 1
                    if first_bound_witness is None:
                        first_bound_witness = {
                            "mask": mask,
                            "order": list(order),
                            "bound": bound,
                            "exact_remaining": exact_remaining,
                            "join_lb": join_lb,
                            "sort_lb": sort_lb,
                        }

    return {
        "instance": instance_summary(instance),
        "exact_optimum": exact_cost,
        "quotient_optimum": quotient_cost,
        "optimum_difference": quotient_cost - exact_cost,
        "exact_order_states": exact_states,
        "quotient_signature_states": quotient_states,
        "state_reduction_fraction": (exact_states - quotient_states) / exact_states,
        "exact_transitions": exact_transitions,
        "quotient_transitions": quotient_transitions,
        "signature_pairs_checked": signature_pairs,
        "continuation_actions_checked": continuation_actions,
        "candidate_counterexamples": candidate_counterexamples,
        "naive_counterexamples": naive_counterexamples,
        "admissibility_checks": bound_checks,
        "admissibility_violations": admissibility_violations,
        "signature_constructions": signature_builds,
        "first_candidate_witness": first_candidate_witness,
        "first_naive_witness": first_naive_witness,
        "first_bound_witness": first_bound_witness,
    }


def aggregate_formal() -> Dict:
    totals = {
        "instance_count": 0,
        "exact_order_states": 0,
        "quotient_signature_states": 0,
        "exact_transitions": 0,
        "quotient_transitions": 0,
        "signature_pairs_checked": 0,
        "continuation_actions_checked": 0,
        "candidate_counterexamples": 0,
        "naive_counterexamples": 0,
        "admissibility_checks": 0,
        "admissibility_violations": 0,
        "signature_constructions": 0,
        "optimum_mismatches": 0,
        "instances_with_positive_reduction": 0,
    }
    first_naive = None
    first_candidate = None
    first_bound = None
    max_reduction = None
    min_reduction = None
    for instance in formal_instances():
        result = analyze_instance(instance, check_bounds=True)
        totals["instance_count"] += 1
        for key in (
            "exact_order_states",
            "quotient_signature_states",
            "exact_transitions",
            "quotient_transitions",
            "signature_pairs_checked",
            "continuation_actions_checked",
            "candidate_counterexamples",
            "naive_counterexamples",
            "admissibility_checks",
            "admissibility_violations",
            "signature_constructions",
        ):
            totals[key] += result[key]
        if abs(result["optimum_difference"]) > EPS:
            totals["optimum_mismatches"] += 1
        if result["state_reduction_fraction"] > EPS:
            totals["instances_with_positive_reduction"] += 1
        if first_naive is None and result["first_naive_witness"] is not None:
            first_naive = {"instance": result["instance"], **result["first_naive_witness"]}
        if first_candidate is None and result["first_candidate_witness"] is not None:
            first_candidate = {"instance": result["instance"], **result["first_candidate_witness"]}
        if first_bound is None and result["first_bound_witness"] is not None:
            first_bound = {"instance": result["instance"], **result["first_bound_witness"]}
        reduction_record = {
            "instance": result["instance"]["name"],
            "fraction": result["state_reduction_fraction"],
            "exact_states": result["exact_order_states"],
            "quotient_states": result["quotient_signature_states"],
        }
        if max_reduction is None or reduction_record["fraction"] > max_reduction["fraction"]:
            max_reduction = reduction_record
        if min_reduction is None or reduction_record["fraction"] < min_reduction["fraction"]:
            min_reduction = reduction_record
    totals["state_reduction_fraction"] = (
        totals["exact_order_states"] - totals["quotient_signature_states"]
    ) / totals["exact_order_states"]
    totals["transition_reduction_fraction"] = (
        totals["exact_transitions"] - totals["quotient_transitions"]
    ) / totals["exact_transitions"]
    totals["first_naive_counterexample"] = first_naive
    totals["first_candidate_counterexample"] = first_candidate
    totals["first_admissibility_violation"] = first_bound
    totals["max_instance_reduction"] = max_reduction
    totals["min_instance_reduction"] = min_reduction
    return totals


def sha256_file(path: pathlib.Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest().upper()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--contract", required=True)
    parser.add_argument("--output", required=True)
    args = parser.parse_args()
    root = pathlib.Path(__file__).resolve().parent
    contract = (root / args.contract).resolve()
    output = (root / args.output).resolve()
    job_file = root / "inputs" / "JOB_4a.sql"
    if not contract.is_file() or not job_file.is_file():
        raise FileNotFoundError("Frozen contract or JOB input is missing")
    if root not in output.parents:
        raise ValueError("Output must stay inside the candidate directory")

    tracemalloc.start()
    wall_start = time.perf_counter()
    cpu_start = time.process_time()
    formal = aggregate_formal()
    natural = analyze_instance(parse_job_sql(job_file), check_bounds=True)
    cpu_seconds = time.process_time() - cpu_start
    wall_seconds = time.perf_counter() - wall_start
    _current, peak_bytes = tracemalloc.get_traced_memory()
    tracemalloc.stop()

    hard_fail = any(
        (
            formal["candidate_counterexamples"],
            formal["optimum_mismatches"],
            formal["admissibility_violations"],
            natural["candidate_counterexamples"],
            abs(natural["optimum_difference"]) > EPS,
            natural["admissibility_violations"],
        )
    )
    positive_reduction = (
        formal["state_reduction_fraction"] > EPS
        and natural["state_reduction_fraction"] > EPS
    )
    verdict = (
        "STOP_TRIGGERED"
        if hard_fail or not positive_reduction
        else "NOT_FALSIFIED_WITH_PRELIMINARY_SUPPORT"
    )
    payload = {
        "schema_version": "s6-js-prefixbound-probe-v1",
        "python_version": sys.version,
        "contract_sha256": sha256_file(contract),
        "input": {
            "path": "inputs/JOB_4a.sql",
            "bytes": job_file.stat().st_size,
            "sha256": sha256_file(job_file),
        },
        "model_claim_limit": "FINITE_ENUMERATION_NOT_THEOREM_OR_DPOMEGA_CODE_REPRODUCTION",
        "formal_exhaustive": formal,
        "natural_structure_probe": natural,
        "verdict": verdict,
        "full_cost": {
            "wall_time_seconds": wall_seconds,
            "process_cpu_time_seconds": cpu_seconds,
            "peak_tracemalloc_bytes": peak_bytes,
            "gpu_used": False,
            "network_used_during_probe": False,
        },
    }
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({
        "output": str(output),
        "verdict": verdict,
        "formal_instances": formal["instance_count"],
        "formal_state_reduction": formal["state_reduction_fraction"],
        "natural_state_reduction": natural["state_reduction_fraction"],
        "candidate_counterexamples": formal["candidate_counterexamples"] + natural["candidate_counterexamples"],
        "admissibility_violations": formal["admissibility_violations"] + natural["admissibility_violations"],
        "optimum_mismatches": formal["optimum_mismatches"] + int(abs(natural["optimum_difference"]) > EPS),
        "wall_time_seconds": wall_seconds,
    }, indent=2, sort_keys=True))
    return 0 if verdict != "STOP_TRIGGERED" else 2


if __name__ == "__main__":
    raise SystemExit(main())

