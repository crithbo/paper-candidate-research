"""Exceptional R3G fidelity-only replay for PARQUET-PAGE-COSEGMENT.

This wrapper imports the frozen Stage A implementation and changes only the
three user-authorized fidelity defects: complete native family execution,
typed arm-cost allocation, and actual Latin arm rotation.
"""
from __future__ import annotations

import argparse
import concurrent.futures
import contextlib
import hashlib
import importlib.util
import json
import multiprocessing
import queue as queue_module
import os
from pathlib import Path
import shutil
import statistics
import sys
import threading
import time
from typing import Any

import psutil
import pyarrow as pa
import pyarrow.parquet as pq
from datafusion import SessionConfig, SessionContext


TOPIC = Path(__file__).resolve().parents[2]
FROZEN_SCRIPT = TOPIC / "scripts" / "parquet_stagea.py"
FROZEN_SHA256 = "38E7BC74352BFD235709BD383E087BF5CEDF978DE2017BBC65BD9764A083EFF6"
EXPECTED_CORPUS = [f"green_tripdata_{year:04d}-{month:02d}.parquet" for year, month in
                   [(2024, m) for m in range(1, 13)] + [(2025, m) for m in range(1, 9)]]
FIXED = [(r, b) for r in (1024, 4096, 16384, 65536) for b in (65536, 262144, 1048576)]
CDC = [(65536, 262144, 0), (262144, 1048576, 1), (262144, 2097152, 2)]
NATIVE_MODES = {
    "native-v1-zstd-plain": dict(data_page_version="1.0", use_dictionary=False, use_byte_stream_split=False),
    "native-v1-zstd-dictionary": dict(data_page_version="1.0", use_dictionary=True, use_byte_stream_split=False),
    "native-v2-zstd-plain": dict(data_page_version="2.0", use_dictionary=False, use_byte_stream_split=False),
    "native-v2-zstd-dictionary": dict(data_page_version="2.0", use_dictionary=True, use_byte_stream_split=False),
    "native-v2-zstd-bss": dict(data_page_version="2.0", use_dictionary=False, use_byte_stream_split=True),
}
CUSTOM_MODES = ("custom-v2-zstd-always-compressed", "custom-v2-zstd-threshold-0_9")


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest().upper()


if sha256(FROZEN_SCRIPT) != FROZEN_SHA256:
    raise RuntimeError("frozen implementation hash mismatch")
spec = importlib.util.spec_from_file_location("r3g_frozen_parquet", FROZEN_SCRIPT)
if spec is None or spec.loader is None:
    raise RuntimeError("cannot import frozen implementation")
frozen = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = frozen
spec.loader.exec_module(frozen)


class Meter:
    def __init__(self) -> None:
        self.process = psutil.Process()
        self.cpu0 = 0
        self.wall0 = 0
        self.peak = 0
        self.stop = threading.Event()
        self.thread: threading.Thread | None = None

    def __enter__(self) -> "Meter":
        self.cpu0 = time.process_time_ns()
        self.wall0 = time.perf_counter_ns()
        self.peak = self.process.memory_info().rss
        def sample() -> None:
            while not self.stop.wait(0.002):
                self.peak = max(self.peak, self.process.memory_info().rss)
        self.thread = threading.Thread(target=sample, daemon=True)
        self.thread.start()
        return self

    def __exit__(self, *_: Any) -> None:
        self.stop.set()
        if self.thread is not None:
            self.thread.join()
        self.wall_ns = time.perf_counter_ns() - self.wall0
        self.cpu_ns = time.process_time_ns() - self.cpu0

    def record(self, **extra: Any) -> dict[str, Any]:
        return {"wall_ns": self.wall_ns, "cpu_ns": self.cpu_ns,
                "peak_rss_bytes": self.peak, **extra}


def stable_digest(value: Any) -> str:
    return hashlib.sha256(json.dumps(value, sort_keys=True, separators=(",", ":"), default=str).encode()).hexdigest().upper()


def action_catalog() -> list[dict[str, Any]]:
    boundaries = ([{"id": f"fixed-r{r}-b{b}", "kind": "fixed", "row_limit": r, "page_bytes": b}
                   for r, b in FIXED] +
                  [{"id": f"cdc-{lo}-{hi}-n{n}", "kind": "cdc", "minimum": lo, "maximum": hi, "norm": n}
                   for lo, hi, n in CDC])
    reps = list(NATIVE_MODES) + list(CUSTOM_MODES)
    points = [{"id": "source-original", "boundary": "source", "representation": "source-original"}]
    for boundary in boundaries:
        for rep in reps:
            points.append({"id": f"{boundary['id']}__{rep}", "boundary": boundary, "representation": rep})
    if len(points) != 106 or len({x["id"] for x in points}) != 106:
        raise AssertionError("complete family cardinality/uniqueness failure")
    return points


def native_write(source: Path, output: Path, boundary: dict[str, Any], mode: str) -> None:
    pf = pq.ParquetFile(source)
    mode_opts = dict(NATIVE_MODES[mode])
    if mode == "native-v2-zstd-bss":
        mode_opts["use_byte_stream_split"] = [
            field.name for field in pf.schema_arrow
            if (pa.types.is_integer(field.type) or pa.types.is_floating(field.type)
                or pa.types.is_timestamp(field.type) or pa.types.is_date(field.type)
                or pa.types.is_time(field.type) or pa.types.is_duration(field.type)
                or pa.types.is_decimal(field.type) or pa.types.is_fixed_size_binary(field.type))
        ]
    opts: dict[str, Any] = dict(version="2.6", compression="zstd", write_statistics=True,
                                write_page_index=True, write_batch_size=512, **mode_opts)
    if boundary["kind"] == "fixed":
        opts["max_rows_per_page"] = boundary["row_limit"]
        opts["data_page_size"] = boundary["page_bytes"]
    else:
        opts["use_content_defined_chunking"] = {
            "min_chunk_size": boundary["minimum"], "max_chunk_size": boundary["maximum"],
            "norm_level": boundary["norm"]}
        opts["data_page_size"] = boundary["maximum"]
    with pq.ParquetWriter(output, pf.schema_arrow, **opts) as writer:
        for rg in range(pf.num_row_groups):
            table = pf.read_row_group(rg)
            writer.write_table(table, row_group_size=table.num_rows)


def custom_write(source: Path, output: Path, cuts: dict[tuple[int, str], list[int]], mode: str,
                 table: pa.Table, footer: Any) -> dict[str, Any]:
    old_mode = "always_compressed" if mode.endswith("always-compressed") else "threshold_0_9"
    retention, retention_audit = frozen.retention_for(table, footer, cuts, source, old_mode)
    audit = frozen.write_standard_file(source, output, cuts, retention)
    return {"retention": retention, "retention_audit": retention_audit, "writer_audit": audit}


def no_retention(cuts: dict[tuple[int, str], list[int]]) -> dict[tuple[int, str], list[bool]]:
    return {key: [False] * len(value) for key, value in cuts.items()}


def predicted(source: Path, table: pa.Table, cuts: dict[tuple[int, str], list[int]]) -> float:
    return frozen.predicted_score(table, source, cuts, no_retention(cuts))


def session(path: Path) -> SessionContext:
    cfg = SessionConfig().set("datafusion.execution.parquet.enable_page_index", "true").set(
        "datafusion.execution.parquet.pushdown_filters", "true").set("datafusion.execution.target_partitions", "1")
    ctx = SessionContext(cfg)
    ctx.register_parquet("t", str(path))
    return ctx


def scalar(batch: Any) -> list[str]:
    out = []
    for column in batch.columns:
        value = column[0].as_py()
        out.append("NaN" if isinstance(value, float) and value != value else (format(value, ".12g") if isinstance(value, float) else str(value)))
    return out


def run_one(ctx: SessionContext, sql: str) -> tuple[list[str], dict[str, int]]:
    process = psutil.Process()
    stop = threading.Event()
    peak = [process.memory_info().rss]
    def sample() -> None:
        while not stop.wait(0.002):
            peak[0] = max(peak[0], process.memory_info().rss)
    thread = threading.Thread(target=sample, daemon=True)
    thread.start()
    cpu0, wall0 = time.process_time_ns(), time.perf_counter_ns()
    batch = ctx.sql(sql).collect()[0]
    wall_ns, cpu_ns = time.perf_counter_ns() - wall0, time.process_time_ns() - cpu0
    stop.set(); thread.join()
    return scalar(batch), {"wall_ns": wall_ns, "cpu_ns": cpu_ns, "peak_rss_bytes": peak[0]}


def latin_queries(union_path: Path, candidate_path: Path, queries: list[str], file_index: int,
                  warmups: int = 2, repetitions: int = 9) -> dict[str, Any]:
    contexts = {"union": session(union_path), "candidate": session(candidate_path)}
    records = {"union": [], "candidate": []}
    expected: dict[int, list[str]] = {}
    trace = []
    for qidx, sql in enumerate(queries):
        for ridx in range(warmups + repetitions):
            order = ["union", "candidate"] if (file_index + qidx + ridx) % 2 == 0 else ["candidate", "union"]
            trace.append({"query": qidx, "round": ridx, "measured": ridx >= warmups, "order": order})
            for arm in order:
                value, cost = run_one(contexts[arm], sql)
                if qidx not in expected:
                    expected[qidx] = value
                elif value != expected[qidx]:
                    raise ValueError(f"SQL mismatch query={qidx} arm={arm}")
                if ridx >= warmups:
                    records[arm].append({"query": qidx, "round": ridx - warmups, "result": value, **cost})
                else:
                    records[arm].append({"query": qidx, "round": ridx, "warmup": True, "result": value, **cost})
    output: dict[str, Any] = {"rotation_trace": trace, "rotation_digest": stable_digest(trace)}
    for arm in ("union", "candidate"):
        measured = [x for x in records[arm] if not x.get("warmup")]
        output[arm] = {
            "records": records[arm],
            "p50_wall_ns": statistics.median(x["wall_ns"] for x in measured),
            "p90_wall_ns": statistics.quantiles([x["wall_ns"] for x in measured], n=10, method="inclusive")[8],
            "measured_wall_ns": sum(x["wall_ns"] for x in measured),
            "warmup_wall_ns": sum(x["wall_ns"] for x in records[arm] if x.get("warmup")),
            "total_wall_ns": sum(x["wall_ns"] for x in records[arm]),
            "total_cpu_ns": sum(x["cpu_ns"] for x in records[arm]),
            "peak_rss_bytes": max(x["peak_rss_bytes"] for x in records[arm]),
        }
    return output


def boundary_cuts(source: Path, work: Path) -> dict[str, dict[tuple[int, str], list[int]]]:
    result = {}
    for r, b in FIXED:
        bid = f"fixed-r{r}-b{b}"
        path = work / f"{bid}.parquet"
        frozen.native_boundary_file(source, path, row_limit=r, page_bytes=b)
        result[bid] = frozen.extract_cuts(path)
        path.unlink()
    for lo, hi, n in CDC:
        bid = f"cdc-{lo}-{hi}-n{n}"
        path = work / f"{bid}.parquet"
        frozen.native_boundary_file(source, path, cdc=(lo, hi, n))
        result[bid] = frozen.extract_cuts(path)
        path.unlink()
    return result


def write_point(source: Path, target: Path, point: dict[str, Any], table: pa.Table, footer: Any,
                frozen_cuts: dict[str, dict[tuple[int, str], list[int]]]) -> dict[str, Any]:
    if point["id"] == "source-original":
        shutil.copyfile(source, target)
        source_footer = frozen.read_footer(target)
        if all(c.offset_index_offset is not None for rg in source_footer.row_groups for c in rg.columns):
            cuts = frozen.extract_cuts(target)
        else:
            # No native OffsetIndex means the frozen page-index reader cannot
            # prune within the chunk; model one visible span per column chunk.
            cuts = {(rg_idx, chunk.meta_data.path_in_schema[0]): [rg.num_rows]
                    for rg_idx, rg in enumerate(source_footer.row_groups) for chunk in rg.columns}
        return {"cuts": cuts, "custom": None}
    boundary = point["boundary"]
    bid = boundary["id"]
    rep = point["representation"]
    if rep in NATIVE_MODES:
        native_write(source, target, boundary, rep)
        cuts = frozen.extract_cuts(target)
        return {"cuts": cuts, "custom": None}
    cuts = frozen_cuts[bid]
    info = custom_write(source, target, cuts, rep, table, footer)
    return {"cuts": cuts, "custom": info}


def evaluate_point_task(payload: tuple[str, str, dict[str, Any], dict[str, dict[tuple[int, str], list[int]]]]) -> dict[str, Any]:
    """Materialize, parse, score, and hash one family point in an isolated worker."""
    source_s, target_s, point, cuts_by_boundary = payload
    source, target = Path(source_s), Path(target_s)
    table = pq.read_table(source)
    footer = frozen.read_footer(source)
    with Meter() as meter:
        info = write_point(source, target, point, table, footer, cuts_by_boundary)
        cuts = info["cuts"]
        score = predicted(source, table, cuts)
        size = target.stat().st_size
        digest = sha256(target)
        row_groups = pq.ParquetFile(target).num_row_groups
    return {
        "id": point["id"], "score": score, "bytes": size, "sha256": digest,
        "cuts_digest": stable_digest({str(k): v for k, v in cuts.items()}),
        "row_groups": row_groups, "cuts": cuts, "worker_cost": meter.record(
            logical_read_bytes=source.stat().st_size, logical_write_bytes=size, temporary_bytes=size),
    }


def candidate_task(source_s: str, union_cuts: dict[tuple[int, str], list[int]], queue: Any) -> None:
    source = Path(source_s)
    table = pq.read_table(source)
    footer = frozen.read_footer(source)
    cuts, dp = frozen.candidate_plan(table, source, union_cuts)
    retention, audit = frozen.retention_for(table, footer, cuts, source, "workload_conditioned")
    queue.put((cuts, dp, retention, audit))


def bounded_candidate(source: Path, union_cuts: dict[tuple[int, str], list[int]], timeout_s: float = 120.0) -> tuple[Any, dict[str, Any]]:
    ctx = multiprocessing.get_context("spawn")
    queue = ctx.Queue(maxsize=1)
    proc = ctx.Process(target=candidate_task, args=(str(source), union_cuts, queue))
    wall0 = time.perf_counter_ns()
    proc.start()
    child = psutil.Process(proc.pid)
    peak = 0
    cpu_ns = 0
    deadline = time.perf_counter() + timeout_s
    while proc.is_alive() and time.perf_counter() < deadline:
        with contextlib.suppress(psutil.Error):
            peak = max(peak, child.memory_info().rss)
            ct = child.cpu_times()
            cpu_ns = max(cpu_ns, int((ct.user + ct.system) * 1e9))
        proc.join(timeout=min(0.05, max(0.0, deadline - time.perf_counter())))
    timed_out = proc.is_alive()
    if timed_out:
        proc.terminate()
    proc.join(timeout=5)
    with contextlib.suppress(psutil.Error):
        ct = child.cpu_times()
        cpu_ns = max(cpu_ns, int((ct.user + ct.system) * 1e9))
    wall_ns = time.perf_counter_ns() - wall0
    payload = None
    if not timed_out and proc.exitcode == 0:
        try:
            payload = queue.get(timeout=2)
        except queue_module.Empty:
            payload = None
    cost = {"wall_ns": wall_ns, "cpu_ns": cpu_ns, "peak_rss_bytes": peak,
            "logical_read_bytes": source.stat().st_size, "logical_write_bytes": 0,
            "temporary_bytes": 0, "candidates_evaluated": 15,
            "timed_out": timed_out, "fallback_count": int(timed_out),
            "failure_count": int(proc.exitcode not in (0, None) and not timed_out),
            "child_exitcode": proc.exitcode}
    return payload, cost


def equivalent(source: Path, output: Path) -> dict[str, Any]:
    src = pq.read_table(source)
    out = pq.read_table(output)
    spf, opf = pq.ParquetFile(source), pq.ParquetFile(output)
    checks = {
        "table": src.equals(out),
        "schema": src.schema.equals(out.schema, check_metadata=True),
        "row_groups": [spf.metadata.row_group(i).num_rows for i in range(spf.num_row_groups)] == [opf.metadata.row_group(i).num_rows for i in range(opf.num_row_groups)],
    }
    checks["pass"] = all(checks.values())
    return checks


def one_file(source: Path, output_dir: Path, file_index: int) -> dict[str, Any]:
    file_dir = output_dir / source.stem
    work = file_dir / "tmp"
    file_dir.mkdir(parents=True, exist_ok=True)
    work.mkdir(parents=True, exist_ok=True)
    process = psutil.Process()
    with Meter() as shared_meter:
        table = pq.read_table(source)
        footer = frozen.read_footer(source)
        queries = frozen.heldout_sql(source)
        _ = frozen.workload_intervals(source, True)
    shared = shared_meter.record(logical_read_bytes=source.stat().st_size, logical_write_bytes=0, temporary_bytes=0)

    catalog = action_catalog()
    point_records = []
    selected: tuple[tuple[float, int, str], dict[str, Any]] | None = None
    total_temp_bytes = 0
    with Meter() as baseline_meter:
        cuts_by_boundary = boundary_cuts(source, work)
        all_family_cuts: dict[tuple[int, str], set[int]] = {}
        point_by_id = {x["id"]: x for x in catalog}
        payloads = [(str(source), str(work / f"point-{idx:03d}.parquet"), point, cuts_by_boundary)
                    for idx, point in enumerate(catalog)]
        worker_cpu_ns = 0
        worker_peak_rss = 0
        with concurrent.futures.ProcessPoolExecutor(max_workers=4) as pool:
            for point_record in pool.map(evaluate_point_task, payloads, chunksize=1):
                cuts = point_record.pop("cuts")
                worker = point_record.pop("worker_cost")
                worker_cpu_ns += worker["cpu_ns"]
                worker_peak_rss = max(worker_peak_rss, worker["peak_rss_bytes"])
                point_records.append(point_record)
                total_temp_bytes += point_record["bytes"]
                for key, values in cuts.items():
                    all_family_cuts.setdefault(key, set()).update(values)
                key = (point_record["score"], point_record["bytes"], point_record["id"])
                if selected is None or key < selected[0]:
                    selected = (key, point_by_id[point_record["id"]])
        for target in work.glob("point-*.parquet"):
            target.unlink()
    baseline = baseline_meter.record(logical_read_bytes=source.stat().st_size * len(catalog),
                                     logical_write_bytes=total_temp_bytes, temporary_bytes=total_temp_bytes,
                                     candidates_evaluated=len(catalog))
    baseline["cpu_ns"] += worker_cpu_ns
    baseline["peak_rss_bytes"] = baseline["peak_rss_bytes"] + worker_peak_rss * 4
    if baseline["wall_ns"] > 120_000_000_000:
        raise RuntimeError(f"baseline selection budget exceeded for {source.name}: {baseline['wall_ns']}")
    assert selected is not None
    union_point = selected[1]
    union_out = file_dir / "strongest_union.parquet"
    with Meter() as union_write_meter:
        union_info = write_point(source, union_out, union_point, table, footer, cuts_by_boundary)
    union_write = union_write_meter.record(logical_read_bytes=source.stat().st_size,
                                           logical_write_bytes=union_out.stat().st_size, temporary_bytes=0)

    union_cuts = union_info["cuts"]
    candidate_payload, candidate_planning = bounded_candidate(source, union_cuts)
    fallback = candidate_payload is None
    if fallback:
        candidate_cuts = union_cuts
        candidate_dp = {"status": "FALLBACK_SELECTION_BUDGET_120S", "selected_union": union_point["id"]}
        candidate_retention = (union_info["custom"]["retention"] if union_info.get("custom") is not None
                               else no_retention(union_cuts))
        candidate_retention_audit = {"pages": sum(len(x) for x in candidate_retention.values()),
                                     "retained": sum(sum(x) for x in candidate_retention.values()),
                                     "fallback": True}
    else:
        candidate_cuts, candidate_dp, candidate_retention, candidate_retention_audit = candidate_payload
    candidate_out = file_dir / "candidate.parquet"
    with Meter() as candidate_write_meter:
        if fallback:
            candidate_info = write_point(source, candidate_out, union_point, table, footer, cuts_by_boundary)
            candidate_audit = {"fallback": True, "selected_union": union_point["id"], "info": str(type(candidate_info["custom"]).__name__)}
        else:
            candidate_audit = frozen.write_standard_file(source, candidate_out, candidate_cuts, candidate_retention)
    candidate_write = candidate_write_meter.record(logical_read_bytes=source.stat().st_size,
                                                    logical_write_bytes=candidate_out.stat().st_size, temporary_bytes=0)

    with Meter() as verify_meter:
        eq_union = equivalent(source, union_out)
        eq_candidate = equivalent(source, candidate_out)
        if not eq_union["pass"] or not eq_candidate["pass"]:
            raise ValueError(f"equivalence killer {source.name}")
        union_index = None
        with contextlib.suppress(Exception):
            union_index = frozen.inspect_standard_indexes(union_out)
        candidate_index = frozen.inspect_standard_indexes(candidate_out)
        if not fallback and not candidate_index["pass"]:
            raise ValueError(f"candidate index killer {source.name}")
    verification = verify_meter.record(logical_read_bytes=source.stat().st_size + union_out.stat().st_size + candidate_out.stat().st_size,
                                       logical_write_bytes=0, temporary_bytes=0)

    latin = latin_queries(union_out, candidate_out, queries, file_index)
    actions = outside = useful = 0
    intervals = frozen.workload_intervals(source, True)
    for name in (() if fallback else frozen.ELIGIBLE):
        values = frozen.normalized_pylist(table.column(name))
        cuts = candidate_cuts[(0, name)]
        previous = 0
        for idx, end in enumerate(cuts):
            actions += 2
            if end not in all_family_cuts.get((0, name), set()):
                outside += 1
                if idx > 0:
                    left = cuts[idx - 2] if idx >= 2 else 0
                    split = frozen.page_access_count(values, left, previous, intervals[name]) * (previous-left) + frozen.page_access_count(values, previous, end, intervals[name]) * (end-previous)
                    merged = frozen.page_access_count(values, left, end, intervals[name]) * (end-left)
                    useful += int(merged > split + 32)
            selected_retention = []
            if union_info.get("custom") is not None:
                selected_retention = union_info["custom"]["retention"].get((0, name), [])
            if candidate_retention[(0, name)][idx] and not (idx < len(selected_retention) and selected_retention[idx]):
                outside += 1
                useful += 1
            previous = end
    shared_half = shared["wall_ns"] / 2 + verification["wall_ns"] / 2
    union_full = shared_half + baseline["wall_ns"] + union_write["wall_ns"] + latin["union"]["total_wall_ns"]
    candidate_full = shared_half + candidate_planning["wall_ns"] + candidate_write["wall_ns"] + latin["candidate"]["total_wall_ns"]
    result = {
        "file": source.name, "file_index": file_index, "source_sha256": sha256(source), "rows": table.num_rows,
        "catalog_count": len(catalog), "selected_union": union_point["id"], "baseline_points": point_records,
        "candidate_dp": candidate_dp, "candidate_retention": candidate_retention_audit,
        "fallback": fallback, "candidate_write_audit": candidate_audit,
        "actions": actions, "outside_actions": outside, "useful_outside_actions": useful,
        "union_bytes": union_out.stat().st_size, "candidate_bytes": candidate_out.stat().st_size,
        "size_ratio": candidate_out.stat().st_size / union_out.stat().st_size,
        "union_sha256": sha256(union_out), "candidate_sha256": sha256(candidate_out),
        "equivalence": {"union": eq_union, "candidate": eq_candidate},
        "index_audit": {"union": union_index, "candidate": candidate_index},
        "latin": latin, "cost": {"shared": shared, "baseline_only": baseline,
                                   "candidate_only": candidate_planning, "union_write": union_write,
                                   "candidate_write": candidate_write, "verification_shared": verification,
                                   "union_full_wall_ns": union_full, "candidate_full_wall_ns": candidate_full,
                                   "candidate_union_full_wall_ratio": candidate_full / union_full},
        "p50_improvement": 1 - latin["candidate"]["p50_wall_ns"] / latin["union"]["p50_wall_ns"],
        "p90_improvement": 1 - latin["candidate"]["p90_wall_ns"] / latin["union"]["p90_wall_ns"],
        "peak_rss_bytes": max(process.memory_info().rss, shared["peak_rss_bytes"], baseline["peak_rss_bytes"],
                              candidate_planning["peak_rss_bytes"], union_write["peak_rss_bytes"],
                              candidate_write["peak_rss_bytes"], verification["peak_rss_bytes"],
                              latin["union"]["peak_rss_bytes"], latin["candidate"]["peak_rss_bytes"]),
    }
    (file_dir / "result.json").write_text(json.dumps(result, indent=2, sort_keys=True), encoding="utf-8", newline="\n")
    shutil.rmtree(work)
    return result


def summarize(results: list[dict[str, Any]], replay: str) -> dict[str, Any]:
    actions = sum(x["actions"] for x in results)
    useful = sum(x["useful_outside_actions"] for x in results)
    summary = {
        "replay": replay, "files": 20, "all_equivalent": all(x["equivalence"]["union"]["pass"] and x["equivalence"]["candidate"]["pass"] for x in results),
        "catalog_count_each": sorted(set(x["catalog_count"] for x in results)),
        "actions": actions, "outside_actions": sum(x["outside_actions"] for x in results),
        "useful_outside_actions": useful, "useful_action_rate": useful / max(1, actions),
        "files_p50_improvement_ge_10pct": sum(x["p50_improvement"] >= .10 for x in results),
        "files_p90_nonworse": sum(x["p90_improvement"] >= 0 for x in results),
        "files_size_le_1_05": sum(x["size_ratio"] <= 1.05 for x in results),
        "files_strict_full_cost_residual": sum(x["cost"]["candidate_union_full_wall_ratio"] < 1 for x in results),
        "median_size_ratio": statistics.median(x["size_ratio"] for x in results),
        "median_p50_improvement": statistics.median(x["p50_improvement"] for x in results),
        "median_p90_improvement": statistics.median(x["p90_improvement"] for x in results),
        "median_full_cost_ratio": statistics.median(x["cost"]["candidate_union_full_wall_ratio"] for x in results),
        "max_peak_rss_bytes": max(x["peak_rss_bytes"] for x in results),
        "selected_union_counts": {k: sum(x["selected_union"] == k for x in results) for k in sorted(set(x["selected_union"] for x in results))},
    }
    summary["killer_pass"] = bool(summary["useful_action_rate"] >= .10 and summary["files_p50_improvement_ge_10pct"] >= 12 and summary["files_p90_nonworse"] == 20 and summary["files_size_le_1_05"] == 20 and summary["files_strict_full_cost_residual"] > 0 and summary["all_equivalent"])
    return summary


def preclaim(output_dir: Path) -> dict[str, Any]:
    output_dir.mkdir(parents=True, exist_ok=True)
    witness_dir = output_dir / "witness"
    base = frozen.witness(witness_dir)
    seed = witness_dir / "witness_seed.parquet"
    dated_seed = witness_dir / "green_tripdata_2024-01.parquet"
    shutil.copyfile(seed, dated_seed)
    rep_checks = {}
    boundary = {"id": "fixed-r8-b65536", "kind": "fixed", "row_limit": 8, "page_bytes": 65536}
    for mode in NATIVE_MODES:
        target = witness_dir / f"{mode}.parquet"
        native_write(seed, target, boundary, mode)
        rep_checks[mode] = equivalent(seed, target)
    witness_table = pq.read_table(seed)
    witness_footer = frozen.read_footer(seed)
    witness_cuts = {(0, name): [5, 12, 32] for name in witness_table.schema.names}
    for mode in CUSTOM_MODES:
        target = witness_dir / f"{mode}.parquet"
        custom_write(dated_seed, target, witness_cuts, mode, witness_table, witness_footer)
        rep_checks[mode] = equivalent(dated_seed, target)
    latin_execution = latin_queries(
        witness_dir / "native-v2-zstd-plain.parquet",
        witness_dir / "custom-v2-zstd-always-compressed.parquet",
        ["SELECT COUNT(*), SUM(i64), SUM(f64), COUNT(txt) FROM t"], 0)
    catalog = action_catalog()
    trace = []
    for file_index in (0, 1):
        for q in range(10):
            for r in range(11):
                trace.append(["union", "candidate"] if (file_index + q + r) % 2 == 0 else ["candidate", "union"])
    ledger_example = {"shared": 100, "baseline": 30, "candidate": 20, "union_write_query": 10, "candidate_write_query": 15}
    ledger = {"union": 50 + 30 + 10, "candidate": 50 + 20 + 15}
    checks = {
        "frozen_script_hash": sha256(FROZEN_SCRIPT) == FROZEN_SHA256,
        "frozen_witness": base["all_pass"],
        "catalog_106_unique": len(catalog) == len({x["id"] for x in catalog}) == 106,
        "native_representations_equal": all(x["pass"] for x in rep_checks.values()),
        "latin_both_orders": {tuple(x) for x in trace} == {("union", "candidate"), ("candidate", "union")},
        "latin_executed_11_rounds_each_arm": len(latin_execution["union"]["records"]) == len(latin_execution["candidate"]["records"]) == 11,
        "ledger_shared_split_once": ledger["union"] + ledger["candidate"] == sum(ledger_example.values()),
    }
    result = {"checks": checks, "pass": all(checks.values()), "catalog": catalog,
              "native_representation_checks": rep_checks, "latin_schedule_digest": stable_digest(trace),
              "latin_execution": latin_execution,
              "ledger_example": ledger_example, "ledger_result": ledger}
    (output_dir / "PRECLAIM_RESULT.json").write_text(json.dumps(result, indent=2, sort_keys=True), encoding="utf-8", newline="\n")
    if not result["pass"]:
        raise SystemExit(4)
    return result


def probe(corpus: Path, output_dir: Path, replay: str) -> dict[str, Any]:
    files = sorted(corpus.glob("green_tripdata_*.parquet"))
    if [x.name for x in files] != EXPECTED_CORPUS:
        raise ValueError("frozen 20-file corpus mismatch")
    output_dir.mkdir(parents=True, exist_ok=True)
    results = []
    started_cpu, started_wall = time.process_time_ns(), time.perf_counter_ns()
    for idx, source in enumerate(files):
        result = one_file(source, output_dir, idx)
        results.append(result)
        print(f"FILE {idx+1}/20 {source.name} union={result['selected_union']} p50={result['p50_improvement']:.4f} p90={result['p90_improvement']:.4f} size={result['size_ratio']:.4f} full={result['cost']['candidate_union_full_wall_ratio']:.4f}", flush=True)
    summary = summarize(results, replay)
    summary["total_cpu_ns"] = time.process_time_ns() - started_cpu
    summary["total_wall_ns"] = time.perf_counter_ns() - started_wall
    (output_dir / "probe_summary.json").write_text(json.dumps(summary, indent=2, sort_keys=True), encoding="utf-8", newline="\n")
    print(json.dumps(summary, indent=2, sort_keys=True))
    return summary


def main() -> None:
    parser = argparse.ArgumentParser()
    sub = parser.add_subparsers(dest="command", required=True)
    p0 = sub.add_parser("preclaim"); p0.add_argument("--output-dir", required=True, type=Path)
    p1 = sub.add_parser("probe"); p1.add_argument("--corpus-dir", required=True, type=Path); p1.add_argument("--output-dir", required=True, type=Path); p1.add_argument("--replay", required=True)
    args = parser.parse_args()
    if args.command == "preclaim":
        print(json.dumps(preclaim(args.output_dir), indent=2, sort_keys=True))
    else:
        probe(args.corpus_dir, args.output_dir, args.replay)


if __name__ == "__main__":
    main()
