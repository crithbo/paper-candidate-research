#!/usr/bin/env python3
"""Deterministic Stage A analytical counterexample search.

The model deliberately reports normalized cost units, never elapsed time.  It
tests whether region heterogeneity can make a mixed lifecycle plan cheaper than
every single uniform B0-B3 policy after planner cost.  B4 is the unattainable
per-region union oracle and is always retained as a ceiling.
"""

from __future__ import annotations

import argparse
import csv
import hashlib
import itertools
import json
from collections import Counter
from pathlib import Path


ACTIONS = ("B0_SYSTEM", "B1_UVM_DEMAND", "B2_UVM_PREFETCH", "B3_EXPLICIT")


def action_cost(region: dict, p: dict, action: str, delay: float) -> float:
    n = float(region["bytes"])
    passes = float(region["gpu_passes"])
    hot = float(region["hot_fraction"])
    final_cpu = float(region["final_cpu_fraction"])
    round_trips = int(region["cpu_gpu_round_trips"])
    fixed = float(p["fixed_action_overhead_bytes"])

    if action == "B0_SYSTEM":
        remote_passes = min(passes, delay) + max(0.0, passes - delay) * (1.0 - hot)
        migration = n * hot * p["migration_per_byte"] if passes > delay else 0.0
        return (
            n * p["system_alloc_per_byte"]
            + n * remote_passes * p["remote_per_byte"]
            + migration
            + fixed * (1 + round_trips)
        )

    if action == "B1_UVM_DEMAND":
        first_migration = n * p["migration_per_byte"] if region["cpu_initialized"] else 0.0
        cpu_remote = n * final_cpu * p["remote_per_byte"]
        return n * p["managed_alloc_per_byte"] + first_migration + cpu_remote + fixed

    if action == "B2_UVM_PREFETCH":
        to_gpu = n * p["prefetch_per_byte"] if region["cpu_initialized"] else 0.0
        cpu_return = n * final_cpu * min(p["prefetch_per_byte"], p["remote_per_byte"])
        return (
            n * p["managed_alloc_per_byte"]
            + to_gpu
            + cpu_return
            + fixed * (2 + round_trips)
        )

    if action == "B3_EXPLICIT":
        input_copy = 0.0
        if region["cpu_initialized"] and not region["gpu_initializer_legal"]:
            input_copy = n * p["explicit_copy_per_byte"]
        output_copy = n * final_cpu * p["explicit_copy_per_byte"]
        transition_copy = n * round_trips * p["explicit_copy_per_byte"]
        return (
            n * p["device_alloc_per_byte"]
            + input_copy
            + output_copy
            + transition_copy
            + fixed * (1 + round_trips)
        )
    raise ValueError(action)


def parameter_grid(spec: dict):
    keys = list(spec["grid"].keys())
    for values in itertools.product(*(spec["grid"][k] for k in keys)):
        yield dict(zip(keys, values))


def evaluate_program(program: dict, p: dict, delay: float) -> dict:
    region_costs = {
        r["id"]: {a: action_cost(r, p, a, delay) for a in ACTIONS}
        for r in program["regions"]
    }
    uniform = {a: sum(region_costs[r][a] for r in region_costs) for a in ACTIONS}
    best_uniform_action = min(ACTIONS, key=lambda a: (uniform[a], a))
    best_uniform_cost = uniform[best_uniform_action]

    selected = {
        r: min(ACTIONS, key=lambda a: (region_costs[r][a], a)) for r in region_costs
    }
    oracle_cost = sum(region_costs[r][selected[r]] for r in region_costs)
    total_bytes = sum(float(r["bytes"]) for r in program["regions"])
    planner_cost = total_bytes * p["planner_overhead_fraction"]
    candidate_cost = oracle_cost + planner_cost
    residual = (best_uniform_cost - candidate_cost) / max(best_uniform_cost, 1e-12)
    distinct = len(set(selected.values()))
    return {
        "program": program["id"],
        **p,
        "best_uniform_action": best_uniform_action,
        "best_uniform_cost": best_uniform_cost,
        "candidate_cost": candidate_cost,
        "oracle_cost": oracle_cost,
        "planner_cost": planner_cost,
        "residual_vs_uniform": residual,
        "mixed": distinct > 1,
        "distinct_actions": distinct,
        "selected_plan": ";".join(f"{r}:{selected[r]}" for r in sorted(selected)),
        "oracle_gap": (candidate_cost - oracle_cost) / max(oracle_cost, 1e-12),
    }


def summarize(rows: list[dict], program: str) -> dict:
    residuals = [r["residual_vs_uniform"] for r in rows]
    positive = [r for r in rows if r["mixed"] and r["residual_vs_uniform"] > 0.0]
    material = [r for r in rows if r["mixed"] and r["residual_vs_uniform"] >= 0.05]
    absorbed = [r for r in rows if r["residual_vs_uniform"] <= 0.0]
    policies = Counter(r["best_uniform_action"] for r in rows)
    plans = Counter(r["selected_plan"] for r in rows)
    strongest = sorted(rows, key=lambda r: r["residual_vs_uniform"], reverse=True)[:3]
    counter = sorted(rows, key=lambda r: r["residual_vs_uniform"])[:3]
    return {
        "program": program,
        "grid_points": len(rows),
        "mixed_positive_points": len(positive),
        "mixed_positive_fraction": len(positive) / len(rows),
        "material_ge_5pct_points": len(material),
        "material_ge_5pct_fraction": len(material) / len(rows),
        "absorbed_or_overhead_negative_points": len(absorbed),
        "absorbed_or_overhead_negative_fraction": len(absorbed) / len(rows),
        "min_residual": min(residuals),
        "median_residual": sorted(residuals)[len(residuals) // 2],
        "max_residual": max(residuals),
        "best_uniform_policy_counts": dict(sorted(policies.items())),
        "distinct_mixed_plans": sum(
            1
            for plan in plans
            if len({x.split(":", 1)[1] for x in plan.split(";")}) > 1
        ),
        "most_common_plans": plans.most_common(5),
        "strongest_support_examples": strongest,
        "counterexample_examples": counter,
    }


def stable_hash(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest().upper()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--inputs", required=True)
    parser.add_argument("--output", required=True)
    args = parser.parse_args()

    input_path = Path(args.inputs).resolve()
    output = Path(args.output).resolve()
    output.mkdir(parents=True, exist_ok=True)
    spec = json.loads(input_path.read_text(encoding="utf-8"))
    delay = float(spec["system_access_counter_delay_passes"])

    all_rows = []
    summaries = []
    for program in spec["programs"]:
        rows = [evaluate_program(program, p, delay) for p in parameter_grid(spec)]
        all_rows.extend(rows)
        summaries.append(summarize(rows, program["id"]))

    fieldnames = list(all_rows[0].keys())
    csv_path = output / "grid.csv"
    with csv_path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(all_rows)

    both_positive = all(s["mixed_positive_points"] > 0 for s in summaries)
    summary = {
        "schema_version": "coh-rl-stagea-probe-result-v1",
        "contract_id": spec["contract_id"],
        "determinism": "DETERMINISTIC_CARTESIAN_GRID",
        "evidence_class": "ANALYTICAL_TRACE_SOFTWARE_ONLY",
        "program_summaries": summaries,
        "gate": {
            "both_programs_have_positive_mixed_region": both_positive,
            "positive_ceiling": "PRELIMINARY_SUPPORT" if both_positive else "NEGATIVE_KILL",
            "main_claim_established": False,
            "gh200_performance_measured": False,
        },
        "interpretation_guard": (
            "Parameter-grid frequency is not a probability and normalized residual is not a speedup. "
            "B4 is the region-wise union oracle; candidate cost includes planner overhead and cannot "
            "establish hardware performance without a GH200 replay."
        ),
    }
    summary_path = output / "summary.json"
    summary_path.write_text(json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8")

    manifest = {
        "inputs_sha256": stable_hash(input_path),
        "grid_sha256": stable_hash(csv_path),
        "summary_sha256": stable_hash(summary_path),
    }
    (output / "run_manifest.json").write_text(
        json.dumps(manifest, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )


if __name__ == "__main__":
    main()
