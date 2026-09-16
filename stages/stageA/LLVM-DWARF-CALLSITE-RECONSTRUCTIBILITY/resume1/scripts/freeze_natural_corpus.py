#!/usr/bin/env python3
"""Freeze the first 30 eligible natural compiler-rt call-cut sites by a result-blind rule."""

from __future__ import annotations

import hashlib
import json
import re
import shutil
import subprocess
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
COMMIT = "e72ba6cf366a3180cbf5a8690d9e50665880ab76"
BUILTINS = ROOT / "src" / f"llvm-project-{COMMIT}" / "compiler-rt" / "lib" / "builtins"
CLANG = ROOT / "build" / "bin" / "clang.exe"
LLC = ROOT / "build" / "bin" / "llc.exe"
OUT = ROOT / "inputs" / "natural_corpus"
WORK = ROOT / "results" / "natural_corpus_eligibility"
ARG_REGS = {"rdi", "edi", "di", "dil", "rsi", "esi", "si", "sil", "rdx", "edx", "dx", "dl", "rcx", "ecx", "cx", "cl", "r8", "r8d", "r8w", "r8b", "r9", "r9d", "r9w", "r9b"}


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest().upper()


def run(args: list[str]) -> tuple[int, str]:
    p = subprocess.run(args, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    return p.returncode, p.stdout.decode("utf-8", errors="replace")


def find_site(text: str):
    for doc in re.split(r"(?m)^---\s*$", text):
        name_match = re.search(r"(?m)^name:\s+(.+?)\s*$", doc)
        if not name_match or "callSites:" not in doc or "body:" not in doc:
            continue
        function = name_match.group(1).strip(" '\"")
        call_region = doc.split("callSites:", 1)[1].split("debugValueSubstitutions:", 1)[0]
        lines = call_region.splitlines()
        sites = []
        current = None
        for line in lines:
            m = re.search(r"- \{ bb: (\d+), offset: (\d+), fwdArgRegs:", line)
            if m:
                current = {"bb": int(m.group(1)), "offset": int(m.group(2)), "arg_regs": []}
                sites.append(current)
                continue
            m = re.search(r"- \{ arg: (\d+), reg: '\$([^']+)'", line)
            if m and current is not None:
                current["arg_regs"].append({"arg": int(m.group(1)), "reg": m.group(2).lower()})
        body = doc.split("body:", 1)[1]
        for site in sites:
            if site["bb"] == 0:
                continue
            block_match = re.search(
                rf"(?ms)^  bb\.{site['bb']}\.[^:]*:\s*(.*?)(?=^  bb\.\d+\.|\Z)", body
            )
            if not block_match:
                continue
            block = block_match.group(1)
            for arg in site["arg_regs"]:
                if arg["reg"] not in ARG_REGS:
                    continue
                copy = re.search(rf"(?m)^\s*\${re.escape(arg['reg'])}\s*=\s*COPY\s+(%\d+)", block, re.IGNORECASE)
                if copy and "CALL" in block[copy.end():]:
                    return {
                        "function": function,
                        "bb": site["bb"],
                        "offset": site["offset"],
                        "arg": arg["arg"],
                        "arg_reg": arg["reg"],
                        "source_vreg": copy.group(1),
                    }
    return None


def main() -> int:
    OUT.mkdir(parents=True, exist_ok=True)
    WORK.mkdir(parents=True, exist_ok=True)
    candidates = sorted(BUILTINS.glob("*.c"), key=lambda p: p.name.lower())
    selected = []
    audit = []
    for source in candidates:
        stem = source.stem
        bc = WORK / f"{stem}.bc"
        mir = WORK / f"{stem}.mir"
        clang_args = [
            str(CLANG), "--target=x86_64-unknown-linux-gnu", "-O2", "-g",
            "-fno-omit-frame-pointer", "-ffreestanding", "-fno-builtin",
            "-fno-stack-protector", "-I", str(BUILTINS), "-emit-llvm", "-c",
            str(source), "-o", str(bc),
        ]
        ce, cout = run(clang_args)
        entry = {"source": source.name, "source_sha256": sha256(source), "clang_exit": ce}
        if ce != 0:
            entry["failure_head"] = cout[:500]
            audit.append(entry)
            continue
        llc_args = [
            str(LLC), str(bc), "-mtriple=x86_64-unknown-linux-gnu", "-O2",
            "-emit-call-site-info", "-experimental-debug-variable-locations=true",
            "-stop-before=greedy", "-verify-machineinstrs", "-o", str(mir),
        ]
        le, lout = run(llc_args)
        entry["llc_exit"] = le
        if le != 0:
            entry["failure_head"] = lout[:500]
            audit.append(entry)
            continue
        site = find_site(mir.read_text(encoding="utf-8", errors="replace"))
        entry["eligible"] = site is not None
        audit.append(entry)
        if site is None:
            bc.unlink(missing_ok=True)
            mir.unlink(missing_ok=True)
            continue
        index = len(selected) + 1
        prefix = f"n{index:02d}_{stem}"
        out_bc = OUT / f"{prefix}.bc"
        out_mir = OUT / f"{prefix}.mir"
        shutil.move(str(bc), out_bc)
        shutil.move(str(mir), out_mir)
        selected.append({
            "index": index,
            "source_relpath": f"compiler-rt/lib/builtins/{source.name}",
            "source_sha256": sha256(source),
            "license": "Apache-2.0-WITH-LLVM-exception",
            "site": site,
            "bitcode": str(out_bc.relative_to(ROOT)).replace("\\", "/"),
            "bitcode_sha256": sha256(out_bc),
            "prera_mir": str(out_mir.relative_to(ROOT)).replace("\\", "/"),
            "prera_mir_sha256": sha256(out_mir),
        })
        print(f"selected {index}/30 {source.name} {site}", flush=True)
        if len(selected) == 30:
            break
    result = {
        "schema": "llvm-dwarf-natural-corpus-freeze-v1",
        "selection_rule": "lexicographically_first_30_root_compiler_rt_builtin_C_translation_units_that_exact_clang_compiles_and_whose_exact_pre_greedy_MIR_has_a_computed_virtual_value_copied_to_a_SysV_integer_argument_at_a_non_entry_call_site",
        "selection_is_result_blind": True,
        "source_commit": COMMIT,
        "source_archive_sha256": "643B7011C512E3204C88F836F4E2A9913C20F03D1BEA5421B60EACB7B527814C",
        "candidate_or_union_results_inspected_for_selection": False,
        "selected_count": len(selected),
        "selected": selected,
        "eligibility_audit": audit,
    }
    (OUT / "corpus_freeze.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"selected_count": len(selected), "examined": len(audit)}, indent=2))
    return 0 if len(selected) == 30 else 3


if __name__ == "__main__":
    raise SystemExit(main())
