#!/usr/bin/env python3
"""Freeze 30 distinct natural optimized-debug functions before candidate evaluation."""

from __future__ import annotations

import hashlib
import json
import re
import shutil
import subprocess
from pathlib import Path

from freeze_natural_sites import find_sites


ROOT = Path(__file__).resolve().parents[1]
COMMIT = "e72ba6cf366a3180cbf5a8690d9e50665880ab76"
CLANG = ROOT / "build" / "bin" / "clang.exe"
LLC = ROOT / "build" / "bin" / "llc.exe"
CORPUS = ROOT / "inputs" / "natural_corpus"
BUILTINS_FREEZE = CORPUS / "corpus_freeze.json"
MUSL = ROOT / "resources" / "musl-src" / "musl-1.2.5"
MUSL_GEN = ROOT / "resources" / "musl-build" / "include"
WORK = ROOT / "results" / "musl_eligibility"


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest().upper()


def run(args: list[str]) -> tuple[int, str]:
    p = subprocess.run(args, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    return p.returncode, p.stdout.decode("utf-8", errors="replace")


def first_site_per_function(items: list[dict]) -> list[dict]:
    items.sort(key=lambda x: (x["source_relpath"].lower(), x["site"]["function"], x["site"]["bb"], x["site"]["offset"], x["site"]["arg"]))
    out = []
    seen = set()
    for item in items:
        key = (item["source_relpath"], item["site"]["function"])
        if key not in seen:
            seen.add(key)
            out.append(item)
    return out


def main() -> int:
    CORPUS.mkdir(parents=True, exist_ok=True)
    WORK.mkdir(parents=True, exist_ok=True)
    builtins = json.loads(BUILTINS_FREEZE.read_text(encoding="utf-8"))
    builtin_sites = []
    for unit in builtins["selected"]:
        mir = ROOT / unit["prera_mir"]
        for site in find_sites(mir.read_text(encoding="utf-8", errors="replace")):
            builtin_sites.append({
                "source_collection": "llvm_compiler_rt_builtins",
                "source_relpath": unit["source_relpath"], "source_sha256": unit["source_sha256"],
                "license": unit["license"], "bitcode": unit["bitcode"],
                "bitcode_sha256": unit["bitcode_sha256"], "prera_mir": unit["prera_mir"],
                "prera_mir_sha256": unit["prera_mir_sha256"], "site": site,
            })
    selected = first_site_per_function(builtin_sites)
    audit = []
    musl_sources = sorted((MUSL / "src").rglob("*.c"), key=lambda p: p.relative_to(MUSL).as_posix().lower())
    for source in musl_sources:
        if len(selected) >= 30:
            break
        rel = source.relative_to(MUSL).as_posix()
        safe = re.sub(r"[^A-Za-z0-9]+", "_", rel).strip("_")
        bc = WORK / f"{safe}.bc"
        mir = WORK / f"{safe}.mir"
        args = [
            str(CLANG), "--target=x86_64-unknown-linux-gnu", "-O2", "-g",
            "-fno-omit-frame-pointer", "-ffreestanding", "-fno-builtin", "-fno-stack-protector",
            "-I", str(MUSL_GEN), "-I", str(MUSL / "arch" / "x86_64"),
            "-I", str(MUSL / "arch" / "generic"), "-I", str(MUSL / "src" / "include"),
            "-I", str(MUSL / "include"), "-emit-llvm", "-c", str(source), "-o", str(bc),
        ]
        ce, cout = run(args)
        entry = {"source_relpath": rel, "source_sha256": sha256(source), "clang_exit": ce}
        if ce != 0:
            entry["failure_head"] = cout[:500]
            audit.append(entry)
            continue
        le, lout = run([
            str(LLC), str(bc), "-mtriple=x86_64-unknown-linux-gnu", "-O2", "-emit-call-site-info",
            "-experimental-debug-variable-locations=true", "-stop-before=greedy", "-verify-machineinstrs",
            "-o", str(mir),
        ])
        entry["llc_exit"] = le
        if le != 0:
            entry["failure_head"] = lout[:500]
            audit.append(entry)
            continue
        sites = first_site_per_function([
            {"source_relpath": rel, "site": site} for site in find_sites(mir.read_text(encoding="utf-8", errors="replace"))
        ])
        entry["eligible_distinct_functions"] = len(sites)
        audit.append(entry)
        if not sites:
            bc.unlink(missing_ok=True)
            mir.unlink(missing_ok=True)
            continue
        unit_index = len({x["bitcode"] for x in selected if x["source_collection"] == "musl_1_2_5"}) + 1
        prefix = f"m{unit_index:02d}_{safe[:70]}"
        out_bc = CORPUS / f"{prefix}.bc"
        out_mir = CORPUS / f"{prefix}.mir"
        shutil.move(str(bc), out_bc)
        shutil.move(str(mir), out_mir)
        for site_item in sites:
            if len(selected) >= 30:
                break
            selected.append({
                "source_collection": "musl_1_2_5", "source_relpath": rel,
                "source_sha256": sha256(source), "license": "MIT",
                "bitcode": str(out_bc.relative_to(ROOT)).replace("\\", "/"),
                "bitcode_sha256": sha256(out_bc),
                "prera_mir": str(out_mir.relative_to(ROOT)).replace("\\", "/"),
                "prera_mir_sha256": sha256(out_mir), "site": site_item["site"],
            })
            print(f"selected function {len(selected)}/30 {rel}::{site_item['site']['function']}", flush=True)
    selected = selected[:30]
    for index, item in enumerate(selected, 1):
        item["index"] = index
    result = {
        "schema": "llvm-dwarf-natural-function-freeze-v1",
        "selection_rule": "first_distinct_eligible_function_per_exact_commit_compiler_rt_builtin_source_then_lexicographically_first_distinct_eligible_musl_1_2_5_functions_until_30_each_with_first_non_entry_computed_integer_argument_call_site",
        "selection_is_result_blind": True,
        "candidate_or_union_results_inspected_for_selection": False,
        "function_count": len(selected),
        "distinct_function_count": len({(x["source_collection"], x["source_relpath"], x["site"]["function"]) for x in selected}),
        "llvm_source": {"commit": COMMIT, "archive_sha256": builtins["source_archive_sha256"], "license": "Apache-2.0-WITH-LLVM-exception"},
        "musl_source": {
            "version": "1.2.5", "official_url": "https://musl.libc.org/releases/musl-1.2.5.tar.gz",
            "verified_mirror_url": "https://sources.voidlinux.org/musl-1.2.5/musl-1.2.5.tar.gz",
            "bytes": 1080786, "sha256": "A9A118BBE84D8764DA0EA0D28B3AB3FAE8477FC7E4085D90102B8596FC7C75E4",
            "copyright_sha256": "F9BC4423732350EB0B3F7ED7E91D530298476F8FEC0C6C427A1C04ADE22655AF",
            "license": "MIT", "generated_alltypes_sha256": sha256(MUSL_GEN / "bits" / "alltypes.h"),
            "generated_syscall_sha256": sha256(MUSL_GEN / "bits" / "syscall.h"),
        },
        "functions": selected,
        "musl_eligibility_audit": audit,
    }
    output = CORPUS / "natural_functions_freeze.json"
    output.write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"function_count": len(selected), "distinct": result["distinct_function_count"], "sha256": sha256(output)}, indent=2))
    return 0 if len(selected) == 30 and result["distinct_function_count"] == 30 else 3


if __name__ == "__main__":
    raise SystemExit(main())
