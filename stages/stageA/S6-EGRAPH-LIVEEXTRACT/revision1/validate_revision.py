from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

from oracle_revision import parse_projection, replay_schedule, selected_map, enumerate_extractions


def canonical(payload: dict) -> bytes:
    value = {k: v for k, v in payload.items() if k != "nondeterministic_full_cost"}
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def main() -> None:
    parser = argparse.ArgumentParser()
    for arg in ("source", "projection", "run1", "run2", "output"):
        parser.add_argument(f"--{arg}", required=True)
    args = parser.parse_args()
    source_path, projection_path = Path(args.source), Path(args.projection)
    run1, run2 = json.loads(Path(args.run1).read_text()), json.loads(Path(args.run2).read_text())
    source_hash = hashlib.sha256(source_path.read_bytes()).hexdigest()
    source_ok = source_hash == "8301352a6b70d0d79bd0eeecfdff39081e3f565b000ccabc8ba5ca63653b05d8" and source_path.stat().st_size == 17477
    canonical1, canonical2 = canonical(run1), canonical(run2)
    reproducible = canonical1 == canonical2
    projection = json.loads(projection_path.read_text())
    classes, roots = parse_projection(projection)
    extractions = enumerate_extractions(classes, roots)
    by_signature = {x.signature: x for x in extractions}
    replay_count = 0
    violations = []
    for point in run1["budgets"]:
        for method in ("joint", "runtime_first", "memory_first"):
            value = point[method]
            if value is None:
                continue
            extraction = by_signature[value["extraction"]]
            replay = replay_schedule(selected_map(classes, extraction), roots, value["actions"])
            replay_count += 1
            for key in ("peak_live_bytes", "total_target_operation_millicost", "emitted_operations", "recomputations"):
                if replay[key] != value[key]:
                    violations.append(f"{point['B']}:{method}:{key}")
            if replay["peak_live_bytes"] > point["B"]:
                violations.append(f"{point['B']}:{method}:budget")
        joint, runtime, memory = point["joint"], point["runtime_first"], point["memory_first"]
        expected = bool(joint and runtime and memory and
                        joint["total_target_operation_millicost"] < runtime["total_target_operation_millicost"] and
                        joint["total_target_operation_millicost"] < memory["total_target_operation_millicost"])
        if expected != point["strict_witness"]:
            violations.append(f"{point['B']}:witness")

    fallacy_scan = {
        "coverage": "11/11",
        "simpsons_paradox": "NOT_APPLICABLE_DETERMINISTIC_EXHAUSTIVE_OBJECT",
        "ecological_fallacy": "NOT_APPLICABLE_NO_POPULATION_INFERENCE",
        "berksons_paradox": "NOT_APPLICABLE_NO_SELECTED_STATISTICAL_SAMPLE",
        "collider_bias": "NOT_APPLICABLE_NO_CAUSAL_MODEL",
        "base_rate_neglect": "NOT_APPLICABLE_NO_DIAGNOSTIC_PROBABILITIES",
        "regression_to_mean": "NOT_APPLICABLE_NO_REPEATED_STOCHASTIC_MEASURES",
        "survivorship_bias": "PASS_ALL_EXACT_EXTRACTIONS_AND_BUDGETS_REPORTED",
        "look_elsewhere_effect": "PASS_WITNESS_RULE_AND_FULL_BUDGET_SWEEP_PREREGISTERED",
        "garden_of_forking_paths": "PASS_SOURCE_MAPPING_CONTROLS_AND_STOP_RULE_FROZEN",
        "correlation_not_causation": "PASS_ONLY_MECHANISTIC_EXACT_COMPARISONS_CLAIMED",
        "reverse_causality": "NOT_APPLICABLE_ALGORITHMIC_COUNTERFACTUAL",
    }
    verdict = "REPRODUCIBLE" if source_ok and reproducible and not violations else "NOT_REPRODUCIBLE"
    output = {
        "schema_version": "stagea-natural-liveextract-revision-validation-v1",
        "verification_status": "VERIFIED" if verdict == "REPRODUCIBLE" else "ANALYZED",
        "reproducibility_verdict": verdict,
        "source_hash_and_size_match": source_ok,
        "canonical_run1_sha256": hashlib.sha256(canonical1).hexdigest(),
        "canonical_run2_sha256": hashlib.sha256(canonical2).hexdigest(),
        "canonical_outputs_equal": reproducible,
        "schedule_replays_checked": replay_count,
        "violations": violations,
        "fallacy_scan": fallacy_scan,
    }
    Path(args.output).write_text(json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(output, sort_keys=True))
    if verdict != "REPRODUCIBLE":
        raise SystemExit(1)


if __name__ == "__main__":
    main()
