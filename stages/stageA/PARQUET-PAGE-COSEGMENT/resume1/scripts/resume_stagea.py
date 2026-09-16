"""Resume-only continuity, oracle validation, input view, and monitored runner.

The frozen scientific implementation remains the immutable parent
scripts/parquet_stagea.py.  This wrapper adds no action or scoring behavior; it
only creates resume-local copies, validates the paused 2024-06 oracles, invokes
the parent module, and records process-level costs.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import shutil
import sys
import threading
import time
from typing import Any

import psutil
import pyarrow.parquet as pq


CORPUS_HASHES = {
    "green_tripdata_2024-01.parquet": "1512A953BED564AC68DCB622827424DFB4F68AD93C2A4572E50EF6AB0B09C1AD",
    "green_tripdata_2024-02.parquet": "CB7EB405EE7E795C9FD6B8AD1B291F46F4E0A1CD60A57067B0AACA2420E8BC5D",
    "green_tripdata_2024-03.parquet": "43DEDD66DD556ACFC38DA679A174B6ADC32E01DD6DCCAD14BDFDF1521A14ABED",
    "green_tripdata_2024-04.parquet": "AF174977258A02F8F44C37534ABC9A8B4EAA5EC6D2F9C2BC49782327628B608C",
    "green_tripdata_2024-05.parquet": "AA8B1965ED36F0BDA1B342930D5E6F5A89F8FE56D0C6C6D77D9C156B408AA0EA",
    "green_tripdata_2024-06.parquet": "47E7C37DD39069C474364AEE3D76C9DDC887A3F714E9BB550B5866FE0B89B9CD",
    "green_tripdata_2024-07.parquet": "CE0D7591316050BEA21DA49E383EB733411E98AE17E114AFCC7FBE4B36B116F2",
    "green_tripdata_2024-08.parquet": "733210FB27CBE8CF8B0AD9F5D6FFF03DFAFCC8FF7C2BEB1C1B707825D72F0376",
    "green_tripdata_2024-09.parquet": "8F6AA8F3E8A2040FC161C7FBCB60E5418238B27E7E95998363572A4C977B69CE",
    "green_tripdata_2024-10.parquet": "6E737B7C4EDAC91F865AA210F7110D0118A9992B3A96720936E090277C24EDAA",
    "green_tripdata_2024-11.parquet": "FDE255B43D4158124921B7C085D9ABF15DE5C5A9128C2CE0FB4E2372BC1E0D4A",
    "green_tripdata_2024-12.parquet": "1D708F58D29B0795A54CA11A36DB6DF61262986D122985F0FB52A56ACC064BAC",
    "green_tripdata_2025-01.parquet": "84F3A121667157EFCBF012C3566A6065DF6F8E0312C678CB2F29CD72CC9C0F10",
    "green_tripdata_2025-02.parquet": "B3FFE16A96BA0C68C8A8F8B10F049294AE6EB8D21F2E13B3FDBD452FA2E3498E",
    "green_tripdata_2025-03.parquet": "D58E8D08E5E8A34C12F0D3F5EA049AE25C7C8215218A6AF7BF6B8124ECDE1C79",
    "green_tripdata_2025-04.parquet": "6CF7CA2A4DD8907437E2E4B4728F62B353712FF09B322223A61E01AECEE02411",
    "green_tripdata_2025-05.parquet": "DCBF4AFCE26D1ADC544A89EE1BDAC88089B1BBAA300685144D31EEE646DA58BB",
    "green_tripdata_2025-06.parquet": "451BC9F29382CCA5DC33DB05FF399CB137735D19C7449BBAA8B3348B0824F8E3",
    "green_tripdata_2025-07.parquet": "BBD6F9E5955570521DF5C6DD40C1A75B37CCCD730FCAFF4FB50BCD32D2D35F69",
    "green_tripdata_2025-08.parquet": "EBAAB192C199B850B0244E10C90622E472C1D4F2851168F950C9F75FE8DB18D1",
}


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for block in iter(lambda: f.read(1 << 20), b""):
            h.update(block)
    return h.hexdigest().upper()


def load_parent(old_root: Path) -> Any:
    script = old_root / "scripts" / "parquet_stagea.py"
    if sha256(script) != "38E7BC74352BFD235709BD383E087BF5CEDF978DE2017BBC65BD9764A083EFF6":
        raise RuntimeError("parent scientific script hash mismatch")
    spec = importlib.util.spec_from_file_location("frozen_parquet_stagea", script)
    if spec is None or spec.loader is None:
        raise RuntimeError("cannot load frozen parent script")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def validate_oracle_set(old_root: Path, source: Path, partial: Path, output: Path) -> None:
    parent = load_parent(old_root)
    source_pf = pq.ParquetFile(source)
    source_table = pq.read_table(source)
    records = []
    for path in sorted(partial.glob("*.parquet")):
        raw_head = path.read_bytes()[:4]
        with path.open("rb") as f:
            f.seek(-4, os.SEEK_END)
            raw_tail = f.read(4)
        table = pq.read_table(path)
        pf = pq.ParquetFile(path)
        indexes = parent.inspect_standard_indexes(path)
        cuts = parent.extract_cuts(path)
        terminal_rows = all(ends and ends[-1] == source_pf.metadata.row_group(key[0]).num_rows for key, ends in cuts.items())
        record = {
            "file": path.name,
            "bytes": path.stat().st_size,
            "sha256": sha256(path),
            "parquet_magic": raw_head == b"PAR1" and raw_tail == b"PAR1",
            "table_equal": source_table.equals(table),
            "schema_equal": source_table.schema.equals(table.schema, check_metadata=True),
            "row_groups_equal": pf.num_row_groups == source_pf.num_row_groups and [pf.metadata.row_group(i).num_rows for i in range(pf.num_row_groups)] == [source_pf.metadata.row_group(i).num_rows for i in range(source_pf.num_row_groups)],
            "standard_indexes": bool(indexes["pass"]),
            "cut_columns": len(cuts),
            "terminal_rows_equal": terminal_rows,
        }
        record["pass"] = all(record[k] for k in ("parquet_magic", "table_equal", "schema_equal", "row_groups_equal", "standard_indexes", "terminal_rows_equal"))
        records.append(record)
    result = {
        "status": "PASS" if len(records) == 15 and all(x["pass"] for x in records) else "FAIL",
        "expected_count": 15,
        "observed_count": len(records),
        "source_sha256": sha256(source),
        "records": records,
    }
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8", newline="\n")
    print(json.dumps({k: v for k, v in result.items() if k != "records"}, sort_keys=True))
    if result["status"] != "PASS":
        raise SystemExit(3)


def validate_partial(old_root: Path, output: Path) -> None:
    validate_oracle_set(
        old_root,
        old_root / "assets" / "nyc-green" / "green_tripdata_2024-06.parquet",
        old_root / "artifacts" / "replay1" / "green_tripdata_2024-06" / "boundary_oracles",
        output,
    )


def prepare(old_root: Path, resume_root: Path, replay: str) -> None:
    if replay not in ("replay1_remaining", "replay1_tail", "replay2"):
        raise ValueError(replay)
    source_dir = old_root / "assets" / "nyc-green"
    view = resume_root / "inputs" / replay
    view.mkdir(parents=True, exist_ok=True)
    names = sorted(CORPUS_HASHES)
    if replay == "replay1_remaining":
        names = names[5:]
    elif replay == "replay1_tail":
        names = names[8:]
    copied = []
    for name in names:
        source = source_dir / name
        if sha256(source) != CORPUS_HASHES[name]:
            raise RuntimeError(f"frozen corpus hash mismatch: {name}")
        target = view / name
        if target.exists():
            if sha256(target) != CORPUS_HASHES[name]:
                raise RuntimeError(f"resume input collision: {target}")
        else:
            shutil.copy2(source, target)
        copied.append({"file": name, "bytes": target.stat().st_size, "sha256": sha256(target)})
    if replay == "replay1_remaining":
        src = old_root / "artifacts" / "replay1" / "green_tripdata_2024-06" / "boundary_oracles"
        dst = resume_root / "artifacts" / replay / "green_tripdata_2024-06" / "boundary_oracles"
        dst.mkdir(parents=True, exist_ok=True)
        for old in sorted(src.glob("*.parquet")):
            target = dst / old.name
            if target.exists() and sha256(target) != sha256(old):
                raise RuntimeError(f"partial oracle collision: {target}")
            if not target.exists():
                shutil.copy2(old, target)
            if sha256(target) != sha256(old):
                raise RuntimeError(f"partial oracle copy mismatch: {target}")
    elif replay == "replay1_tail":
        src = resume_root / "artifacts" / "replay1_remaining" / "green_tripdata_2024-09" / "boundary_oracles"
        dst = resume_root / "artifacts" / replay / "green_tripdata_2024-09" / "boundary_oracles"
        dst.mkdir(parents=True, exist_ok=True)
        for old in sorted(src.glob("*.parquet")):
            target = dst / old.name
            if target.exists() and sha256(target) != sha256(old):
                raise RuntimeError(f"interrupted oracle collision: {target}")
            if not target.exists():
                shutil.copy2(old, target)
            if sha256(target) != sha256(old):
                raise RuntimeError(f"interrupted oracle copy mismatch: {target}")
    manifest = resume_root / "inputs" / f"{replay}_manifest.json"
    manifest.write_text(json.dumps({"replay": replay, "records": copied}, indent=2, sort_keys=True) + "\n", encoding="utf-8", newline="\n")
    print(json.dumps({"replay": replay, "files": len(copied), "bytes": sum(x["bytes"] for x in copied)}, sort_keys=True))


def run_probe(old_root: Path, corpus_dir: Path, output_dir: Path, cost_output: Path) -> None:
    parent = load_parent(old_root)
    process = psutil.Process()
    stop = threading.Event()
    peak = [process.memory_info().rss]
    def sampler() -> None:
        while not stop.wait(0.005):
            peak[0] = max(peak[0], process.memory_info().rss)
    thread = threading.Thread(target=sampler, daemon=True)
    io0 = process.io_counters()._asdict()
    cpu0, wall0 = time.process_time_ns(), time.perf_counter_ns()
    status = "COMPLETED"
    error = None
    thread.start()
    try:
        parent.full_probe(corpus_dir, output_dir)
    except BaseException as exc:
        status = "FAILED"
        error = f"{type(exc).__name__}: {exc}"
        raise
    finally:
        stop.set()
        thread.join()
        io1 = process.io_counters()._asdict()
        cost = {
            "status": status,
            "error": error,
            "wall_ns": time.perf_counter_ns() - wall0,
            "cpu_ns": time.process_time_ns() - cpu0,
            "peak_rss_bytes": peak[0],
            "io_delta": {k: io1[k] - io0[k] for k in io0},
            "input_files": len(list(corpus_dir.glob("green_tripdata_*.parquet"))),
        }
        cost_output.parent.mkdir(parents=True, exist_ok=True)
        cost_output.write_text(json.dumps(cost, indent=2, sort_keys=True) + "\n", encoding="utf-8", newline="\n")


def main() -> None:
    parser = argparse.ArgumentParser()
    sub = parser.add_subparsers(dest="command", required=True)
    validate = sub.add_parser("validate-partial")
    validate.add_argument("--old-root", type=Path, required=True)
    validate.add_argument("--output", type=Path, required=True)
    validate_any = sub.add_parser("validate-oracles")
    validate_any.add_argument("--old-root", type=Path, required=True)
    validate_any.add_argument("--source", type=Path, required=True)
    validate_any.add_argument("--oracle-dir", type=Path, required=True)
    validate_any.add_argument("--output", type=Path, required=True)
    prepare_p = sub.add_parser("prepare")
    prepare_p.add_argument("--old-root", type=Path, required=True)
    prepare_p.add_argument("--resume-root", type=Path, required=True)
    prepare_p.add_argument("--replay", choices=("replay1_remaining", "replay1_tail", "replay2"), required=True)
    run = sub.add_parser("run")
    run.add_argument("--old-root", type=Path, required=True)
    run.add_argument("--corpus-dir", type=Path, required=True)
    run.add_argument("--output-dir", type=Path, required=True)
    run.add_argument("--cost-output", type=Path, required=True)
    args = parser.parse_args()
    if args.command == "validate-partial":
        validate_partial(args.old_root.resolve(), args.output.resolve())
    elif args.command == "validate-oracles":
        validate_oracle_set(args.old_root.resolve(), args.source.resolve(), args.oracle_dir.resolve(), args.output.resolve())
    elif args.command == "prepare":
        prepare(args.old_root.resolve(), args.resume_root.resolve(), args.replay)
    else:
        run_probe(args.old_root.resolve(), args.corpus_dir.resolve(), args.output_dir.resolve(), args.cost_output.resolve())


if __name__ == "__main__":
    main()
