#!/usr/bin/env python3
"""Link and execute the sole positive natural function for both paired arms."""

import hashlib
import json
import os
import statistics
import subprocess
import time
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
UP = ROOT.parent / "resume1"
BIN = UP / "build" / "bin"
LLC = BIN / "llc.exe"
CLANG = BIN / "clang.exe"
LLD = BIN / "ld.lld.exe"
BLINK = UP / "resources" / "blinkenlights-2022-05-12.com"
SRC = ROOT / "resources" / "build" / "natural_run04" / "n02_crtbegin"
SITE = SRC / "site_02"
OUT = ROOT / "resources" / "build" / "site02_behavior"
HARNESS = ROOT / "inputs" / "site02_behavior_harness.s"
RESULT = ROOT / "SITE02_EXECUTED_BEHAVIOR.json"
TMP = ROOT / "resources" / "tmp"


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest().upper()


def run(args):
    env = os.environ.copy(); env.update({"TEMP": str(TMP), "TMP": str(TMP), "TMPDIR": str(TMP)})
    start = time.perf_counter()
    p = subprocess.run(args, cwd=OUT, env=env, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    return {"exit": p.returncode, "wall_seconds": time.perf_counter() - start,
            "stdout": p.stdout.decode(errors="replace"), "stderr": p.stderr.decode(errors="replace")}


def make_public(mir_in, mir_out):
    text = mir_in.read_text(encoding="utf-8", errors="replace")
    old = "define internal void @__do_fini()"
    if text.count(old) != 1:
        raise ValueError(f"expected one internal __do_fini definition, got {text.count(old)}")
    mir_out.write_text(text.replace(old, "define dso_local void @__do_fini()", 1), encoding="utf-8", newline="\n")


def percentile(values, p):
    values = sorted(values)
    return values[max(0, int((p * len(values) + 0.999999999)) - 1)]


def main():
    OUT.mkdir(parents=True, exist_ok=True)
    base_mir = OUT / "baseline_public.mir"; cand_mir = OUT / "candidate_public.mir"
    make_public(SRC / "common_prera.mir", base_mir)
    make_public(SITE / "candidate.mir", cand_mir)
    harness_obj = OUT / "harness.o"
    hc = run([str(CLANG), "--target=x86_64-unknown-linux-gnu", "-c", str(HARNESS), "-o", str(harness_obj)])
    arms = {}
    for name, mir in (("baseline", base_mir), ("candidate", cand_mir)):
        obj = OUT / f"{name}.o"; elf = OUT / f"{name}.elf"
        writer = run([str(LLC), str(mir), "-mtriple=x86_64-unknown-linux-gnu", "-O2", "-start-before=greedy",
                      "-emit-call-site-info", "-experimental-debug-variable-locations=true", "-debugger-tune=lldb",
                      "-dwarf-version=5", "-verify-machineinstrs", "-filetype=obj", "-o", str(obj)])
        linker = run([str(LLD), "-m", "elf_x86_64", "-e", "_start", "-o", str(elf), str(obj), str(harness_obj)]) if writer["exit"] == 0 and hc["exit"] == 0 else {"exit": -1, "wall_seconds": 0, "stdout": "", "stderr": "not run"}
        warmups = []
        repeats = []
        if linker["exit"] == 0:
            for _ in range(3): warmups.append(run([str(BLINK), str(elf)]))
            for _ in range(30): repeats.append(run([str(BLINK), str(elf)]))
        walls = [x["wall_seconds"] for x in repeats]
        arms[name] = {
            "mir_sha256": sha(mir), "writer": writer, "linker": linker,
            "object_sha256": sha(obj) if obj.exists() else None,
            "elf_sha256": sha(elf) if elf.exists() else None,
            "warmup_exits": [x["exit"] for x in warmups], "repeat_exits": [x["exit"] for x in repeats],
            "stdout_nonempty": any(x["stdout"] for x in warmups + repeats),
            "stderr_nonempty": any(x["stderr"] for x in warmups + repeats),
            "latency_seconds": None if not walls else {"n": len(walls), "p50": statistics.median(walls), "p90_nearest_rank": percentile(walls, .9), "min": min(walls), "max": max(walls)},
        }
    pass_behavior = hc["exit"] == 0 and all(
        arms[name]["writer"]["exit"] == 0 and arms[name]["linker"]["exit"] == 0 and
        arms[name]["warmup_exits"] == [0, 0, 0] and arms[name]["repeat_exits"] == [0] * 30 and
        not arms[name]["stdout_nonempty"] and not arms[name]["stderr_nonempty"]
        for name in ("baseline", "candidate")
    )
    result = {
        "schema": "site02-executed-linux-sysv-behavior-v1", "site_index": 2, "function": "__do_fini",
        "behavior_control_change": "LINKAGE_ONLY_INTERNAL_TO_GLOBAL_FOR_EXTERNAL_HARNESS__SAME_FOR_BOTH_ARMS",
        "harness_sha256": sha(HARNESS), "harness_compile": hc,
        "runner_sha256": sha(BLINK), "repetitions_per_arm": 30, "arms": arms,
        "behavior_equivalence": "PASS" if pass_behavior else "FAIL",
        "latency_claim": "CONTROL_ONLY_BLINK_WALL_TIME__NOT_NATIVE_CYCLES",
    }
    RESULT.write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(result, indent=2))
    raise SystemExit(0 if pass_behavior else 2)


if __name__ == "__main__":
    main()
