#!/usr/bin/env python3
"""Deterministic registered analysis for the bounded native Stage A pilot."""

from __future__ import annotations

import hashlib
import json
import math
from pathlib import Path


ROOT = Path(r"<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1")
INPUT = ROOT / "runs/natural/pilot_final/NATIVE_RESULTS.json"
OUTPUT = ROOT / "runs/natural/pilot_final/ANALYSIS.json"
CANONICAL_ELIGIBILITY = ROOT / "runs/natural/CANONICAL_ELIGIBILITY.json"


def nearest_rank(values: list[float], q: float) -> float:
    if not values:
        raise ValueError("empty quantile input")
    ordered = sorted(values)
    return ordered[max(0, math.ceil(q * len(ordered)) - 1)]


def best_primary(rows: list[dict], candidate: bool) -> dict:
    passed = [r for r in rows if r["all_native_steps_exit_zero"]]
    best_bytes = min(r["function_text_bytes"] for r in passed)
    byte_tied = [r for r in passed if r["function_text_bytes"] == best_bytes]
    best_frame = min(r["frame_bytes"] for r in byte_tied)
    primary_tied = [r for r in byte_tied if r["frame_bytes"] == best_frame]
    cpu_key = "full_candidate_cpu_seconds" if candidate else "cpu_seconds"
    wall_key = "full_candidate_wall_seconds" if candidate else "wall_seconds"
    selected = min(primary_tied, key=lambda r: (r[cpu_key], r[wall_key], r["name"]))
    return {
        "name": selected["name"],
        "function_text_bytes": selected["function_text_bytes"],
        "frame_bytes": selected["frame_bytes"],
        "cpu_seconds": selected[cpu_key],
        "wall_seconds": selected[wall_key],
        "peak_working_set_bytes": (
            selected["full_candidate_peak_working_set_bytes"]
            if candidate
            else selected["peak_working_set_bytes"]
        ),
        "assembly_sha256": selected["assembly_sha256"],
        "push": selected["push"],
        "popret": selected["popret"],
    }


def main() -> None:
    raw = INPUT.read_bytes()
    source = json.loads(raw.decode("utf-8-sig"))
    canonical_raw = CANONICAL_ELIGIBILITY.read_bytes()
    canonical = json.loads(canonical_raw.decode("utf-8-sig"))
    canonical_names = sorted(row["function"] for row in canonical["rows"] if row["eligible"])
    replay_names = sorted(row["function"] for row in source["rows"])
    if canonical_names != replay_names:
        raise RuntimeError("canonical eligibility and exact single-function replay sets differ")
    rows: list[dict] = []
    excluded: list[dict] = []
    byte_deltas: list[float] = []
    frame_deltas: list[float] = []
    cpu_deltas: list[float] = []
    wall_deltas: list[float] = []
    total_candidate_actions = 0
    raw_outside_actions = 0
    useful_residual_functions = 0
    candidate_native_pass = 0
    candidate_native_total = 0
    union_native_pass = 0
    union_native_total = 0

    for function in source["rows"]:
        if function.get("final_eligibility") != "ELIGIBLE":
            excluded.append(
                {
                    "function": function["function"],
                    "status": function.get("final_eligibility"),
                    "reason_tail": function.get("exclusion_reason", "").splitlines()[-1],
                }
            )
            continue

        candidates = function["candidate_rows"]
        union = function["union_rows"]
        candidate_native_total += len(candidates)
        candidate_native_pass += sum(bool(r["all_native_steps_exit_zero"]) for r in candidates)
        union_native_total += len(union)
        union_native_pass += sum(bool(r["all_native_steps_exit_zero"]) for r in union)
        if not all(r["all_native_steps_exit_zero"] for r in candidates + union):
            raise RuntimeError(f"native pipeline failure in {function['function']}")

        union_hashes = {r["assembly_sha256"] for r in union}
        outside = sum(r["assembly_sha256"] not in union_hashes for r in candidates)
        total_candidate_actions += len(candidates)
        raw_outside_actions += outside

        cb = best_primary(candidates, candidate=True)
        ub = best_primary(union, candidate=False)
        byte_delta = cb["function_text_bytes"] - ub["function_text_bytes"]
        frame_delta = cb["frame_bytes"] - ub["frame_bytes"]
        cpu_delta = cb["cpu_seconds"] - ub["cpu_seconds"]
        wall_delta = cb["wall_seconds"] - ub["wall_seconds"]
        byte_deltas.append(byte_delta)
        frame_deltas.append(frame_delta)
        cpu_deltas.append(cpu_delta)
        wall_deltas.append(wall_delta)

        # A useful residual must strictly improve at least one registered
        # primary output metric.  A distinct encoding or construction-cost
        # fluctuation alone is not a scientific residual.
        primary_benefit = byte_delta < 0 or (byte_delta == 0 and frame_delta < 0)
        if primary_benefit:
            useful_residual_functions += 1

        rows.append(
            {
                "module": function["module"],
                "function": function["function"],
                "interface_width": function["interface_width"],
                "candidate_plan_count": len(candidates),
                "current_union_arm_count": len(union),
                "raw_candidate_actions_outside_union_by_assembly_hash": outside,
                "candidate_best": cb,
                "current_union_best": ub,
                "paired_delta_candidate_minus_union": {
                    "function_text_bytes": byte_delta,
                    "frame_bytes": frame_delta,
                    "full_construction_cpu_seconds": cpu_delta,
                    "full_construction_wall_seconds": wall_delta,
                },
                "strict_primary_benefit": primary_benefit,
                "useful_residual": primary_benefit,
            }
        )

    eligible = len(rows)
    payload = {
        "schema": "zcmp-natural-pilot-analysis-v1",
        "source_results_sha256": hashlib.sha256(raw).hexdigest().upper(),
        "canonical_eligibility_sha256": hashlib.sha256(canonical_raw).hexdigest().upper(),
        "canonical_eligible_set_matches_single_function_replay": True,
        "quantile_method": "nearest_rank; p50=ceil(0.50*n), p90=ceil(0.90*n)",
        "same_information": True,
        "native_pipeline": {
            "candidate_pass": candidate_native_pass,
            "candidate_total": candidate_native_total,
            "current_union_pass": union_native_pass,
            "current_union_total": union_native_total,
        },
        "denominator": {
            "canonical_modules": canonical["input_module_count"],
            "canonical_functions_screened": canonical["function_count"],
            "initial_eligible_functions": source["function_count"],
            "eligible_after_exact_single_function_replay": eligible,
            "excluded_before_candidate_vs_union_outcome": excluded,
        },
        "action_coverage": {
            "candidate_native_action_count": total_candidate_actions,
            "raw_distinct_actions_outside_union_by_assembly_hash": raw_outside_actions,
            "raw_distinct_action_fraction": raw_outside_actions / total_candidate_actions,
            "useful_residual_function_count": useful_residual_functions,
            "useful_residual_function_fraction": useful_residual_functions / eligible,
            "registered_minimum_fraction": 0.10,
            "registered_minimum_met": useful_residual_functions / eligible >= 0.10,
            "important_distinction": "raw action distinctness is not useful residual without strict code-size or frame primary benefit",
        },
        "paired_summary_candidate_minus_union": {
            "function_text_bytes": {
                "p50": nearest_rank(byte_deltas, 0.50),
                "p90": nearest_rank(byte_deltas, 0.90),
            },
            "frame_bytes": {
                "p50": nearest_rank(frame_deltas, 0.50),
                "p90": nearest_rank(frame_deltas, 0.90),
            },
            "full_construction_cpu_seconds": {
                "p50": nearest_rank(cpu_deltas, 0.50),
                "p90": nearest_rank(cpu_deltas, 0.90),
            },
            "full_construction_wall_seconds": {
                "p50": nearest_rank(wall_deltas, 0.50),
                "p90": nearest_rank(wall_deltas, 0.90),
            },
        },
        "functions": rows,
        "owner_scientific_recommendation": "STOP",
        "reason": "0/4 useful natural residuals; candidate best primary points are matched by the complete executable current union and add planner cost",
        "evidence_ceiling": "BOUNDED_STAGEA_SCIENTIFIC_NEGATIVE__OWNER_RECOMMENDATION__INDEPENDENT_GATE_REQUIRED",
    }
    OUTPUT.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
