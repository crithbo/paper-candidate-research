"""Freeze a native generated-reader request trace from only the 11 training models."""

from __future__ import annotations

import csv
import hashlib
import json
import subprocess
import time
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
INITIAL = ROOT.parent / "initial"
MANIFEST = INITIAL / "inputs" / "natural_corpus_manifest.json"
COLLECTOR = ROOT / "scripts" / "trace_collector.exe"
TRACE_DIR = ROOT / "trace"

ENDPOINTS = [
    ("tflite.Model.version", "tflite.Model.version", "Model::version"),
    ("tflite.Model.description", "tflite.Model.description", "Model::description"),
    ("tflite.Model.subgraphs", "tflite.Model.subgraphs", "Model::subgraphs"),
    ("tflite.Model.operator_codes", "tflite.Model.operator_codes", "Model::operator_codes"),
    ("tflite.Model.buffers", "tflite.Model.buffers", "Model::buffers"),
    ("tflite.SubGraph.name", "tflite.SubGraph.name", "SubGraph::name"),
    ("tflite.SubGraph.inputs", "tflite.SubGraph.inputs", "SubGraph::inputs"),
    ("tflite.SubGraph.outputs", "tflite.SubGraph.outputs", "SubGraph::outputs"),
    ("tflite.SubGraph.tensors", "tflite.SubGraph.tensors", "SubGraph::tensors"),
    ("tflite.SubGraph.operators", "tflite.SubGraph.operators", "SubGraph::operators"),
    ("tflite.Tensor.shape", "tflite.Tensor.shape", "Tensor::shape"),
    ("tflite.Tensor.type", "tflite.Tensor.type", "Tensor::type"),
    ("tflite.Tensor.buffer", "tflite.Tensor.buffer", "Tensor::buffer"),
    ("tflite.Tensor.name", "tflite.Tensor.name", "Tensor::name"),
    ("tflite.Tensor.quantization", "tflite.Tensor.quantization", "Tensor::quantization"),
    ("tflite.Tensor.is_variable", "tflite.Tensor.is_variable", "Tensor::is_variable"),
    ("tflite.Tensor.shape_signature", "tflite.Tensor.shape_signature", "Tensor::shape_signature"),
    ("tflite.Tensor.has_rank", "tflite.Tensor.has_rank", "Tensor::has_rank"),
    ("tflite.Operator.opcode_index", "tflite.Operator.opcode_index", "Operator::opcode_index"),
    ("tflite.Operator.inputs", "tflite.Operator.inputs", "Operator::inputs"),
    ("tflite.Operator.outputs", "tflite.Operator.outputs", "Operator::outputs"),
    ("tflite.Operator.builtin_options_type", "tflite.Operator.builtin_options_type", "Operator::builtin_options_type"),
    ("tflite.Operator.builtin_options", "tflite.Operator.builtin_options", "Operator::builtin_options"),
    ("tflite.Operator.custom_options", "tflite.Operator.custom_options", "Operator::custom_options"),
    ("tflite.Operator.custom_options_format", "tflite.Operator.custom_options_format", "Operator::custom_options_format"),
    ("tflite.Operator.mutating_variable_inputs", "tflite.Operator.mutating_variable_inputs", "Operator::mutating_variable_inputs"),
    ("tflite.Operator.intermediates", "tflite.Operator.intermediates", "Operator::intermediates"),
    ("tflite.OperatorCode.deprecated_builtin_code", "tflite.OperatorCode.deprecated_builtin_code", "OperatorCode::deprecated_builtin_code"),
    ("tflite.OperatorCode.custom_code", "tflite.OperatorCode.custom_code", "OperatorCode::custom_code"),
    ("tflite.OperatorCode.version", "tflite.OperatorCode.version", "OperatorCode::version"),
    ("tflite.OperatorCode.builtin_code", "tflite.OperatorCode.builtin_code", "OperatorCode::builtin_code"),
    ("tflite.Buffer.data", "tflite.Buffer.data", "Buffer::data"),
    ("tflite.Buffer.offset", "tflite.Buffer.offset", "Buffer::offset"),
    ("tflite.Buffer.size", "tflite.Buffer.size", "Buffer::size"),
]


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest().upper()


payload = json.loads(MANIFEST.read_text(encoding="utf-8"))
train = [record for record in payload["records"] if record["split"] == "train"]
if len(payload["records"]) != 24 or len(train) != 11:
    raise RuntimeError("frozen 24 / 11 split mismatch")
if any((ROOT / "results").glob("natural_results*")):
    raise RuntimeError("corrected natural result exists before trace freeze")
if not COLLECTOR.is_file():
    raise RuntimeError("trace collector is not built")

TRACE_DIR.mkdir(parents=True, exist_ok=True)
trace_rows: list[dict[str, str]] = []
request_rows: list[dict[str, str | int]] = []
cost_rows: list[dict[str, str]] = []
started_wall = time.perf_counter()

for record in train:
    model_id = f"{record['ordinal']:02d}_{record['family']}_{Path(record['source_path']).stem}"
    model_path = INITIAL / record["local_path"]
    if sha256(model_path) != record["sha256"]:
        raise RuntimeError(f"training model hash mismatch: {model_id}")
    result = subprocess.run(
        [str(COLLECTOR), str(model_path), model_id],
        capture_output=True,
        text=True,
        timeout=60,
        check=False,
    )
    if result.returncode != 0:
        raise RuntimeError(f"collector failed for {model_id}: {result.returncode}: {result.stderr}")
    rows = list(csv.DictReader(result.stdout.splitlines(), delimiter="\t"))
    if not rows or {int(row["request_ordinal"]) for row in rows} != set(range(64)):
        raise RuntimeError(f"incomplete trace for {model_id}")
    trace_rows.extend(rows)
    request_rows.extend(
        {"origin_model": model_id, "request_ordinal": request, "seed": request}
        for request in range(64)
    )
    lines = [line for line in result.stderr.splitlines() if line.startswith("TRACE_COST,")]
    if len(lines) != 1:
        raise RuntimeError(f"missing collector cost for {model_id}")
    _, cost_model, wall_ms, cpu_ms, peak_rss, sink = lines[0].split(",")
    cost_rows.append(
        {"model": cost_model, "wall_ms": wall_ms, "cpu_ms": cpu_ms, "peak_rss": peak_rss, "sink": sink}
    )

known = {item[0] for item in ENDPOINTS}
observed = Counter(row["endpoint_id"] for row in trace_rows)
if set(observed) - known:
    raise RuntimeError(f"unmapped endpoints: {sorted(set(observed) - known)}")

mapping_path = TRACE_DIR / "logical_endpoint_mapping.tsv"
with mapping_path.open("w", encoding="utf-8", newline="") as handle:
    writer = csv.writer(handle, delimiter="\t", lineterminator="\n")
    writer.writerow(["endpoint_id", "reflection_key", "generated_reader_accessor", "planner_role"])
    for endpoint, reflection_key, accessor in ENDPOINTS:
        writer.writerow([endpoint, reflection_key, accessor, "edge_or_field_access_weight"])

program_path = TRACE_DIR / "request_program.tsv"
with program_path.open("w", encoding="utf-8", newline="") as handle:
    writer = csv.DictWriter(handle, fieldnames=["origin_model", "request_ordinal", "seed"], delimiter="\t", lineterminator="\n")
    writer.writeheader()
    writer.writerows(request_rows)

trace_path = TRACE_DIR / "training_request_trace.tsv"
with trace_path.open("w", encoding="utf-8", newline="") as handle:
    fieldnames = ["global_event_ordinal", "model", "request_ordinal", "seed", "event_ordinal", "endpoint_id", "selector"]
    writer = csv.DictWriter(handle, fieldnames=fieldnames, delimiter="\t", lineterminator="\n")
    writer.writeheader()
    for ordinal, row in enumerate(trace_rows):
        writer.writerow({"global_event_ordinal": ordinal, **row})

weights_path = TRACE_DIR / "profile_weights.tsv"
with weights_path.open("w", encoding="utf-8", newline="") as handle:
    writer = csv.writer(handle, delimiter="\t", lineterminator="\n")
    writer.writerow(["endpoint_id", "reflection_key", "event_count", "planner_weight"])
    for endpoint, reflection_key, _ in ENDPOINTS:
        writer.writerow([endpoint, reflection_key, observed.get(endpoint, 0), observed.get(endpoint, 0)])

cost_path = TRACE_DIR / "trace_collection_cost.csv"
with cost_path.open("w", encoding="utf-8", newline="") as handle:
    writer = csv.DictWriter(handle, fieldnames=["model", "wall_ms", "cpu_ms", "peak_rss", "sink"], lineterminator="\n")
    writer.writeheader()
    writer.writerows(cost_rows)

freeze_path = TRACE_DIR / "TRACE_FREEZE.yaml"
artifact_paths = [mapping_path, program_path, trace_path, weights_path, cost_path]
total_wall_ms = 1000.0 * (time.perf_counter() - started_wall)
native_wall_ms = sum(float(row["wall_ms"]) for row in cost_rows)
native_cpu_ms = sum(float(row["cpu_ms"]) for row in cost_rows)
peak_rss = max(int(row["peak_rss"]) for row in cost_rows)
lines = [
    "schema_version: training-trace-freeze-v1",
    "source_split: train_only",
    "heldout_files_opened: false",
    "initial_result_files_opened: false",
    "models: 11",
    "requests_per_model: 64",
    f"requests: {len(request_rows)}",
    f"events: {len(trace_rows)}",
    "estimator: exact_unsmoothed_event_count_per_logical_endpoint",
    "reference_offsets_used: false",
    f"orchestration_wall_ms: {total_wall_ms:.6f}",
    f"native_collection_wall_ms_sum: {native_wall_ms:.6f}",
    f"native_collection_cpu_ms_sum: {native_cpu_ms:.6f}",
    f"native_collection_peak_rss_bytes: {peak_rss}",
    f"corpus_manifest_sha256: {sha256(MANIFEST)}",
    f"collector_source_sha256: {sha256(ROOT / 'scripts' / 'trace_collector.cpp')}",
    f"collector_executable_sha256: {sha256(COLLECTOR)}",
    "training_model_hashes:",
]
for record in train:
    model_id = f"{record['ordinal']:02d}_{record['family']}_{Path(record['source_path']).stem}"
    lines.append(f"  {model_id}: {record['sha256']}")
lines.append("artifact_hashes:")
for path in artifact_paths:
    lines.append(f"  {path.name}: {sha256(path)}")
lines.append(f"artifact_bytes_without_freeze_yaml: {sum(path.stat().st_size for path in artifact_paths)}")
freeze_path.write_text("\n".join(lines) + "\n", encoding="utf-8")

print(json.dumps({
    "pass": True,
    "models": len(train),
    "requests": len(request_rows),
    "events": len(trace_rows),
    "endpoints_observed": sum(count > 0 for count in observed.values()),
    "trace_freeze_sha256": sha256(freeze_path),
    "heldout_files_opened": False,
    "initial_result_files_opened": False,
}))
