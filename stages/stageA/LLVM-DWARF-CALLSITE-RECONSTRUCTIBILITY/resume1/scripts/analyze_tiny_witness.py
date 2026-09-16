#!/usr/bin/env python3
"""Collect exact native bytes and reader observations for the tiny witness."""

from __future__ import annotations

import hashlib
import json
import subprocess
import time
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "build" / "bin"
OUT = ROOT / "witness"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest().upper()


def run(args: list[str]) -> subprocess.CompletedProcess[str]:
    return subprocess.run(args, cwd=ROOT, text=True, encoding="utf-8", errors="replace", capture_output=True, check=False)


def sections(path: Path) -> dict[str, int]:
    cp = run([str(BIN / "llvm-readobj.exe"), "--elf-output-style=JSON", "--sections", str(path)])
    if cp.returncode:
        raise RuntimeError(cp.stderr)
    raw = json.loads(cp.stdout)[0]["Sections"]
    return {x["Section"]["Name"]["Name"]: int(x["Section"]["Size"]) for x in raw}


def main() -> None:
    results = {}
    runner = ROOT / "resources" / "blinkenlights-2022-05-12.com"
    for plan in ("rax", "rbx"):
        obj = OUT / f"plan_{plan}.o"
        elf = OUT / f"plan_{plan}.elf"
        dwarf = run([str(BIN / "llvm-dwarfdump.exe"), "--debug-info", "--show-children", str(obj)])
        verify = run([str(BIN / "llvm-dwarfdump.exe"), "--verify", "--quiet", str(elf)])
        unwind = run([str(BIN / "llvm-readobj.exe"), "--unwind", str(elf)])
        disasm = run([str(BIN / "llvm-objdump.exe"), "-d", "--no-show-raw-insn", str(elf)])
        for name, cp in (("dwarf", dwarf), ("verify", verify), ("unwind", unwind), ("disasm", disasm)):
            if cp.returncode:
                raise RuntimeError(f"{plan} {name}: {cp.stderr}")
            (OUT / f"plan_{plan}.{name}.txt").write_text(cp.stdout + cp.stderr, encoding="utf-8", newline="\n")
        start = time.perf_counter()
        behavior = run([str(runner), str(elf)])
        behavior_wall = time.perf_counter() - start
        if behavior.returncode != 0:
            raise RuntimeError(f"{plan} behavior exit {behavior.returncode}: {behavior.stdout} {behavior.stderr}")
        sec = sections(elf)
        debug_bytes = sum(size for name, size in sec.items() if name.startswith(".debug"))
        results[plan] = {
            "object_bytes": obj.stat().st_size,
            "object_sha256": sha256(obj),
            "elf_bytes": elf.stat().st_size,
            "elf_sha256": sha256(elf),
            "text_bytes": sec.get(".text", 0),
            "debug_section_bytes": debug_bytes,
            "eh_frame_bytes": sec.get(".eh_frame", 0),
            "call_site_parameters": dwarf.stdout.count("DW_TAG_call_site_parameter"),
            "has_rbx_breg_call_value": "DW_AT_call_value" in dwarf.stdout and "DW_OP_breg3 RBX+0" in dwarf.stdout,
            "dwarf_verify_exit": verify.returncode,
            "unwind_reader_exit": unwind.returncode,
            "behavior_exit": behavior.returncode,
            "behavior_wall_seconds": round(behavior_wall, 6)
        }
    record = {
        "schema": "tiny-native-witness-metrics-v1",
        "same_behavior": all(v["behavior_exit"] == 0 for v in results.values()),
        "native_reader": "exact_commit_llvm_dwarfdump_llvm_readobj",
        "writer": "exact_commit_llc_lld",
        "runner_sha256": sha256(runner),
        "plans": results
    }
    (OUT / "tiny_metrics.json").write_text(json.dumps(record, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(json.dumps(record, separators=(",", ":")))


if __name__ == "__main__":
    main()
