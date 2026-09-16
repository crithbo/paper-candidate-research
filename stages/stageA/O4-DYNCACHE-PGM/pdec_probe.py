#!/usr/bin/env python3
"""Deterministic PDEC leaf-microkernel transition and semantics checker.

This is deliberately narrower than a complete learned index.  It checks the
contract-frozen page-local certificate, copy-on-write transition, exact query
semantics, logical page-touch charge, and dual-version peak-space charge.
"""

from __future__ import annotations

import argparse
import bisect
import gzip
import hashlib
import json
import math
import xml.etree.ElementTree as ET
from collections import Counter, deque
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
from typing import Iterable, Sequence


EPSILON = 1
PAGE_CAPACITY = 4
PAGE_BYTES = 256
PAGE_TOUCH_CAP = 4
AUX_PAGE_CAP = 2
REBUILD_CREDIT = 5
EXHAUSTIVE_UNIVERSE = tuple(range(8))

Page = tuple[int, ...]
State = tuple[Page, ...]


def contract_hash() -> str:
    path = Path(__file__).with_name("EXPERIMENT_CONTRACT.yaml")
    return hashlib.sha256(path.read_bytes()).hexdigest()


def affine_prediction(page: Page, key: int) -> Fraction:
    if len(page) <= 1 or page[-1] == page[0]:
        return Fraction(0)
    prediction = Fraction((key - page[0]) * (len(page) - 1), page[-1] - page[0])
    return min(Fraction(len(page) - 1), max(Fraction(0), prediction))


def certificate_max_error(page: Page) -> Fraction:
    if len(page) <= 2:
        return Fraction(0)
    return max(abs(affine_prediction(page, key) - rank) for rank, key in enumerate(page))


def page_feasible(page: Page) -> bool:
    return 1 <= len(page) <= PAGE_CAPACITY and certificate_max_error(page) <= EPSILON


def validate_state(state: State) -> list[str]:
    failures: list[str] = []
    flattened: list[int] = []
    for index, page in enumerate(state):
        if not page_feasible(page):
            failures.append(f"page[{index}] infeasible: {page}, error={certificate_max_error(page)}")
        if tuple(sorted(set(page))) != page:
            failures.append(f"page[{index}] not strictly sorted: {page}")
        if index and state[index - 1][-1] >= page[0]:
            failures.append(f"page overlap/order violation at {index - 1}/{index}")
        flattened.extend(page)
    if flattened != sorted(set(flattened)):
        failures.append("flattened page coverage is not a strictly sorted set")
    return failures


def local_partition(payload: Sequence[int]) -> tuple[Page, ...]:
    """Minimum-page deterministic partition of one affected page payload."""
    values = tuple(payload)
    if not values:
        return ()
    candidates: list[tuple[tuple[int, ...], tuple[Page, ...]]] = []

    def visit(offset: int, chunks: list[Page]) -> None:
        if offset == len(values):
            sizes = tuple(len(chunk) for chunk in chunks)
            score = (len(chunks), max(sizes) - min(sizes), sizes)
            candidates.append((score, tuple(chunks)))
            return
        for end in range(offset + 1, min(len(values), offset + PAGE_CAPACITY) + 1):
            chunk = values[offset:end]
            if page_feasible(chunk):
                visit(end, chunks + [chunk])

    visit(0, [])
    if not candidates:
        raise AssertionError(f"no feasible local partition for {values}")
    candidates.sort(key=lambda item: (item[0], item[1]))
    return candidates[0][1]


@dataclass(frozen=True)
class Transition:
    state: State
    logical_page_touches: int
    auxiliary_pages: int
    rebuild_key_slots: int
    certificate_recomputations: int
    noop: bool


def locate_insert_page(state: State, key: int) -> int:
    for index, page in enumerate(state):
        if key <= page[-1]:
            return index
    return len(state) - 1


def apply_update(state: State, operation: str, key: int) -> Transition:
    present = any(key in page for page in state)
    if operation == "insert" and present:
        return Transition(state, 1, 0, 0, 0, True)
    if operation == "delete" and not present:
        return Transition(state, 1, 0, 0, 0, True)

    if operation == "insert":
        if not state:
            old_index = 0
            old_page: Page = ()
            payload = (key,)
        else:
            old_index = locate_insert_page(state, key)
            old_page = state[old_index]
            payload = tuple(sorted(old_page + (key,)))
    elif operation == "delete":
        old_index = next(index for index, page in enumerate(state) if key in page)
        old_page = state[old_index]
        payload = tuple(value for value in old_page if value != key)
    else:
        raise ValueError(operation)

    new_pages = local_partition(payload)
    if state:
        new_state = state[:old_index] + new_pages + state[old_index + 1 :]
    else:
        new_state = new_pages
    old_reads = 1 if old_page else 0
    touches = 1 + old_reads + len(new_pages)  # route + old leaf + new leaf images
    return Transition(
        new_state,
        touches,
        len(new_pages),
        len(payload),
        len(new_pages),
        False,
    )


def lower_bound_from_window(page: Page, key: int) -> tuple[int, bool]:
    if not page:
        return 0, True
    prediction = affine_prediction(page, key)
    lo = max(0, math.floor(prediction) - EPSILON - 1)
    hi = min(len(page), math.ceil(prediction) + EPSILON + 2)
    exact = bisect.bisect_left(page, key)
    covered = lo <= exact <= hi
    local = lo + bisect.bisect_left(page[lo:hi], key)
    return local, covered and local == exact


def predecessor_query(state: State, key: int) -> tuple[int | None, bool, int]:
    if not state or key <= state[0][0]:
        return None, True, 1
    page_index = next((i for i, page in enumerate(state) if page[-1] >= key), len(state) - 1)
    page = state[page_index]
    position, window_ok = lower_bound_from_window(page, key)
    if position:
        value = page[position - 1]
    elif page_index:
        value = state[page_index - 1][-1]
    else:
        value = None
    return value, window_ok, 2


def range_query(state: State, low: int, high: int) -> tuple[list[int], bool, int]:
    if not state or low > high:
        return [], True, 1
    start = next((i for i, page in enumerate(state) if page[-1] >= low), None)
    if start is None:
        return [], True, 1
    position, window_ok = lower_bound_from_window(state[start], low)
    output: list[int] = []
    leaf_touches = 0
    for page_index in range(start, len(state)):
        page = state[page_index]
        leaf_touches += 1
        begin = position if page_index == start else 0
        for value in page[begin:]:
            if value > high:
                return output, window_ok, 1 + leaf_touches
            output.append(value)
        if page[-1] > high:
            break
    return output, window_ok, 1 + leaf_touches


def oracle_values(state: State) -> list[int]:
    return [value for page in state for value in page]


def verify_queries(state: State, probes: Iterable[int], ranges: Iterable[tuple[int, int]]) -> tuple[int, int, list[str]]:
    values = oracle_values(state)
    failures: list[str] = []
    predecessor_count = 0
    range_count = 0
    for key in probes:
        actual, window_ok, _touches = predecessor_query(state, key)
        position = bisect.bisect_left(values, key)
        expected = values[position - 1] if position else None
        predecessor_count += 1
        if actual != expected or not window_ok:
            failures.append(f"predecessor({key}) actual={actual} expected={expected} window_ok={window_ok} state={state}")
    for low, high in ranges:
        actual, window_ok, touches = range_query(state, low, high)
        expected = [value for value in values if low <= value <= high]
        range_count += 1
        if actual != expected or not window_ok:
            failures.append(f"range({low},{high}) actual={actual} expected={expected} window_ok={window_ok} state={state}")
        leaf_touches = max(0, touches - 1)
        if leaf_touches > len(expected) + 1:
            failures.append(f"range output-sensitivity bound failed: output={len(expected)} leaf_touches={leaf_touches}")
    return predecessor_count, range_count, failures


def check_transition(old_state: State, transition: Transition) -> list[str]:
    failures = validate_state(transition.state)
    if transition.logical_page_touches > PAGE_TOUCH_CAP:
        failures.append(f"page touches {transition.logical_page_touches} > {PAGE_TOUCH_CAP}")
    if transition.auxiliary_pages > AUX_PAGE_CAP:
        failures.append(f"aux pages {transition.auxiliary_pages} > {AUX_PAGE_CAP}")
    if transition.rebuild_key_slots > REBUILD_CREDIT:
        failures.append(f"rebuild slots {transition.rebuild_key_slots} > {REBUILD_CREDIT}")
    if transition.auxiliary_pages * PAGE_BYTES > AUX_PAGE_CAP * PAGE_BYTES:
        failures.append("auxiliary byte cap exceeded")
    # During copy-on-write publication the pre-state remains fully queryable.
    failures.extend(f"old-version visibility: {item}" for item in validate_state(old_state))
    return failures


def exhaustive_probe() -> dict[str, object]:
    initial: State = ()
    queue: deque[State] = deque([initial])
    seen: set[State] = {initial}
    failures: list[str] = []
    transitions = 0
    noops = 0
    predecessor_checks = 0
    range_checks = 0
    max_touches = 0
    max_aux = 0
    max_rebuild = 0
    max_pages = 0
    probes = range(-1, 9)
    ranges = tuple((low, high) for low in EXHAUSTIVE_UNIVERSE for high in EXHAUSTIVE_UNIVERSE if low <= high)

    while queue:
        state = queue.popleft()
        max_pages = max(max_pages, len(state))
        state_failures = validate_state(state)
        pc, rc, query_failures = verify_queries(state, probes, ranges)
        predecessor_checks += pc
        range_checks += rc
        failures.extend(state_failures)
        failures.extend(query_failures)
        for operation in ("insert", "delete"):
            for key in EXHAUSTIVE_UNIVERSE:
                transition = apply_update(state, operation, key)
                transitions += 1
                noops += int(transition.noop)
                max_touches = max(max_touches, transition.logical_page_touches)
                max_aux = max(max_aux, transition.auxiliary_pages)
                max_rebuild = max(max_rebuild, transition.rebuild_key_slots)
                transition_failures = check_transition(state, transition)
                if transition_failures:
                    failures.extend(f"{operation} {key} from {state}: {item}" for item in transition_failures)
                if transition.state not in seen:
                    seen.add(transition.state)
                    queue.append(transition.state)
        if len(failures) > 100:
            break

    return {
        "schema_version": "o4-pdec-probe-v1",
        "mode": "exhaustive",
        "contract_sha256": contract_hash(),
        "parameters": {
            "epsilon_rank": EPSILON,
            "page_capacity_keys": PAGE_CAPACITY,
            "page_touch_cap": PAGE_TOUCH_CAP,
            "dual_version_aux_page_cap": AUX_PAGE_CAP,
            "rebuild_credit_key_slots": REBUILD_CREDIT,
            "key_universe": list(EXHAUSTIVE_UNIVERSE),
        },
        "reachable_states": len(seen),
        "transitions_checked": transitions,
        "noop_transitions": noops,
        "predecessor_queries_checked": predecessor_checks,
        "range_queries_checked": range_checks,
        "maximum_committed_leaf_pages": max_pages,
        "maximum_logical_page_touches_per_update": max_touches,
        "maximum_dual_version_aux_pages": max_aux,
        "maximum_peak_auxiliary_bytes": max_aux * PAGE_BYTES,
        "maximum_rebuild_key_slots": max_rebuild,
        "semantic_or_invariant_failures": len(failures),
        "failure_examples": failures[:20],
        "verdict": "NOT_FALSIFIED" if not failures else "NEGATIVE_KILL",
    }


def hilbert_index_16(x: int, y: int) -> int:
    """Map two 16-bit coordinates to a 32-bit Hilbert distance."""
    n = 1 << 16
    distance = 0
    scale = n >> 1
    while scale:
        rx = 1 if x & scale else 0
        ry = 1 if y & scale else 0
        distance += scale * scale * ((3 * rx) ^ ry)
        if ry == 0:
            if rx == 1:
                x = n - 1 - x
                y = n - 1 - y
            x, y = y, x
        scale >>= 1
    return distance


def node_key(node: ET.Element) -> int:
    lon = float(node.attrib["lon"])
    lat = float(node.attrib["lat"])
    x = min(65_535, max(0, round((lon + 180.0) / 360.0 * 65_535)))
    y = min(65_535, max(0, round((lat + 90.0) / 180.0 * 65_535)))
    cell = hilbert_index_16(x, y)
    entity_id = int(node.attrib["id"])  # node type tag is zero in the frozen type-qualified layout
    return (cell << 64) | entity_id


def natural_probe(path: Path) -> dict[str, object]:
    payload = path.read_bytes()
    state: State = ()
    reference: set[int] = set()
    id_to_key: dict[int, int] = {}
    failures: list[str] = []
    event_counts: Counter[str] = Counter()
    effective_counts: Counter[str] = Counter()
    timestamps: list[str] = []
    effective_updates = 0
    noops = 0
    max_touches = 0
    max_aux = 0
    max_rebuild = 0

    with gzip.GzipFile(fileobj=__import__("io").BytesIO(payload)) as stream:
        root = ET.parse(stream).getroot()
    if root.tag != "osmChange":
        failures.append(f"unexpected root {root.tag}")

    def perform(operation: str, key: int) -> None:
        nonlocal state, effective_updates, noops, max_touches, max_aux, max_rebuild
        old_state = state
        transition = apply_update(state, operation, key)
        state = transition.state
        max_touches = max(max_touches, transition.logical_page_touches)
        max_aux = max(max_aux, transition.auxiliary_pages)
        max_rebuild = max(max_rebuild, transition.rebuild_key_slots)
        noops += int(transition.noop)
        effective_updates += int(not transition.noop)
        if operation == "insert":
            reference.add(key)
        else:
            reference.discard(key)
        transition_failures = check_transition(old_state, transition)
        failures.extend(transition_failures)
        flattened = oracle_values(state)
        if flattened != sorted(reference):
            failures.append("natural replay state differs from exact sorted-set oracle")
        probes = {key, max(0, key - 1), key + 1}
        if flattened:
            probes.update((flattened[0], flattened[-1], flattened[-1] + 1))
        pc, rc, query_failures = verify_queries(
            state,
            sorted(probes),
            ((max(0, key - 1), key + 1), (key, key)),
        )
        del pc, rc
        failures.extend(query_failures)

    for action_wrapper in root:
        action = action_wrapper.tag
        if action not in {"create", "modify", "delete"}:
            continue
        for element in action_wrapper:
            if element.tag != "node":
                continue
            event_counts[action] += 1
            timestamp = element.attrib.get("timestamp")
            if timestamp:
                timestamps.append(timestamp)
            node_id = int(element.attrib["id"])
            previous = id_to_key.get(node_id)
            if action == "delete":
                if previous is None:
                    noops += 1
                    effective_counts["delete_absent_noop"] += 1
                else:
                    perform("delete", previous)
                    effective_counts["delete"] += 1
                    id_to_key.pop(node_id, None)
                continue
            if "lat" not in element.attrib or "lon" not in element.attrib:
                noops += 1
                effective_counts["missing_coordinate_noop"] += 1
                continue
            current = node_key(element)
            if previous is not None and previous != current:
                perform("delete", previous)
                effective_counts["relocation_delete"] += 1
            transition_before = effective_updates
            perform("insert", current)
            if effective_updates > transition_before:
                effective_counts["upsert_insert"] += 1
            else:
                effective_counts["same_key_noop"] += 1
            id_to_key[node_id] = current

    timestamp_inversions = sum(left > right for left, right in zip(timestamps, timestamps[1:]))
    return {
        "schema_version": "o4-pdec-probe-v1",
        "mode": "natural",
        "contract_sha256": contract_hash(),
        "input": {
            "filename": path.name,
            "bytes": len(payload),
            "sha256": hashlib.sha256(payload).hexdigest(),
            "sequence_number": 7_235_045,
        },
        "osm_node_events": sum(event_counts.values()),
        "event_counts": dict(sorted(event_counts.items())),
        "effective_operation_counts": dict(sorted(effective_counts.items())),
        "effective_updates": effective_updates,
        "noops_or_unobserved_deletes": noops,
        "observed_active_ids": len(id_to_key),
        "final_keys": len(reference),
        "final_committed_leaf_pages": len(state),
        "timestamp_min": min(timestamps) if timestamps else None,
        "timestamp_max": max(timestamps) if timestamps else None,
        "timestamp_order_inversions": timestamp_inversions,
        "maximum_logical_page_touches_per_update": max_touches,
        "maximum_dual_version_aux_pages": max_aux,
        "maximum_peak_auxiliary_bytes": max_aux * PAGE_BYTES,
        "maximum_rebuild_key_slots": max_rebuild,
        "semantic_or_invariant_failures": len(failures),
        "failure_examples": failures[:20],
        "verdict": "PRELIMINARY_SUPPORT" if effective_updates and not failures else "NEGATIVE_OR_INCONCLUSIVE",
        "honesty_limit": "observed-window node replay; not a full OSM snapshot replay and not a scalable directory benchmark",
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--mode", choices=("exhaustive", "natural"), required=True)
    parser.add_argument("--input", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if args.mode == "exhaustive":
        result = exhaustive_probe()
    else:
        if args.input is None:
            parser.error("--input is required for natural mode")
        result = natural_probe(args.input)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({"mode": args.mode, "output": str(args.output), "verdict": result["verdict"]}, sort_keys=True))
    return 0 if result["semantic_or_invariant_failures"] == 0 else 2


if __name__ == "__main__":
    raise SystemExit(main())
