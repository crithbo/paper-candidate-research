#!/usr/bin/env python3
"""Measure fixed preprocessing cost for the ten packaged natural traces."""

from __future__ import annotations

import json
import pathlib
import sys
import csv


SCRIPT_DIR = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(SCRIPT_DIR))
import prepare_corpus as pc  # noqa: E402


ROOT = pc.ROOT
CORPUS = ROOT / "runs" / "corpus" / "CORPUS_MANIFEST.json"
OUT = ROOT / "runs" / "preprocess_cost"
COMMAND_LOG = OUT / "PREPROCESS_COMMANDS.jsonl"
RESULT = OUT / "PACKAGED_PREPROCESSING_COST.json"
OFFICIAL_CSV = (
    ROOT
    / "artifact"
    / "certified_maxpre_experimental_data"
    / "data"
    / "data_maxpre_default_checked.csv"
)


def main() -> None:
    OUT.mkdir(parents=True, exist_ok=True)
    if COMMAND_LOG.exists():
        COMMAND_LOG.unlink()
    pc.COMMANDS = COMMAND_LOG
    corpus = json.loads(CORPUS.read_text(encoding="utf-8"))
    with OFFICIAL_CSV.open("r", encoding="utf-8", newline="") as handle:
        official_rows = {row["benchmark"]: row for row in csv.DictReader(handle)}
    records = []
    for trace in corpus["accepted"]:
        if trace["source_kind"] != "ZENODO_10630852_V1_EXAMPLE":
            continue
        trace_id = trace["trace_id"]
        run_dir = OUT / trace_id
        run_dir.mkdir(parents=True, exist_ok=True)
        input_wcnf = ROOT / trace["frozen_files"]["input_wcnf"]["path"]
        frozen_output = ROOT / trace["frozen_files"]["output_wcnf"]["path"]
        frozen_proof = ROOT / trace["frozen_files"]["augmented_proof"]["path"]
        official_benchmark = trace["source_id"] + ".wcnf.xz"
        if official_benchmark not in official_rows:
            raise RuntimeError(f"missing official preprocessing row: {official_benchmark}")
        official = official_rows[official_benchmark]
        if official["status"] != "SUCCESS":
            raise RuntimeError(f"official preprocessing did not succeed: {official_benchmark}")
        replay_output = run_dir / "output.wcnf"
        replay_proof = run_dir / "augmented.pbp"
        stderr = run_dir / "maxpre.stderr.txt"
        run = pc.run_process(
            f"{trace_id}:packaged_preprocess_cost",
            [
                str(pc.MAXPRE),
                str(input_wcnf),
                f"-proof={replay_proof}",
                "-verb=0",
            ],
            replay_output,
            stderr,
            180,
        )
        valid_run = (
            run["returncode"] == 0
            and not run["timed_out"]
            and replay_output.is_file()
            and replay_proof.is_file()
        )
        record = {
            "trace_id": trace_id,
            "valid_run": valid_run,
            "duration_ns": run["duration_ns"],
            "peak_rss_bytes": run["peak_rss_bytes"],
            "official_benchmark": official_benchmark,
            "official_artifact_solving_time_s": float(official["solving_time"]),
            "official_artifact_augmented_proofsize": int(official["augmented_proofsize"]),
            "official_artifact_kernel_proofsize": int(official["kernel_proofsize"]),
            "frozen_output_sha256": pc.file_sha256(frozen_output),
            "frozen_proof_sha256": pc.file_sha256(frozen_proof),
            "replay_output_sha256": pc.file_sha256(replay_output) if replay_output.exists() else None,
            "replay_proof_sha256": pc.file_sha256(replay_proof) if replay_proof.exists() else None,
        }
        record["output_byte_identical"] = (
            record["replay_output_sha256"] == record["frozen_output_sha256"]
        )
        record["proof_byte_identical"] = (
            record["replay_proof_sha256"] == record["frozen_proof_sha256"]
        )
        if not valid_run:
            raise RuntimeError(f"packaged preprocessing replay failed: {trace_id}")
        records.append(record)
    if len(records) != 10:
        raise RuntimeError(f"expected 10 packaged traces, found {len(records)}")
    payload = {
        "schema_version": "packaged-preprocessing-cost-v1",
        "command": "frozen MaxPre artifact source build, default preprocessing, proof logging, verb=0",
        "official_cost_source": {
            "path": OFFICIAL_CSV.relative_to(ROOT).as_posix(),
            "sha256": pc.file_sha256(OFFICIAL_CSV),
            "field": "solving_time",
            "treatment": "primary full-cost value for packaged traces; local Windows replay is a disclosed portability proxy only because it is not byte-identical",
        },
        "records": records,
    }
    RESULT.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
    print(f"records={len(records)}")
    print(f"output_identical={sum(r['output_byte_identical'] for r in records)}")
    print(f"proof_identical={sum(r['proof_byte_identical'] for r in records)}")
    print(f"result_sha256={pc.file_sha256(RESULT)}")


if __name__ == "__main__":
    main()
