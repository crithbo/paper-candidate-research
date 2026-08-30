#!/usr/bin/env python3
"""Run and summarize the frozen 100-module bounded Stage-A killer."""

from __future__ import annotations

import argparse
import csv
import hashlib
import importlib.util
import json
import math
import pathlib
import statistics
import sys
import time
from collections import Counter
from typing import Any


def load(name: str, path: pathlib.Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def sha(path: pathlib.Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write_json(path: pathlib.Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def percentile(values: list[float], fraction: float) -> float:
    ordered = sorted(values)
    if not ordered:
        return float("nan")
    index = max(0, min(len(ordered) - 1, math.ceil(fraction * len(ordered)) - 1))
    return ordered[index]


def sum_check_wall(verification: dict[str, Any], arm: str) -> float:
    row = verification["arms"][arm]
    return sum(x["wall_seconds"] for x in row["checks"].values())


def sum_check_cpu(verification: dict[str, Any], arm: str) -> float:
    row = verification["arms"][arm]
    return sum(
        (x["cpu_user_seconds"] or 0) + (x["cpu_kernel_seconds"] or 0)
        for x in row["checks"].values()
    )


def peak_check_rss(verification: dict[str, Any], arm: str) -> int:
    row = verification["arms"][arm]
    return max(
        [x["peak_rss_bytes"] for x in row["checks"].values()]
        + [x["peak_rss_bytes"] for x in row["read_trials"]]
        + [0]
    )


def compile_cpu(corpus: dict[str, Any]) -> float:
    rows = corpus["modules"] + corpus["failures"]
    return sum(
        (row["compile_measurement"]["cpu_user_seconds"] or 0)
        + (row["compile_measurement"]["cpu_kernel_seconds"] or 0)
        for row in rows
    )


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--python", required=True, type=pathlib.Path)
    ap.add_argument("--codec", required=True, type=pathlib.Path)
    ap.add_argument("--planner", required=True, type=pathlib.Path)
    ap.add_argument("--verifier", required=True, type=pathlib.Path)
    ap.add_argument("--llvm-bin", required=True, type=pathlib.Path)
    ap.add_argument("--corpus-freeze", required=True, type=pathlib.Path)
    ap.add_argument("--corpus-freeze-sha256", required=True)
    ap.add_argument("--output-root", required=True, type=pathlib.Path)
    ap.add_argument("--read-repeats", type=int, default=5)
    ap.add_argument("--universe-cap", type=int, default=10)
    ap.add_argument("--per-block-defs", type=int, default=6)
    ap.add_argument("--global-defs", type=int, default=12)
    args = ap.parse_args()
    measure = load("stagea_measure", args.verifier.resolve())
    actual_freeze_sha = sha(args.corpus_freeze)
    if actual_freeze_sha != args.corpus_freeze_sha256.lower():
        raise RuntimeError("natural corpus freeze hash mismatch")
    corpus = json.loads(args.corpus_freeze.read_text(encoding="utf-8"))
    args.output_root.mkdir(parents=True, exist_ok=True)
    progress_path = args.output_root / "CORPUS_RUN_PROGRESS.json"
    if progress_path.exists():
        progress = json.loads(progress_path.read_text(encoding="utf-8"))
        rows = progress["rows"]
        finished = {row["module_sha256"] for row in rows}
    else:
        rows = []
        finished = set()
    start = time.perf_counter()
    fail_closed = False

    for index, module_row in enumerate(corpus["modules"]):
        if module_row["module_sha256"] in finished:
            continue
        module = pathlib.Path(module_row["module_path"])
        trace = pathlib.Path(module_row["trace_path"])
        if sha(module) != module_row["module_sha256"] or sha(trace) == "":
            raise RuntimeError(f"frozen module integrity failure: {module}")
        item_dir = args.output_root / f"{index:03d}_{module.stem}"
        item_dir.mkdir(parents=True, exist_ok=True)
        planner_command = [
            str(args.python), str(args.planner), "--codec", str(args.codec),
            "--input", str(module), "--output-dir", str(item_dir),
            "--universe-cap", str(args.universe_cap),
            "--per-block-defs", str(args.per_block_defs),
            "--global-defs", str(args.global_defs),
        ]
        planner_measure = measure.run_measured(planner_command, timeout=180)
        if planner_measure["returncode"] != 0:
            row = {
                **module_row, "index": index, "planner_measurement": planner_measure,
                "strict_pass": False, "failure": "PLANNER_FAILED",
            }
            rows.append(row)
            fail_closed = True
            write_json(progress_path, {"rows": rows, "fail_closed": True})
            break
        plan_path = item_dir / "plan.json"
        plan = json.loads(plan_path.read_text(encoding="utf-8"))
        verify_path = item_dir / "verification.json"
        verifier_command = [
            str(args.python), str(args.verifier), "--codec", str(args.codec),
            "--llvm-bin", str(args.llvm_bin), "--arms-dir", str(item_dir),
            "--output", str(verify_path), "--read-repeats", str(args.read_repeats),
        ]
        verifier_measure = measure.run_measured(verifier_command, timeout=240)
        verification = (
            json.loads(verify_path.read_text(encoding="utf-8"))
            if verify_path.exists() else None
        )
        strict_pass = (
            verifier_measure["returncode"] == 0
            and verification is not None and verification["all_arms_pass"]
        )
        sizes = {arm: plan[arm]["bytes"] for arm in ("B0", "B1", "B2", "WL")}
        union_bytes = min(sizes["B1"], sizes["B2"])
        wl_scope = plan["WL"].get("selected_scope_action") is not None
        b2_scope = plan["B2"].get("selected_scope_action") is not None
        actual_wl_novel = 0 if wl_scope else plan["WL"]["selected_novel_definition_count"]
        actual_b2_novel = 0 if b2_scope else plan["B2"]["selected_novel_definition_count"]
        first_reads = {
            arm: verification["arms"][arm]["read_first_wall_seconds"]
            if verification else None for arm in ("B0", "B1", "B2", "WL")
        }
        warm_reads = {
            arm: statistics.median(verification["arms"][arm]["read_warm_wall_seconds"])
            if verification and verification["arms"][arm]["read_warm_wall_seconds"] else None
            for arm in ("B0", "B1", "B2", "WL")
        }
        row = {
            **module_row,
            "index": index,
            "result_directory": str(item_dir.resolve()),
            "plan_sha256": sha(plan_path),
            "verification_sha256": sha(verify_path) if verify_path.exists() else None,
            "planner_measurement": planner_measure,
            "verifier_measurement": verifier_measure,
            "strict_pass": strict_pass,
            "failure": None if strict_pass else "STRICT_NATIVE_ARM_VERIFICATION_FAILED",
            "B0_bytes": sizes["B0"], "B1_bytes": sizes["B1"],
            "B2_bytes": sizes["B2"], "WL_bytes": sizes["WL"],
            "union_bytes": union_bytes,
            "WL_saving_vs_B0_bytes": sizes["B0"] - sizes["WL"],
            "WL_residual_vs_union_bytes": union_bytes - sizes["WL"],
            "WL_output_differs_B2": plan["WL"]["sha256"] != plan["B2"]["sha256"],
            "WL_actual_novel_definitions": actual_wl_novel,
            "B2_actual_novel_definitions": actual_b2_novel,
            "WL_scope_action": wl_scope,
            "B2_scope_action": b2_scope,
            "planning_wall_seconds": {
                arm: 0.0 if arm == "B0" else plan[arm]["planning_wall_seconds"]
                for arm in ("B0", "B1", "B2", "WL")
            },
            "strict_check_wall_seconds": {
                arm: sum_check_wall(verification, arm) if verification else None
                for arm in ("B0", "B1", "B2", "WL")
            },
            "strict_check_cpu_seconds": {
                arm: sum_check_cpu(verification, arm) if verification else None
                for arm in ("B0", "B1", "B2", "WL")
            },
            "peak_native_rss_bytes": {
                arm: peak_check_rss(verification, arm) if verification else None
                for arm in ("B0", "B1", "B2", "WL")
            },
            "first_read_wall_seconds": first_reads,
            "warm_read_median_wall_seconds": warm_reads,
        }
        rows.append(row)
        finished.add(module_row["module_sha256"])
        write_json(progress_path, {
            "schema": "llvm-stagea-corpus-run-progress-v1",
            "claim_bearing_observation_started": True,
            "rows": rows, "fail_closed": not strict_pass,
        })
        if not strict_pass:
            fail_closed = True
            break

    complete = len(rows) == corpus["retained_modules"] and not fail_closed
    valid = [row for row in rows if row.get("strict_pass")]
    useful = [row for row in valid if row["WL_saving_vs_B0_bytes"] > 0]
    residual = [row for row in useful if row["WL_residual_vs_union_bytes"] > 0]
    residual_action_coverage = len(residual) / len(useful) if useful else 0.0
    raw_residuals = [row["WL_residual_vs_union_bytes"] for row in valid]
    summaries: dict[str, Any] = {}
    for arm in ("B0", "B1", "B2", "WL"):
        byte_values = [row[f"{arm}_bytes"] for row in valid]
        plan_values = [row["planning_wall_seconds"][arm] for row in valid]
        check_values = [row["strict_check_wall_seconds"][arm] for row in valid]
        first_values = [row["first_read_wall_seconds"][arm] for row in valid]
        warm_values = [row["warm_read_median_wall_seconds"][arm] for row in valid]
        rss_values = [row["peak_native_rss_bytes"][arm] for row in valid]
        summaries[arm] = {
            "raw_bytes_p50": percentile(byte_values, 0.50),
            "raw_bytes_p90": percentile(byte_values, 0.90),
            "planning_wall_seconds_p50": percentile(plan_values, 0.50),
            "planning_wall_seconds_p90": percentile(plan_values, 0.90),
            "strict_check_wall_seconds_p50": percentile(check_values, 0.50),
            "strict_check_wall_seconds_p90": percentile(check_values, 0.90),
            "first_read_wall_seconds_p50": percentile(first_values, 0.50),
            "first_read_wall_seconds_p90": percentile(first_values, 0.90),
            "warm_read_wall_seconds_p50": percentile(warm_values, 0.50),
            "warm_read_wall_seconds_p90": percentile(warm_values, 0.90),
            "peak_native_rss_bytes_p50": percentile(rss_values, 0.50),
            "peak_native_rss_bytes_p90": percentile(rss_values, 0.90),
        }

    planner_cpu = sum(
        (row["planner_measurement"]["cpu_user_seconds"] or 0)
        + (row["planner_measurement"]["cpu_kernel_seconds"] or 0)
        for row in valid
    )
    native_cpu = sum(
        row["strict_check_cpu_seconds"][arm]
        for row in valid for arm in ("B0", "B1", "B2", "WL")
    )
    cumulative_cpu = compile_cpu(corpus) + planner_cpu + native_cpu
    result = {
        "schema": "llvm-stagea-natural-results-v1",
        "assignment_id": "STAGEA-L3-20260811-LLVM-BITCODE-ABBREV-PLANNER-RESUME1-V8.7",
        "claim_bearing_observation": "100-module post-gate native arm comparison",
        "claim_bearing_observation_obtained": len(valid) > 0,
        "corpus_freeze_sha256": actual_freeze_sha,
        "requested_modules": corpus["retained_modules"],
        "completed_modules": len(valid),
        "complete": complete,
        "strict_all_arms_pass": complete and all(row["strict_pass"] for row in rows),
        "useful_candidate_modules_vs_B0": len(useful),
        "residual_candidate_modules_vs_strongest_union": len(residual),
        "residual_action_coverage": residual_action_coverage,
        "residual_action_coverage_threshold": 0.10,
        "raw_residual_vs_union_bytes_p50": percentile(raw_residuals, 0.50),
        "raw_residual_vs_union_bytes_p90": percentile(raw_residuals, 0.90),
        "WL_equal_B2_output_count": sum(not row["WL_output_differs_B2"] for row in valid),
        "WL_novel_definition_modules": sum(row["WL_actual_novel_definitions"] > 0 for row in valid),
        "WL_scope_action_modules": sum(row["WL_scope_action"] for row in valid),
        "B2_scope_action_modules": sum(row["B2_scope_action"] for row in valid),
        "summaries": summaries,
        "full_cost": {
            "corpus_compile_cpu_seconds_including_failed_attempts": compile_cpu(corpus),
            "planner_process_cpu_seconds": planner_cpu,
            "native_strict_check_cpu_seconds": native_cpu,
            "cumulative_measured_cpu_seconds": cumulative_cpu,
            "cumulative_measured_cpu_hours": cumulative_cpu / 3600.0,
            "planner_process_peak_rss_bytes": max(
                [row["planner_measurement"]["peak_rss_bytes"] for row in valid] + [0]
            ),
            "native_peak_rss_bytes": max(
                [row["peak_native_rss_bytes"][arm] for row in valid
                 for arm in ("B0", "B1", "B2", "WL")] + [0]
            ),
            "run_wall_seconds_this_invocation": time.perf_counter() - start,
        },
        "stop_signals": {
            "strict_failure": fail_closed,
            "residual_coverage_below_10_percent": residual_action_coverage < 0.10,
            "no_positive_p50_residual": percentile(raw_residuals, 0.50) <= 0,
            "no_positive_p90_residual": percentile(raw_residuals, 0.90) <= 0,
            "B1_or_B2_absorbs_all_primary_benefit": len(residual) == 0,
        },
        "rows": rows,
        "positive_claim_ceiling": "PRELIMINARY_SUPPORT",
        "stageb_authorized": False,
    }
    result_path = args.output_root / "NATURAL_RESULTS.json"
    write_json(result_path, result)

    csv_path = args.output_root / "NATURAL_RESULTS.csv"
    fields = [
        "index", "path", "language", "optimization", "debug",
        "source_size_quartile", "module_bytes", "module_sha256", "strict_pass",
        "B0_bytes", "B1_bytes", "B2_bytes", "WL_bytes", "union_bytes",
        "WL_saving_vs_B0_bytes", "WL_residual_vs_union_bytes",
        "WL_output_differs_B2", "WL_actual_novel_definitions",
        "WL_scope_action", "B2_scope_action",
    ]
    with csv_path.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(rows)
    print(json.dumps({
        "complete": complete, "strict_all_arms_pass": result["strict_all_arms_pass"],
        "modules": len(valid), "useful_vs_B0": len(useful),
        "residual_vs_union": len(residual),
        "residual_action_coverage": residual_action_coverage,
        "residual_p50": result["raw_residual_vs_union_bytes_p50"],
        "residual_p90": result["raw_residual_vs_union_bytes_p90"],
        "cpu_hours": result["full_cost"]["cumulative_measured_cpu_hours"],
        "result": str(result_path),
    }, sort_keys=True))
    return 0 if complete else 2


if __name__ == "__main__":
    raise SystemExit(main())
