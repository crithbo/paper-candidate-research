#!/usr/bin/env python3
"""Build and verify the frozen 30-trace natural Stage A corpus."""

from __future__ import annotations

import ctypes
import hashlib
import json
import os
import pathlib
import re
import subprocess
import time
from ctypes import wintypes


ROOT = pathlib.Path(r"D:\project\writing\reserch\stages\stageA\PB-DELETE-SCHEDULE")
PYTHON = pathlib.Path(
    r"C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"
)
MAXPRE = ROOT / "build" / "maxpre.exe"
VERIPB = ROOT / "build" / "veripb-target-system" / "release" / "veripb.exe"
CAKEPB = ROOT / "build" / "cake_pb_wcnf_v3.exe"
EXAMPLES = ROOT / "artifact" / "certified_maxpre_experimental_data" / "examples"
MSE_POOL = ROOT / "artifact" / "mse23-exact-weighted-range-subset" / "wcnf"
RUNS = ROOT / "runs" / "corpus"
CORPUS_MANIFEST = RUNS / "CORPUS_MANIFEST.json"
COMMANDS = RUNS / "CORPUS_COMMANDS.jsonl"
MIN_TOTAL = 30
PACKAGED_COUNT = 10
GENERATED_NEEDED = MIN_TOTAL - PACKAGED_COUNT
CHECKED_RE = re.compile(r"^\s*del\s+(.+?)\s*;\s*(.*)$")
TARGET_RE = re.compile(r"\bid\s+([0-9][0-9 ]*)")


class PROCESS_MEMORY_COUNTERS_EX(ctypes.Structure):
    _fields_ = [
        ("cb", wintypes.DWORD),
        ("PageFaultCount", wintypes.DWORD),
        ("PeakWorkingSetSize", ctypes.c_size_t),
        ("WorkingSetSize", ctypes.c_size_t),
        ("QuotaPeakPagedPoolUsage", ctypes.c_size_t),
        ("QuotaPagedPoolUsage", ctypes.c_size_t),
        ("QuotaPeakNonPagedPoolUsage", ctypes.c_size_t),
        ("QuotaNonPagedPoolUsage", ctypes.c_size_t),
        ("PagefileUsage", ctypes.c_size_t),
        ("PeakPagefileUsage", ctypes.c_size_t),
        ("PrivateUsage", ctypes.c_size_t),
    ]


GetProcessMemoryInfo = ctypes.windll.psapi.GetProcessMemoryInfo


def file_sha256(path: pathlib.Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest().upper()


def slug(name: str) -> str:
    clean = re.sub(r"[^A-Za-z0-9._-]+", "_", name)
    return clean[:180]


def peak_rss(process: subprocess.Popen) -> int:
    counters = PROCESS_MEMORY_COUNTERS_EX()
    counters.cb = ctypes.sizeof(counters)
    ok = GetProcessMemoryInfo(
        wintypes.HANDLE(process._handle),
        ctypes.byref(counters),
        counters.cb,
    )
    return int(counters.PeakWorkingSetSize) if ok else 0


def run_process(
    label: str,
    command: list[str],
    stdout_path: pathlib.Path,
    stderr_path: pathlib.Path,
    timeout_s: float,
    env_extra: dict[str, str] | None = None,
) -> dict:
    stdout_path.parent.mkdir(parents=True, exist_ok=True)
    env = os.environ.copy()
    if env_extra:
        env.update(env_extra)
    started_wall = time.strftime("%Y-%m-%dT%H:%M:%S%z")
    started = time.perf_counter_ns()
    timed_out = False
    peak = 0
    with stdout_path.open("wb") as stdout, stderr_path.open("wb") as stderr:
        process = subprocess.Popen(command, stdout=stdout, stderr=stderr, env=env)
        deadline = time.monotonic() + timeout_s
        while process.poll() is None:
            peak = max(peak, peak_rss(process))
            if time.monotonic() >= deadline:
                timed_out = True
                process.kill()
                break
            time.sleep(0.005)
        returncode = process.wait()
        peak = max(peak, peak_rss(process))
    ended = time.perf_counter_ns()
    record = {
        "label": label,
        "command": command,
        "cwd": str(ROOT),
        "env_overrides": env_extra or {},
        "started_wall": started_wall,
        "duration_ns": ended - started,
        "timeout_s": timeout_s,
        "timed_out": timed_out,
        "returncode": returncode,
        "peak_rss_bytes": peak,
        "stdout_path": stdout_path.relative_to(ROOT).as_posix(),
        "stderr_path": stderr_path.relative_to(ROOT).as_posix(),
    }
    with COMMANDS.open("a", encoding="utf-8") as handle:
        handle.write(json.dumps(record, sort_keys=True) + "\n")
    return record


def extract_checked(proof: pathlib.Path, output: pathlib.Path) -> dict:
    records = []
    raw = proof.read_text(encoding="utf-8", errors="strict").splitlines()
    for line_index, line in enumerate(raw, start=1):
        match = CHECKED_RE.match(line)
        if not match:
            continue
        target_match = TARGET_RE.search(match.group(1))
        target_ids = []
        if target_match:
            target_ids = [int(token) for token in target_match.group(1).split()]
        normalized = " ".join(line.strip().split())
        records.append(
            {
                "ordinal": len(records),
                "proof_line": line_index,
                "target_ids": target_ids,
                "witness": " ".join(match.group(2).split()),
                "normalized_command": normalized,
            }
        )
    with output.open("w", encoding="utf-8", newline="\n") as handle:
        for record in records:
            handle.write(json.dumps(record, sort_keys=True) + "\n")
    return {
        "checked_deletions": len(records),
        "extraction_bytes": output.stat().st_size,
        "extraction_sha256": file_sha256(output),
    }


def verify_trace(
    trace_id: str,
    input_wcnf: pathlib.Path,
    augmented: pathlib.Path,
    output_wcnf: pathlib.Path,
    trace_dir: pathlib.Path,
) -> tuple[bool, dict]:
    kernel = trace_dir / "original.kernel.v3.pbp"
    veri_stdout = trace_dir / "original.veripb.stdout.txt"
    veri_stderr = trace_dir / "original.veripb.stderr.txt"
    veri = run_process(
        f"{trace_id}:original:veripb",
        [
            str(VERIPB),
            "--wcnf",
            "--force-checked-deletion",
            "--stats",
            "--elaborate",
            str(kernel),
            str(input_wcnf),
            str(augmented),
            str(output_wcnf),
        ],
        veri_stdout,
        veri_stderr,
        180,
    )
    veri_text = veri_stdout.read_text(encoding="utf-8", errors="replace")
    veri_ok = (
        veri["returncode"] == 0
        and not veri["timed_out"]
        and "s VERIFIED OUTPUT EQUIOPTIMAL" in veri_text
        and kernel.is_file()
    )
    cake = None
    cake_ok = False
    if veri_ok:
        cake_stdout = trace_dir / "original.cakepb.stdout.txt"
        cake_stderr = trace_dir / "original.cakepb.stderr.txt"
        cake = run_process(
            f"{trace_id}:original:cakepb",
            [str(CAKEPB), str(input_wcnf), str(kernel), str(output_wcnf)],
            cake_stdout,
            cake_stderr,
            180,
            {"CML_HEAP_SIZE": "512", "CML_STACK_SIZE": "128"},
        )
        cake_text = cake_stdout.read_text(encoding="utf-8", errors="replace")
        cake_ok = (
            cake["returncode"] == 0
            and not cake["timed_out"]
            and "s VERIFIED OUTPUT EQUIOPTIMAL" in cake_text
        )
    return veri_ok and cake_ok, {
        "kernel_path": kernel,
        "veripb": veri,
        "cakepb": cake,
        "veripb_ok": veri_ok,
        "cakepb_ok": cake_ok,
    }


def trace_manifest(
    trace_id: str,
    source_kind: str,
    source_id: str,
    input_wcnf: pathlib.Path,
    output_wcnf: pathlib.Path,
    augmented: pathlib.Path,
    extracted: pathlib.Path,
    extraction: dict,
    verification: dict,
    preprocessing: dict | None,
) -> dict:
    kernel = verification["kernel_path"]
    paths = {
        "input_wcnf": input_wcnf,
        "output_wcnf": output_wcnf,
        "augmented_proof": augmented,
        "kernel_proof_v3": kernel,
        "canonical_checked_trace": extracted,
    }
    frozen = {
        key: {
            "path": path.relative_to(ROOT).as_posix(),
            "bytes": path.stat().st_size,
            "sha256": file_sha256(path),
        }
        for key, path in paths.items()
    }
    record = {
        "trace_id": trace_id,
        "source_kind": source_kind,
        "source_id": source_id,
        "checked_deletions": extraction["checked_deletions"],
        "frozen_files": frozen,
        "original_contract": {
            "veripb_checked_deletion_forced": verification["veripb_ok"],
            "cakepb_output_equioptimal": verification["cakepb_ok"],
            "veripb_duration_ns": verification["veripb"]["duration_ns"],
            "veripb_peak_rss_bytes": verification["veripb"]["peak_rss_bytes"],
            "cakepb_duration_ns": verification["cakepb"]["duration_ns"],
            "cakepb_peak_rss_bytes": verification["cakepb"]["peak_rss_bytes"],
        },
        "preprocessing": preprocessing,
    }
    return record


def main() -> None:
    for tool in (MAXPRE, VERIPB, CAKEPB):
        if not tool.is_file():
            raise FileNotFoundError(tool)
    RUNS.mkdir(parents=True, exist_ok=True)
    if COMMANDS.exists():
        COMMANDS.unlink()
    accepted = []
    rejected = []

    packaged = sorted(EXAMPLES.glob("*.augmented.pbp"), key=lambda p: p.name)
    if len(packaged) != PACKAGED_COUNT:
        raise RuntimeError(f"expected {PACKAGED_COUNT} packaged examples, found {len(packaged)}")
    for proof in packaged:
        stem = proof.name.removesuffix(".augmented.pbp")
        trace_id = "zenodo__" + slug(stem)
        trace_dir = RUNS / trace_id
        trace_dir.mkdir(parents=True, exist_ok=True)
        input_wcnf = EXAMPLES / f"{stem}.wcnf"
        output_wcnf = EXAMPLES / f"{stem}.output.wcnf"
        extracted = trace_dir / "checked_deletions.canonical.jsonl"
        extraction = extract_checked(proof, extracted)
        if extraction["checked_deletions"] < 2:
            raise RuntimeError(f"packaged trace below deletion gate: {trace_id}")
        ok, verification = verify_trace(
            trace_id, input_wcnf, proof, output_wcnf, trace_dir
        )
        if not ok:
            raise RuntimeError(f"packaged trace failed fixed contract: {trace_id}")
        record = trace_manifest(
            trace_id,
            "ZENODO_10630852_V1_EXAMPLE",
            stem,
            input_wcnf,
            output_wcnf,
            proof,
            extracted,
            extraction,
            verification,
            None,
        )
        (trace_dir / "TRACE_MANIFEST.json").write_text(
            json.dumps(record, indent=2) + "\n", encoding="utf-8"
        )
        accepted.append(record)

    for input_wcnf in sorted(MSE_POOL.glob("*.wcnf"), key=lambda p: p.name):
        if len(accepted) >= MIN_TOTAL:
            break
        trace_id = "mse23__" + slug(input_wcnf.stem)
        trace_dir = RUNS / trace_id
        trace_dir.mkdir(parents=True, exist_ok=True)
        output_wcnf = trace_dir / "output.wcnf"
        augmented = trace_dir / "original.augmented.pbp"
        maxpre_stdout = output_wcnf
        maxpre_stderr = trace_dir / "maxpre.stderr.txt"
        preprocess = run_process(
            f"{trace_id}:maxpre",
            [
                str(MAXPRE),
                str(input_wcnf),
                f"-proof={augmented}",
                "-timelimit=10",
                "-verb=0",
            ],
            maxpre_stdout,
            maxpre_stderr,
            30,
        )
        if preprocess["returncode"] != 0 or preprocess["timed_out"] or not augmented.is_file():
            rejected.append(
                {"source": input_wcnf.name, "reason": "MAXPRE_FAILURE", "run": preprocess}
            )
            continue
        extracted = trace_dir / "checked_deletions.canonical.jsonl"
        extraction = extract_checked(augmented, extracted)
        if extraction["checked_deletions"] < 2:
            rejected.append(
                {
                    "source": input_wcnf.name,
                    "reason": "FEWER_THAN_2_CHECKED_DELETIONS",
                    "checked_deletions": extraction["checked_deletions"],
                }
            )
            continue
        ok, verification = verify_trace(
            trace_id, input_wcnf, augmented, output_wcnf, trace_dir
        )
        if not ok:
            rejected.append(
                {
                    "source": input_wcnf.name,
                    "reason": "FIXED_CONTRACT_VERIFICATION_FAILURE",
                    "verification": {
                        "veripb_ok": verification["veripb_ok"],
                        "cakepb_ok": verification["cakepb_ok"],
                    },
                }
            )
            continue
        pre_record = {
            "duration_ns": preprocess["duration_ns"],
            "peak_rss_bytes": preprocess["peak_rss_bytes"],
            "returncode": preprocess["returncode"],
            "timed_out": preprocess["timed_out"],
        }
        record = trace_manifest(
            trace_id,
            "MSE2023_EXACT_WEIGHTED_OFFICIAL_RANGE_MEMBER",
            input_wcnf.name,
            input_wcnf,
            output_wcnf,
            augmented,
            extracted,
            extraction,
            verification,
            pre_record,
        )
        (trace_dir / "TRACE_MANIFEST.json").write_text(
            json.dumps(record, indent=2) + "\n", encoding="utf-8"
        )
        accepted.append(record)

    if len(accepted) < MIN_TOTAL:
        raise RuntimeError(
            f"natural corpus gate failed: accepted={len(accepted)}, required={MIN_TOTAL}"
        )
    corpus = {
        "schema_version": "pb-delete-schedule-corpus-v1",
        "selection_rule": (
            "all 10 canonical IJCAR artifact examples, then canonical lexicographic trace ID "
            "among eligible members of the frozen 50-member resource-bounded MSE23 pool"
        ),
        "accepted_count": len(accepted),
        "minimum_checked_deletions_per_trace": min(
            record["checked_deletions"] for record in accepted
        ),
        "accepted": accepted,
        "rejected_before_quota": rejected,
        "tool_hashes": {
            "maxpre_sha256": file_sha256(MAXPRE),
            "veripb_sha256": file_sha256(VERIPB),
            "cakepb_sha256": file_sha256(CAKEPB),
        },
    }
    CORPUS_MANIFEST.write_text(json.dumps(corpus, indent=2) + "\n", encoding="utf-8")
    print(f"accepted={len(accepted)}")
    print(f"rejected={len(rejected)}")
    print(f"minimum_checked_deletions={corpus['minimum_checked_deletions_per_trace']}")
    print(f"corpus_manifest_sha256={file_sha256(CORPUS_MANIFEST)}")


if __name__ == "__main__":
    main()
