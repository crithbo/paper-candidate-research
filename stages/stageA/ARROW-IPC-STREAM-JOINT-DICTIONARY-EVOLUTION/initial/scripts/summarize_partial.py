"""Summarize immutable completed windows after the fail-closed natural run."""

from __future__ import annotations

import argparse
import json
import math
import statistics
from pathlib import Path

from preclaim import sha256


def finite_or_none(value: float) -> float | None:
    return value if math.isfinite(value) else None


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--run-root", required=True, type=Path)
    args = parser.parse_args()
    run_root = args.run_root.resolve()
    paths = sorted((run_root / "windows").rglob("window_*.json"))
    windows = [json.loads(path.read_text(encoding="utf-8")) for path in paths]
    diagnostic_path = run_root / "DIAGNOSTIC_WINDOW_11.json"
    diagnostic = json.loads(diagnostic_path.read_text(encoding="utf-8"))
    arm_names = sorted(windows[0]["arms"]) if windows else []
    dimensions = [
        "full_end_to_end_wall_ns",
        "peak_rss_bytes",
        "temporary_bytes",
        "first_batch_decode_wall_ns",
        "total_decode_wall_ns",
    ]
    arms = {}
    for arm in arm_names:
        item = {
            "stream_bytes_sum": sum(window["arms"][arm]["stream_bytes"] for window in windows),
            "stream_bytes_median": statistics.median(window["arms"][arm]["stream_bytes"] for window in windows),
            "planning_wall_ns_p50_sum": sum(window["arms"][arm]["planning_wall_ns"]["p50"] for window in windows),
            "planning_wall_ns_p90_sum": sum(window["arms"][arm]["planning_wall_ns"]["p90"] for window in windows),
            "all_native_equivalent": all(window["arms"][arm]["all_native_equivalent"] for window in windows),
            "all_stream_hashes_equal": all(window["arms"][arm]["all_stream_hashes_equal"] for window in windows),
        }
        for dimension in dimensions:
            item[f"{dimension}_p50_sum"] = sum(window["arms"][arm][dimension]["p50"] for window in windows)
            item[f"{dimension}_p90_sum"] = sum(window["arms"][arm][dimension]["p90"] for window in windows)
        arms[arm] = item
    result = {
        "status": "PARTIAL_FAIL_CLOSED__NOT_A_THRESHOLD_ESTIMATE",
        "completed_windows": len(windows),
        "planned_windows": 40,
        "completed_carriers": sorted({window["carrier"] for window in windows}),
        "completed_window_files": [
            {"path": str(path.relative_to(run_root)).replace("\\", "/"), "sha256": sha256(path)} for path in paths
        ],
        "all_completed_native_equivalent": all(all(arm["all_native_equivalent"] for arm in window["arms"].values()) for window in windows),
        "all_completed_streams_deterministic": all(all(arm["all_stream_hashes_equal"] for arm in window["arms"].values()) for window in windows),
        "completed_rp_product_exact_both_arms": sum(window["rp_product_exact_both_delta_arms"] for window in windows),
        "completed_strict_rank_compression": sum(window["strict_rank_compression"] for window in windows),
        "completed_useful_rank_compression": sum(window["useful_rank_compression"] for window in windows),
        "completed_full_cost_residual": sum(window["full_cost_residual"] for window in windows),
        "completed_rank_ratios": [finite_or_none(window["rank_ratio"]) for window in windows],
        "threshold_inference_allowed": False,
        "failure": {
            "carrier": diagnostic["carrier"],
            "window_index": diagnostic["window_index"],
            "offset": diagnostic["offset"],
            "delta_arm": diagnostic["emit_dictionary_deltas"],
            "first_mismatch_boundary": diagnostic["first_mismatch_boundary"],
            "difference_boundaries": [item["boundary"] for item in diagnostic["differences"]],
            "all_mismatched_cost_frontiers_equal": diagnostic["all_cost_frontiers_equal"],
            "final_static_cost_equal": diagnostic["final_product_plan"]["static_cost"] == diagnostic["final_rp_plan"]["static_cost"],
            "final_signature_equal": diagnostic["final_product_plan"]["signature"] == diagnostic["final_rp_plan"]["signature"],
            "diagnostic_sha256": sha256(diagnostic_path),
        },
        "arms_completed_windows_only": arms,
        "decision": "REVISE_ONCE",
        "evidence_ceiling": "IMPLEMENTATION_FIDELITY_FAILURE__NO_NATURAL_SUPPORT_OR_STOP_INFERENCE",
    }
    target = run_root / "PARTIAL_SUMMARY.json"
    target.write_text(json.dumps(result, indent=2, sort_keys=True, allow_nan=False) + "\n", encoding="utf-8", newline="\n")
    print(json.dumps({
        "completed_windows": result["completed_windows"],
        "strict": result["completed_strict_rank_compression"],
        "useful": result["completed_useful_rank_compression"],
        "residual": result["completed_full_cost_residual"],
        "decision": result["decision"],
        "output_sha256": sha256(target),
    }, indent=2))


if __name__ == "__main__":
    main()
