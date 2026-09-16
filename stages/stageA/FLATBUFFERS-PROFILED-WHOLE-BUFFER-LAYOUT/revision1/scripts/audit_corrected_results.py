"""Owner-side independent mechanical recomputation of decisive corrected quantities."""

from __future__ import annotations

import csv
import json
import math
from collections import defaultdict
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
rows = list(csv.DictReader((ROOT / "results" / "natural_results.csv").open(encoding="utf-8", newline="")))
summary = json.loads((ROOT / "results" / "summary.json").read_text(encoding="utf-8"))
candidate_name = "fb_rcfdp_bounded"
pareto_metrics = summary["pareto_metrics"]


def pct(values: list[float], q: float) -> float:
    ordered = sorted(values)
    position = (len(ordered) - 1) * q
    lo, hi = math.floor(position), math.ceil(position)
    if lo == hi:
        return ordered[lo]
    return ordered[lo] * (hi - position) + ordered[hi] * (position - lo)


def dom(a: dict, b: dict) -> bool:
    av = [float(a[key]) for key in pareto_metrics]
    bv = [float(b[key]) for key in pareto_metrics]
    return all(x <= y for x, y in zip(av, bv)) and any(x < y for x, y in zip(av, bv))


by_model: dict[str, list[dict]] = defaultdict(list)
for row in rows:
    by_model[row["model"]].append(row)
if len(rows) != 192 or len(by_model) != 24 or any(len(group) != 8 for group in by_model.values()):
    raise RuntimeError("cardinality mismatch")
if any(row[key] != "1" for row in rows for key in ["eligible", "verify", "equality", "identifier", "alignment"]):
    raise RuntimeError("same-object mismatch")

candidate_rows = [row for row in rows if row["arm"] == candidate_name]
numerator = sum(int(float(row["useful_residual_actions"])) for row in candidate_rows)
denominator = sum(int(float(row["candidate_plan_transitions"])) for row in candidate_rows)

paired = {name: [] for name in ["bytes", "trace_warm", "trace_cold"]}
metric_map = {
    "bytes": "bytes",
    "trace_warm": "reader_trace_warm_ns",
    "trace_cold": "reader_trace_cold_ns",
}
for model, group in by_model.items():
    candidate = next(row for row in group if row["arm"] == candidate_name)
    if candidate["split"] != "heldout":
        continue
    union = [row for row in group if row["arm"] != candidate_name]
    for name, metric in metric_map.items():
        best = min(float(row[metric]) for row in union)
        paired[name].append(100.0 * (float(candidate[metric]) - best) / best)

aggregate_frontiers = {}
heldout = [row for row in rows if row["split"] == "heldout"]
for label, q in [("p50", 0.5), ("p90", 0.9)]:
    points = []
    for arm in sorted({row["arm"] for row in heldout}):
        arm_rows = [row for row in heldout if row["arm"] == arm]
        point = {"arm": arm}
        for metric in pareto_metrics:
            point[metric] = pct([float(row[metric]) for row in arm_rows], q)
        points.append(point)
    aggregate_frontiers[label] = sorted(
        point["arm"]
        for point in points
        if not any(other["arm"] != point["arm"] and dom(other, point) for other in points)
    )

audit = {
    "pass": True,
    "rows": len(rows),
    "models": len(by_model),
    "eligible": sum(int(row["eligible"]) for row in rows),
    "useful_numerator": numerator,
    "useful_denominator": denominator,
    "useful_fraction": numerator / denominator,
    "heldout_paired": {
        name: {"p50": pct(values, 0.5), "p90": pct(values, 0.9)} for name, values in paired.items()
    },
    "heldout_frontier_p50": aggregate_frontiers["p50"],
    "heldout_frontier_p90": aggregate_frontiers["p90"],
}

assert audit["useful_numerator"] == summary["useful_residual_action"]["numerator"]
assert audit["useful_denominator"] == summary["useful_residual_action"]["denominator"]
for name in paired:
    for quantile in ["p50", "p90"]:
        expected = summary["splits"]["heldout"][f"{name}_delta_pct"][quantile]
        assert abs(audit["heldout_paired"][name][quantile] - expected) < 1e-12
assert audit["heldout_frontier_p50"] == summary["aggregate_heldout_executable_frontiers"]["p50"]["frontier_arms"]
assert audit["heldout_frontier_p90"] == summary["aggregate_heldout_executable_frontiers"]["p90"]["frontier_arms"]

(ROOT / "results" / "recomputation.json").write_text(json.dumps(audit, indent=2) + "\n", encoding="utf-8")
print(json.dumps(audit))
