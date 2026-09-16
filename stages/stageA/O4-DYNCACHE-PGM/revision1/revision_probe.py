#!/usr/bin/env python3
"""Atomic Stage A revision: PDEC non-vacuity and B-tree absorption probe."""

from __future__ import annotations

import argparse
import bisect
import gzip
import hashlib
import json
import math
import xml.etree.ElementTree as ET
from collections import Counter, defaultdict, deque
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
from typing import Iterable, Sequence


EPSILON = 1
PAGE_CAPACITY = 4
PAGE_BYTES = 256
AFFINE_METADATA_BYTES = 24
PAGE_TOUCH_CAP = 4
AUX_PAGE_CAP = 2
REBUILD_SLOT_CAP = 5
UNIVERSE = tuple(range(8))

PLAIN = "PLAIN_COW_BTREE_LEAF"
AFFINE = "BTREE_LEAF_WITH_AFFINE_HINT_DEFAULT"
ABSORBER = "BTREE_LEAF_WITH_AFFINE_HINT_ABSORPTION_FRONTIER"
PDEC = "PDEC"
MECHANISMS = (PLAIN, AFFINE, ABSORBER, PDEC)

Page = tuple[int, ...]
State = tuple[Page, ...]
JointState = tuple[State, State, State, State]


def contract_hash() -> str:
    return hashlib.sha256(Path(__file__).with_name("REVISION_EXPERIMENT_CONTRACT.yaml").read_bytes()).hexdigest()


def affine_prediction(page: Page, key: int) -> Fraction:
    if len(page) <= 1 or page[-1] == page[0]:
        return Fraction(0)
    value = Fraction((key - page[0]) * (len(page) - 1), page[-1] - page[0])
    return min(Fraction(len(page) - 1), max(Fraction(0), value))


def certificate_max_error(page: Page) -> Fraction:
    if len(page) <= 2:
        return Fraction(0)
    return max(abs(affine_prediction(page, key) - rank) for rank, key in enumerate(page))


def certificate_feasible(page: Page) -> bool:
    return 1 <= len(page) <= PAGE_CAPACITY and certificate_max_error(page) <= EPSILON


def capacity_feasible(page: Page) -> bool:
    return 1 <= len(page) <= PAGE_CAPACITY


def mechanism_requires_certificate(mechanism: str) -> bool:
    return mechanism in (ABSORBER, PDEC)


def mechanism_has_affine_metadata(mechanism: str) -> bool:
    return mechanism in (AFFINE, ABSORBER, PDEC)


def page_feasible(page: Page, mechanism: str) -> bool:
    return certificate_feasible(page) if mechanism_requires_certificate(mechanism) else capacity_feasible(page)


def validate_state(state: State, mechanism: str) -> list[str]:
    failures: list[str] = []
    flat: list[int] = []
    for index, page in enumerate(state):
        if tuple(sorted(set(page))) != page:
            failures.append(f"{mechanism} page {index} is not a strict sorted set: {page}")
        if not page_feasible(page, mechanism):
            failures.append(f"{mechanism} page {index} violates its declared policy: {page}")
        if index and state[index - 1][-1] >= page[0]:
            failures.append(f"{mechanism} page ordering overlap at {index - 1}/{index}")
        flat.extend(page)
    if flat != sorted(set(flat)):
        failures.append(f"{mechanism} flattened coverage is not a strict sorted set")
    return failures


def local_partition(payload: Sequence[int], mechanism: str) -> tuple[Page, ...]:
    values = tuple(payload)
    if not values:
        return ()
    choices: list[tuple[tuple[int, int, tuple[int, ...]], tuple[Page, ...]]] = []

    def visit(offset: int, pages: tuple[Page, ...]) -> None:
        if offset == len(values):
            sizes = tuple(len(page) for page in pages)
            choices.append(((len(pages), max(sizes) - min(sizes), sizes), pages))
            return
        for end in range(offset + 1, min(len(values), offset + PAGE_CAPACITY) + 1):
            page = values[offset:end]
            if page_feasible(page, mechanism):
                visit(end, pages + (page,))

    visit(0, ())
    if not choices:
        raise AssertionError(f"no partition for {mechanism}: {values}")
    choices.sort(key=lambda item: (item[0], item[1]))
    return choices[0][1]


@dataclass(frozen=True)
class Transition:
    state: State
    action: tuple[Page, ...]
    cost: tuple[tuple[str, int], ...]
    noop: bool

    def cost_dict(self) -> dict[str, int]:
        return dict(self.cost)


def locate_insert_page(state: State, key: int) -> int:
    for index, page in enumerate(state):
        if key <= page[-1]:
            return index
    return len(state) - 1


def apply_update(state: State, mechanism: str, operation: str, key: int) -> Transition:
    present = any(key in page for page in state)
    if (operation == "insert" and present) or (operation == "delete" and not present):
        cost = {
            "logical_route_page_touches": 1,
            "old_leaf_reads": 0,
            "new_leaf_writes": 0,
            "page_payload_bytes_written": 0,
            "affine_metadata_bytes_written": 0,
            "certificate_key_evaluations": 0,
            "rebuilt_key_slots": 0,
            "auxiliary_page_images": 0,
            "peak_auxiliary_bytes": 0,
        }
        return Transition(state, (), tuple(sorted(cost.items())), True)

    if operation == "insert":
        if not state:
            index = 0
            old_page: Page = ()
            payload = (key,)
        else:
            index = locate_insert_page(state, key)
            old_page = state[index]
            payload = tuple(sorted(old_page + (key,)))
    elif operation == "delete":
        index = next(i for i, page in enumerate(state) if key in page)
        old_page = state[index]
        payload = tuple(value for value in old_page if value != key)
    else:
        raise ValueError(operation)

    new_pages = local_partition(payload, mechanism)
    new_state = (state[:index] + new_pages + state[index + 1 :]) if state else new_pages
    metadata_pages = len(new_pages) if mechanism_has_affine_metadata(mechanism) else 0
    certificate_evaluations = len(payload) if mechanism_has_affine_metadata(mechanism) else 0
    old_reads = 1 if old_page else 0
    cost = {
        "logical_route_page_touches": 1 + old_reads + len(new_pages),
        "old_leaf_reads": old_reads,
        "new_leaf_writes": len(new_pages),
        "page_payload_bytes_written": len(new_pages) * PAGE_BYTES,
        "affine_metadata_bytes_written": metadata_pages * AFFINE_METADATA_BYTES,
        "certificate_key_evaluations": certificate_evaluations,
        "rebuilt_key_slots": len(payload),
        "auxiliary_page_images": len(new_pages),
        "peak_auxiliary_bytes": len(new_pages) * PAGE_BYTES + metadata_pages * AFFINE_METADATA_BYTES,
    }
    return Transition(new_state, new_pages, tuple(sorted(cost.items())), False)


def state_cost(state: State, mechanism: str) -> dict[str, int]:
    metadata = len(state) * AFFINE_METADATA_BYTES if mechanism_has_affine_metadata(mechanism) else 0
    return {
        "committed_leaf_pages": len(state),
        "committed_payload_bytes": len(state) * PAGE_BYTES,
        "committed_affine_metadata_bytes": metadata,
        "committed_total_bytes": len(state) * PAGE_BYTES + metadata,
    }


def bisect_left_count(values: Sequence[int], key: int) -> tuple[int, int]:
    low, high, comparisons = 0, len(values), 0
    while low < high:
        mid = (low + high) // 2
        comparisons += 1
        if values[mid] < key:
            low = mid + 1
        else:
            high = mid
    return low, comparisons


def model_window(page: Page, key: int) -> tuple[int, int]:
    prediction = affine_prediction(page, key)
    low = max(0, math.floor(prediction) - EPSILON - 1)
    high = min(len(page), math.ceil(prediction) + EPSILON + 2)
    return low, high


def predecessor_profile(state: State, mechanism: str, key: int) -> tuple[int | None, dict[str, int | bool]]:
    if not state or key <= state[0][0]:
        return None, {
            "model_evaluations": 0,
            "candidate_key_slots": 0,
            "exact_key_comparisons": 0,
            "full_leaf_fallbacks": 0,
            "certificate_guarantee": mechanism_requires_certificate(mechanism),
        }
    page_index = next((i for i, page in enumerate(state) if page[-1] >= key), len(state) - 1)
    page = state[page_index]
    use_model = mechanism_has_affine_metadata(mechanism)
    certified = certificate_feasible(page)
    fallback = use_model and not certified
    if use_model and certified:
        low, high = model_window(page, key)
    else:
        low, high = 0, len(page)
    local_position, comparisons = bisect_left_count(page[low:high], key)
    position = low + local_position
    if position:
        predecessor = page[position - 1]
    elif page_index:
        predecessor = state[page_index - 1][-1]
    else:
        predecessor = None
    return predecessor, {
        "model_evaluations": int(use_model),
        "candidate_key_slots": high - low,
        "exact_key_comparisons": comparisons,
        "full_leaf_fallbacks": int(fallback),
        "certificate_guarantee": mechanism_requires_certificate(mechanism),
    }


def range_result(state: State, low: int, high: int) -> tuple[list[int], int]:
    if not state or low > high:
        return [], 0
    start = next((i for i, page in enumerate(state) if page[-1] >= low), None)
    if start is None:
        return [], 0
    output: list[int] = []
    leaf_pages = 0
    for page in state[start:]:
        leaf_pages += 1
        for key in page:
            if key < low:
                continue
            if key > high:
                return output, leaf_pages
            output.append(key)
    return output, leaf_pages


def flatten(state: State) -> list[int]:
    return [key for page in state for key in page]


def transition_cap_failures(mechanism: str, transition: Transition) -> list[str]:
    cost = transition.cost_dict()
    failures: list[str] = []
    if cost["logical_route_page_touches"] > PAGE_TOUCH_CAP:
        failures.append(f"{mechanism} page touches exceed {PAGE_TOUCH_CAP}: {cost}")
    if cost["auxiliary_page_images"] > AUX_PAGE_CAP:
        failures.append(f"{mechanism} auxiliary pages exceed {AUX_PAGE_CAP}: {cost}")
    if cost["rebuilt_key_slots"] > REBUILD_SLOT_CAP:
        failures.append(f"{mechanism} rebuilt slots exceed {REBUILD_SLOT_CAP}: {cost}")
    return failures


def trace_to_json(trace: tuple[tuple[str, int], ...], final_operation: tuple[str, int] | None = None) -> list[dict[str, int | str]]:
    rows = [{"operation": operation, "key": key} for operation, key in trace]
    if final_operation is not None:
        rows.append({"operation": final_operation[0], "key": final_operation[1]})
    return rows


def exhaustive_probe() -> dict[str, object]:
    empty: State = ()
    initial: JointState = (empty, empty, empty, empty)
    queue: deque[JointState] = deque([initial])
    traces: dict[JointState, tuple[tuple[str, int], ...]] = {initial: ()}
    failures: list[str] = []
    transitions_checked = 0
    absorbable = 0
    unabsorbable = 0
    pdec_plain_state_differences = 0
    pdec_affine_default_state_differences = 0
    pdec_more_pages_than_plain = 0
    pdec_extra_write_bytes_events = 0
    pdec_unique_residual_cases = 0
    first_plain_difference: dict[str, object] | None = None
    first_affine_default_difference: dict[str, object] | None = None
    query_counts = Counter()
    query_max: dict[str, dict[str, int]] = {
        mechanism: {"candidate_key_slots": 0, "exact_key_comparisons": 0, "full_leaf_fallbacks": 0}
        for mechanism in MECHANISMS
    }
    update_max: dict[str, dict[str, int]] = {mechanism: defaultdict(int) for mechanism in MECHANISMS}
    update_sum: dict[str, dict[str, int]] = {mechanism: defaultdict(int) for mechanism in MECHANISMS}
    useful_subpage_bound_violations = 0
    ranges = tuple((low, high) for low in UNIVERSE for high in UNIVERSE if low <= high)

    while queue:
        joint = queue.popleft()
        trace = traces[joint]
        logical_sets = [flatten(state) for state in joint]
        if len({tuple(values) for values in logical_sets}) != 1:
            failures.append(f"logical object divergence at trace {trace}: {logical_sets}")
        for mechanism, state in zip(MECHANISMS, joint):
            failures.extend(validate_state(state, mechanism))
            values = flatten(state)
            for query in range(-1, 9):
                actual, profile = predecessor_profile(state, mechanism, query)
                position = bisect.bisect_left(values, query)
                expected = values[position - 1] if position else None
                query_counts[f"{mechanism}:predecessor"] += 1
                if actual != expected:
                    failures.append(f"{mechanism} predecessor({query})={actual}, expected={expected}, trace={trace}")
                for metric in ("candidate_key_slots", "exact_key_comparisons"):
                    query_max[mechanism][metric] = max(query_max[mechanism][metric], int(profile[metric]))
                query_max[mechanism]["full_leaf_fallbacks"] += int(profile["full_leaf_fallbacks"])
                if mechanism == PDEC and int(profile["candidate_key_slots"]) >= PAGE_CAPACITY:
                    useful_subpage_bound_violations += 1
            for low, high in ranges:
                actual, pages = range_result(state, low, high)
                expected = [key for key in values if low <= key <= high]
                query_counts[f"{mechanism}:range"] += 1
                if actual != expected:
                    failures.append(f"{mechanism} range({low},{high}) mismatch at trace={trace}")
                if pages > len(expected) + 1:
                    failures.append(f"{mechanism} output-sensitive page bound failed at trace={trace}")

        # The affine control's guarantee-preserving frontier must match PDEC query-by-query.
        for query in range(-1, 9):
            _, absorber_profile = predecessor_profile(joint[2], ABSORBER, query)
            _, pdec_profile = predecessor_profile(joint[3], PDEC, query)
            if absorber_profile != pdec_profile:
                failures.append(f"affine frontier query profile differs from PDEC at trace={trace}, q={query}")

        for operation in ("insert", "delete"):
            for key in UNIVERSE:
                transitions = tuple(
                    apply_update(state, mechanism, operation, key)
                    for mechanism, state in zip(MECHANISMS, joint)
                )
                transitions_checked += 1
                for mechanism, transition in zip(MECHANISMS, transitions):
                    failures.extend(transition_cap_failures(mechanism, transition))
                    for metric, value in transition.cost_dict().items():
                        update_max[mechanism][metric] = max(update_max[mechanism][metric], value)
                        update_sum[mechanism][metric] += value

                pdec_transition = transitions[3]
                absorber_transition = transitions[2]
                if pdec_transition.state == absorber_transition.state and pdec_transition.action == absorber_transition.action and pdec_transition.cost == absorber_transition.cost:
                    absorbable += 1
                else:
                    unabsorbable += 1
                    pdec_unique_residual_cases += 1

                if pdec_transition.state != transitions[0].state:
                    pdec_plain_state_differences += 1
                    if len(pdec_transition.state) > len(transitions[0].state):
                        pdec_more_pages_than_plain += 1
                    if first_plain_difference is None:
                        first_plain_difference = {
                            "trace": trace_to_json(trace, (operation, key)),
                            "plain_state": transitions[0].state,
                            "pdec_state": pdec_transition.state,
                            "plain_cost": transitions[0].cost_dict(),
                            "pdec_cost": pdec_transition.cost_dict(),
                            "affine_frontier_state": absorber_transition.state,
                        }
                if pdec_transition.state != transitions[1].state:
                    pdec_affine_default_state_differences += 1
                    if first_affine_default_difference is None:
                        first_affine_default_difference = {
                            "trace": trace_to_json(trace, (operation, key)),
                            "affine_default_state": transitions[1].state,
                            "pdec_state": pdec_transition.state,
                            "affine_frontier_state": absorber_transition.state,
                        }
                if pdec_transition.cost_dict()["page_payload_bytes_written"] > transitions[0].cost_dict()["page_payload_bytes_written"]:
                    pdec_extra_write_bytes_events += 1

                next_joint: JointState = tuple(transition.state for transition in transitions)  # type: ignore[assignment]
                if next_joint not in traces:
                    traces[next_joint] = trace + ((operation, key),)
                    queue.append(next_joint)
        if len(failures) > 100:
            break

    all_absorbed = unabsorbable == 0 and pdec_unique_residual_cases == 0
    return {
        "schema_version": "o4-pdec-revision-probe-v1",
        "mode": "exhaustive",
        "contract_sha256": contract_hash(),
        "joint_reachable_states": len(traces),
        "transitions_checked": transitions_checked,
        "query_counts": dict(sorted(query_counts.items())),
        "semantic_or_accounting_failures": len(failures),
        "failure_examples": failures[:20],
        "absorption": {
            "pdec_transitions_in_affine_control_frontier": absorbable,
            "pdec_transitions_outside_affine_control_frontier": unabsorbable,
            "pdec_unique_residual_cases": pdec_unique_residual_cases,
            "all_pdec_behavior_absorbed": all_absorbed,
        },
        "default_policy_differences": {
            "pdec_vs_plain_state_events": pdec_plain_state_differences,
            "pdec_vs_affine_default_state_events": pdec_affine_default_state_differences,
            "pdec_more_pages_than_plain_events": pdec_more_pages_than_plain,
            "pdec_more_payload_write_bytes_than_plain_events": pdec_extra_write_bytes_events,
            "first_plain_difference": first_plain_difference,
            "first_affine_default_difference": first_affine_default_difference,
            "interpretation": "default-policy differences do not count when the affine control frontier reproduces PDEC",
        },
        "query_maxima": query_max,
        "pdec_strict_subpage_candidate_bound": {
            "required_max_candidate_slots_less_than": PAGE_CAPACITY,
            "violating_query_instances": useful_subpage_bound_violations,
            "satisfied": useful_subpage_bound_violations == 0,
        },
        "update_cost_maxima": {mechanism: dict(sorted(values.items())) for mechanism, values in update_max.items()},
        "update_cost_sums_over_reachable_graph": {mechanism: dict(sorted(values.items())) for mechanism, values in update_sum.items()},
        "gate_verdict": "STOP_RECOMMENDED" if all_absorbed else "PASS_RECOMMENDED",
        "evidence_ceiling": "NEGATIVE_ABSORPTION_RESULT" if all_absorbed else "PRELIMINARY_SUPPORT",
    }


def hilbert_index_16(x: int, y: int) -> int:
    size = 1 << 16
    distance = 0
    scale = size >> 1
    while scale:
        rx = 1 if x & scale else 0
        ry = 1 if y & scale else 0
        distance += scale * scale * ((3 * rx) ^ ry)
        if ry == 0:
            if rx == 1:
                x = size - 1 - x
                y = size - 1 - y
            x, y = y, x
        scale >>= 1
    return distance


def node_key(node: ET.Element) -> int:
    lon = float(node.attrib["lon"])
    lat = float(node.attrib["lat"])
    x = min(65_535, max(0, round((lon + 180.0) / 360.0 * 65_535)))
    y = min(65_535, max(0, round((lat + 90.0) / 180.0 * 65_535)))
    return (hilbert_index_16(x, y) << 64) | int(node.attrib["id"])


def natural_probe(input_path: Path) -> dict[str, object]:
    payload = input_path.read_bytes()
    joint: JointState = ((), (), (), ())
    reference: set[int] = set()
    id_to_key: dict[int, int] = {}
    failures: list[str] = []
    event_counts: Counter[str] = Counter()
    effective_counts: Counter[str] = Counter()
    aggregate_cost: dict[str, dict[str, int]] = {mechanism: defaultdict(int) for mechanism in MECHANISMS}
    max_cost: dict[str, dict[str, int]] = {mechanism: defaultdict(int) for mechanism in MECHANISMS}
    effective_updates = 0
    noops = 0
    absorbable = 0
    unabsorbable = 0
    pdec_plain_state_differences = 0
    pdec_affine_default_state_differences = 0
    pdec_extra_pages_events = 0
    first_difference: dict[str, object] | None = None
    pdec_query_max_slots = 0
    pdec_query_bound_violations = 0

    with gzip.GzipFile(fileobj=__import__("io").BytesIO(payload)) as stream:
        root = ET.parse(stream).getroot()

    def perform(operation: str, key: int) -> None:
        nonlocal joint, effective_updates, noops, absorbable, unabsorbable
        nonlocal pdec_plain_state_differences, pdec_affine_default_state_differences
        nonlocal pdec_extra_pages_events, first_difference, pdec_query_max_slots, pdec_query_bound_violations
        transitions = tuple(
            apply_update(state, mechanism, operation, key)
            for mechanism, state in zip(MECHANISMS, joint)
        )
        noops += int(transitions[3].noop)
        effective_updates += int(not transitions[3].noop)
        for mechanism, transition in zip(MECHANISMS, transitions):
            failures.extend(transition_cap_failures(mechanism, transition))
            for metric, value in transition.cost_dict().items():
                aggregate_cost[mechanism][metric] += value
                max_cost[mechanism][metric] = max(max_cost[mechanism][metric], value)
        if transitions[3].state == transitions[2].state and transitions[3].action == transitions[2].action and transitions[3].cost == transitions[2].cost:
            absorbable += 1
        else:
            unabsorbable += 1
        if transitions[3].state != transitions[0].state:
            pdec_plain_state_differences += 1
            if len(transitions[3].state) > len(transitions[0].state):
                pdec_extra_pages_events += 1
            if first_difference is None:
                first_difference = {
                    "operation": operation,
                    "key": key,
                    "plain_pages": len(transitions[0].state),
                    "pdec_pages": len(transitions[3].state),
                    "affine_frontier_pages": len(transitions[2].state),
                    "plain_cost": transitions[0].cost_dict(),
                    "pdec_cost": transitions[3].cost_dict(),
                }
        if transitions[3].state != transitions[1].state:
            pdec_affine_default_state_differences += 1
        joint = tuple(transition.state for transition in transitions)  # type: ignore[assignment]
        if operation == "insert":
            reference.add(key)
        else:
            reference.discard(key)
        for mechanism, state in zip(MECHANISMS, joint):
            failures.extend(validate_state(state, mechanism))
            if flatten(state) != sorted(reference):
                failures.append(f"{mechanism} natural state differs from exact oracle")
            for query in (max(0, key - 1), key, key + 1):
                actual, profile = predecessor_profile(state, mechanism, query)
                position = bisect.bisect_left(sorted(reference), query)
                expected = sorted(reference)[position - 1] if position else None
                if actual != expected:
                    failures.append(f"{mechanism} natural predecessor mismatch")
                if mechanism == PDEC:
                    slots = int(profile["candidate_key_slots"])
                    pdec_query_max_slots = max(pdec_query_max_slots, slots)
                    pdec_query_bound_violations += int(slots >= PAGE_CAPACITY)
        for query in (max(0, key - 1), key, key + 1):
            _, absorber_profile = predecessor_profile(joint[2], ABSORBER, query)
            _, pdec_profile = predecessor_profile(joint[3], PDEC, query)
            if absorber_profile != pdec_profile:
                failures.append("natural affine frontier query profile differs from PDEC")

    for wrapper in root:
        action = wrapper.tag
        if action not in {"create", "modify", "delete"}:
            continue
        for element in wrapper:
            if element.tag != "node":
                continue
            event_counts[action] += 1
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
            before = effective_updates
            perform("insert", current)
            effective_counts["upsert_insert" if effective_updates > before else "same_key_noop"] += 1
            id_to_key[node_id] = current

    all_absorbed = unabsorbable == 0
    return {
        "schema_version": "o4-pdec-revision-probe-v1",
        "mode": "natural",
        "contract_sha256": contract_hash(),
        "input": {
            "filename": input_path.name,
            "bytes": len(payload),
            "sha256": hashlib.sha256(payload).hexdigest(),
            "sequence_number": 7_235_045,
        },
        "event_counts": dict(sorted(event_counts.items())),
        "effective_operation_counts": dict(sorted(effective_counts.items())),
        "effective_updates": effective_updates,
        "noops_or_unobserved_deletes": noops,
        "semantic_or_accounting_failures": len(failures),
        "failure_examples": failures[:20],
        "absorption": {
            "pdec_transitions_in_affine_control_frontier": absorbable,
            "pdec_transitions_outside_affine_control_frontier": unabsorbable,
            "pdec_unique_residual_cases": 0 if all_absorbed else unabsorbable,
            "all_pdec_behavior_absorbed": all_absorbed,
        },
        "default_policy_differences": {
            "pdec_vs_plain_state_events": pdec_plain_state_differences,
            "pdec_vs_affine_default_state_events": pdec_affine_default_state_differences,
            "pdec_more_pages_than_plain_events": pdec_extra_pages_events,
            "first_difference": first_difference,
        },
        "aggregate_update_cost": {mechanism: dict(sorted(values.items())) for mechanism, values in aggregate_cost.items()},
        "maximum_update_cost": {mechanism: dict(sorted(values.items())) for mechanism, values in max_cost.items()},
        "final_state_cost": {mechanism: state_cost(state, mechanism) for mechanism, state in zip(MECHANISMS, joint)},
        "pdec_query_window": {
            "maximum_candidate_key_slots": pdec_query_max_slots,
            "capacity": PAGE_CAPACITY,
            "strict_subpage_bound_violations": pdec_query_bound_violations,
            "strict_subpage_bound_satisfied": pdec_query_bound_violations == 0,
        },
        "gate_verdict": "STOP_RECOMMENDED" if all_absorbed else "PASS_RECOMMENDED",
        "evidence_ceiling": "NEGATIVE_ABSORPTION_RESULT" if all_absorbed else "PRELIMINARY_SUPPORT",
        "honesty_limit": "same locked observed-window OSM replay; no effective deletes and no global directory or performance evidence",
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
            parser.error("--input required for natural mode")
        result = natural_probe(args.input)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({"mode": args.mode, "output": str(args.output), "gate_verdict": result["gate_verdict"]}, sort_keys=True))
    return 0 if result["semantic_or_accounting_failures"] == 0 else 2


if __name__ == "__main__":
    raise SystemExit(main())
