"""Read-only aggregation of already completed revision window ledgers."""

from __future__ import annotations

import argparse
import json
import statistics
from pathlib import Path
from typing import Any


METRICS = (
    "full_end_to_end_wall_ns",
    "planning_wall_ns",
    "planning_cpu_ns",
    "peak_rss_bytes",
    "temporary_bytes",
    "first_batch_decode_wall_ns",
    "total_decode_wall_ns",
    "writer_wall_ns",
    "construction_wall_ns",
    "validation_wall_ns",
)


def windows(path: Path) -> list[dict[str, Any]]:
    return [json.loads(item.read_text(encoding="utf-8")) for item in sorted((path / "windows").glob("*/*.json"))]


def summarize(path: Path) -> dict[str, Any]:
    items = windows(path)
    arm_names = sorted({name for item in items for name in item["arms"]})
    arm_ledger = {}
    for name in arm_names:
        present = [item["arms"][name] for item in items if name in item["arms"]]
        arm_ledger[name] = {
            "windows": len(present),
            "stream_bytes_sum": sum(arm["stream_bytes"] for arm in present),
            "planning_io_read_bytes_sum": sum(arm["planning_io_read_bytes"] for arm in present),
            "planning_io_write_bytes_sum": sum(arm["planning_io_write_bytes"] for arm in present),
            "metric_median_of_window_quantiles": {
                metric: {
                    quantile: statistics.median(arm[metric][quantile] for arm in present)
                    for quantile in ("p50", "p90")
                }
                for metric in METRICS
            },
            "peak_rss_bytes_max_over_window_p90": max(arm["peak_rss_bytes"]["p90"] for arm in present),
            "temporary_bytes_max_over_window_p90": max(arm["temporary_bytes"]["p90"] for arm in present),
            "all_native_equivalent": all(arm["all_native_equivalent"] for arm in present),
            "all_stream_hashes_equal": all(arm["all_stream_hashes_equal"] for arm in present),
        }
    return {
        "windows": len(items),
        "carriers": sorted({item["carrier"] for item in items}),
        "strict_rank_compression_windows": sum(item["strict_rank_compression"] for item in items),
        "useful_rank_compression_windows": sum(item["useful_rank_compression"] for item in items),
        "infinite_rank_ratio_windows": sum(item["rank_ratio"] == float("inf") for item in items),
        "finite_rank_ratios": [item["rank_ratio"] for item in items if item["rank_ratio"] != float("inf")],
        "full_cost_residual_windows": sum(item["full_cost_residual"] for item in items),
        "all_native_equivalent": all(all(arm["all_native_equivalent"] for arm in item["arms"].values()) for item in items),
        "all_stream_hashes_deterministic": all(all(arm["all_stream_hashes_equal"] for arm in item["arms"].values()) for item in items),
        "all_feasible_rp_product_exact": all(item["rp_product_exact_both_delta_arms"] for item in items),
        "arm_ledger": arm_ledger,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--primary", required=True, type=Path)
    parser.add_argument("--replay", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    result = {
        "primary": summarize(args.primary),
        "independent_replay": summarize(args.replay),
        "adult_window_0_resource_observation": {
            "product_upper_states": 15782560,
            "frozen_exact_product_cap": 4096,
            "last_sample_rss_mib": 3553.5,
            "last_sample_private_mib": 4305.1,
            "resource_limit_mib": 4096,
            "terminated_fail_closed": True,
            "adult_results_written": 0,
        },
        "frozen_threshold_bounds": {
            "useful_required": 10,
            "strict_required": 20,
            "observed_useful": 0,
            "observed_strict": 0,
            "unexecuted_windows": 8,
            "max_possible_useful": 8,
            "max_possible_strict": 8,
            "minimum_possible_median_rank_ratio": 2.0,
            "product_sized_killer_irrevocable": True,
            "adult_residual_required": 2,
            "adult_residual_upper_bound": 0,
            "full_cost_aggregate_support_possible": False,
        },
        "decision": "STOP_RECOMMENDED__NARROW_FROZEN_MECHANISM",
        "evidence_ceiling": "STAGEA_SCIENTIFIC_NEGATIVE__CORRECTED_FIDELITY_PASS__PARTIAL_NATURAL_EXECUTION_WITH_IRREVOCABLE_KILLERS",
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8", newline="\n")
    print(json.dumps({
        "decision": result["decision"],
        "primary_windows": result["primary"]["windows"],
        "replay_windows": result["independent_replay"]["windows"],
        "primary_residuals": result["primary"]["full_cost_residual_windows"],
        "replay_residuals": result["independent_replay"]["full_cost_residual_windows"],
        "bounds": result["frozen_threshold_bounds"],
    }, indent=2))


if __name__ == "__main__":
    main()
