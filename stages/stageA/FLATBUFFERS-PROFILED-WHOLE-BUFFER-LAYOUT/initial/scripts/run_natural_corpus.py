"""Orchestrate the frozen corpus through the compiled native harness."""

from __future__ import annotations

import csv
import json
import subprocess
import time
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
MANIFEST = ROOT / "inputs" / "natural_corpus_manifest.json"
SCHEMA = ROOT / "inputs" / "tflite_schema" / "schema.bfbs"
HARNESS = ROOT / "scripts" / "natural_native_harness.exe"
OUT = ROOT / "results" / "natural"
COMBINED = ROOT / "results" / "natural_results.csv"
PROFILE = ROOT / "results" / "profile_extraction.csv"


payload = json.loads(MANIFEST.read_text(encoding="utf-8"))
OUT.mkdir(parents=True, exist_ok=True)
all_rows: list[dict[str, str]] = []
profile_rows: list[list[str]] = []
started = time.perf_counter()

for record in payload["records"]:
    model_id = f"{record['ordinal']:02d}_{record['family']}_{Path(record['source_path']).stem}"
    command = [
        str(HARNESS),
        str(SCHEMA),
        str(ROOT / record["local_path"]),
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
