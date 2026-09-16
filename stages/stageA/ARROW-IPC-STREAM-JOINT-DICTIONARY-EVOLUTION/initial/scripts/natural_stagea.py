"""Preregistered natural Stage A killer for Arrow IPC RP-FDP.

The input hashes, window rule, fields, action catalog, rank thresholds, arm
family, repetitions, and cost dimensions are frozen in EXPERIMENT_CONTRACT.yaml.
"""

from __future__ import annotations

import argparse
import csv
import gc
import hashlib
import itertools
import json
import math
from pathlib import Path
import statistics
import threading
import time
import zipfile
from typing import Any, Callable

import psutil
import pyarrow as pa
import pyarrow.parquet as pq

from preclaim import (
    Component,
    ProductLabel,
    add,
    build_array,
    comparable,
    deep_size,
    explicit_product,
    first_occurrence_dictionary,
    materialize_components,
    pareto,
    reduced_states,
    rp_fdp,
    sha256,
    sha256_bytes,
    state_key,
)


EXPECTED_HASHES = {
    "yellow_tripdata_2025-01.parquet": "9AF277E4C0D3F9DEB30644DA822981E1E7DF6AF58313170FD3AA8A474485488A",
    "yellow_tripdata_2025-02.parquet": "037CBA555A73663F3A51A2C27816E40E3FEB364769942BDF122B9DA31E377BD3",
    "adult.zip": "7537312DD56C2B98035880805CE99E68183A30EE468AA5329D6DF0FBB3CC21BB",
}
REPETITIONS = 5
WARMUPS = 1


def normalized(value: Any) -> str | None:
    if value is None:
        return None
    if isinstance(value, float) and value.is_integer():
        return str(int(value))
    return str(value).strip()


def load_nyc(path: Path) -> tuple[list[str | None], list[str | None], dict[str, Any]]:
    table = pq.read_table(path, columns=["store_and_fwd_flag", "payment_type"], use_threads=False)
    return (
        [normalized(value) for value in table.column("store_and_fwd_flag").to_pylist()],
        [normalized(value) for value in table.column("payment_type").to_pylist()],
        {"rows": table.num_rows, "schema": str(table.schema)},
    )


def load_adult(path: Path) -> tuple[list[str | None], list[str | None], dict[str, Any]]:
    with zipfile.ZipFile(path) as archive:
        candidates = [name for name in archive.namelist() if name.lower().endswith("adult.data")]
        if len(candidates) != 1:
            raise RuntimeError(f"expected one adult.data, got {candidates}")
        raw = archive.read(candidates[0]).decode("utf-8")
    rows = [row for row in csv.reader(raw.splitlines(), skipinitialspace=True) if len(row) >= 4]
    return [row[1].strip() for row in rows], [row[3].strip() for row in rows], {"rows": len(rows), "member": candidates[0]}


def window_offsets(row_count: int, count: int) -> list[int]:
    if row_count < 16:
        raise RuntimeError("carrier has fewer than 16 rows")
    if count == 1:
        return [0]
    return [math.floor(index * (row_count - 16) / (count - 1)) for index in range(count)]


def quantile(values: list[int], q: float) -> float:
    ordered = sorted(values)
    if len(ordered) == 1:
        return float(ordered[0])
    position = (len(ordered) - 1) * q
    lower, upper = math.floor(position), math.ceil(position)
    if lower == upper:
        return float(ordered[lower])
    return ordered[lower] * (upper - position) + ordered[upper] * (position - lower)


def summary(values: list[int]) -> dict[str, float]:
    measured = values[WARMUPS:]
    return {"p50": float(statistics.median(measured)), "p90": quantile(measured, 0.9), "min": float(min(measured)), "max": float(max(measured))}


def all_final_labels(table: dict[tuple[Any, ...], list[ProductLabel]]) -> list[ProductLabel]:
    return pareto(label for labels in table.values() for label in labels)


def label_plan(label: ProductLabel) -> dict[str, Any]:
    return {
        "cuts": list(label.cuts),
        "dictionaries": [[list(entry[0]) for entry in history] for history in label.histories],
        "null_modes": [[entry[1] for entry in history] for history in label.histories],
        "branches": [[entry[2] for entry in history] for history in label.histories],
        "static_cost": list(label.cost),
        "signature": label.signature,
    }


def choose(labels: list[ProductLabel]) -> ProductLabel:
    return min(labels, key=lambda label: (label.cost, label.signature))


def rank_metrics(tables: list[list[Component]]) -> dict[str, Any]:
    rows = []
    for boundary, components in enumerate(tables):
        local_counts = []
        if components:
            for field in range(len(components[0].maps)):
                states = {state for component in components for state in component.maps[field]}
                local_counts.append(len(states))
        product = math.prod(local_counts) if local_counts else 1
        ratio = len(components) * sum(local_counts) / product if product else float("inf")
        eligible = boundary > 0 and product >= sum(local_counts)
        rows.append({"boundary": boundary, "R": len(components), "local_state_counts": local_counts, "product_states": product, "rank_ratio": ratio, "eligible_for_preregistered_max": eligible})
    eligible_rows = [row for row in rows if row["eligible_for_preregistered_max"]]
    return {
        "by_boundary": rows,
        "max_ratio": max((row["rank_ratio"] for row in eligible_rows), default=float("inf")),
        "eligible_boundary_count": len(eligible_rows),
        "max_R": max(row["R"] for row in rows),
    }


def plan_product(rows: list[list[str | None]], deltas: bool) -> dict[str, Any]:
    tables, counts = explicit_product(rows, deltas)
    labels = all_final_labels(tables[-1])
    selected = choose(labels)
    return {"plan": label_plan(selected), "frontier": sorted([list(label.cost) for label in labels]), "counts": counts, "temporary_deep_bytes": deep_size(tables), "boundary_projection": [comparable(table) for table in tables]}


def plan_rp(rows: list[list[str | None]], deltas: bool) -> dict[str, Any]:
    tables, counts = rp_fdp(rows, deltas)
    material = materialize_components(tables[-1])
    labels = all_final_labels(material)
    selected = choose(labels)
    return {"plan": label_plan(selected), "frontier": sorted([list(label.cost) for label in labels]), "counts": counts, "rank": rank_metrics(tables), "temporary_deep_bytes": deep_size(tables), "boundary_projection": [comparable(materialize_components(components)) for components in tables]}


def plan_independent(rows: list[list[str | None]], deltas: bool) -> dict[str, Any]:
    local_pools = []
    local_cost = {"transitions": 0, "labels_created": 0}
    local_deep = 0
    for field_rows in rows:
        tables, counts = explicit_product([field_rows], deltas)
        labels = all_final_labels(tables[-1])
        pool = {cut for label in labels for cut in label.cuts}
        local_pools.append(pool)
        local_cost["transitions"] += counts["transitions"]
        local_cost["labels_created"] += counts["labels_created"]
        local_deep += deep_size(tables)
    shared_pool = set().union(*local_pools)
    joint, counts = explicit_product(rows, deltas, shared_pool)
    labels = all_final_labels(joint[-1])
    if not labels:
        raise RuntimeError("independent cut pool produced no legal full plan")
    selected = choose(labels)
    return {
        "plan": label_plan(selected),
        "frontier": sorted([list(label.cost) for label in labels]),
        "counts": {"local": local_cost, "joint_reoptimization": counts, "cut_pool": sorted(shared_pool)},
        "temporary_deep_bytes": local_deep + deep_size(joint),
    }


def fixed_cuts(n: int, chunk: int) -> tuple[int, ...]:
    cuts = list(range(0, n, chunk))
    if not cuts or cuts[-1] != n:
        cuts.append(n)
    return tuple(cuts)


def dictionary_builder(rows: list[list[str | None]], cuts: tuple[int, ...], kind: str) -> tuple[list[list[list[str | None]]], list[list[str]]]:
    dictionaries: list[list[list[str | None]]] = []
    modes: list[list[str]] = []
    for field_rows in rows:
        field_dicts = []
        field_modes = []
        stable = first_occurrence_dictionary(field_rows)
        cumulative: list[str] = []
        seen: set[str] = set()
        for i, j in zip(cuts, cuts[1:]):
            segment = field_rows[i:j]
            if kind == "minimal":
                dictionary = first_occurrence_dictionary(segment)
            elif kind == "stable_full":
                dictionary = stable
            else:
                for value in segment:
                    if value is not None and value not in seen:
                        seen.add(value)
                        cumulative.append(value)
                dictionary = tuple(cumulative)
            field_dicts.append(list(dictionary))
            field_modes.append("index_validity" if None in segment else "none")
        dictionaries.append(field_dicts)
        modes.append(field_modes)
    return dictionaries, modes


def stream_schema(field_count: int) -> pa.Schema:
    return pa.schema([pa.field(f"f{index}", pa.dictionary(pa.int8(), pa.string()), nullable=True) for index in range(field_count)], metadata={b"contract": b"ARROW-IPC-RP-FDP-V1"})


def execute_plan(rows: list[list[str | None]], plan: dict[str, Any], deltas: bool) -> tuple[bytes, dict[str, Any]]:
    process = psutil.Process()
    peak = [process.memory_info().rss]
    stop = threading.Event()

    def sample() -> None:
        while not stop.wait(0.001):
            peak[0] = max(peak[0], process.memory_info().rss)

    thread = threading.Thread(target=sample, daemon=True)
    thread.start()
    cpu_total0, wall_total0 = time.process_time_ns(), time.perf_counter_ns()
    allocated0 = pa.total_allocated_bytes()
    cuts = tuple(plan["cuts"])
    schema = stream_schema(len(rows))
    cpu0, wall0 = time.process_time_ns(), time.perf_counter_ns()
    batches = []
    for batch, (i, j) in enumerate(zip(cuts, cuts[1:])):
        arrays = []
        for field, field_rows in enumerate(rows):
            arrays.append(build_array(field_rows[i:j], tuple(plan["dictionaries"][field][batch]), plan["null_modes"][field][batch]))
        batches.append(pa.RecordBatch.from_arrays(arrays, schema=schema))
    construction = {"wall_ns": time.perf_counter_ns() - wall0, "cpu_ns": time.process_time_ns() - cpu0}
    options = pa.ipc.IpcWriteOptions(metadata_version=pa.ipc.MetadataVersion.V5, use_legacy_format=False, compression=None, use_threads=False, emit_dictionary_deltas=deltas, unify_dictionaries=False)
    sink = pa.BufferOutputStream()
    cpu0, wall0 = time.process_time_ns(), time.perf_counter_ns()
    with pa.ipc.new_stream(sink, schema, options=options) as writer:
        for batch in batches:
            writer.write_batch(batch)
    data = sink.getvalue().to_pybytes()
    writer_cost = {"wall_ns": time.perf_counter_ns() - wall0, "cpu_ns": time.process_time_ns() - cpu0}
    cpu0, wall0 = time.process_time_ns(), time.perf_counter_ns()
    reader = pa.ipc.open_stream(pa.BufferReader(data))
    first = reader.read_next_batch()
    first_cost = {"wall_ns": time.perf_counter_ns() - wall0, "cpu_ns": time.process_time_ns() - cpu0}
    decoded_batches = [first]
    while True:
        try:
            next_batch = reader.read_next_batch()
            if next_batch is None:
                break
            decoded_batches.append(next_batch)
        except StopIteration:
            break
    total_decode = {"wall_ns": time.perf_counter_ns() - wall0, "cpu_ns": time.process_time_ns() - cpu0}
    cpu0, wall0 = time.process_time_ns(), time.perf_counter_ns()
    decoded = {f"f{field}": [value for batch in decoded_batches for value in batch.column(field).to_pylist()] for field in range(len(rows))}
    expected = {f"f{field}": values for field, values in enumerate(rows)}
    validation = {"wall_ns": time.perf_counter_ns() - wall0, "cpu_ns": time.process_time_ns() - cpu0, "equal": decoded == expected, "schema_equal": all(batch.schema.equals(schema, check_metadata=True) for batch in decoded_batches)}
    stop.set()
    thread.join()
    return data, {
        "construction": construction,
        "writer": writer_cost,
        "first_batch_decode": first_cost,
        "total_decode": total_decode,
        "validation": validation,
        "total_wall_ns": time.perf_counter_ns() - wall_total0,
        "total_cpu_ns": time.process_time_ns() - cpu_total0,
        "peak_rss_bytes": peak[0],
        "arrow_temporary_delta_bytes": max(0, pa.total_allocated_bytes() - allocated0),
        "stream_bytes": len(data),
        "stream_sha256": sha256_bytes(data),
        "schema_sha256": sha256_bytes(schema.serialize().to_pybytes()),
        "ordered_value_null_sha256": sha256_bytes(json.dumps(decoded, ensure_ascii=False, separators=(",", ":"), sort_keys=True).encode("utf-8")),
    }


def plan_grid(rows: list[list[str | None]], deltas: bool) -> dict[str, Any]:
    n = len(rows[0])
    cut_options: set[tuple[int, ...]] = {fixed_cuts(n, chunk) for chunk in (1, 2, 4, 8, 16)}
    change = [0] + [i for i in range(1, n) if any(field[i] != field[i - 1] for field in rows)] + [n]
    cut_options.add(tuple(change))
    trials = []
    for cuts in sorted(cut_options):
        for kind in ("minimal", "cumulative_prefix", "stable_full"):
            dictionaries, modes = dictionary_builder(rows, cuts, kind)
            plan = {"cuts": list(cuts), "dictionaries": dictionaries, "null_modes": modes, "branches": [], "static_cost": [], "signature": json.dumps([cuts, kind], separators=(",", ":"))}
            data, ledger = execute_plan(rows, plan, deltas)
            trials.append((len(data), plan["signature"], plan, ledger["stream_sha256"]))
    selected = min(trials, key=lambda item: (item[0], item[1]))
    return {"plan": selected[2], "grid_trials": len(trials), "selected_stream_bytes_during_search": selected[0], "selected_stream_sha256_during_search": selected[3], "temporary_deep_bytes": deep_size(trials)}


def measured(function: Callable[[], dict[str, Any]]) -> tuple[dict[str, Any], dict[str, int]]:
    gc.collect()
    process = psutil.Process()
    peak = [process.memory_info().rss]
    stop = threading.Event()

    def sample() -> None:
        while not stop.wait(0.001):
            peak[0] = max(peak[0], process.memory_info().rss)

    thread = threading.Thread(target=sample, daemon=True)
    io0 = process.io_counters()._asdict()
    allocated0 = pa.total_allocated_bytes()
    cpu0, wall0 = time.process_time_ns(), time.perf_counter_ns()
    thread.start()
    result = function()
    stop.set()
    thread.join()
    io1 = process.io_counters()._asdict()
    return result, {
        "wall_ns": time.perf_counter_ns() - wall0,
        "cpu_ns": time.process_time_ns() - cpu0,
        "peak_rss_bytes": peak[0],
        "temporary_bytes": max(result.get("temporary_deep_bytes", 0), max(0, pa.total_allocated_bytes() - allocated0)),
        "read_bytes": io1["read_bytes"] - io0["read_bytes"],
        "write_bytes": io1["write_bytes"] - io0["write_bytes"],
    }


def summarize_arm(planning: list[dict[str, int]], executions: list[dict[str, Any]], common_prep_share_ns: int) -> dict[str, Any]:
    full_wall = [planning[index]["wall_ns"] + executions[index]["total_wall_ns"] + common_prep_share_ns for index in range(REPETITIONS)]
    temp = [max(planning[index]["temporary_bytes"], executions[index]["arrow_temporary_delta_bytes"]) for index in range(REPETITIONS)]
    peak = [max(planning[index]["peak_rss_bytes"], executions[index]["peak_rss_bytes"]) for index in range(REPETITIONS)]
    return {
        "stream_bytes": executions[0]["stream_bytes"],
        "stream_sha256": executions[0]["stream_sha256"],
        "all_stream_hashes_equal": len({item["stream_sha256"] for item in executions}) == 1,
        "all_native_equivalent": all(item["validation"]["equal"] and item["validation"]["schema_equal"] for item in executions),
        "planning_wall_ns": summary([item["wall_ns"] for item in planning]),
        "planning_cpu_ns": summary([item["cpu_ns"] for item in planning]),
        "full_end_to_end_wall_ns": summary(full_wall),
        "peak_rss_bytes": summary(peak),
        "temporary_bytes": summary(temp),
        "first_batch_decode_wall_ns": summary([item["first_batch_decode"]["wall_ns"] for item in executions]),
        "total_decode_wall_ns": summary([item["total_decode"]["wall_ns"] for item in executions]),
        "writer_wall_ns": summary([item["writer"]["wall_ns"] for item in executions]),
        "construction_wall_ns": summary([item["construction"]["wall_ns"] for item in executions]),
        "validation_wall_ns": summary([item["validation"]["wall_ns"] for item in executions]),
        "planning_io_read_bytes": sum(item["read_bytes"] for item in planning),
        "planning_io_write_bytes": sum(item["write_bytes"] for item in planning),
        "fallback_or_failure": False,
    }


def vector(arm: dict[str, Any], quantile_key: str) -> tuple[float, ...]:
    return (
        arm["stream_bytes"],
        arm["full_end_to_end_wall_ns"][quantile_key],
        arm["peak_rss_bytes"][quantile_key],
        arm["temporary_bytes"][quantile_key],
        arm["first_batch_decode_wall_ns"][quantile_key],
        arm["total_decode_wall_ns"][quantile_key],
    )


def weakly_dominates(a: tuple[float, ...], b: tuple[float, ...]) -> bool:
    return all(x <= y for x, y in zip(a, b)) and any(x < y for x, y in zip(a, b))


def run_window(carrier: str, window_index: int, rows: list[list[str | None]], prep_share_ns: int, stream_root: Path) -> dict[str, Any]:
    algorithms = ["rp_fdp", "product", "independent", "grid"]
    deltas_options = [False, True]
    upper_states = []
    for field_rows in rows:
        universe = tuple(sorted({value for value in field_rows if value is not None})) + ((None,) if None in field_rows else ())
        upper_states.append(len(reduced_states(universe, set())))
    product_upper = math.prod(upper_states)
    product_feasible = product_upper <= 4096
    if not product_feasible:
        raise RuntimeError(f"predeclared natural window exceeds exact product state cap: {carrier}/{window_index} {product_upper}")
    planners: dict[str, Callable[[], dict[str, Any]]] = {}
    for algorithm in algorithms:
        for deltas in deltas_options:
            key = f"{algorithm}__delta_{str(deltas).lower()}"
            if algorithm == "rp_fdp":
                planners[key] = lambda d=deltas: plan_rp(rows, d)
            elif algorithm == "product":
                planners[key] = lambda d=deltas: plan_product(rows, d)
            elif algorithm == "independent":
                planners[key] = lambda d=deltas: plan_independent(rows, d)
            else:
                planners[key] = lambda d=deltas: plan_grid(rows, d)
    keys = sorted(planners)
    plan_results: dict[str, list[dict[str, Any]]] = {key: [] for key in keys}
    plan_costs: dict[str, list[dict[str, int]]] = {key: [] for key in keys}
    for repetition in range(REPETITIONS):
        rotation = (window_index + repetition) % len(keys)
        for key in keys[rotation:] + keys[:rotation]:
            result, cost = measured(planners[key])
            plan_results[key].append(result)
            plan_costs[key].append(cost)
    for key in keys:
        stable = {(result["plan"]["signature"], json.dumps(result.get("frontier", []), sort_keys=True)) for result in plan_results[key]}
        if len(stable) != 1:
            raise RuntimeError(f"non-deterministic planner: {carrier}/{window_index}/{key}")
    for deltas in deltas_options:
        rp = plan_results[f"rp_fdp__delta_{str(deltas).lower()}"][0]
        product = plan_results[f"product__delta_{str(deltas).lower()}"][0]
        if rp["boundary_projection"] != product["boundary_projection"] or rp["plan"]["signature"] != product["plan"]["signature"]:
            raise RuntimeError(f"natural RP/product mismatch: {carrier}/{window_index}/deltas={deltas}")
    executions: dict[str, list[dict[str, Any]]] = {key: [] for key in keys}
    stream_root.mkdir(parents=True, exist_ok=True)
    for repetition in range(REPETITIONS):
        rotation = (window_index + repetition) % len(keys)
        for key in keys[rotation:] + keys[:rotation]:
            deltas = key.endswith("true")
            data, ledger = execute_plan(rows, plan_results[key][repetition]["plan"], deltas)
            executions[key].append(ledger)
            if repetition == 0:
                (stream_root / f"{key}.arrow").write_bytes(data)
    arms = {key: summarize_arm(plan_costs[key], executions[key], prep_share_ns) for key in keys}
    for deltas in deltas_options:
        suffix = str(deltas).lower()
        rp_key, product_key = f"rp_fdp__delta_{suffix}", f"product__delta_{suffix}"
        arms[rp_key]["exact_product_stream_equal"] = arms[rp_key]["stream_sha256"] == arms[product_key]["stream_sha256"]
        arms[rp_key]["rank"] = plan_results[rp_key][0]["rank"]
        arms[rp_key]["static_frontier"] = plan_results[rp_key][0]["frontier"]
        arms[product_key]["static_frontier"] = plan_results[product_key][0]["frontier"]
        arms[f"independent__delta_{suffix}"]["cut_pool"] = plan_results[f"independent__delta_{suffix}"][0]["counts"]["cut_pool"]
        arms[f"grid__delta_{suffix}"]["grid_trials"] = plan_results[f"grid__delta_{suffix}"][0]["grid_trials"]
    candidate_keys = [key for key in keys if key.startswith("rp_fdp")]
    baseline_keys = [key for key in keys if not key.startswith("rp_fdp")]
    candidate_residuals = []
    for key in candidate_keys:
        p50 = not any(weakly_dominates(vector(arms[baseline], "p50"), vector(arms[key], "p50")) for baseline in baseline_keys)
        p90 = not any(weakly_dominates(vector(arms[baseline], "p90"), vector(arms[key], "p90")) for baseline in baseline_keys)
        candidate_residuals.append({"arm": key, "p50_non_dominated": p50, "p90_non_dominated": p90, "residual": p50 and p90 and arms[key]["exact_product_stream_equal"]})
    best_rank = min(arms[key]["rank"]["max_ratio"] for key in candidate_keys)
    return {
        "carrier": carrier,
        "window_index": window_index,
        "rows": 16,
        "field_universes": [sorted({str(value) for value in field if value is not None}) + (["<NULL>"] if None in field else []) for field in rows],
        "product_upper_states": product_upper,
        "product_feasible": product_feasible,
        "rp_product_exact_both_delta_arms": all(arms[key]["exact_product_stream_equal"] for key in candidate_keys),
        "rank_ratio": best_rank,
        "strict_rank_compression": best_rank < 1.0,
        "useful_rank_compression": best_rank <= 0.75,
        "candidate_residuals": candidate_residuals,
        "full_cost_residual": any(item["residual"] for item in candidate_residuals),
        "arms": arms,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, required=True)
    parser.add_argument("--run-id", required=True)
    args = parser.parse_args()
    root = args.root.resolve()
    natural = root / "assets" / "natural"
    for filename, expected in EXPECTED_HASHES.items():
        if sha256(natural / filename) != expected:
            raise RuntimeError(f"natural input hash mismatch: {filename}")
    output = root / "artifacts" / args.run_id
    output.mkdir(parents=True, exist_ok=True)
    carriers = [
        ("NYC_TLC_YELLOW_2025_01", natural / "yellow_tripdata_2025-01.parquet", 16, load_nyc),
        ("NYC_TLC_YELLOW_2025_02", natural / "yellow_tripdata_2025-02.parquet", 16, load_nyc),
        ("UCI_ADULT", natural / "adult.zip", 8, load_adult),
    ]
    all_results = []
    carrier_ledgers = []
    process = psutil.Process()
    run_cpu0, run_wall0 = time.process_time_ns(), time.perf_counter_ns()
    for carrier_id, path, count, loader in carriers:
        io0 = process.io_counters()._asdict()
        cpu0, wall0 = time.process_time_ns(), time.perf_counter_ns()
        first, second, metadata = loader(path)
        prep = {"wall_ns": time.perf_counter_ns() - wall0, "cpu_ns": time.process_time_ns() - cpu0}
        io1 = process.io_counters()._asdict()
        prep["read_bytes"] = io1["read_bytes"] - io0["read_bytes"]
        prep["write_bytes"] = io1["write_bytes"] - io0["write_bytes"]
        offsets = window_offsets(len(first), count)
        prep_share = math.ceil(prep["wall_ns"] / count)
        carrier_ledgers.append({"carrier": carrier_id, "input": str(path.relative_to(root)).replace("\\", "/"), "sha256": EXPECTED_HASHES[path.name], "metadata": metadata, "offsets": offsets, "preparation": prep, "charged_wall_ns_per_window_per_arm": prep_share})
        for index, offset in enumerate(offsets):
            rows = [first[offset : offset + 16], second[offset : offset + 16]]
            result_path = output / "windows" / carrier_id / f"window_{index:02d}.json"
            result = run_window(carrier_id, index, rows, prep_share, output / "streams" / carrier_id / f"window_{index:02d}")
            result["offset"] = offset
            result_path.parent.mkdir(parents=True, exist_ok=True)
            result_path.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8", newline="\n")
            all_results.append(result)
            print(f"WINDOW {len(all_results)}/40 {carrier_id}:{index} ratio={result['rank_ratio']:.6f} residual={result['full_cost_residual']}", flush=True)
    strict = sum(result["strict_rank_compression"] for result in all_results)
    useful = sum(result["useful_rank_compression"] for result in all_results)
    residual = sum(result["full_cost_residual"] for result in all_results)
    adult_residual = sum(result["full_cost_residual"] for result in all_results if result["carrier"] == "UCI_ADULT")
    median_ratio = statistics.median(result["rank_ratio"] for result in all_results)
    summary_result = {
        "assignment_id": "STAGEA-L1-20260811-ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION-INITIAL-V8.7",
        "run_id": args.run_id,
        "natural_windows": len(all_results),
        "carriers": carrier_ledgers,
        "all_native_equivalent": all(all(arm["all_native_equivalent"] for arm in result["arms"].values()) for result in all_results),
        "all_deterministic_streams": all(all(arm["all_stream_hashes_equal"] for arm in result["arms"].values()) for result in all_results),
        "rp_product_exact_windows": sum(result["rp_product_exact_both_delta_arms"] for result in all_results),
        "strict_rank_compression_windows": strict,
        "useful_rank_compression_windows": useful,
        "median_rank_ratio": median_ratio,
        "rank_success": useful >= 10 and strict >= 20,
        "product_sized_killer": strict < 4 or median_ratio >= 1.0,
        "full_cost_residual_windows": residual,
        "independent_carrier_residual_windows": adult_residual,
        "full_cost_success": residual >= 10 and adult_residual >= 2,
        "threshold_pass": useful >= 10 and strict >= 20 and not (strict < 4 or median_ratio >= 1.0) and residual >= 10 and adult_residual >= 2,
        "run_wall_ns": time.perf_counter_ns() - run_wall0,
        "run_cpu_ns": time.process_time_ns() - run_cpu0,
    }
    (output / "summary.json").write_text(json.dumps(summary_result, indent=2, sort_keys=True) + "\n", encoding="utf-8", newline="\n")
    print(json.dumps(summary_result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
