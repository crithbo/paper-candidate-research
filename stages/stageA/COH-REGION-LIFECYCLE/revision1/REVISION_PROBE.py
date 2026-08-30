#!/usr/bin/env python3
"""Atomic Stage A revision: same-information selector absorption test.

This script reuses the frozen region structures and action-cost equations but
does not claim that the original coefficient grid is calibrated to GH200.  The
grid is used only to exhaustively check an algebraic identity already valid for
every admissible shared coefficient completion.
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
EPSILON = 1e-15
EXPECTED_INPUT_SHA256 = "0F3549333DFC6529327395019AF1CAE55C8F73E1D0CD12AD16AFE3595089B217"
EXPECTED_DOMAIN_SHA256 = None  # recorded in the run manifest after file freeze


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest().upper()


def action_cost(region: dict, p: dict, action: str, delay: float) -> float:
    """Exact inherited action-cost function from the initial Stage A probe."""
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


def candidate_rule(region_costs: dict[str, dict[str, float]]) -> dict[str, str]:
    return {
        region: min(ACTIONS, key=lambda action: (region_costs[region][action], action))
        for region in region_costs
    }


def simple_selector_rule(region_costs: dict[str, dict[str, float]]) -> dict[str, str]:
    # Independently expressed control: same finite information and deterministic tie break.
    selected: dict[str, str] = {}
    for region, costs in region_costs.items():
        ranked = sorted(((costs[action], action) for action in ACTIONS))
        selected[region] = ranked[0][1]
    return selected


def evaluate(program: dict, p: dict, delay: float) -> dict:
    region_costs = {
        region["id"]: {action: action_cost(region, p, action, delay) for action in ACTIONS}
        for region in program["regions"]
    }
    candidate_plan = candidate_rule(region_costs)
    selector_plan = simple_selector_rule(region_costs)
    action_sum_candidate = sum(region_costs[r][candidate_plan[r]] for r in region_costs)
    action_sum_selector = sum(region_costs[r][selector_plan[r]] for r in region_costs)
    total_bytes = sum(float(region["bytes"]) for region in program["regions"])
    decision_cost = total_bytes * float(p["planner_overhead_fraction"])
    candidate_full_cost = action_sum_candidate + decision_cost
    selector_full_cost = action_sum_selector + decision_cost
    residual = (selector_full_cost - candidate_full_cost) / max(selector_full_cost, 1e-12)
    plans_identical = candidate_plan == selector_plan
    costs_identical = candidate_full_cost == selector_full_cost
    return {
        "program": program["id"],
        **p,
        "candidate_plan": ";".join(f"{r}:{candidate_plan[r]}" for r in sorted(candidate_plan)),
        "selector_plan": ";".join(f"{r}:{selector_plan[r]}" for r in sorted(selector_plan)),
        "plans_identical": plans_identical,
        "candidate_action_cost": action_sum_candidate,
        "selector_action_cost": action_sum_selector,
        "candidate_decision_cost": decision_cost,
        "selector_decision_cost": decision_cost,
        "candidate_full_cost": candidate_full_cost,
        "selector_full_cost": selector_full_cost,
        "costs_identical": costs_identical,
        "candidate_only_residual": residual,
        "strict_positive_residual": residual > EPSILON,
    }


def summarize(rows: list[dict], program: str) -> dict:
    residuals = [row["candidate_only_residual"] for row in rows]
    plan_mismatches = sum(not row["plans_identical"] for row in rows)
    cost_mismatches = sum(not row["costs_identical"] for row in rows)
    strict = sum(row["strict_positive_residual"] for row in rows)
    plan_counts = Counter(row["candidate_plan"] for row in rows)
    return {
        "program": program,
        "grid_points": len(rows),
        "plan_mismatch_count": plan_mismatches,
        "full_cost_mismatch_count": cost_mismatches,
        "strict_positive_residual_count": strict,
        "min_candidate_only_residual": min(residuals),
        "max_candidate_only_residual": max(residuals),
        "distinct_candidate_plans": len(plan_counts),
        "all_rows_absorbed": plan_mismatches == 0 and cost_mismatches == 0 and strict == 0,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--inputs", required=True)
    parser.add_argument("--domain", required=True)
    parser.add_argument("--output", required=True)
    args = parser.parse_args()

    input_path = Path(args.inputs).resolve()
    domain_path = Path(args.domain).resolve()
    output = Path(args.output).resolve()
    output.mkdir(parents=True, exist_ok=False)

    if sha256(input_path) != EXPECTED_INPUT_SHA256:
        raise RuntimeError("frozen LOCKED_INPUTS.json hash mismatch")
    spec = json.loads(input_path.read_text(encoding="utf-8"))
    domain = json.loads(domain_path.read_text(encoding="utf-8"))
    if domain["admissible_completion"]["same_region_and_coefficient_information_for_candidate_and_selector"] is not True:
        raise RuntimeError("same-information domain guard failed")
    if domain["admissible_completion"]["same_action_cost_function_for_candidate_and_selector"] is not True:
        raise RuntimeError("same-cost-function domain guard failed")

    delay = float(spec["system_access_counter_delay_passes"])
    all_rows: list[dict] = []
    summaries: list[dict] = []
    for program in spec["programs"]:
        rows = [evaluate(program, p, delay) for p in parameter_grid(spec)]
        all_rows.extend(rows)
        summaries.append(summarize(rows, program["id"]))

    grid_path = output / "selector_control.csv"
    with grid_path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(all_rows[0].keys()))
        writer.writeheader()
        writer.writerows(all_rows)

    strict_total = sum(item["strict_positive_residual_count"] for item in summaries)
    mismatch_total = sum(item["plan_mismatch_count"] + item["full_cost_mismatch_count"] for item in summaries)
    absorbed = strict_total == 0 and mismatch_total == 0
    result = {
        "schema_version": "coh-rl-stagea-selector-control-result-v1",
        "assignment_id": "STAGEA-L2-20260809-COH-REGION-LIFECYCLE-R1",
        "evidence_level": "E1_ANALYTICAL_MODEL_AND_IDENTITY",
        "coefficient_domain": "PARTIALLY_IDENTIFIED_PRIMARY_SOURCE_DOMAIN",
        "original_grid_role": "IDENTITY_DIAGNOSTIC_ONLY_NOT_PLATFORM_EVIDENCE",
        "program_summaries": summaries,
        "aggregate": {
            "row_count": len(all_rows),
            "strict_positive_candidate_residual_count": strict_total,
            "plan_or_cost_mismatch_count": mismatch_total,
            "selector_absorbs_candidate": absorbed,
            "recommendation": "STOP_RECOMMENDED" if absorbed else "PASS_RECOMMENDED",
        },
        "universal_guard": {
            "statement": "candidate and selector evaluate identical shared action costs and apply identical per-region argmin with equal decision cost",
            "valid_for_every_finite_nonnegative_shared_cost_completion": True,
            "requires_gh200_measurement": False,
        },
        "claim_ceiling": "ANALYTICAL_SELECTOR_ABSORPTION_ONLY",
        "gh200_b0_b3_executed": False,
        "main_claim_established": False,
    }
    result_path = output / "summary.json"
    result_path.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    manifest = {
        "inputs_sha256": sha256(input_path),
        "domain_sha256": sha256(domain_path),
        "selector_control_sha256": sha256(grid_path),
        "summary_sha256": sha256(result_path),
    }
    (output / "run_manifest.json").write_text(
        json.dumps(manifest, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )


if __name__ == "__main__":
    main()

