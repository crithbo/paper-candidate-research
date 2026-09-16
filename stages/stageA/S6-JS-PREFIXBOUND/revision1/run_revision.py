#!/usr/bin/env python3
"""Contract-faithful, fully costed Stage-A revision for S6-JS-PREFIXBOUND.

This is a finite same-object pilot. It is not a DPomega implementation, an
unbounded proof, a DBMS experiment, or Stage B work.
"""

from __future__ import annotations

import argparse
import gc
import hashlib
import itertools
import json
import math
import pathlib
import re
import sys
import time
import tracemalloc
from dataclasses import asdict, dataclass, fields
from typing import Dict, Iterator, Mapping, Sequence, Tuple


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


@dataclass
class Ledger:
    transition_evaluations: int = 0
    sort_cost_invocations: int = 0
    table_lookups: int = 0
    key_hashes: int = 0
    key_compares: int = 0
    table_writes: int = 0
    signature_invocations: int = 0
    signature_vector_elements: int = 0
    signature_normalizations: int = 0
    compact_class_assignments: int = 0
    bound_evaluations: int = 0
    bound_oracle_calls: int = 0
    bound_oracle_transitions: int = 0

    def add(self, other: "Ledger") -> None:
        for field in fields(self):
            setattr(self, field.name, getattr(self, field.name) + getattr(other, field.name))

    def total(self) -> int:
        return sum(getattr(self, field.name) for field in fields(self))

    def payload(self) -> dict:
        result = asdict(self)
        result["logical_work_total"] = self.total()
        return result


@dataclass
class PhaseCost:
    wall_time_seconds: float = 0.0
    process_cpu_time_seconds: float = 0.0
    peak_incremental_tracemalloc_bytes: int = 0
    calls: int = 0

    def payload(self) -> dict:
        return asdict(self)


def measured(phase: PhaseCost, fn):
    baseline_current = tracemalloc.get_traced_memory()[0]
    tracemalloc.reset_peak()
    wall_start = time.perf_counter()
    cpu_start = time.process_time()
    value = fn()
    phase.process_cpu_time_seconds += time.process_time() - cpu_start
    phase.wall_time_seconds += time.perf_counter() - wall_start
    _current, peak = tracemalloc.get_traced_memory()
    phase.peak_incremental_tracemalloc_bytes = max(
        phase.peak_incremental_tracemalloc_bytes, max(0, peak - baseline_current)
    )
    phase.calls += 1
    return value


def sha256_file(path: pathlib.Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest().upper()


def canonical_bytes(record) -> int:
    return len(
        json.dumps(record, ensure_ascii=False, separators=(",", ":"), sort_keys=True).encode(
            "utf-8"
        )
    )


def order_record(order: Order) -> list[str]:
    return list(order)


def signature_record(sig: Tuple[Tuple, ...]) -> list:
    return [[list(demand), list(prefix), float(cost).hex()] for demand, prefix, cost in sig]


def retained_exact_bytes(dp: Mapping[int, Mapping[Order, float]]) -> int:
    total = 0
    for mask, states in dp.items():
        total += canonical_bytes({"mask": mask, "entries": len(states)})
        for order, cost in states.items():
            total += canonical_bytes({"o": order_record(order), "g": float(cost).hex()})
    return total


def retained_full_bytes(dp: Mapping[int, Mapping[Tuple, Tuple[float, Order]]]) -> int:
    total = 0
    for mask, states in dp.items():
        total += canonical_bytes({"mask": mask, "entries": len(states)})
        for sig, (cost, order) in states.items():
            total += canonical_bytes(
                {"sigma": signature_record(sig), "o": order_record(order), "g": float(cost).hex()}
            )
    return total


def retained_compact_bytes(dp: Mapping[int, Sequence[Tuple[float, Order]]]) -> int:
    total = 0
    for mask, states in dp.items():
        total += canonical_bytes({"mask": mask, "entries": len(states)})
        for cost, order in states:
            total += canonical_bytes({"o": order_record(order), "g": float(cost).hex()})
    return total


def popcount(mask: int) -> int:
    return mask.bit_count()


def mask_members(mask: int, n: int) -> Tuple[int, ...]:
    return tuple(i for i in range(n) if mask & (1 << i))


def proper_partitions(mask: int) -> Iterator[Tuple[int, int]]:
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
    """Exactly the frozen A/B formulas; JOB EC labels map by parity."""
    c = cardinality(mask)
    if attr == "A":
        value = 2 + mask % 5
    elif attr == "B":
        value = 3 + (mask * 2) % 7
    else:
        match = re.fullmatch(r"EC(\d+)", attr)
        if not match:
            raise ValueError(f"Unfrozen attribute label: {attr}")
        if int(match.group(1)) % 2 == 0:
            value = 2 + mask % 5
        else:
            value = 3 + (mask * 2) % 7
    return min(c, value)


def sort_cost(mask: int, current: Order, demand: Order, ledger: Ledger | None = None) -> float:
    if ledger is not None:
        ledger.sort_cost_invocations += 1
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
        mask for mask in range(1, instance.full_mask + 1) if is_connected(instance, mask)
    )


def future_demands(instance: Instance, mask: int) -> Tuple[Order, ...]:
    if mask == instance.full_mask:
        return (instance.omega,) if instance.omega else ()
    outside = instance.full_mask ^ mask
    result = set()
    sub = outside
    while sub:
        if is_connected(instance, sub):
            result.update(demands_for_keys(cross_keys(instance, mask, sub)))
        sub = (sub - 1) & outside
    return tuple(sorted(result))


def signature(instance: Instance, mask: int, order: Order, ledger: Ledger) -> Tuple[Tuple, ...]:
    ledger.signature_invocations += 1
    result = []
    for demand in future_demands(instance, mask):
        ledger.signature_vector_elements += 1
        ledger.signature_normalizations += 1
        result.append(
            (demand, lcp(order, demand), round(sort_cost(mask, order, demand, ledger), 12))
        )
    return tuple(result)


def probe_dict(mapping: dict, key, ledger: Ledger):
    ledger.table_lookups += 1
    ledger.key_hashes += 1
    hash(key)
    prior = mapping.get(key)
    if prior is not None:
        ledger.key_compares += 1
    return prior


def write_dict(mapping: dict, key, value, ledger: Ledger) -> None:
    mapping[key] = value
    ledger.table_writes += 1


def exact_dp(instance: Instance, ledger: Ledger):
    dp: Dict[int, Dict[Order, float]] = {}
    transitions = 0
    connected = set(connected_masks(instance))
    for mask in sorted(connected, key=lambda m: (popcount(m), m)):
        if popcount(mask) == 1:
            dp[mask] = {(): 0.0}
            ledger.table_writes += 1
            continue
        states: Dict[Order, float] = {}
        for left, right in proper_partitions(mask):
            if left not in connected or right not in connected:
                continue
            for lo, lc in dp[left].items():
                for ro, rc in dp[right].items():
                    for demand in demands_for_keys(cross_keys(instance, left, right)):
                        transitions += 1
                        ledger.transition_evaluations += 1
                        cost = (
                            lc
                            + rc
                            + sort_cost(left, lo, demand, ledger)
                            + sort_cost(right, ro, demand, ledger)
                            + cardinality(mask)
                        )
                        prior = probe_dict(states, demand, ledger)
                        if prior is None or cost < prior:
                            write_dict(states, demand, cost, ledger)
        if states:
            dp[mask] = states
    return dp, transitions


def quotient_full_dp(instance: Instance, ledger: Ledger):
    dp: Dict[int, Dict[Tuple, Tuple[float, Order]]] = {}
    transitions = 0
    connected = set(connected_masks(instance))
    for mask in sorted(connected, key=lambda m: (popcount(m), m)):
        if popcount(mask) == 1:
            sig = signature(instance, mask, (), ledger)
            dp[mask] = {sig: (0.0, ())}
            ledger.table_writes += 1
            continue
        states: Dict[Tuple, Tuple[float, Order]] = {}
        for left, right in proper_partitions(mask):
            if left not in connected or right not in connected:
                continue
            for lc, lo in dp[left].values():
                for rc, ro in dp[right].values():
                    for demand in demands_for_keys(cross_keys(instance, left, right)):
                        transitions += 1
                        ledger.transition_evaluations += 1
                        cost = (
                            lc
                            + rc
                            + sort_cost(left, lo, demand, ledger)
                            + sort_cost(right, ro, demand, ledger)
                            + cardinality(mask)
                        )
                        sig = signature(instance, mask, demand, ledger)
                        prior = probe_dict(states, sig, ledger)
                        if prior is None or cost < prior[0]:
                            write_dict(states, sig, (cost, demand), ledger)
        if states:
            dp[mask] = states
    return dp, transitions


def quotient_compact_dp(instance: Instance, ledger: Ledger):
    """One allowed same-equivalence compact pivot.

    Full vectors are constructed only on first use of each (mask, order), exact
    tuple equality assigns a contiguous class id, and temporary maps are dropped
    after the subset table freezes.
    """
    dp: Dict[int, list[Tuple[float, Order]]] = {}
    transitions = 0
    connected = set(connected_masks(instance))
    equivalence_mismatches = 0
    for mask in sorted(connected, key=lambda m: (popcount(m), m)):
        order_to_id: Dict[Order, int] = {}
        class_by_sig: Dict[Tuple, int] = {}
        states: list[Tuple[float, Order]] = []

        def class_id(order: Order) -> int:
            cached = probe_dict(order_to_id, order, ledger)
            if cached is not None:
                return cached
            sig = signature(instance, mask, order, ledger)
            prior_id = probe_dict(class_by_sig, sig, ledger)
            if prior_id is None:
                prior_id = len(class_by_sig)
                write_dict(class_by_sig, sig, prior_id, ledger)
                ledger.compact_class_assignments += 1
            write_dict(order_to_id, order, prior_id, ledger)
            return prior_id

        if popcount(mask) == 1:
            cid = class_id(())
            if cid != 0:
                equivalence_mismatches += 1
            states.append((0.0, ()))
            ledger.table_writes += 1
            dp[mask] = states
            continue

        for left, right in proper_partitions(mask):
            if left not in connected or right not in connected:
                continue
            for lc, lo in dp[left]:
                for rc, ro in dp[right]:
                    for demand in demands_for_keys(cross_keys(instance, left, right)):
                        transitions += 1
                        ledger.transition_evaluations += 1
                        cost = (
                            lc
                            + rc
                            + sort_cost(left, lo, demand, ledger)
                            + sort_cost(right, ro, demand, ledger)
                            + cardinality(mask)
                        )
                        cid = class_id(demand)
                        ledger.table_lookups += 1
                        if cid < len(states):
                            ledger.key_compares += 1
                            if cost < states[cid][0]:
                                states[cid] = (cost, demand)
                                ledger.table_writes += 1
                        elif cid == len(states):
                            states.append((cost, demand))
                            ledger.table_writes += 1
                        else:
                            equivalence_mismatches += 1
        if states:
            if len(states) != len(class_by_sig):
                equivalence_mismatches += abs(len(states) - len(class_by_sig)) or 1
            dp[mask] = states
        del order_to_id, class_by_sig
    return dp, transitions, equivalence_mismatches


def final_exact_cost(instance: Instance, states: Mapping[Order, float]) -> float:
    return min(cost + sort_cost(instance.full_mask, order, instance.omega) for order, cost in states.items())


def final_full_cost(instance: Instance, states: Mapping[Tuple, Tuple[float, Order]]) -> float:
    return min(
        cost + sort_cost(instance.full_mask, order, instance.omega)
        for cost, order in states.values()
    )


def final_compact_cost(instance: Instance, states: Sequence[Tuple[float, Order]]) -> float:
    return min(
        cost + sort_cost(instance.full_mask, order, instance.omega) for cost, order in states
    )


def completion_cost(
    instance: Instance, start_mask: int, start_order: Order, with_sort: bool, ledger: Ledger
) -> float:
    ledger.bound_oracle_calls += 1
    outside = mask_members(instance.full_mask ^ start_mask, instance.n)
    atoms = (start_mask,) + tuple(1 << i for i in outside)
    atom_n = len(atoms)
    full_atom_mask = (1 << atom_n) - 1
    union_cache = {
        atom_mask: sum((atoms[i] for i in range(atom_n) if atom_mask & (1 << i)), 0)
        for atom_mask in range(1, full_atom_mask + 1)
    }
    dp: Dict[int, Dict[Order, float]] = {}
    for atom_mask in range(1, full_atom_mask + 1):
        if popcount(atom_mask) == 1:
            idx = (atom_mask & -atom_mask).bit_length() - 1
            dp[atom_mask] = {start_order if idx == 0 else (): 0.0}
            ledger.table_writes += 1
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
                        ledger.bound_oracle_transitions += 1
                        extra_sort = 0.0
                        if with_sort:
                            extra_sort = sort_cost(left_rel, lo, demand, ledger) + sort_cost(
                                right_rel, ro, demand, ledger
                            )
                        cost = lc + rc + extra_sort + cardinality(left_rel | right_rel)
                        prior = probe_dict(states, demand, ledger)
                        if prior is None or cost < prior:
                            write_dict(states, demand, cost, ledger)
        dp[atom_mask] = states
    states = dp[full_atom_mask]
    if not states:
        return math.inf
    return min(
        cost
        + (sort_cost(instance.full_mask, order, instance.omega, ledger) if with_sort else 0.0)
        for order, cost in states.items()
    )


def bound_value(instance: Instance, mask: int, order: Order, ledger: Ledger):
    ledger.bound_evaluations += 1
    exact_remaining = completion_cost(instance, mask, order, True, ledger)
    join_lb = completion_cost(instance, mask, order, False, ledger)
    demands = future_demands(instance, mask)
    sort_lb = min((sort_cost(mask, order, demand, ledger) for demand in demands), default=0.0)
    return max(join_lb, sort_lb), exact_remaining


def audit_signatures(instance: Instance, exact, signature_ledger: Ledger):
    candidate_counterexamples = 0
    same_signature_pairs = 0
    continuation_actions = 0
    for mask, states in exact.items():
        groups: Dict[Tuple, list[Order]] = {}
        for order in sorted(states):
            sig = signature(instance, mask, order, signature_ledger)
            prior = probe_dict(groups, sig, signature_ledger)
            if prior is None:
                write_dict(groups, sig, [order], signature_ledger)
            else:
                prior.append(order)
                signature_ledger.table_writes += 1
        demands = future_demands(instance, mask)
        for group in groups.values():
            for left, right in itertools.combinations(group, 2):
                same_signature_pairs += 1
                for demand in demands:
                    continuation_actions += 1
                    if abs(
                        sort_cost(mask, left, demand, signature_ledger)
                        - sort_cost(mask, right, demand, signature_ledger)
                    ) > EPS:
                        candidate_counterexamples += 1
    return {
        "candidate_counterexamples": candidate_counterexamples,
        "same_signature_pairs": same_signature_pairs,
        "continuation_actions": continuation_actions,
    }


def audit_bounds(instance: Instance, exact, bound_ledger: Ledger):
    bound_checks = 0
    bound_overestimates = 0
    first_bound = None
    for mask, states in exact.items():
        for order in states:
            bound, exact_remaining = bound_value(instance, mask, order, bound_ledger)
            bound_checks += 1
            if bound > exact_remaining + EPS:
                bound_overestimates += 1
                if first_bound is None:
                    first_bound = {
                        "instance": instance.name,
                        "mask": mask,
                        "order": list(order),
                        "bound": bound,
                        "exact_remaining": exact_remaining,
                    }
    return {
        "bound_checks": bound_checks,
        "bound_overestimates": bound_overestimates,
        "first_bound_overestimate": first_bound,
    }


def graph_connected(n: int, edge_pairs: Sequence[Edge]) -> bool:
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
            chosen = tuple(edge for idx, edge in enumerate(all_edges) if graph_bits & (1 << idx))
            if not graph_connected(n, chosen):
                continue
            for labels in itertools.product(key_choices, repeat=len(chosen)):
                frozen_edges = tuple((a, b, tuple(label)) for (a, b), label in zip(chosen, labels))
                graph_id = f"n{n}-g{graph_bits:x}-l" + "_".join("".join(label) for label in labels)
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
    aliases = []
    for spec in (x.strip() for x in from_match.group(1).split(",")):
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
    roots = sorted({uf.find(col) for _, left, _, right in valid for col in (left, right)})
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


def state_count(dp) -> int:
    return sum(len(states) for states in dp.values())


def add_audit(total: dict, current: dict) -> None:
    for key in (
        "candidate_counterexamples",
        "same_signature_pairs",
        "continuation_actions",
        "bound_checks",
        "bound_overestimates",
    ):
        total[key] += current.get(key, 0)
    if total["first_bound_overestimate"] is None and current.get("first_bound_overestimate") is not None:
        total["first_bound_overestimate"] = current["first_bound_overestimate"]


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--contract", required=True)
    parser.add_argument("--output", required=True)
    args = parser.parse_args()
    root = pathlib.Path(__file__).resolve().parent
    contract = (root / args.contract).resolve()
    output = (root / args.output).resolve()
    job_file = (root / ".." / "inputs" / "JOB_4a.sql").resolve()
    if root not in output.parents:
        raise ValueError("Output must stay in revision1")
    if not contract.is_file() or not job_file.is_file():
        raise FileNotFoundError("Frozen revision contract or JOB input missing")
    contract_text = contract.read_text(encoding="utf-8")
    for required in (
        'ndv_A_formula: "ndv(S,A)=min(card(S),2+mask(S)%5)"',
        'ndv_B_formula: "ndv(S,B)=min(card(S),3+(mask(S)*2)%7)"',
        "expected_instance_count: 19440",
        "compact_attempt_limit: 1",
    ):
        if required not in contract_text:
            raise ValueError(f"Contract invariant missing: {required}")
    if job_file.stat().st_size != 450 or sha256_file(job_file) != "C80E515F37A633ADCA3AB45BBD5CBA20E760C80A71D7841B51E64154B1008065":
        raise ValueError("Pinned JOB_4a input mismatch")

    phase_costs = {name: PhaseCost() for name in (
        "exact_control",
        "full_vector_quotient",
        "compact_equivalent_quotient",
        "future_equivalence_audit",
        "bound_oracle_audit",
    )}
    ledgers = {name: Ledger() for name in phase_costs}
    aggregate = {
        "instance_count": 0,
        "formal_instance_count": 0,
        "exact_states": 0,
        "full_vector_states": 0,
        "compact_states": 0,
        "exact_transitions": 0,
        "full_vector_transitions": 0,
        "compact_transitions": 0,
        "exact_retained_payload_bytes": 0,
        "full_vector_retained_payload_bytes": 0,
        "compact_retained_payload_bytes": 0,
        "max_live_exact_retained_payload_bytes": 0,
        "max_live_full_vector_retained_payload_bytes": 0,
        "max_live_compact_retained_payload_bytes": 0,
        "full_vector_optimum_mismatches": 0,
        "compact_optimum_mismatches": 0,
        "compact_equivalence_mismatches": 0,
    }
    audit_total = {
        "candidate_counterexamples": 0,
        "same_signature_pairs": 0,
        "continuation_actions": 0,
        "bound_checks": 0,
        "bound_overestimates": 0,
        "first_bound_overestimate": None,
    }
    references: Dict[str, dict] = {}
    natural_summary = None

    all_start_wall = time.perf_counter()
    all_start_cpu = time.process_time()
    tracemalloc.start()
    instances = itertools.chain(formal_instances(), (parse_job_sql(job_file),))
    for instance in instances:
        aggregate["instance_count"] += 1
        if instance.source_class == "EXHAUSTIVE_FORMAL":
            aggregate["formal_instance_count"] += 1
        exact_ledger = Ledger()
        exact, exact_transitions = measured(
            phase_costs["exact_control"], lambda: exact_dp(instance, exact_ledger)
        )
        ledgers["exact_control"].add(exact_ledger)
        exact_optimum = final_exact_cost(instance, exact[instance.full_mask])
        exact_states = state_count(exact)
        exact_retained = retained_exact_bytes(exact)
        aggregate["exact_states"] += exact_states
        aggregate["exact_transitions"] += exact_transitions
        aggregate["exact_retained_payload_bytes"] += exact_retained
        aggregate["max_live_exact_retained_payload_bytes"] = max(
            aggregate["max_live_exact_retained_payload_bytes"], exact_retained
        )

        signature_audit_ledger = Ledger()
        bound_ledger = Ledger()
        signature_audit = measured(
            phase_costs["future_equivalence_audit"],
            lambda: audit_signatures(instance, exact, signature_audit_ledger),
        )
        bound_audit = measured(
            phase_costs["bound_oracle_audit"],
            lambda: audit_bounds(instance, exact, bound_ledger),
        )
        ledgers["future_equivalence_audit"].add(signature_audit_ledger)
        ledgers["bound_oracle_audit"].add(bound_ledger)
        add_audit(audit_total, signature_audit)
        add_audit(audit_total, bound_audit)

        full_ledger = Ledger()
        full, full_transitions = measured(
            phase_costs["full_vector_quotient"], lambda: quotient_full_dp(instance, full_ledger)
        )
        ledgers["full_vector_quotient"].add(full_ledger)
        full_optimum = final_full_cost(instance, full[instance.full_mask])
        full_states = state_count(full)
        full_retained = retained_full_bytes(full)
        aggregate["full_vector_states"] += full_states
        aggregate["full_vector_transitions"] += full_transitions
        aggregate["full_vector_retained_payload_bytes"] += full_retained
        aggregate["max_live_full_vector_retained_payload_bytes"] = max(
            aggregate["max_live_full_vector_retained_payload_bytes"], full_retained
        )
        if abs(full_optimum - exact_optimum) > EPS:
            aggregate["full_vector_optimum_mismatches"] += 1
        references[instance.name] = {
            "exact_optimum": exact_optimum,
            "full_subset_counts": {str(mask): len(states) for mask, states in full.items()},
            "source_class": instance.source_class,
        }
        if instance.source_class != "EXHAUSTIVE_FORMAL":
            natural_summary = {
                "exact_states": exact_states,
                "full_vector_states": full_states,
                "exact_transitions": exact_transitions,
                "full_vector_transitions": full_transitions,
                "exact_optimum": exact_optimum,
                "full_vector_optimum": full_optimum,
            }
        del exact, full
        if aggregate["instance_count"] % 500 == 0:
            gc.collect()

    exact_work = ledgers["exact_control"].total()
    bound_work = ledgers["bound_oracle_audit"].total()
    full_work = ledgers["full_vector_quotient"].total()
    full_work_residual = exact_work - (full_work + bound_work)
    full_retained_residual = (
        aggregate["exact_retained_payload_bytes"]
        - aggregate["full_vector_retained_payload_bytes"]
    )
    full_absorbed = full_work_residual <= 0 and full_retained_residual <= 0
    compact_triggered = full_absorbed

    if compact_triggered:
        for instance in itertools.chain(formal_instances(), (parse_job_sql(job_file),)):
            compact_ledger = Ledger()
            compact, compact_transitions, local_equivalence_mismatches = measured(
                phase_costs["compact_equivalent_quotient"],
                lambda: quotient_compact_dp(instance, compact_ledger),
            )
            ledgers["compact_equivalent_quotient"].add(compact_ledger)
            compact_optimum = final_compact_cost(instance, compact[instance.full_mask])
            compact_states = state_count(compact)
            compact_retained = retained_compact_bytes(compact)
            reference = references[instance.name]
            count_mismatches = sum(
                int(len(compact[int(mask)]) != expected)
                for mask, expected in reference["full_subset_counts"].items()
            )
            aggregate["compact_equivalence_mismatches"] += local_equivalence_mismatches + count_mismatches
            if abs(compact_optimum - reference["exact_optimum"]) > EPS:
                aggregate["compact_optimum_mismatches"] += 1
            aggregate["compact_states"] += compact_states
            aggregate["compact_transitions"] += compact_transitions
            aggregate["compact_retained_payload_bytes"] += compact_retained
            aggregate["max_live_compact_retained_payload_bytes"] = max(
                aggregate["max_live_compact_retained_payload_bytes"], compact_retained
            )
            if instance.source_class != "EXHAUSTIVE_FORMAL":
                natural_summary.update(
                    {
                        "compact_states": compact_states,
                        "compact_transitions": compact_transitions,
                        "compact_optimum": compact_optimum,
                    }
                )
            del compact
        compact_work = ledgers["compact_equivalent_quotient"].total()
        compact_work_residual = exact_work - (compact_work + bound_work)
        compact_retained_residual = (
            aggregate["exact_retained_payload_bytes"]
            - aggregate["compact_retained_payload_bytes"]
        )
    else:
        compact_work_residual = None
        compact_retained_residual = None

    selected = "compact_equivalent" if compact_triggered else "full_vector"
    selected_work_residual = compact_work_residual if compact_triggered else full_work_residual
    selected_retained_residual = compact_retained_residual if compact_triggered else full_retained_residual
    positive_residual = selected_work_residual > 0 or selected_retained_residual > 0
    hard_fail = any(
        (
            aggregate["full_vector_optimum_mismatches"],
            aggregate["compact_optimum_mismatches"],
            aggregate["compact_equivalence_mismatches"],
            audit_total["candidate_counterexamples"],
            audit_total["bound_overestimates"],
        )
    )
    verdict = "STOP_RECOMMENDED" if hard_fail or not positive_residual else "PRELIMINARY_SUPPORT"
    total_cpu = time.process_time() - all_start_cpu
    total_wall = time.perf_counter() - all_start_wall
    _current, overall_peak = tracemalloc.get_traced_memory()
    tracemalloc.stop()

    payload = {
        "schema_version": "s6-js-prefixbound-stagea-revision-v1",
        "topic_id": "S6-JS-PREFIXBOUND",
        "assignment_id": "STAGEA-L1-20260809-S6-JS-PREFIXBOUND-R1",
        "contract_sha256": sha256_file(contract),
        "input": {"path": "../inputs/JOB_4a.sql", "bytes": job_file.stat().st_size, "sha256": sha256_file(job_file)},
        "python_version": sys.version,
        "frozen_cost_profile": {
            "cardinality": "32+7*mask+3*popcount(mask)",
            "ndv_A": "min(cardinality,2+mask%5)",
            "ndv_B": "min(cardinality,3+(mask*2)%7)",
            "job_EC_mapping": "even->A_formula,odd->B_formula",
        },
        "aggregate": aggregate,
        "audit": audit_total,
        "natural_structure_probe": natural_summary,
        "phase_costs": {name: phase.payload() for name, phase in phase_costs.items()},
        "work_ledgers": {name: ledger.payload() for name, ledger in ledgers.items()},
        "residual_gate": {
            "full_vector_work_residual_units": full_work_residual,
            "full_vector_retained_residual_bytes": full_retained_residual,
            "full_vector_absorbed": full_absorbed,
            "compact_triggered": compact_triggered,
            "compact_attempts": int(compact_triggered),
            "compact_work_residual_units": compact_work_residual,
            "compact_retained_residual_bytes": compact_retained_residual,
            "selected_representation": selected,
            "selected_work_residual_units": selected_work_residual,
            "selected_retained_residual_bytes": selected_retained_residual,
            "positive_deterministic_local_residual": positive_residual,
            "bound_retained_bytes": 0,
            "time_and_peak_ram_used_as_sole_gate": False,
        },
        "job_4a_claim_limit": "NATURAL_GRAPH_STRUCTURE_ONLY_NOT_PERFORMANCE",
        "claim_ceiling": "FINITE_CONTRACT_FAITHFUL_COSTED_NONVACUITY_PRELIMINARY_SUPPORT" if verdict != "STOP_RECOMMENDED" else "NO_BOUNDED_SAME_OBJECT_RESIDUAL_OR_CORRECTNESS_FAILURE",
        "stageb_user_approval_id": None,
        "stageb_authorized": False,
        "total_wall_time_seconds": total_wall,
        "total_process_cpu_time_seconds": total_cpu,
        "overall_peak_tracemalloc_bytes": overall_peak,
        "verdict": verdict,
    }
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({
        "output": str(output),
        "verdict": verdict,
        "formal_instances": aggregate["formal_instance_count"],
        "full_vector_absorbed": full_absorbed,
        "compact_triggered": compact_triggered,
        "selected_representation": selected,
        "selected_work_residual_units": selected_work_residual,
        "selected_retained_residual_bytes": selected_retained_residual,
        "optimum_mismatches": aggregate["full_vector_optimum_mismatches"] + aggregate["compact_optimum_mismatches"],
        "compact_equivalence_mismatches": aggregate["compact_equivalence_mismatches"],
        "bound_overestimates": audit_total["bound_overestimates"],
        "wall_time_seconds": total_wall,
    }, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
