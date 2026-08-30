"""Derive paired residuals and whole-executable-arm Pareto frontiers mechanically."""

from __future__ import annotations

import csv
import json
import math
from collections import defaultdict
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "results" / "natural_results.csv"
OUT_JSON = ROOT / "results" / "summary.json"
OUT_RESIDUAL = ROOT / "results" / "per_model_residual.csv"
OUT_FRONTIER = ROOT / "results" / "per_model_frontier.csv"
CANDIDATE = "fb_rcfdp_bounded"
ARMS = [
    "generated_pack_default",
    "stable_legal_topo",
    "stable_dedup_off",
    "stable_size_matched_capacity",
    "hot_first_ready",
    "local_field_order",
    "generic_bounded_beam",
    CANDIDATE,
]
PRIMARY = ["bytes", "reader_trace_warm_ns", "reader_trace_cold_ns"]
PARETO = [
    "bytes",
    "reader_trace_warm_ns",
    "reader_trace_cold_ns",
    "end_to_end_construction_wall_us",
    "end_to_end_construction_cpu_us",
    "reader_trace_warm_cpu_ns",
    "reader_trace_cold_cpu_ns",
    "process_peak_rss",
    "total_temp_bytes",
    "fallback",
]
NUMERIC = [
    "bytes",
    "weighted_distance",
    "builder_calls",
    "builder_wall_us",
    "builder_cpu_us",
    "builder_capacity_bytes",
    "builder_scratch_bytes",
    "builder_reallocated",
    "verify_wall_us",
    "verify_cpu_us",
    "equivalence_wall_us",
    "equivalence_cpu_us",
    "reader_generic_warm_ns",
    "reader_generic_cold_ns",
    "reader_trace_warm_ns",
    "reader_trace_warm_cpu_ns",
    "reader_trace_cold_ns",
    "reader_trace_cold_cpu_ns",
    "graph_extraction_wall_us",
    "graph_extraction_cpu_us",
    "planner_wall_ms",
    "planner_cpu_ms",
    "planner_peak_rss",
    "planner_states",
    "planner_transitions",
    "planner_merges",
    "planner_distinct_raw_merges",
    "planner_temp_bytes",
    "useful_residual_actions",
    "candidate_plan_transitions",
    "fallback",
    "process_peak_rss",
    "total_temp_bytes",
    "end_to_end_construction_wall_us",
    "end_to_end_construction_cpu_us",
]
FLAGS = ["eligible", "verify", "equality", "identifier", "alignment"]


def percentile(values: list[float], q: float) -> float:
    if not values:
        return math.nan
    ordered = sorted(values)
    if len(ordered) == 1:
        return ordered[0]
    position = (len(ordered) - 1) * q
    lower = int(math.floor(position))
    upper = int(math.ceil(position))
    if lower == upper:
        return ordered[lower]
    fraction = position - lower
    return ordered[lower] * (1.0 - fraction) + ordered[upper] * fraction


def dominates(left: dict[str, float], right: dict[str, float], metrics: list[str]) -> bool:
    return all(left[m] <= right[m] for m in metrics) and any(left[m] < right[m] for m in metrics)


def frontier(points: list[dict[str, float]], metrics: list[str]) -> list[str]:
    return sorted(
        point["arm"]
        for point in points
        if not any(other["arm"] != point["arm"] and dominates(other, point, metrics) for other in points)
    )


with SOURCE.open("r", encoding="utf-8", newline="") as handle:
    rows: list[dict] = list(csv.DictReader(handle))

for row in rows:
    for key in NUMERIC:
        row[key] = float(row[key])
    for key in FLAGS:
        row[key] = int(row[key])

by_model: dict[str, list[dict]] = defaultdict(list)
for row in rows:
    by_model[row["model"]].append(row)

if len(rows) != 192 or len(by_model) != 24:
    raise RuntimeError(f"frozen cardinality mismatch rows={len(rows)} models={len(by_model)}")
for model, group in by_model.items():
    if sorted(row["arm"] for row in group) != sorted(ARMS):
        raise RuntimeError(f"arm mismatch for {model}")

all_same_object = all(all(row[key] for key in FLAGS) for row in rows)
if not all_same_object:
    raise RuntimeError("same-object eligibility failure in corrected result")

residuals: list[dict] = []
frontier_rows: list[dict] = []
for model, group in sorted(by_model.items()):
    candidate = next(row for row in group if row["arm"] == CANDIDATE)
    union = [row for row in group if row["arm"] != CANDIDATE and row["eligible"]]
    model_frontier = frontier(group, PARETO)
    dominators = [row["arm"] for row in union if dominates(row, candidate, PARETO)]
    item = {
        "model": model,
        "split": candidate["split"],
        "family": candidate["family"],
        "candidate_on_full_cost_frontier": int(CANDIDATE in model_frontier),
        "candidate_full_cost_dominators": ";".join(sorted(dominators)),
        "frontier_arms": ";".join(model_frontier),
        "candidate_fallback": int(candidate["fallback"]),
        "candidate_useful_residual_actions": int(candidate["useful_residual_actions"]),
        "candidate_plan_transitions": int(candidate["candidate_plan_transitions"]),
    }
    for metric in PRIMARY:
        best = min(row[metric] for row in union)
        value = candidate[metric]
        prefix = {
            "bytes": "bytes",
            "reader_trace_warm_ns": "trace_warm",
            "reader_trace_cold_ns": "trace_cold",
        }[metric]
        item[f"candidate_{prefix}"] = value
        item[f"union_best_{prefix}"] = best
        item[f"{prefix}_delta"] = value - best
        item[f"{prefix}_delta_pct"] = 100.0 * (value - best) / best
    residuals.append(item)
    for row in group:
        frontier_rows.append(
            {
                "model": model,
                "split": row["split"],
                "family": row["family"],
                "arm": row["arm"],
                "on_frontier": int(row["arm"] in model_frontier),
                "dominates_candidate": int(row["arm"] in dominators),
            }
        )


def paired_summary(items: list[dict]) -> dict:
    output: dict = {"models": len(items)}
    for prefix in ["bytes", "trace_warm", "trace_cold"]:
        values = [float(item[f"{prefix}_delta_pct"]) for item in items]
        output[f"{prefix}_delta_pct"] = {
            "p50": percentile(values, 0.50),
            "p90": percentile(values, 0.90),
        }
    output["candidate_frontier_models"] = sum(item["candidate_on_full_cost_frontier"] for item in items)
    output["candidate_fallback_models"] = sum(item["candidate_fallback"] for item in items)
    return output


def aggregate_arm_vectors(split_rows: list[dict], q: float) -> list[dict]:
    points = []
    for arm in ARMS:
        arm_rows = [row for row in split_rows if row["arm"] == arm]
        point: dict[str, float | str] = {"arm": arm}
        for metric in PARETO:
            point[metric] = percentile([float(row[metric]) for row in arm_rows], q)
        points.append(point)
    return points


heldout_rows = [row for row in rows if row["split"] == "heldout"]
aggregate_frontiers = {}
for name, q in [("p50", 0.50), ("p90", 0.90)]:
    points = aggregate_arm_vectors(heldout_rows, q)
    aggregate_frontiers[name] = {
        "vectors": points,
        "frontier_arms": frontier(points, PARETO),
    }

candidate_rows = [row for row in rows if row["arm"] == CANDIDATE]
useful_numerator = sum(int(row["useful_residual_actions"]) for row in candidate_rows)
useful_denominator = sum(int(row["candidate_plan_transitions"]) for row in candidate_rows)
useful_fraction = useful_numerator / useful_denominator if useful_denominator else 0.0
candidate_distinct_raw_merges = sum(int(row["planner_distinct_raw_merges"]) for row in candidate_rows)
candidate_expanded_transitions = sum(int(row["planner_transitions"]) for row in candidate_rows)
strict_merge_models = sum(int(row["planner_distinct_raw_merges"] > 0) for row in candidate_rows)
plan_equality_by_arm = {}
for arm in ARMS[:-1]:
    equal = 0
    for model, group in by_model.items():
        candidate = next(row for row in group if row["arm"] == CANDIDATE)
        comparator = next(row for row in group if row["arm"] == arm)
        equal += int(candidate["plan_fnv64"] == comparator["plan_fnv64"])
    plan_equality_by_arm[arm] = equal

split_payload = {
    "train": paired_summary([item for item in residuals if item["split"] == "train"]),
    "heldout": paired_summary([item for item in residuals if item["split"] == "heldout"]),
    "all": paired_summary(residuals),
}
heldout = split_payload["heldout"]
primary_residual_metrics = [
    prefix
    for prefix in ["bytes", "trace_warm", "trace_cold"]
    if heldout[f"{prefix}_delta_pct"]["p50"] < 0.0 and heldout[f"{prefix}_delta_pct"]["p90"] < 0.0
]
candidate_p50_frontier = CANDIDATE in aggregate_frontiers["p50"]["frontier_arms"]
candidate_p90_frontier = CANDIDATE in aggregate_frontiers["p90"]["frontier_arms"]
qualifies = bool(
    all_same_object
    and useful_fraction >= 0.10
    and primary_residual_metrics
    and candidate_p50_frontier
    and candidate_p90_frontier
)

killers = []
if useful_fraction < 0.10:
    killers.append("USEFUL_RESIDUAL_ACTION_FRACTION_BELOW_10_PERCENT")
if not primary_residual_metrics:
    killers.append("NO_HELDOUT_P50_AND_P90_RAW_BYTE_OR_PROFILE_TRACE_ACCESS_RESIDUAL")
if not candidate_p50_frontier or not candidate_p90_frontier:
    killers.append("CANDIDATE_ABSENT_FROM_HELDOUT_P50_OR_P90_WHOLE_EXECUTABLE_ARM_FULL_COST_FRONTIER")

payload = {
    "schema_version": "corrected-trace-profiled-stagea-summary-v1",
    "models": len(by_model),
    "arms": len(rows),
    "eligible_outputs": sum(row["eligible"] for row in rows),
    "all_outputs_same_object": all_same_object,
    "splits": split_payload,
    "useful_residual_action": {
        "numerator": useful_numerator,
        "denominator": useful_denominator,
        "fraction": useful_fraction,
        "threshold": 0.10,
        "pass": useful_fraction >= 0.10,
        "train": {
            "numerator": sum(int(row["useful_residual_actions"]) for row in candidate_rows if row["split"] == "train"),
            "denominator": sum(int(row["candidate_plan_transitions"]) for row in candidate_rows if row["split"] == "train"),
        },
        "heldout": {
            "numerator": sum(int(row["useful_residual_actions"]) for row in candidate_rows if row["split"] == "heldout"),
            "denominator": sum(int(row["candidate_plan_transitions"]) for row in candidate_rows if row["split"] == "heldout"),
        },
    },
    "mechanism": {
        "candidate_expanded_transitions": candidate_expanded_transitions,
        "candidate_distinct_raw_merges": candidate_distinct_raw_merges,
        "strict_merge_models": strict_merge_models,
        "plan_equality_models_by_comparator_arm": plan_equality_by_arm,
    },
    "aggregate_heldout_executable_frontiers": aggregate_frontiers,
    "candidate_on_heldout_p50_frontier": candidate_p50_frontier,
    "candidate_on_heldout_p90_frontier": candidate_p90_frontier,
    "heldout_primary_residual_metrics_at_both_p50_p90": primary_residual_metrics,
    "qualifying_full_cost_nondominated_at_required_heldout_p50_p90": qualifies,
    "killers": killers,
    "owner_recommendation": "PASS_RECOMMENDED" if qualifies else "STOP_RECOMMENDED__OWNER_NONFINAL",
    "quality_tier": "TIER_B_Q2_VIABLE" if qualifies else "BELOW_Q2_STOP",
    "evidence_ceiling": (
        "PRELIMINARY_SUPPORT__NOT_FALSIFIED" if qualifies
        else "CORRECTED_TRACE_PROFILED_SAME_OBJECT_24_MODEL_STAGEA_NEGATIVE__OWNER_NONFINAL"
    ),
    "pareto_metrics": PARETO,
    "pareto_semantics": "whole executable arm vectors only; coordinate-wise union used solely for paired scalar primary residuals",
    "arm_summaries": {},
}

for split in ["train", "heldout", "all"]:
    split_rows = rows if split == "all" else [row for row in rows if row["split"] == split]
    payload["arm_summaries"][split] = {}
    for arm in ARMS:
        arm_rows = [row for row in split_rows if row["arm"] == arm]
        payload["arm_summaries"][split][arm] = {
            metric: {
                "p50": percentile([float(row[metric]) for row in arm_rows], 0.50),
                "p90": percentile([float(row[metric]) for row in arm_rows], 0.90),
            }
            for metric in PARETO
        }

with OUT_RESIDUAL.open("w", encoding="utf-8", newline="") as handle:
    writer = csv.DictWriter(handle, fieldnames=list(residuals[0]), lineterminator="\n")
    writer.writeheader()
    writer.writerows(residuals)
with OUT_FRONTIER.open("w", encoding="utf-8", newline="") as handle:
    writer = csv.DictWriter(handle, fieldnames=list(frontier_rows[0]), lineterminator="\n")
    writer.writeheader()
    writer.writerows(frontier_rows)
OUT_JSON.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
print(json.dumps({
    "pass": True,
    "owner_recommendation": payload["owner_recommendation"],
    "useful_residual_fraction": useful_fraction,
    "primary_residual_metrics": primary_residual_metrics,
    "candidate_p50_frontier": candidate_p50_frontier,
    "candidate_p90_frontier": candidate_p90_frontier,
    "killers": killers,
}))
