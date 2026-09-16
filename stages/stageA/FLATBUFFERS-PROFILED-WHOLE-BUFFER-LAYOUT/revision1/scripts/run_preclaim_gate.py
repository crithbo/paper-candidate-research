"""Close the revised fidelity gate without emitting corrected natural objective rows."""

from __future__ import annotations

import csv
import hashlib
import json
import subprocess
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
INITIAL = ROOT.parent / "initial"
TRACE = ROOT / "trace"
PRECLAIM = ROOT / "preclaim"
HARNESS = ROOT / "scripts" / "natural_native_harness.exe"
SCHEMA = INITIAL / "inputs" / "tflite_schema" / "schema.bfbs"
MODEL = INITIAL / "inputs" / "natural_corpus" / "00_quantize_quantize0.tflite"
WEIGHTS = TRACE / "profile_weights.tsv"
PROGRAM = TRACE / "request_program.tsv"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest().upper()


if (ROOT / "results" / "natural_results.csv").exists() or (ROOT / "results" / "SCIENTIFIC_REVISION_CONSUMPTION.json").exists():
    raise RuntimeError("claim-bearing result exists before revised gate")
PRECLAIM.mkdir(parents=True, exist_ok=True)

# Recompute trace counts and freeze integrity.
with (TRACE / "training_request_trace.tsv").open("r", encoding="utf-8", newline="") as handle:
    trace_rows = list(csv.DictReader(handle, delimiter="\t"))
with PROGRAM.open("r", encoding="utf-8", newline="") as handle:
    program_rows = list(csv.DictReader(handle, delimiter="\t"))
with WEIGHTS.open("r", encoding="utf-8", newline="") as handle:
    weight_rows = list(csv.DictReader(handle, delimiter="\t"))
with (TRACE / "logical_endpoint_mapping.tsv").open("r", encoding="utf-8", newline="") as handle:
    mapping_rows = list(csv.DictReader(handle, delimiter="\t"))

observed = Counter(row["endpoint_id"] for row in trace_rows)
weights = {row["endpoint_id"]: int(row["planner_weight"]) for row in weight_rows}
mapping = {row["endpoint_id"]: row["reflection_key"] for row in mapping_rows}
train_models = {row["model"] for row in trace_rows}
trace_integrity = bool(
    len(trace_rows) == 23936
    and len(program_rows) == 704
    and len(train_models) == 11
    and set(observed) == set(weights) == set(mapping)
    and all(observed[key] == weights[key] for key in observed)
    and all(row["origin_model"] in train_models for row in program_rows)
    and {int(row["request_ordinal"]) for row in program_rows} == set(range(64))
)

freeze_text = (TRACE / "TRACE_FREEZE.yaml").read_text(encoding="utf-8")
trace_freeze_flags = all(
    token in freeze_text
    for token in [
        "source_split: train_only",
        "heldout_files_opened: false",
        "initial_result_files_opened: false",
        "reference_offsets_used: false",
        "estimator: exact_unsmoothed_event_count_per_logical_endpoint",
    ]
)
for name in [
    "logical_endpoint_mapping.tsv",
    "request_program.tsv",
    "training_request_trace.tsv",
    "profile_weights.tsv",
    "trace_collection_cost.csv",
]:
    expected_line = next((line for line in freeze_text.splitlines() if line.strip().startswith(name + ":")), None)
    if expected_line is None or expected_line.split(":", 1)[1].strip() != sha256(TRACE / name):
        trace_freeze_flags = False

# Re-run unchanged native small witnesses and require semantic identity with initial gate results.
witness_pairs = [
    ("witness_replay.exe", "preclaim_native_witness.json", "native_56_byte_witness.json"),
    ("tiny_oracle_dp.exe", "preclaim_tiny_oracle.json", "native_tiny_oracle.json"),
]
witness_pass = True
for executable, expected_name, output_name in witness_pairs:
    result = subprocess.run(
        [str(INITIAL / "witness" / executable)],
        cwd=INITIAL,
        capture_output=True,
        text=True,
        timeout=120,
        check=False,
    )
    if result.returncode != 0:
        raise RuntimeError(f"small witness failed: {executable}: {result.returncode}: {result.stderr}")
    observed_payload = json.loads(result.stdout)
    expected_payload = json.loads((INITIAL / "results" / expected_name).read_text(encoding="utf-8"))
    subset_match = all(expected_payload.get(key) == value for key, value in observed_payload.items())
    if not subset_match or observed_payload.get("pass") is not True:
        witness_pass = False
    observed_payload["native_exit_code"] = result.returncode
    observed_payload["frozen_expected_field_subset_match"] = subset_match
    (PRECLAIM / output_name).write_text(json.dumps(observed_payload, indent=2) + "\n", encoding="utf-8")

# Run all eight revised arms on one frozen training carrier while suppressing every objective row.
arm_result = subprocess.run(
    [
        str(HARNESS),
        str(SCHEMA),
        str(MODEL),
        str(WEIGHTS),
        str(PROGRAM),
        "train",
        "quantize",
        "00_quantize_quantize0",
        "--preclaim",
    ],
    capture_output=True,
    text=True,
    timeout=180,
    check=False,
)
if arm_result.returncode != 0:
    raise RuntimeError(f"preclaim arm check failed: {arm_result.returncode}: {arm_result.stderr}")
arm_payload = json.loads(arm_result.stdout)
(PRECLAIM / "arm_executability.json").write_text(json.dumps(arm_payload, indent=2) + "\n", encoding="utf-8")
with (TRACE / "trace_collection_cost.csv").open("r", encoding="utf-8", newline="") as handle:
    first_cost = next(csv.DictReader(handle))
trace_reader_parity = int(first_cost["sink"]) == int(arm_payload["trace_replay_checksum"])
arm_pass = bool(
    arm_payload["preclaim_arm_executability"] == "PASS"
    and arm_payload["eligible_arms"] == 8
    and arm_payload["canonical_digest_count"] == 1
    and arm_payload["frozen_requests"] == 704
    and arm_payload["positive_profile_fields"] > 0
    and arm_payload["applied_profile_weight_sum"] > 0
    and arm_payload["objective_rows_emitted"] == 0
)

source = (ROOT / "scripts" / "natural_native_harness.cpp").read_text(encoding="utf-8")
required_source_tokens = [
    "LoadProfileWeights",
    "LoadRequestProgram",
    "TraceReplayChecksum",
    "ComputeUsefulResidualActions",
    "MeasuredFlatBufferBuilder",
    "reader_trace_warm_ns",
    "reader_trace_cold_ns",
    "end_to_end_construction_wall_us",
    "useful_residual_actions",
]
full_cost_and_action_mapping = all(token in source for token in required_source_tokens)
initial_action_catalog_exact = sha256(INITIAL / "NATIVE_ACTION_CATALOG.md") == "B0467CFBACEFDFC06A121B023FC7648C4156D87F32B6F531C197FD8F73C90C7D"

checks = {
    "training_only_trace_freeze": trace_integrity and trace_freeze_flags,
    "logical_endpoint_atomic_mapping": trace_integrity and initial_action_catalog_exact,
    "native_reader_trace_parity": trace_reader_parity,
    "eight_arm_comparator_semantics_and_executability": arm_pass,
    "same_object_native_codec_reader_format": arm_pass,
    "common_denominator_and_full_cost_paths": full_cost_and_action_mapping,
    "small_56_byte_witness": witness_pass,
    "tiny_exhaustive_oracle": witness_pass,
    "claim_rows_emitted_before_pass_zero": True,
}
status = "PASS" if all(checks.values()) else "FAIL_CLOSED"
gate_payload = {
    "gate": "TRACE_DERIVED_PROFILE_MATCHED_READER_AND_EXECUTABLE_FRONTIER_FIDELITY_GATE",
    "status": status,
    "claim_rows_emitted_before_pass": 0,
    "scientific_revision_consumed": False,
    "trace_freeze_sha256": sha256(TRACE / "TRACE_FREEZE.yaml"),
    "trace_events": len(trace_rows),
    "trace_requests": len(program_rows),
    "trace_training_models": len(train_models),
    "trace_reader_checksum_parity": trace_reader_parity,
    "checks": checks,
    "arm_check": arm_payload,
    "native_56_byte_witness_sha256": sha256(PRECLAIM / "native_56_byte_witness.json"),
    "native_tiny_oracle_sha256": sha256(PRECLAIM / "native_tiny_oracle.json"),
    "stageb_authorized": False,
}
(PRECLAIM / "GATE_RESULT.json").write_text(json.dumps(gate_payload, indent=2) + "\n", encoding="utf-8")
(ROOT / "PRECLAIM_GATE.md").write_text(
    "# Revised pre-claim contract fidelity gate\n\n"
    f"- Gate: `{gate_payload['gate']}`\n"
    f"- Status: `{status}`\n"
    "- Corrected natural claim-bearing rows before PASS: `0`\n"
    "- Scientific revision consumed at gate: `false`\n"
    f"- Training-only trace: `{len(train_models)} models / {len(program_rows)} requests / {len(trace_rows)} events`; freeze SHA-256 `{gate_payload['trace_freeze_sha256']}`\n"
    f"- Collector/replay checksum parity: `{'PASS' if trace_reader_parity else 'FAIL'}`\n"
    f"- Eight-arm suppress-objectives executability/same-object: `{'PASS' if arm_pass else 'FAIL'}`\n"
    f"- Unchanged native 56-byte witness and tiny exhaustive oracle: `{'PASS' if witness_pass else 'FAIL'}`\n"
    f"- Atomic action mapping and trace endpoint mapping: `{'PASS' if checks['logical_endpoint_atomic_mapping'] else 'FAIL'}`\n"
    f"- Full-cost/common-denominator collection paths: `{'PASS' if checks['common_denominator_and_full_cost_paths'] else 'FAIL'}`\n"
    "- Gate artifacts: `preclaim/GATE_RESULT.json`, `preclaim/arm_executability.json`, `preclaim/native_56_byte_witness.json`, `preclaim/native_tiny_oracle.json`.\n"
    "- Only a PASS permits the corrected 24-model natural run; this gate contains no PASS/STOP scientific inference.\n",
    encoding="utf-8",
)
print(json.dumps(gate_payload))
if status != "PASS":
    raise SystemExit(3)
