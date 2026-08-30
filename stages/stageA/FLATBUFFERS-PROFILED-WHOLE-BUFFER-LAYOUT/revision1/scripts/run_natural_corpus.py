"""Orchestrate the frozen corpus through the compiled native harness."""

from __future__ import annotations

import csv
import datetime as dt
import json
import subprocess
import time
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
INITIAL = ROOT.parent / "initial"
MANIFEST = INITIAL / "inputs" / "natural_corpus_manifest.json"
SCHEMA = INITIAL / "inputs" / "tflite_schema" / "schema.bfbs"
HARNESS = ROOT / "scripts" / "natural_native_harness.exe"
PROFILE_WEIGHTS = ROOT / "trace" / "profile_weights.tsv"
REQUEST_PROGRAM = ROOT / "trace" / "request_program.tsv"
TRACE_FREEZE = ROOT / "trace" / "TRACE_FREEZE.yaml"
GATE_RESULT = ROOT / "preclaim" / "GATE_RESULT.json"
OUT = ROOT / "results" / "natural"
COMBINED = ROOT / "results" / "natural_results.csv"
PROFILE = ROOT / "results" / "profile_extraction.csv"
REVISION_MARKER = ROOT / "results" / "SCIENTIFIC_REVISION_CONSUMPTION.json"


payload = json.loads(MANIFEST.read_text(encoding="utf-8"))
gate = json.loads(GATE_RESULT.read_text(encoding="utf-8"))
if gate.get("status") != "PASS" or gate.get("claim_rows_emitted_before_pass") != 0:
    raise RuntimeError("revised preclaim gate is not PASS")
for required in [HARNESS, PROFILE_WEIGHTS, REQUEST_PROGRAM, TRACE_FREEZE]:
    if not required.is_file():
        raise RuntimeError(f"missing frozen revised input: {required}")
OUT.mkdir(parents=True, exist_ok=True)
all_rows: list[dict[str, str]] = []
profile_rows: list[list[str]] = []
started = time.perf_counter()

for record in payload["records"]:
    model_id = f"{record['ordinal']:02d}_{record['family']}_{Path(record['source_path']).stem}"
    command = [
        str(HARNESS),
        str(SCHEMA),
        str(INITIAL / record["local_path"]),
        str(PROFILE_WEIGHTS),
        str(REQUEST_PROGRAM),
        record["split"],
        record["family"],
        model_id,
    ]
    result = subprocess.run(command, capture_output=True, text=True, timeout=180, check=False)
    (OUT / f"{model_id}.stdout.csv").write_text(result.stdout, encoding="utf-8")
    (OUT / f"{model_id}.stderr.log").write_text(result.stderr, encoding="utf-8")
    if result.returncode != 0:
        raise RuntimeError(f"native harness failed for {model_id}: {result.returncode}: {result.stderr}")
    rows = list(csv.DictReader(result.stdout.splitlines()))
    if len(rows) != 8:
        raise RuntimeError(f"expected 8 arms for {model_id}, observed {len(rows)}")
    if any(row["eligible"] != "1" for row in rows):
        raise RuntimeError(f"ineligible corrected arm for {model_id}")
    if not REVISION_MARKER.exists():
        REVISION_MARKER.write_text(
            json.dumps(
                {
                    "scientific_revision_consumed": True,
                    "consumption_point": "FIRST_ACCEPTED_CORRECTED_NATURAL_CLAIM_BEARING_OBSERVATION_AFTER_REVISED_PRECLAIM_PASS",
                    "accepted_at": dt.datetime.now(dt.timezone(dt.timedelta(hours=8))).isoformat(),
                    "first_model": model_id,
                    "first_accepted_arm": rows[0]["arm"],
                    "accepted_model_rows": len(rows),
                    "gate_result": str(GATE_RESULT.relative_to(ROOT)).replace("\\", "/"),
                },
                indent=2,
            )
            + "\n",
            encoding="utf-8",
        )
    all_rows.extend(rows)
    for line in result.stderr.splitlines():
        if line.startswith("PROFILE,"):
            profile_rows.append(line.split(","))

if not all_rows:
    raise RuntimeError("no natural rows")
with COMBINED.open("w", encoding="utf-8", newline="") as handle:
    writer = csv.DictWriter(handle, fieldnames=list(all_rows[0]))
    writer.writeheader()
    writer.writerows(all_rows)
with PROFILE.open("w", encoding="utf-8", newline="") as handle:
    writer = csv.writer(handle)
    writer.writerow(["kind", "model", "wall_ms", "cpu_ms", "peak_rss", "nodes", "canonical_fnv64"])
    writer.writerows(profile_rows)

print(
    json.dumps(
        {
            "pass": True,
            "models": len(payload["records"]),
            "arms": len(all_rows),
            "elapsed_seconds": time.perf_counter() - started,
        }
    )
)
