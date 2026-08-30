"""Deterministic double-replay integrity and frozen Stage A aggregation.

This script reads the immutable five-result parent prefix plus the resume-local
replay tails, compares them with replay2, and applies the thresholds frozen in
the parent and resume contracts.  It does not construct layouts or run queries.
"""

from __future__ import annotations

import argparse
import copy
import csv
import hashlib
import json
from pathlib import Path
import statistics
from typing import Any


FILES = [f"green_tripdata_{year}-{month:02d}.parquet" for year, months in ((2024, range(1, 13)), (2025, range(1, 9))) for month in months]
VOLATILE_EXACT = {"p50_improvement", "p90_improvement"}
VOLATILE_SUFFIXES = ("wall_ns", "cpu_ns", "peak_rss_bytes")


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1 << 20), b""):
            h.update(block)
    return h.hexdigest().upper()


def load_json(path: Path) -> dict[str, Any]:
    return json.loads(path.read_text(encoding="utf-8"))


def write_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8", newline="\n")


def stable_projection(value: Any) -> Any:
    if isinstance(value, dict):
        projected = {}
        for key, item in value.items():
            if key in VOLATILE_EXACT or key.endswith(VOLATILE_SUFFIXES):
                continue
            projected[key] = stable_projection(item)
        return projected
    if isinstance(value, list):
        return [stable_projection(item) for item in value]
    return value


def replay1_dir(old_root: Path, resume_root: Path, stem: str) -> Path:
    ym = stem.removeprefix("green_tripdata_")
    if ym <= "2024-05":
        return old_root / "artifacts" / "replay1" / stem
    if ym <= "2024-08":
        return resume_root / "artifacts" / "replay1_remaining" / stem
    return resume_root / "artifacts" / "replay1_tail" / stem


def query_wall_total(result: dict[str, Any], arm: str) -> int:
    return sum(sample["wall_ns"] for query in result[f"{arm}_query"]["queries"] for sample in query["samples"])


def arm_full_cost(result: dict[str, Any], arm: str) -> int:
    base = result[f"{arm}_write"]["wall_ns"] + query_wall_total(result, arm)
    return base + (result["planning_wall_ns"] if arm == "candidate" else 0)


def equivalent(result: dict[str, Any]) -> bool:
    return all(result["equivalence"].values())


def summarize(records: list[dict[str, Any]]) -> dict[str, Any]:
    actions = sum(record["actions"] for record in records)
    useful = sum(record["useful_outside_actions"] for record in records)
    union_full = [arm_full_cost(record, "union") for record in records]
    candidate_full = [arm_full_cost(record, "candidate") for record in records]
    candidate_non_dominated = []
    strict_query_and_full_cost_residual = []
    for record, union_cost, candidate_cost in zip(records, union_full, candidate_full):
        union_tuple = (
            record["union_bytes"],
            record["union_query"]["p50_wall_ns"],
            record["union_query"]["p90_wall_ns"],
            union_cost,
        )
        candidate_tuple = (
            record["candidate_bytes"],
            record["candidate_query"]["p50_wall_ns"],
            record["candidate_query"]["p90_wall_ns"],
            candidate_cost,
        )
        union_dominates = all(u <= c for u, c in zip(union_tuple, candidate_tuple)) and any(u < c for u, c in zip(union_tuple, candidate_tuple))
        candidate_non_dominated.append(not union_dominates)
        strict_query_and_full_cost_residual.append(
            record["size_ratio"] <= 1.05
            and record["p50_improvement"] >= 0.10
            and record["p90_improvement"] >= 0.0
            and candidate_cost <= union_cost
        )
    p50_count = sum(record["p50_improvement"] >= 0.10 for record in records)
    p90_count = sum(record["p90_improvement"] >= 0.0 for record in records)
    size_count = sum(record["size_ratio"] <= 1.05 for record in records)
    useful_rate = useful / actions
    gates = {
        "equivalence_20_of_20": all(equivalent(record) for record in records),
        "useful_action_rate_ge_0_10": useful_rate >= 0.10,
        "p50_ge_0_10_at_least_12_of_20": p50_count >= 12,
        "p90_not_erased_20_of_20": p90_count == 20,
        "size_le_1_05_20_of_20": size_count == 20,
        "strict_query_and_full_cost_residual_exists": any(strict_query_and_full_cost_residual),
    }
    return {
        "file_count": len(records),
        "all_equivalent": gates["equivalence_20_of_20"],
        "total_actions": actions,
        "total_outside_actions": sum(record["outside_actions"] for record in records),
        "total_useful_outside_actions": useful,
        "useful_retained_residual_action_rate": useful_rate,
        "files_p50_improvement_ge_10pct": p50_count,
        "files_p90_not_erased": p90_count,
        "files_size_le_1_05": size_count,
        "median_p50_improvement": statistics.median(record["p50_improvement"] for record in records),
        "median_p90_improvement": statistics.median(record["p90_improvement"] for record in records),
        "median_size_ratio": statistics.median(record["size_ratio"] for record in records),
        "union_full_cost_wall_ns": sum(union_full),
        "candidate_full_cost_wall_ns": sum(candidate_full),
        "aggregate_full_cost_ratio": sum(candidate_full) / sum(union_full),
        "files_candidate_pareto_non_dominated": sum(candidate_non_dominated),
        "files_strict_query_and_full_cost_residual": sum(strict_query_and_full_cost_residual),
        "gates": gates,
        "threshold_pass": all(gates.values()),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--old-root", type=Path, required=True)
    parser.add_argument("--resume-root", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    args = parser.parse_args()
    old_root = args.old_root.resolve()
    resume_root = args.resume_root.resolve()
    output_dir = args.output_dir.resolve()

    replay1_records: list[dict[str, Any]] = []
    replay2_records: list[dict[str, Any]] = []
    integrity_records = []
    metric_rows = []
    for filename in FILES:
        stem = filename.removesuffix(".parquet")
        first_dir = replay1_dir(old_root, resume_root, stem)
        second_dir = resume_root / "artifacts" / "replay2" / stem
        first = load_json(first_dir / "result.json")
        second = load_json(second_dir / "result.json")
        replay1_records.append(first)
        replay2_records.append(second)

        first_parquet = {str(path.relative_to(first_dir)).replace("\\", "/"): sha256(path) for path in sorted(first_dir.rglob("*.parquet"))}
        second_parquet = {str(path.relative_to(second_dir)).replace("\\", "/"): sha256(path) for path in sorted(second_dir.rglob("*.parquet"))}
        stable_equal = stable_projection(first) == stable_projection(second)
        parquet_equal = first_parquet == second_parquet
        integrity_records.append({
            "file": filename,
            "replay1_result_path": str((first_dir / "result.json").relative_to(old_root.parent if first_dir.is_relative_to(old_root) else resume_root)).replace("\\", "/"),
            "replay1_result_sha256": sha256(first_dir / "result.json"),
            "replay2_result_sha256": sha256(second_dir / "result.json"),
            "stable_projection_equal": stable_equal,
            "parquet_file_count": len(first_parquet),
            "parquet_sha256_exact_equal": parquet_equal,
            "parquet_sha256": first_parquet,
        })
        for replay, result in (("replay1", first), ("replay2", second)):
            union_cost = arm_full_cost(result, "union")
            candidate_cost = arm_full_cost(result, "candidate")
            metric_rows.append({
                "replay": replay,
                "file": filename,
                "rows": result["rows"],
                "actions": result["actions"],
                "outside_actions": result["outside_actions"],
                "useful_outside_actions": result["useful_outside_actions"],
                "union_bytes": result["union_bytes"],
                "candidate_bytes": result["candidate_bytes"],
                "size_ratio": result["size_ratio"],
                "p50_improvement": result["p50_improvement"],
                "p90_improvement": result["p90_improvement"],
                "union_full_cost_wall_ns": union_cost,
                "candidate_full_cost_wall_ns": candidate_cost,
                "full_cost_ratio": candidate_cost / union_cost,
                "equivalent": equivalent(result),
            })

    integrity = {
        "file_count": len(integrity_records),
        "stable_projection_exact_match_20_of_20": all(record["stable_projection_equal"] for record in integrity_records),
        "all_output_parquet_sha256_exact_match_20_of_20": all(record["parquet_sha256_exact_equal"] for record in integrity_records),
        "records": integrity_records,
    }
    replay1_summary = summarize(replay1_records)
    replay2_summary = summarize(replay2_records)
    aggregate = {
        "assignment_id": "STAGEA-L1-20260811-PARQUET-PAGE-COSEGMENT-RESUME1-V8.7",
        "topic_id": "PARQUET-PAGE-COSEGMENT",
        "frozen_thresholds": {
            "useful_action_rate_min": 0.10,
            "p50_improvement_min": 0.10,
            "p50_file_count_min": 12,
            "p90_not_erased_file_count": 20,
            "size_ratio_max_file_count": {"ratio": 1.05, "files": 20},
            "strict_query_and_full_cost_residual_exists": True,
        },
        "replay1": replay1_summary,
        "replay2": replay2_summary,
        "double_replay_integrity_pass": integrity["stable_projection_exact_match_20_of_20"] and integrity["all_output_parquet_sha256_exact_match_20_of_20"],
        "double_replay_threshold_pass": replay1_summary["threshold_pass"] and replay2_summary["threshold_pass"],
        "scientific_decision": "STOP_NARROW_FROZEN_MECHANISM" if not (replay1_summary["threshold_pass"] and replay2_summary["threshold_pass"]) else "PASS_RECOMMENDED",
        "evidence_ceiling": "STAGEA_SCIENTIFIC_NEGATIVE__NARROW_FROZEN_MECHANISM" if not (replay1_summary["threshold_pass"] and replay2_summary["threshold_pass"]) else "PRELIMINARY_SUPPORT",
        "stageb_authorized": False,
    }
    write_json(output_dir / "replay_integrity.json", integrity)
    write_json(output_dir / "aggregate_results.json", aggregate)
    output_dir.mkdir(parents=True, exist_ok=True)
    with (output_dir / "file_metrics.tsv").open("w", encoding="utf-8", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=list(metric_rows[0]), delimiter="\t", lineterminator="\n")
        writer.writeheader()
        writer.writerows(metric_rows)
    print(json.dumps({
        "integrity_pass": aggregate["double_replay_integrity_pass"],
        "replay1": replay1_summary,
        "replay2": replay2_summary,
        "decision": aggregate["scientific_decision"],
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
