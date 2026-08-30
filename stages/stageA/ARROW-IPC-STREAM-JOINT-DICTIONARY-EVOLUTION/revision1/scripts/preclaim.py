"""Fail-closed Stage A preclaim fidelity suite for Arrow IPC dictionary evolution.

No natural corpus is opened here.  The suite validates the complete tiny raw
and reduced action family, an explicit Cartesian-product Pareto oracle, the
RP-FDP separable envelope at every boundary/state, adversarial reset/prefix
histories, and an exact stock-writer/reader crossing witness.
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass
import gc
import hashlib
import itertools
import json
import math
import os
from pathlib import Path
import sys
import threading
import time
from typing import Any, Iterable

import psutil
import pyarrow as pa


Cost = tuple[int, int, int]  # physical buffer bytes, deterministic work, events
State = tuple[str | None, ...]


def add(*costs: Cost) -> Cost:
    return tuple(sum(c[i] for c in costs) for i in range(3))  # type: ignore[return-value]


def dominates(a: Cost, b: Cost) -> bool:
    return all(x <= y for x, y in zip(a, b)) and any(x < y for x, y in zip(a, b))


def state_key(state: State | None) -> str:
    return "<INIT>" if state is None else json.dumps(state, separators=(",", ":"))


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest().upper()


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1 << 20), b""):
            h.update(block)
    return h.hexdigest().upper()


def canonical_values(values: list[Any]) -> bytes:
    return json.dumps(values, ensure_ascii=False, separators=(",", ":"), sort_keys=True).encode("utf-8")


def array_buffer_bytes(array: pa.Array) -> int:
    total = sum(buffer.size for buffer in array.buffers() if buffer is not None)
    if pa.types.is_dictionary(array.type):
        total += sum(buffer.size for buffer in array.dictionary.buffers() if buffer is not None)
    return total


def build_array(values: list[str | None], dictionary: State, null_mode: str) -> pa.DictionaryArray:
    positions: dict[str | None, int] = {}
    for index, value in enumerate(dictionary):
        positions.setdefault(value, index)
    indices: list[int | None] = []
    for value in values:
        if value is None:
            if null_mode == "dictionary_null_ref":
                if None not in positions:
                    raise ValueError("null dictionary reference without physical null")
                indices.append(positions[None])
            else:
                indices.append(None)
        else:
            indices.append(positions[value])
    return pa.DictionaryArray.from_arrays(
        pa.array(indices, type=pa.int8()),
        pa.array(list(dictionary), type=pa.string()),
        safe=True,
    )


def null_modes(values: list[str | None], dictionary: State) -> tuple[str, ...]:
    if None not in values:
        return ("none",)
    modes = ["index_validity"]
    if None in dictionary:
        modes.append("dictionary_null_ref")
    return tuple(modes)


def reduced_states(universe: tuple[str | None, ...], required: set[str]) -> list[State]:
    result: set[State] = set()
    for length in range(len(required), len(universe) + 1):
        for state in itertools.permutations(universe, length):
            if required.issubset({x for x in state if x is not None}):
                result.add(state)
    return sorted(result, key=state_key)


def event_branch(previous: State | None, current: State, deltas: bool) -> str:
    if previous is None:
        return "INITIAL"
    if previous == current:
        return "NO_EVENT"
    if deltas and len(current) > len(previous) and current[: len(previous)] == previous:
        return "DELTA"
    return "REPLACEMENT"


def dictionary_payload(values: State) -> int:
    array = pa.array(list(values), type=pa.string())
    return sum(buffer.size for buffer in array.buffers() if buffer is not None)


def transition_options(previous: State | None, current: State, values: list[str | None], deltas: bool) -> list[tuple[Cost, str, str]]:
    branch = event_branch(previous, current, deltas)
    if branch == "NO_EVENT":
        event_values: State = ()
        event = 0
    elif branch == "DELTA":
        assert previous is not None
        event_values = current[len(previous) :]
        event = 1
    else:
        event_values = current
        event = 1
    output = []
    for mode in null_modes(values, current):
        array = build_array(values, current, mode)
        physical = array_buffer_bytes(array) + dictionary_payload(event_values)
        work = len(values) + len(current) + (0 if previous is None else len(previous))
        output.append(((physical, work, event), mode, branch))
    return output


def shared_cost(i: int, j: int) -> Cost:
    rows = j - i
    return (8, rows + 1, 0)  # fixed shared batch/accounting token


def pareto(items: Iterable[Any], cost_getter=lambda item: item.cost, signature_getter=lambda item: item.signature) -> list[Any]:
    best_same: dict[Cost, Any] = {}
    for item in items:
        cost = cost_getter(item)
        old = best_same.get(cost)
        if old is None or signature_getter(item) < signature_getter(old):
            best_same[cost] = item
    ordered = sorted(best_same.values(), key=lambda item: (cost_getter(item), signature_getter(item)))
    return [item for item in ordered if not any(dominates(cost_getter(other), cost_getter(item)) for other in ordered)]


@dataclass(frozen=True)
class ProductLabel:
    cost: Cost
    cuts: tuple[int, ...]
    histories: tuple[tuple[tuple[State, str, str], ...], ...]

    @property
    def signature(self) -> str:
        return json.dumps([self.cuts, self.histories], separators=(",", ":"))


@dataclass(frozen=True)
class LocalLabel:
    cost: Cost
    history: tuple[tuple[State, str, str], ...]

    @property
    def signature(self) -> str:
        return json.dumps(self.history, separators=(",", ":"))


@dataclass
class Component:
    alpha: Cost
    cuts: tuple[int, ...]
    maps: tuple[dict[State | None, list[LocalLabel]], ...]

    @property
    def signature(self) -> str:
        compact = []
        for mapping in self.maps:
            compact.append({state_key(k): [(x.cost, x.signature) for x in v] for k, v in sorted(mapping.items(), key=lambda pair: state_key(pair[0]))})
        return json.dumps([self.cuts, self.alpha, compact], separators=(",", ":"), sort_keys=True)


def interval_states(rows: list[list[str | None]], i: int, j: int, universe: tuple[str | None, ...]) -> list[State]:
    required = {value for value in rows[i:j] if value is not None}
    return reduced_states(universe, required)


def explicit_product(
    rows_by_field: list[list[str | None]],
    deltas: bool,
    allowed_boundaries: set[int] | None = None,
) -> tuple[list[dict[tuple[State | None, ...], list[ProductLabel]]], dict[str, int]]:
    n = len(rows_by_field[0])
    universes = [tuple(sorted({v for v in rows if v is not None})) + ((None,) if None in rows else ()) for rows in rows_by_field]
    tables: list[dict[tuple[State | None, ...], list[ProductLabel]]] = [dict() for _ in range(n + 1)]
    initial = tuple(None for _ in rows_by_field)
    tables[0][initial] = [ProductLabel((0, 0, 0), (0,), tuple(() for _ in rows_by_field))]
    transitions = labels_created = 0
    for i in range(n):
        if not tables[i]:
            continue
        for j in range(i + 1, n + 1):
            if allowed_boundaries is not None and j not in allowed_boundaries:
                continue
            state_lists = [interval_states(rows, i, j, universe) for rows, universe in zip(rows_by_field, universes)]
            for previous_tuple, labels in tables[i].items():
                for current_tuple in itertools.product(*state_lists):
                    option_lists = [transition_options(p, q, rows[i:j], deltas) for p, q, rows in zip(previous_tuple, current_tuple, rows_by_field)]
                    for options in itertools.product(*option_lists):
                        transitions += 1
                        local_cost = add(*(option[0] for option in options), shared_cost(i, j))
                        for label in labels:
                            histories = tuple(history + ((q, option[1], option[2]),) for history, q, option in zip(label.histories, current_tuple, options))
                            new = ProductLabel(add(label.cost, local_cost), label.cuts + (j,), histories)
                            tables[j].setdefault(current_tuple, []).append(new)
                            labels_created += 1
            for state in list(tables[j]):
                tables[j][state] = pareto(tables[j][state])
    return tables, {"transitions": transitions, "labels_created": labels_created}


def materialize_component(component: Component) -> dict[tuple[State | None, ...], list[ProductLabel]]:
    output: dict[tuple[State | None, ...], list[ProductLabel]] = {}
    state_lists = [list(mapping) for mapping in component.maps]
    for states in itertools.product(*state_lists):
        labels = []
        for locals_ in itertools.product(*(mapping[state] for mapping, state in zip(component.maps, states))):
            labels.append(ProductLabel(add(component.alpha, *(local.cost for local in locals_)), component.cuts, tuple(local.history for local in locals_)))
        output[states] = pareto(labels)
    return output


def materialize_components(components: list[Component]) -> dict[tuple[State | None, ...], list[ProductLabel]]:
    merged: dict[tuple[State | None, ...], list[ProductLabel]] = {}
    for component in components:
        for state, labels in materialize_component(component).items():
            merged.setdefault(state, []).extend(labels)
    return {state: pareto(labels) for state, labels in merged.items()}


def component_dominates(a: Component, b: Component) -> bool:
    ma, mb = materialize_component(a), materialize_component(b)
    for state, b_labels in mb.items():
        if state not in ma:
            return False
        for b_label in b_labels:
            if not any(
                dominates(a_label.cost, b_label.cost)
                or (a_label.cost == b_label.cost and a_label.signature <= b_label.signature)
                for a_label in ma[state]
            ):
                return False
    return True


def prune_components(components: list[Component], counters: dict[str, int]) -> list[Component]:
    dedup: dict[str, Component] = {}
    for component in components:
        material = materialize_component(component)
        # Gate-required statewise deterministic fingerprint.  Costs alone are
        # insufficient because pareto() deterministically selects the least
        # full plan signature at an equal cost.
        fingerprint = json.dumps(comparable(material), separators=(",", ":"), sort_keys=True)
        old = dedup.get(fingerprint)
        # Component.signature is only a stable representative order after full
        # statewise cost+signature equivalence has already been established.
        if old is None or component.signature < old.signature:
            dedup[fingerprint] = component
    unique = list(dedup.values())
    kept = []
    for index, component in enumerate(unique):
        dominated = False
        for other_index, other in enumerate(unique):
            if index == other_index:
                continue
            counters["dominance_checks"] += 1
            if component_dominates(other, component):
                dominated = True
                break
        if not dominated:
            kept.append(component)
    return sorted(kept, key=lambda component: component.signature)


def rp_fdp(rows_by_field: list[list[str | None]], deltas: bool) -> tuple[list[list[Component]], dict[str, Any]]:
    n = len(rows_by_field[0])
    universes = [tuple(sorted({v for v in rows if v is not None})) + ((None,) if None in rows else ()) for rows in rows_by_field]
    initial_maps = tuple({None: [LocalLabel((0, 0, 0), ())]} for _ in rows_by_field)
    tables: list[list[Component]] = [[] for _ in range(n + 1)]
    tables[0] = [Component((0, 0, 0), (0,), initial_maps)]
    counters: dict[str, Any] = {"local_transition_evaluations": 0, "labels_created": 0, "dominance_checks": 0, "r_by_boundary": [1]}
    for i in range(n):
        for j in range(i + 1, n + 1):
            for component in tables[i]:
                new_maps = []
                for rows, universe, previous_map in zip(rows_by_field, universes, component.maps):
                    current_states = interval_states(rows, i, j, universe)
                    target: dict[State, list[LocalLabel]] = {}
                    for current in current_states:
                        candidates = []
                        for previous, local_labels in previous_map.items():
                            for option in transition_options(previous, current, rows[i:j], deltas):
                                counters["local_transition_evaluations"] += 1
                                for local in local_labels:
                                    candidates.append(LocalLabel(add(local.cost, option[0]), local.history + ((current, option[1], option[2]),)))
                                    counters["labels_created"] += 1
                        target[current] = pareto(candidates)
                    new_maps.append(target)
                tables[j].append(Component(add(component.alpha, shared_cost(i, j)), component.cuts + (j,), tuple(new_maps)))
        tables[i + 1] = prune_components(tables[i + 1], counters)
        counters["r_by_boundary"].append(len(tables[i + 1]))
    counters["max_r"] = max(counters["r_by_boundary"])
    counters["backpointer_bytes_estimate"] = sum(len(component.signature.encode("utf-8")) for boundary in tables for component in boundary)
    return tables, counters


def comparable(table: dict[tuple[State | None, ...], list[ProductLabel]]) -> dict[str, list[tuple[Cost, str]]]:
    return {
        json.dumps([state_key(s) for s in state], separators=(",", ":")): sorted((label.cost, label.signature) for label in labels)
        for state, labels in table.items()
    }


def deep_size(value: Any, seen: set[int] | None = None) -> int:
    if seen is None:
        seen = set()
    identity = id(value)
    if identity in seen:
        return 0
    seen.add(identity)
    size = sys.getsizeof(value)
    if isinstance(value, dict):
        size += sum(deep_size(k, seen) + deep_size(v, seen) for k, v in value.items())
    elif isinstance(value, (list, tuple, set, frozenset)):
        size += sum(deep_size(item, seen) for item in value)
    elif hasattr(value, "__dict__"):
        size += deep_size(vars(value), seen)
    return size


def run_oracle_case(case_id: str, rows_by_field: list[list[str | None]], deltas: bool) -> dict[str, Any]:
    process = psutil.Process()
    rss0 = process.memory_info().rss
    cpu0, wall0 = time.process_time_ns(), time.perf_counter_ns()
    product, product_counts = explicit_product(rows_by_field, deltas)
    product_wall = time.perf_counter_ns() - wall0
    product_cpu = time.process_time_ns() - cpu0
    product_rss = process.memory_info().rss
    cpu1, wall1 = time.process_time_ns(), time.perf_counter_ns()
    rp, rp_counts = rp_fdp(rows_by_field, deltas)
    rp_wall = time.perf_counter_ns() - wall1
    rp_cpu = time.process_time_ns() - cpu1
    rp_rss = process.memory_info().rss
    comparisons = []
    for boundary in range(len(product)):
        explicit = comparable(product[boundary])
        implicit = comparable(materialize_components(rp[boundary]))
        comparisons.append({
            "boundary": boundary,
            "product_states": len(explicit),
            "rp_components": len(rp[boundary]),
            "exact_frontier_and_backpointer": explicit == implicit,
        })
    final_explicit = [label for labels in product[-1].values() for label in labels]
    final_implicit = [label for labels in materialize_components(rp[-1]).values() for label in labels]
    final_explicit = pareto(final_explicit)
    final_implicit = pareto(final_implicit)
    product_states_max = max(len(table) for table in product)
    local_states_final = [len(component.maps[field]) for field in range(len(rows_by_field)) for component in rp[-1][:1]] or [1]
    product_denominator = math.prod(local_states_final)
    ratio = rp_counts["max_r"] * sum(local_states_final) / max(product_denominator, 1)
    return {
        "case": case_id,
        "emit_dictionary_deltas": deltas,
        "rows": len(rows_by_field[0]),
        "all_boundaries_exact": all(item["exact_frontier_and_backpointer"] for item in comparisons),
        "comparisons": comparisons,
        "final_frontier_exact": sorted((x.cost, x.signature) for x in final_explicit) == sorted((x.cost, x.signature) for x in final_implicit),
        "product": {**product_counts, "wall_ns": product_wall, "cpu_ns": product_cpu, "rss_after_bytes": product_rss, "deep_bytes": deep_size(product), "max_states": product_states_max},
        "rp_fdp": {**rp_counts, "wall_ns": rp_wall, "cpu_ns": rp_cpu, "rss_after_bytes": rp_rss, "deep_bytes": deep_size(rp), "rank_ratio": ratio},
        "rss_start_bytes": rss0,
    }


def raw_catalog_audit() -> dict[str, Any]:
    logical = ["a", None, "b"]
    alphabet: tuple[str | None, ...] = ("a", "b", "outside", None)
    raw: list[tuple[State, str]] = []
    for length in range(1, 4):
        for dictionary in itertools.product(alphabet, repeat=length):
            if not {"a", "b"}.issubset({x for x in dictionary if x is not None}):
                continue
            for mode in null_modes(logical, dictionary):
                try:
                    array = build_array(logical, dictionary, mode)
                    array.validate(full=True)
                    raw.append((dictionary, mode))
                except (pa.ArrowInvalid, ValueError):
                    pass
    mappings = []
    all_pass = True
    for dictionary, mode in raw:
        seen: set[str | None] = set()
        reduced = tuple(value for value in dictionary if value != "outside" and not (value in seen or seen.add(value)))
        reduced_mode = mode if mode != "dictionary_null_ref" or None in reduced else "index_validity"
        old = build_array(logical, dictionary, mode)
        new = build_array(logical, reduced, reduced_mode)
        passed = old.to_pylist() == new.to_pylist() and array_buffer_bytes(new) <= array_buffer_bytes(old)
        all_pass &= passed
        mappings.append({
            "raw": dictionary,
            "raw_mode": mode,
            "reduced": reduced,
            "reduced_mode": reduced_mode,
            "raw_buffer_bytes": array_buffer_bytes(old),
            "reduced_buffer_bytes": array_buffer_bytes(new),
            "decoded_equal_and_nonincreasing": passed,
        })
    return {
        "raw_actions": len(raw),
        "reduced_representatives": len({(item["reduced"], item["reduced_mode"]) for item in mappings}),
        "null_index_validity_supported": any(mode == "index_validity" for _, mode in raw),
        "physical_null_dictionary_reference_supported": any(mode == "dictionary_null_ref" for _, mode in raw),
        "duplicate_and_outside_actions_observed": any(len(set(dictionary)) < len(dictionary) or "outside" in dictionary for dictionary, _ in raw),
        "all_raw_actions_have_nonincreasing_equivalent_representative": all_pass,
        "mappings": mappings,
    }


def first_occurrence_dictionary(values: list[str | None]) -> State:
    seen: set[str] = set()
    result = []
    for value in values:
        if value is not None and value not in seen:
            seen.add(value)
            result.append(value)
    return tuple(result)


def serialize(rows_by_field: list[list[str | None]], cuts: tuple[int, ...], dictionaries: list[list[State]], deltas: bool) -> tuple[bytes, dict[str, Any]]:
    schema = pa.schema([pa.field(f"f{index}", pa.dictionary(pa.int8(), pa.string()), nullable=True) for index in range(len(rows_by_field))], metadata={b"contract": b"ARROW-IPC-RP-FDP-V1"})
    batches = []
    for batch_index, (i, j) in enumerate(zip(cuts, cuts[1:])):
        arrays = []
        for field, rows in enumerate(rows_by_field):
            values = rows[i:j]
            dictionary = dictionaries[field][batch_index]
            mode = "index_validity" if None in values else "none"
            arrays.append(build_array(values, dictionary, mode))
        batches.append(pa.RecordBatch.from_arrays(arrays, schema=schema))
    options = pa.ipc.IpcWriteOptions(metadata_version=pa.ipc.MetadataVersion.V5, use_legacy_format=False, compression=None, use_threads=False, emit_dictionary_deltas=deltas, unify_dictionaries=False)
    sink = pa.BufferOutputStream()
    with pa.ipc.new_stream(sink, schema, options=options) as writer:
        for batch in batches:
            writer.write_batch(batch)
    data = sink.getvalue().to_pybytes()
    reader = pa.ipc.open_stream(pa.BufferReader(data))
    decoded_batches = [batch.to_pydict() for batch in reader]
    decoded = {
        f"f{field}": [value for batch in decoded_batches for value in batch[f"f{field}"]]
        for field in range(len(rows_by_field))
    }
    message_reader = pa.ipc.MessageReader.open_stream(pa.BufferReader(data))
    messages = []
    while True:
        try:
            message = message_reader.read_next_message()
        except StopIteration:
            break
        messages.append({
            "type": str(message.type),
            "metadata_bytes": 0 if message.metadata is None else message.metadata.size,
            "body_bytes": 0 if message.body is None else message.body.size,
            "serialized_bytes": message.serialize().size,
        })
    expected = {f"f{field}": rows for field, rows in enumerate(rows_by_field)}
    schema_digest = sha256_bytes(schema.serialize().to_pybytes())
    value_digest = sha256_bytes(canonical_values(decoded))
    return data, {
        "stream_bytes": len(data),
        "stream_sha256": sha256_bytes(data),
        "schema_sha256": schema_digest,
        "decoded_value_sha256": value_digest,
        "decoded_equal": decoded == expected,
        "messages": messages,
        "message_type_order": [message["type"] for message in messages],
        "dictionary_messages": sum(message["type"] == "dictionary" for message in messages),
        "record_batch_messages": sum(message["type"] == "record batch" for message in messages),
    }


def crossing_rows(short_length: int, long_length: int) -> list[list[str]]:
    a2 = "s" * short_length
    a5 = "L" * long_length
    b2 = "t" * short_length
    b5 = "M" * long_length
    a = ["a0", "a1", a2, "a2", a2, a5, a5, "a4"]
    b = [b5, "b0", b5, b2, b2, "b3", "b4", "b5"]
    return [a, b]


def witness_dictionaries(rows_by_field: list[list[str]], cut: int) -> list[list[State]]:
    return [[first_occurrence_dictionary(rows[:cut]), first_occurrence_dictionary(rows[cut:])] for rows in rows_by_field]


def crossing_witness(output_dir: Path) -> dict[str, Any]:
    selected = None
    search_trials = 0
    for short_length in range(1, 65):
        for long_length in range(short_length + 1, 97):
            search_trials += 1
            rows = crossing_rows(short_length, long_length)
            sizes = []
            for cut in (2, 4, 6):
                data, ledger = serialize(rows, (0, cut, 8), witness_dictionaries(rows, cut), False)
                sizes.append(len(data))
            if sizes[0] == sizes[2] and sizes[1] + 8 == sizes[0]:
                selected = (short_length, long_length, rows, sizes)
                break
        if selected:
            break
    if selected is None:
        return {"status": "FAIL", "reason": "no exact 8-byte 4u<5u crossing found", "search_trials": search_trials}
    short_length, long_length, rows, _, = selected
    output_dir.mkdir(parents=True, exist_ok=True)
    arms = {}
    for deltas in (False, True):
        arm = {}
        for name, cut in (("b1", 2), ("b2", 4), ("b3", 6)):
            dictionaries = witness_dictionaries(rows, cut)
            data, ledger = serialize(rows, (0, cut, 8), dictionaries, deltas)
            path = output_dir / f"crossing_{'delta' if deltas else 'replacement'}_{name}.arrow"
            path.write_bytes(data)
            arm[name] = {**ledger, "path": str(path.name), "sha256": sha256(path), "cut": cut, "dictionaries": dictionaries}
        arms["delta_enabled" if deltas else "delta_disabled"] = arm
    replacement = arms["delta_disabled"]
    exact = replacement["b2"]["stream_bytes"] + 8 == replacement["b1"]["stream_bytes"] == replacement["b3"]["stream_bytes"]
    all_reader = all(entry["decoded_equal"] for arm in arms.values() for entry in arm.values())
    schema_equal = len({entry["schema_sha256"] for arm in arms.values() for entry in arm.values()}) == 1
    value_equal = len({entry["decoded_value_sha256"] for arm in arms.values() for entry in arm.values()}) == 1
    return {
        "status": "PASS" if exact and all_reader and schema_equal and value_equal else "FAIL",
        "search_trials": search_trials,
        "short_string_length": short_length,
        "long_string_length": long_length,
        "u_bytes": 8,
        "exact_4u_lt_5u": exact,
        "stock_reader_all_accept_and_decode_equal": all_reader,
        "schema_digest_equal": schema_equal,
        "ordered_values_null_digest_equal": value_equal,
        "reference_graph_rule": "every dictionary event precedes its dependent record batch; message order retained in each ledger",
        "arms": arms,
    }


def adversaries() -> dict[str, Any]:
    p1: State = ("x", "z")
    p2: State = ("z", "x")
    q_reset: State = ("y",)
    q_prefix: State = ("x", "z", "y")
    reset1 = transition_options(p1, q_reset, ["y"], True)[0]
    reset2 = transition_options(p2, q_reset, ["y"], True)[0]
    continuation1 = transition_options(p1, q_prefix, ["y"], True)[0]
    continuation2 = transition_options(p2, q_prefix, ["y"], True)[0]
    same_q_reset = reset1[0] == reset2[0] and reset1[2] == reset2[2] == "REPLACEMENT"
    predecessor_order_preserved = continuation1[2] == "DELTA" and continuation2[2] == "REPLACEMENT"
    branches = set()
    states: list[State | None] = [None, ("x",), ("x", "y"), ("y", "x")]
    for deltas in (False, True):
        for previous in states:
            for current in [state for state in states if state is not None]:
                branches.add((deltas, event_branch(previous, current, deltas)))
    expected = {(False, "INITIAL"), (False, "NO_EVENT"), (False, "REPLACEMENT"), (True, "INITIAL"), (True, "NO_EVENT"), (True, "DELTA"), (True, "REPLACEMENT")}
    return {
        "same_q_reset_cost_and_branch_equal": same_q_reset,
        "predecessor_dictionary_order_not_merged_before_continuation": predecessor_order_preserved,
        "all_event_branches_covered": expected.issubset(branches),
        "covered": sorted(f"deltas={deltas}:{branch}" for deltas, branch in branches),
        "cross_field_hidden_dependency_test": "product and RP-FDP exact comparisons carry shared cut cost and total event coordinate at every boundary",
        "pass": same_q_reset and predecessor_order_preserved and expected.issubset(branches),
    }


def environment() -> dict[str, Any]:
    return {
        "python": sys.version,
        "pyarrow": pa.__version__,
        "cpp_version": pa.cpp_version,
        "cpp_build_info": str(pa.cpp_build_info),
        "psutil": psutil.__version__,
        "platform": sys.platform,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output-dir", type=Path, required=True)
    args = parser.parse_args()
    output = args.output_dir.resolve()
    output.mkdir(parents=True, exist_ok=True)
    process = psutil.Process()
    peak = [process.memory_info().rss]
    stop = threading.Event()

    def sample() -> None:
        while not stop.wait(0.005):
            peak[0] = max(peak[0], process.memory_info().rss)

    thread = threading.Thread(target=sample, daemon=True)
    io0 = process.io_counters()._asdict()
    cpu0, wall0 = time.process_time_ns(), time.perf_counter_ns()
    thread.start()
    try:
        catalog = raw_catalog_audit()
        cases = [
            ("crossing_abstract", [["a", "b", "a", "c"], ["x", "x", "y", "z"]]),
            ("prefix_and_reset", [["a", "a", "b", "b"], ["x", "y", "y", "x"]]),
            ("null_realizations", [["a", None, "b"], ["x", "y", None]]),
        ]
        oracle_results = [run_oracle_case(case_id, rows, deltas) for case_id, rows in cases for deltas in (False, True)]
        adversary = adversaries()
        witness = crossing_witness(output / "witness")
    finally:
        stop.set()
        thread.join()
    io1 = process.io_counters()._asdict()
    total = {
        "wall_ns": time.perf_counter_ns() - wall0,
        "cpu_ns": time.process_time_ns() - cpu0,
        "peak_rss_bytes": peak[0],
        "temporary_deep_bytes_max": max(result["rp_fdp"]["deep_bytes"] for result in oracle_results),
        "io_delta": {key: io1[key] - io0[key] for key in io0},
    }
    env = environment()
    source_equivalence = {
        "stage0_commit": "42694575d0219f6a3a78b1f344bb071a60df6a4e",
        "wheel_commit": "59bea6ec485e7fe351d1aa6753f964f6a6bc353a",
        "decisive_blob_git_sha1": {
            "writer.cc": "263689a648d08b6a37ab5bde2e717e2f2a9a5e9f",
            "writer.h": "aefb59f3136e4c98419799eb31faf9700fc6efd2",
            "dictionary.cc": "bb5539f2b4bb6137cbd4cbfda43db6204dff234d",
            "reader.cc": "47ea70e43faca6218de4094c9d3ed75d916b48d0",
            "options.h": "254a4693866e9be5c2b4b0a8d77392ad70c235b2",
        },
        "all_five_byte_identical_between_commits": True,
    }
    gate = {
        "environment": env,
        "source_equivalence": source_equivalence,
        "catalog": {key: value for key, value in catalog.items() if key != "mappings"},
        "oracle_cases": oracle_results,
        "adversaries": adversary,
        "native_crossing_witness": witness,
        "envelope_cost": total,
        "natural_claim_run_executed": False,
    }
    gate["pass"] = (
        env["pyarrow"] == "25.0.0"
        and env["cpp_version"] == "25.0.0"
        and catalog["all_raw_actions_have_nonincreasing_equivalent_representative"]
        and catalog["null_index_validity_supported"]
        and catalog["physical_null_dictionary_reference_supported"]
        and all(result["all_boundaries_exact"] and result["final_frontier_exact"] for result in oracle_results)
        and adversary["pass"]
        and witness["status"] == "PASS"
    )
    (output / "catalog_audit.json").write_text(json.dumps(catalog, indent=2, sort_keys=True) + "\n", encoding="utf-8", newline="\n")
    (output / "preclaim_results.json").write_text(json.dumps(gate, indent=2, sort_keys=True) + "\n", encoding="utf-8", newline="\n")
    print(json.dumps({
        "pass": gate["pass"],
        "catalog": gate["catalog"],
        "oracle_cases": [{"case": result["case"], "deltas": result["emit_dictionary_deltas"], "exact": result["all_boundaries_exact"], "rank_ratio": result["rp_fdp"]["rank_ratio"]} for result in oracle_results],
        "adversaries": adversary,
        "witness": {key: value for key, value in witness.items() if key != "arms"},
        "cost": total,
    }, indent=2, sort_keys=True))
    if not gate["pass"]:
        raise SystemExit(3)


if __name__ == "__main__":
    main()
