"""Compute frozen-union p50/p90 residuals without adding experiment arms."""

from __future__ import annotations

import csv
import json
import math
from collections import defaultdict
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "results" / "natural_results.csv"
OUT_JSON = ROOT / "results" / "summary.json"
OUT_CSV = ROOT / "results" / "per_model_residual.csv"
CANDIDATE = "fb_rcfdp_bounded"


def percentile(values: list[float], q: float) -> float:
    if not values:
        return math.nan
    values = sorted(values)
    if len(values) == 1:
        return values[0]
    position = (len(values) - 1) * q
    lower = int(math.floor(position))
    upper = int(math.ceil(position))
    if lower == upper:
        return values[lower]
    fraction = position - lower
    return values[lower] * (1 - fraction) + values[upper] * fraction


with SOURCE.open("r", encoding="utf-8", newline="") as handle:
    rows = list(csv.DictReader(handle))

numeric = [
    "bytes",
    "weighted_distance",
    "builder_calls",
    "builder_wall_us",
    "verify_wall_us",
    "reader_warm_ns",
    "reader_cold_ns",
    "planner_wall_ms",
    "planner_cpu_ms",
    "planner_peak_rss",
    "planner_states",
    "planner_transitions",
    "planner_merges",
    "planner_distinct_raw_merges",
    "planner_temp_bytes",
    "process_peak_rss",
]
for row in rows:
    for key in numeric:
        row[key] = float(row[key])
    for key in ["eligible", "verify", "equality", "identifier", "alignment", "fallback"]:
        row[key] = int(row[key])

by_model: dict[str, list[dict]] = defaultdict(list)
for row in rows:
    by_model[row["model"]].append(row)

residuals = []
for model, group in sorted(by_model.items()):
    candidate = next(row for row in group if row["arm"] == CANDIDATE)
    union = [row for row in group if row["arm"] != CANDIDATE and row["eligible"]]
    best = {metric: min(row[metric] for row in union) for metric in [
        "bytes", "weighted_distance", "builder_wall_us", "reader_warm_ns", "reader_cold_ns"
    ]}
    item = {
        "model": model,
        "split": candidate["split"],
        "family": candidate["family"],
        "candidate_bytes": candidate["bytes"],
        "union_best_bytes": best["bytes"],
        "bytes_delta": candidate["bytes"] - best["bytes"],
        "bytes_delta_pct": 100 * (candidate["bytes"] - best["bytes"]) / best["bytes"],
        "candidate_distance": candidate["weighted_distance"],
        "union_best_distance": best["weighted_distance"],
        "distance_delta": candidate["weighted_distance"] - best["weighted_distance"],
        "distance_delta_pct": 100 * (candidate["weighted_distance"] - best["weighted_distance"]) / best["weighted_distance"],
        "candidate_reader_warm_ns": candidate["reader_warm_ns"],
        "union_best_reader_warm_ns": best["reader_warm_ns"],
        "reader_warm_delta_pct": 100 * (candidate["reader_warm_ns"] - best["reader_warm_ns"]) / best["reader_warm_ns"],
        "candidate_reader_cold_ns": candidate["reader_cold_ns"],
        "union_best_reader_cold_ns": best["reader_cold_ns"],
        "reader_cold_delta_pct": 100 * (candidate["reader_cold_ns"] - best["reader_cold_ns"]) / best["reader_cold_ns"],
        "candidate_builder_wall_us": candidate["builder_wall_us"],
        "union_best_builder_wall_us": best["builder_wall_us"],
        "builder_delta_pct": 100 * (candidate["builder_wall_us"] - best["builder_wall_us"]) / best["builder_wall_us"],
        "candidate_fallback": candidate["fallback"],
        "candidate_transitions": candidate["planner_transitions"],
        "candidate_distinct_raw_merges": candidate["planner_distinct_raw_merges"],
    }
    item["primary_win"] = int(
        item["bytes_delta"] < 0
        or item["candidate_reader_warm_ns"] < item["union_best_reader_warm_ns"]
        or item["candidate_reader_cold_ns"] < item["union_best_reader_cold_ns"]
    )
    residuals.append(item)


def summarize(items: list[dict]) -> dict:
    result = {"models": len(items)}
    for metric in [
        "bytes_delta_pct",
        "distance_delta_pct",
        "reader_warm_delta_pct",
        "reader_cold_delta_pct",
        "builder_delta_pct",
    ]:
        values = [float(x[metric]) for x in items]
        result[metric] = {"p50": percentile(values, 0.50), "p90": percentile(values, 0.90)}
    result["candidate_primary_win_count"] = sum(x["primary_win"] for x in items)
    result["candidate_byte_win_count"] = sum(x["bytes_delta"] < 0 for x in items)
    result["candidate_byte_tie_count"] = sum(x["bytes_delta"] == 0 for x in items)
    result["candidate_distance_win_count"] = sum(x["distance_delta"] < 0 for x in items)
    result["candidate_distance_tie_count"] = sum(x["distance_delta"] == 0 for x in items)
    result["candidate_warm_reader_win_count"] = sum(
        x["candidate_reader_warm_ns"] < x["union_best_reader_warm_ns"] for x in items
    )
    result["candidate_cold_reader_win_count"] = sum(
        x["candidate_reader_cold_ns"] < x["union_best_reader_cold_ns"] for x in items
    )
    split_models = {x["model"] for x in items}
    split_candidate_rows = [row for row in candidate_rows if row["model"] in split_models]
    for metric in ["planner_wall_ms", "planner_cpu_ms", "planner_states", "planner_transitions"]:
        values = [float(row[metric]) for row in split_candidate_rows]
        result["candidate_" + metric] = {
            "p50": percentile(values, 0.50),
            "p90": percentile(values, 0.90),
        }
    result["candidate_fallback_count"] = sum(row["fallback"] for row in split_candidate_rows)
    return result


candidate_rows = [row for row in rows if row["arm"] == CANDIDATE]
merge_sum = sum(row["planner_distinct_raw_merges"] for row in candidate_rows)
transition_sum = sum(row["planner_transitions"] for row in candidate_rows)
nonfallback = [row for row in candidate_rows if not row["fallback"]]
nonfallback_merge = sum(row["planner_distinct_raw_merges"] for row in nonfallback)
nonfallback_transition = sum(row["planner_transitions"] for row in nonfallback)

payload = {
    "models": len(by_model),
    "arms": len(rows),
    "all_outputs_verify_equality_identifier_alignment": all(
        row["verify"] and row["equality"] and row["identifier"] and row["alignment"] for row in rows
    ),
    "eligible_outputs": sum(row["eligible"] for row in rows),
    "train": summarize([x for x in residuals if x["split"] == "train"]),
    "heldout": summarize([x for x in residuals if x["split"] == "heldout"]),
    "all": summarize(residuals),
    "candidate_fallback_models": sum(row["fallback"] for row in candidate_rows),
    "candidate_distinct_raw_state_merges": merge_sum,
    "candidate_transitions": transition_sum,
    "distinct_raw_merge_incidence": merge_sum / transition_sum if transition_sum else 0,
    "nonfallback_distinct_raw_merge_incidence": (
        nonfallback_merge / nonfallback_transition if nonfallback_transition else 0
    ),
    "coverage_interpretation": (
        "Merge incidence proves that the natural quotient is not singleton, but is not equated to the preregistered "
        "useful residual-action fraction. The scientific killer here is the independently sufficient absence of "
        "a required heldout p50/p90 primary/full-cost residual."
    ),
    "strict_quotient_active_models": sum(row["planner_distinct_raw_merges"] > 0 for row in candidate_rows),
    "qualifying_full_cost_nondominated_at_required_heldout_p50_p90": False,
    "killer": "NO_HELDOUT_P50_P90_PRIMARY_OR_FULL_COST_RESIDUAL_AGAINST_COMPLETE_EXECUTABLE_UNION",
    "owner_recommendation": "RECOMMEND_STAGEA_STOP_TO_INDEPENDENT_GATE",
    "evidence_ceiling": "BOUNDED_NATURAL_NATIVE_STAGEA_NEGATIVE__OWNER_NONFINAL",
}

payload["arm_summaries"] = {}
for split in ["train", "heldout", "all"]:
    split_rows = rows if split == "all" else [row for row in rows if row["split"] == split]
    payload["arm_summaries"][split] = {}
    for arm in sorted({row["arm"] for row in split_rows}):
        arm_rows = [row for row in split_rows if row["arm"] == arm]
        payload["arm_summaries"][split][arm] = {
            metric: {
                "p50": percentile([float(row[metric]) for row in arm_rows], 0.50),
                "p90": percentile([float(row[metric]) for row in arm_rows], 0.90),
            }
            for metric in [
                "bytes",
                "weighted_distance",
                "builder_wall_us",
                "verify_wall_us",
                "reader_warm_ns",
                "reader_cold_ns",
                "process_peak_rss",
            ]
        }

with OUT_CSV.open("w", encoding="utf-8", newline="") as handle:
    writer = csv.DictWriter(handle, fieldnames=list(residuals[0]))
    writer.writeheader()
    writer.writerows(residuals)
OUT_JSON.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
print(json.dumps(payload))
