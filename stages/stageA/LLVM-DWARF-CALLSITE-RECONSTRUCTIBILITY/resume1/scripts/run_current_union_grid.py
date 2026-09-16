#!/usr/bin/env python3
"""Run the frozen exact-commit current-writer union on one common bitcode input."""

from __future__ import annotations

import ctypes
import hashlib
import itertools
import json
import os
import shutil
import subprocess
import sys
import time
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "build" / "bin"
LLC = BIN / "llc.exe"
DWARF = BIN / "llvm-dwarfdump.exe"
INPUT = ROOT / "inputs" / "current_union_smoke.bc"
OUT = ROOT / "results" / "current_union_grid"
UNIQUE = OUT / "unique_objects"
TMP = OUT / "tmp.o"


class FILETIME(ctypes.Structure):
    _fields_ = [("low", ctypes.c_uint32), ("high", ctypes.c_uint32)]


class PROCESS_MEMORY_COUNTERS(ctypes.Structure):
    _fields_ = [
        ("cb", ctypes.c_uint32),
        ("PageFaultCount", ctypes.c_uint32),
        ("PeakWorkingSetSize", ctypes.c_size_t),
        ("WorkingSetSize", ctypes.c_size_t),
        ("QuotaPeakPagedPoolUsage", ctypes.c_size_t),
        ("QuotaPagedPoolUsage", ctypes.c_size_t),
        ("QuotaPeakNonPagedPoolUsage", ctypes.c_size_t),
        ("QuotaNonPagedPoolUsage", ctypes.c_size_t),
        ("PagefileUsage", ctypes.c_size_t),
        ("PeakPagefileUsage", ctypes.c_size_t),
    ]


def ft_value(ft: FILETIME) -> int:
    return (ft.high << 32) | ft.low


def run_measured(args: list[str]) -> dict:
    start = time.perf_counter()
    proc = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = proc.communicate()
    wall = time.perf_counter() - start
    cpu = None
    peak = None
    try:
        creation = FILETIME()
        exit_time = FILETIME()
        kernel = FILETIME()
        user = FILETIME()
        ok = ctypes.windll.kernel32.GetProcessTimes(
            int(proc._handle), ctypes.byref(creation), ctypes.byref(exit_time),
            ctypes.byref(kernel), ctypes.byref(user)
        )
        if ok:
            cpu = (ft_value(kernel) + ft_value(user)) / 10_000_000.0
        counters = PROCESS_MEMORY_COUNTERS()
        counters.cb = ctypes.sizeof(counters)
        ok = ctypes.windll.psapi.GetProcessMemoryInfo(
            int(proc._handle), ctypes.byref(counters), counters.cb
        )
        if ok:
            peak = int(counters.PeakWorkingSetSize)
    except Exception:
        pass
    return {
        "exit": proc.returncode,
        "wall_seconds": wall,
        "cpu_seconds": cpu,
        "peak_rss_bytes": peak,
        "stdout": stdout.decode("utf-8", errors="replace"),
        "stderr": stderr.decode("utf-8", errors="replace"),
    }


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest().upper()


def allocator_variants() -> list[dict]:
    variants = []
    for reverse, priority in itertools.product((False, True), repeat=2):
        variants.append({
            "name": f"greedy_r{int(reverse)}_p{int(priority)}",
            "regalloc": "greedy",
            "allocator_flags": [
                f"-greedy-reverse-local-assignment={'true' if reverse else 'false'}",
                f"-greedy-regclass-priority-trumps-globalness={'true' if priority else 'false'}",
            ],
        })
    variants.extend([
        {"name": "basic", "regalloc": "basic", "allocator_flags": []},
        {"name": "fast", "regalloc": "fast", "allocator_flags": []},
        {"name": "pbqp_c0", "regalloc": "pbqp", "allocator_flags": ["-pbqp-coalescing=false"]},
        {"name": "pbqp_c1", "regalloc": "pbqp", "allocator_flags": ["-pbqp-coalescing=true"]},
    ])
    return variants


def main() -> int:
    OUT.mkdir(parents=True, exist_ok=True)
    UNIQUE.mkdir(parents=True, exist_ok=True)
    rows = []
    unique_by_hash: dict[str, str] = {}
    total = 8 * 2 * 2 * 2 * 2 * 2 * 2 * 3 * 2
    arm_id = 0
    for alloc, csr_scale, csr_first, instr_ref, entry_values, shrink, stress, split, spill_elim in itertools.product(
        allocator_variants(), (0, 100), (0, 100), (False, True), (False, True),
        (False, True), (None, 2), ("default", "size", "speed"), (False, True)
    ):
        arm_id += 1
        config = {
            "allocator": alloc["name"], "regalloc": alloc["regalloc"],
            "csr_cost_scale": csr_scale, "csr_first_time_cost": csr_first,
            "instr_ref": instr_ref, "debug_entry_values": entry_values,
            "shrink_wrap": shrink, "stress_regalloc": stress or "default",
            "split_spill_mode": split, "spill_copy_elimination": spill_elim,
        }
        args = [
            str(LLC), str(INPUT), "-mtriple=x86_64-unknown-linux-gnu", "-O2",
            f"-regalloc={alloc['regalloc']}", f"-regalloc-csr-cost-scale={csr_scale}",
            f"-regalloc-csr-first-time-cost={csr_first}",
            f"-experimental-debug-variable-locations={'true' if instr_ref else 'false'}",
            f"-debug-entry-values={'true' if entry_values else 'false'}",
            f"-enable-shrink-wrap={'true' if shrink else 'false'}",
            f"-split-spill-mode={split}",
            f"-enable-spill-copy-elim={'true' if spill_elim else 'false'}",
            "-emit-call-site-info", "-debugger-tune=lldb", "-dwarf-version=5",
            "-verify-machineinstrs", "-filetype=obj", f"-o={TMP}",
        ] + alloc["allocator_flags"]
        if stress is not None:
            args.append(f"-stress-regalloc={stress}")
        if TMP.exists():
            TMP.unlink()
        llc = run_measured(args)
        row = {"arm_id": arm_id, "config": config, "llc": {k: llc[k] for k in ("exit", "wall_seconds", "cpu_seconds", "peak_rss_bytes")}}
        if llc["exit"] == 0 and TMP.exists():
            digest = sha256(TMP)
            row["object_bytes"] = TMP.stat().st_size
            row["object_sha256"] = digest
            info = run_measured([str(DWARF), "--debug-info", str(TMP)])
            verify = run_measured([str(DWARF), "--verify", str(TMP)])
            text = info["stdout"] + info["stderr"]
            row["reader"] = {
                "info_exit": info["exit"], "verify_exit": verify["exit"],
                "wall_seconds": info["wall_seconds"] + verify["wall_seconds"],
                "cpu_seconds": None if info["cpu_seconds"] is None or verify["cpu_seconds"] is None else info["cpu_seconds"] + verify["cpu_seconds"],
                "peak_rss_bytes": max(x for x in (info["peak_rss_bytes"], verify["peak_rss_bytes"]) if x is not None),
            }
            row["call_site_parameters"] = text.count("DW_TAG_call_site_parameter")
            row["has_breg3_rbx"] = "DW_OP_breg3" in text
            if digest not in unique_by_hash:
                name = f"unique_{len(unique_by_hash) + 1:03d}_{digest[:12]}.o"
                shutil.copyfile(TMP, UNIQUE / name)
                unique_by_hash[digest] = name
            row["unique_object"] = unique_by_hash[digest]
        else:
            error = llc["stderr"] or llc["stdout"]
            row["error_sha256"] = hashlib.sha256(error.encode("utf-8")).hexdigest().upper()
            row["error_head"] = error[:1000]
        rows.append(row)
        if arm_id % 256 == 0 or arm_id == total:
            print(f"completed {arm_id}/{total} successes={sum(r['llc']['exit'] == 0 for r in rows)} unique={len(unique_by_hash)}", flush=True)
    if TMP.exists():
        TMP.unlink()
    summary = {
        "schema": "llvm-dwarf-current-union-results-v1",
        "input": str(INPUT.relative_to(ROOT)).replace("\\", "/"),
        "input_sha256": sha256(INPUT),
        "arm_count_expected": total,
        "arm_count_run": len(rows),
        "successes": sum(r["llc"]["exit"] == 0 for r in rows),
        "failures": sum(r["llc"]["exit"] != 0 for r in rows),
        "unique_object_count": len(unique_by_hash),
        "reconstructible_arms": sum(r.get("call_site_parameters", 0) > 0 for r in rows),
        "breg3_arms": sum(r.get("has_breg3_rbx", False) for r in rows),
        "rows": rows,
    }
    (OUT / "results.json").write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({k: summary[k] for k in summary if k != "rows"}, indent=2), flush=True)
    return 0


if __name__ == "__main__":
    sys.exit(main())
