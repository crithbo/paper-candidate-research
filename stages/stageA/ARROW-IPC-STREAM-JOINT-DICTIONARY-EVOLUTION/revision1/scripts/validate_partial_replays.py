"""Validate non-volatile fields across the two independent corrected NYC runs.

Both runs completed the same frozen 32 NYC windows before the first Adult
window hit the resource/cap boundary.  Timing quantiles and Pareto outcomes are
reported separately; structural projections must replay byte-for-byte.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any

from preclaim import sha256_bytes


def load_windows(root: Path) -> list[tuple[str, dict[str, Any]]]:
    result = []
    for path in sorted((root / "windows").glob("*/*.json")):
        result.append((path.relative_to(root).as_posix(), json.loads(path.read_text(encoding="utf-8"))))
    return result


def arm_projection(arm: dict[str, Any]) -> dict[str, Any]:
    keys = (
        "all_native_equivalent",
        "all_stream_hashes_equal",
        "stream_bytes",
        "stream_sha256",
        "fallback_or_failure",
        "grid_trials",
        "cut_pool",
        "exact_product_stream_equal",
        "rank",
        "static_frontier",
    )
    return {key: arm[key] for key in keys if key in arm}


def structural_projection(window: dict[str, Any]) -> dict[str, Any]:
    return {
        "carrier": window["carrier"],
        "window_index": window["window_index"],
        "offset": window["offset"],
        "rows": window["rows"],
        "field_universes": window["field_universes"],
        "product_upper_states": window["product_upper_states"],
        "product_feasible": window["product_feasible"],
        "rp_product_exact_both_delta_arms": window["rp_product_exact_both_delta_arms"],
        "rank_ratio": window["rank_ratio"],
        "strict_rank_compression": window["strict_rank_compression"],
        "useful_rank_compression": window["useful_rank_compression"],
        "arms": {key: arm_projection(value) for key, value in sorted(window["arms"].items())},
    }


def run_summary(items: list[tuple[str, dict[str, Any]]]) -> dict[str, Any]:
    windows = [window for _path, window in items]
    return {
        "windows": len(windows),
        "strict_rank_compression_windows": sum(window["strict_rank_compression"] for window in windows),
        "useful_rank_compression_windows": sum(window["useful_rank_compression"] for window in windows),
        "finite_rank_ratios": [window["rank_ratio"] for window in windows if window["rank_ratio"] != float("inf")],
        "infinite_rank_ratio_windows": sum(window["rank_ratio"] == float("inf") for window in windows),
        "full_cost_residual_windows": sum(window["full_cost_residual"] for window in windows),
        "all_native_equivalent": all(all(arm["all_native_equivalent"] for arm in window["arms"].values()) for window in windows),
        "all_deterministic_streams": all(all(arm["all_stream_hashes_equal"] for arm in window["arms"].values()) for window in windows),
        "all_rp_product_exact": all(window["rp_product_exact_both_delta_arms"] for window in windows),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--primary", required=True, type=Path)
    parser.add_argument("--replay", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    primary = load_windows(args.primary)
    replay = load_windows(args.replay)
    if [path for path, _ in primary] != [path for path, _ in replay]:
        raise AssertionError("window path sets differ")
    comparisons = []
    for (path, left), (_same_path, right) in zip(primary, replay):
        left_projection = structural_projection(left)
        right_projection = structural_projection(right)
        left_bytes = json.dumps(left_projection, allow_nan=True, separators=(",", ":"), sort_keys=True).encode("utf-8")
        right_bytes = json.dumps(right_projection, allow_nan=True, separators=(",", ":"), sort_keys=True).encode("utf-8")
        comparisons.append({
            "path": path,
            "exact_nonvolatile_match": left_bytes == right_bytes,
            "primary_projection_sha256": sha256_bytes(left_bytes),
            "replay_projection_sha256": sha256_bytes(right_bytes),
        })
    primary_summary = run_summary(primary)
    replay_summary = run_summary(replay)
    observed = primary_summary["windows"]
    remaining = 40 - observed
    result = {
        "comparison_scope": "two independent corrected executions of all 32 frozen NYC windows",
        "timing_and_pareto_residuals_excluded_from_exact_projection": True,
        "comparisons": comparisons,
        "all_nonvolatile_fields_match": all(item["exact_nonvolatile_match"] for item in comparisons),
        "primary": primary_summary,
        "replay": replay_summary,
        "irrevocable_40_window_bounds": {
            "observed_windows": observed,
            "unexecuted_adult_windows": remaining,
            "max_possible_useful_windows": primary_summary["useful_rank_compression_windows"] + remaining,
            "max_possible_strict_windows": primary_summary["strict_rank_compression_windows"] + remaining,
            "minimum_possible_median_rank_ratio": 2.0 if observed >= 21 else None,
            "rank_success_threshold_10_useful_20_strict_possible": primary_summary["useful_rank_compression_windows"] + remaining >= 10 and primary_summary["strict_rank_compression_windows"] + remaining >= 20,
            "product_sized_killer_median_ge_1_irrevocable": observed >= 21,
            "adult_residual_upper_bound_under_frozen_above_cap_disposition": 0,
            "adult_at_least_2_residual_threshold_possible": False,
        },
    }
    result["pass"] = result["all_nonvolatile_fields_match"] and observed == 32
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8", newline="\n")
    print(json.dumps({
        "pass": result["pass"],
        "all_nonvolatile_fields_match": result["all_nonvolatile_fields_match"],
        "primary": primary_summary,
        "replay": replay_summary,
        "bounds": result["irrevocable_40_window_bounds"],
    }, indent=2))
    if not result["pass"]:
        raise SystemExit(1)


if __name__ == "__main__":
    main()
