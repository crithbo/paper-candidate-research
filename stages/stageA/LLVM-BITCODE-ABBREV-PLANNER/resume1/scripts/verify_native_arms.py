#!/usr/bin/env python3
"""Strict same-denominator native verification and measured read harness."""

from __future__ import annotations

import argparse
import ctypes
import hashlib
import importlib.util
import json
import os
import pathlib
import subprocess
import sys
import threading
import time
from typing import Any


def load_codec(path: pathlib.Path) -> Any:
    spec = importlib.util.spec_from_file_location("verify_codec", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


class FILETIME(ctypes.Structure):
    _fields_ = [("dwLowDateTime", ctypes.c_ulong), ("dwHighDateTime", ctypes.c_ulong)]


class PROCESS_MEMORY_COUNTERS(ctypes.Structure):
    _fields_ = [
        ("cb", ctypes.c_ulong),
        ("PageFaultCount", ctypes.c_ulong),
        ("PeakWorkingSetSize", ctypes.c_size_t),
        ("WorkingSetSize", ctypes.c_size_t),
        ("QuotaPeakPagedPoolUsage", ctypes.c_size_t),
        ("QuotaPagedPoolUsage", ctypes.c_size_t),
        ("QuotaPeakNonPagedPoolUsage", ctypes.c_size_t),
        ("QuotaNonPagedPoolUsage", ctypes.c_size_t),
        ("PagefileUsage", ctypes.c_size_t),
        ("PeakPagefileUsage", ctypes.c_size_t),
    ]


def filetime_seconds(value: FILETIME) -> float:
    return ((value.dwHighDateTime << 32) | value.dwLowDateTime) / 10_000_000.0


def run_measured(command: list[str], timeout: float = 120.0) -> dict[str, Any]:
    flags = getattr(subprocess, "CREATE_NO_WINDOW", 0)
    start = time.perf_counter()
    proc = subprocess.Popen(
        command, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
        text=True, creationflags=flags,
    )
    peak_rss = 0
    timed_out = False
    psapi = ctypes.WinDLL("psapi")
    stdout_chunks: list[str] = []
    stderr_chunks: list[str] = []

    def drain(stream: Any, chunks: list[str]) -> None:
        try:
            while True:
                chunk = stream.read(8192)
                if not chunk:
                    break
                chunks.append(chunk)
        finally:
            stream.close()

    stdout_thread = threading.Thread(
        target=drain, args=(proc.stdout, stdout_chunks), daemon=True
    )
    stderr_thread = threading.Thread(
        target=drain, args=(proc.stderr, stderr_chunks), daemon=True
    )
    stdout_thread.start()
    stderr_thread.start()
    while proc.poll() is None:
        counters = PROCESS_MEMORY_COUNTERS()
        counters.cb = ctypes.sizeof(counters)
        if psapi.GetProcessMemoryInfo(
            int(proc._handle), ctypes.byref(counters), counters.cb
        ):
            peak_rss = max(peak_rss, int(counters.PeakWorkingSetSize))
        if time.perf_counter() - start > timeout:
            timed_out = True
            proc.kill()
            break
        time.sleep(0.001)
    stdout_thread.join(timeout=5)
    stderr_thread.join(timeout=5)
    stdout = "".join(stdout_chunks)
    stderr = "".join(stderr_chunks)
    creation = FILETIME()
    exit_time = FILETIME()
    kernel = FILETIME()
    user = FILETIME()
    kernel32 = ctypes.WinDLL("kernel32")
    got_times = kernel32.GetProcessTimes(
        int(proc._handle), ctypes.byref(creation), ctypes.byref(exit_time),
        ctypes.byref(kernel), ctypes.byref(user),
    )
    counters = PROCESS_MEMORY_COUNTERS()
    counters.cb = ctypes.sizeof(counters)
    if psapi.GetProcessMemoryInfo(int(proc._handle), ctypes.byref(counters), counters.cb):
        peak_rss = max(peak_rss, int(counters.PeakWorkingSetSize))
    return {
        "command": command,
        "returncode": proc.returncode,
        "timed_out": timed_out,
        "wall_seconds": time.perf_counter() - start,
        "cpu_user_seconds": filetime_seconds(user) if got_times else None,
        "cpu_kernel_seconds": filetime_seconds(kernel) if got_times else None,
        "peak_rss_bytes": peak_rss,
        "stdout": stdout,
        "stderr": stderr,
    }


def canonical_ir(path: pathlib.Path) -> tuple[str, int]:
    lines = path.read_text(encoding="utf-8").splitlines()
    if lines and lines[0].startswith("; ModuleID = "):
        lines = lines[1:]
    data = ("\n".join(lines).strip() + "\n").encode("utf-8")
    return hashlib.sha256(data).hexdigest(), len(data)


def percentile(values: list[float], fraction: float) -> float:
    ordered = sorted(values)
    if not ordered:
        return float("nan")
    rank = max(0, min(len(ordered) - 1, math.ceil(fraction * len(ordered)) - 1))
    return ordered[rank]


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--codec", required=True, type=pathlib.Path)
    ap.add_argument("--llvm-bin", required=True, type=pathlib.Path)
    ap.add_argument("--arms-dir", required=True, type=pathlib.Path)
    ap.add_argument("--output", required=True, type=pathlib.Path)
    ap.add_argument("--read-repeats", type=int, default=3)
    args = ap.parse_args()
    codec = load_codec(args.codec.resolve())
    arms = ["B0", "B1", "B2", "WL"]
    rows: dict[str, Any] = {}
    baseline_trace = None
    baseline_ir = None
    all_pass = True
    for arm in arms:
        path = args.arms_dir / f"{arm}.bc"
        data = path.read_bytes()
        blocks = codec.Parser(data).parse()
        trace = codec.semantic_document(blocks)["canonical_sha256"]
        decoded = args.arms_dir / f"{arm}.verified.ll"
        checks = {
            "bcanalyzer": run_measured([
                str(args.llvm_bin / "llvm-bcanalyzer.exe"),
                "-disable-histogram", str(path),
            ]),
            "llvm_dis": run_measured([
                str(args.llvm_bin / "llvm-dis.exe"), str(path),
                "-o", str(decoded),
            ]),
            "opt_verify": run_measured([
                str(args.llvm_bin / "opt.exe"), "-passes=verify",
                "-disable-output", str(path),
            ]),
        }
        ir_hash, ir_bytes = canonical_ir(decoded) if decoded.exists() else (None, 0)
        reads = [run_measured([
            str(args.llvm_bin / "llvm-dis.exe"), str(path), "-o", "NUL",
        ]) for _ in range(args.read_repeats)]
        if baseline_trace is None:
            baseline_trace = trace
            baseline_ir = ir_hash
        trace_equal = trace == baseline_trace
        ir_equal = ir_hash == baseline_ir
        native_pass = all(row["returncode"] == 0 and not row["timed_out"] for row in checks.values())
        reads_pass = all(row["returncode"] == 0 and not row["timed_out"] for row in reads)
        arm_pass = trace_equal and ir_equal and native_pass and reads_pass
        all_pass = all_pass and arm_pass
        rows[arm] = {
            "path": str(path.resolve()),
            "bytes": len(data),
            "sha256": hashlib.sha256(data).hexdigest(),
            "trace_sha256": trace,
            "trace_equal_B0": trace_equal,
            "canonical_decoded_ir_sha256": ir_hash,
            "canonical_decoded_ir_bytes": ir_bytes,
            "canonical_decoded_ir_equal_B0": ir_equal,
            "checks": checks,
            "read_trials": reads,
            "read_first_wall_seconds": reads[0]["wall_seconds"] if reads else None,
            "read_warm_wall_seconds": [r["wall_seconds"] for r in reads[1:]],
            "arm_pass": arm_pass,
        }
    result = {
        "schema": "llvm-native-arm-verification-v1",
        "codec": "ordinary raw LLVM bitcode; unmodified pinned LLVM reader",
        "canonical_ir_rule": "remove only filename-derived leading ModuleID line",
        "read_protocol": (
            "first fresh process then repeated fresh processes; no OS cache flush, "
            "therefore operational first/warm labels only"
        ),
        "read_repeats": args.read_repeats,
        "B0_trace_sha256": baseline_trace,
        "B0_canonical_decoded_ir_sha256": baseline_ir,
        "arms": rows,
        "all_arms_pass": all_pass,
        "stageb_authorized": False,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({
        "all_arms_pass": all_pass,
        "bytes": {arm: rows[arm]["bytes"] for arm in arms},
        "output": str(args.output),
    }, sort_keys=True))
    return 0 if all_pass else 2


if __name__ == "__main__":
    # Imported late only for the optional percentile helper to keep startup
    # measurement of the actual tools separate.
    import math
    raise SystemExit(main())
