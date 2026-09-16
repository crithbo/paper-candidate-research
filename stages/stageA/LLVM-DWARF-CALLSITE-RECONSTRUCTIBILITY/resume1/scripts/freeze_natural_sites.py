#!/usr/bin/env python3
"""Expand the result-blind natural freeze from translation units to ordered code sites."""

from __future__ import annotations

import hashlib
import json
import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CORPUS = ROOT / "inputs" / "natural_corpus" / "corpus_freeze.json"
ARG_REGS = {"rdi", "edi", "di", "dil", "rsi", "esi", "si", "sil", "rdx", "edx", "dx", "dl", "rcx", "ecx", "cx", "cl", "r8", "r8d", "r8w", "r8b", "r9", "r9d", "r9w", "r9b"}


def sha256(path: Path) -> str:
    h = hashlib.sha256(path.read_bytes()).hexdigest()
    return h.upper()


def find_sites(text: str):
    found = []
    for doc in re.split(r"(?m)^---\s*$", text):
        name_match = re.search(r"(?m)^name:\s+(.+?)\s*$", doc)
        if not name_match or "callSites:" not in doc or "body:" not in doc:
            continue
        function = name_match.group(1).strip(" '\"")
        call_region = doc.split("callSites:", 1)[1].split("debugValueSubstitutions:", 1)[0]
        sites = []
        current = None
        for line in call_region.splitlines():
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
            block_match = re.search(rf"(?ms)^  bb\.{site['bb']}\.[^:]*:\s*(.*?)(?=^  bb\.\d+\.|\Z)", body)
            if not block_match:
                continue
            block = block_match.group(1)
            for arg in site["arg_regs"]:
                if arg["reg"] not in ARG_REGS:
                    continue
                copy = re.search(rf"(?m)^\s*\${re.escape(arg['reg'])}\s*=\s*COPY\s+(%\d+)", block, re.IGNORECASE)
                if copy and "CALL" in block[copy.end():]:
                    found.append({
                        "function": function, "bb": site["bb"], "offset": site["offset"],
                        "arg": arg["arg"], "arg_reg": arg["reg"], "source_vreg": copy.group(1),
                    })
    return found


def main() -> int:
    base = json.loads(CORPUS.read_text(encoding="utf-8"))
    sites = []
    for unit in base["selected"]:
        mir_path = ROOT / unit["prera_mir"]
        for site in find_sites(mir_path.read_text(encoding="utf-8", errors="replace")):
            sites.append({
                "source_relpath": unit["source_relpath"],
                "source_sha256": unit["source_sha256"],
                "license": unit["license"],
                "bitcode": unit["bitcode"],
                "bitcode_sha256": unit["bitcode_sha256"],
                "prera_mir": unit["prera_mir"],
                "prera_mir_sha256": unit["prera_mir_sha256"],
                "site": site,
            })
    sites.sort(key=lambda x: (x["source_relpath"].lower(), x["site"]["function"], x["site"]["bb"], x["site"]["offset"], x["site"]["arg"]))
    # One parameter per natural call site, then deterministic round-robin by
    # translation unit. This prevents a large runtime file from monopolizing
    # the bounded corpus while remaining independent of candidate/union output.
    deduped = []
    seen_calls = set()
    for item in sites:
        call_key = (item["source_relpath"], item["site"]["function"], item["site"]["bb"], item["site"]["offset"])
        if call_key not in seen_calls:
            seen_calls.add(call_key)
            deduped.append(item)
    groups = {}
    for item in deduped:
        groups.setdefault(item["source_relpath"], []).append(item)
    frozen = []
    round_index = 0
    while len(frozen) < 30:
        added = False
        for source in sorted(groups, key=str.lower):
            if round_index < len(groups[source]):
                frozen.append(groups[source][round_index])
                added = True
                if len(frozen) == 30:
                    break
        if not added:
            break
        round_index += 1
    for index, site in enumerate(frozen, 1):
        site["index"] = index
    result = {
        "schema": "llvm-dwarf-natural-codesite-freeze-v1",
        "selection_rule": "one_lowest_arg_per_call_then_deterministic_round_robin_across_result_blind_exact_commit_compiler_rt_builtin_translation_units_ordered_by_source_function_bb_offset",
        "selection_is_result_blind": True,
        "source_commit": base["source_commit"],
        "source_archive_sha256": base["source_archive_sha256"],
        "candidate_or_union_results_inspected_for_selection": False,
        "translation_units": base["selected_count"],
        "eligible_sites_in_frozen_units": len(sites),
        "eligible_distinct_calls_in_frozen_units": len(deduped),
        "selected_site_count": len(frozen),
        "sites": frozen,
    }
    output = CORPUS.parent / "natural_sites_freeze.json"
    output.write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"translation_units": base["selected_count"], "eligible_sites": len(sites), "selected_sites": len(frozen), "sha256": sha256(output)}, indent=2))
    return 0 if len(frozen) == 30 else 3


if __name__ == "__main__":
    raise SystemExit(main())
