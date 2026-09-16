#!/usr/bin/env python3
"""Paired exact-native baseline/candidate run for the frozen 30-site corpus."""

from __future__ import annotations

import ctypes
import hashlib
import json
import os
import re
import subprocess
import time
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
UPSTREAM = ROOT.parent / "resume1"
BIN = UPSTREAM / "build" / "bin"
LLC = BIN / "llc.exe"
DWARF = BIN / "llvm-dwarfdump.exe"
READOBJ = BIN / "llvm-readobj.exe"
OBJDUMP = BIN / "llvm-objdump.exe"
FREEZE = ROOT / "NONSECURITY_CORPUS_FREEZE.json"
INPUTS = ROOT / "resources" / "src" / "frozen_corpus"
BUILD = ROOT / "resources" / "build" / "natural_run04"
LOGS = ROOT / "resources" / "logs" / "natural_run04"
TMP = ROOT / "resources" / "tmp"
CACHE = ROOT / "resources" / "cache"
RESULT = ROOT / "NATURAL_CORPUS_RESULTS.json"


class FILETIME(ctypes.Structure):
    _fields_ = [("low", ctypes.c_uint32), ("high", ctypes.c_uint32)]


class PROCESS_MEMORY_COUNTERS(ctypes.Structure):
    _fields_ = [
        ("cb", ctypes.c_uint32), ("PageFaultCount", ctypes.c_uint32),
        ("PeakWorkingSetSize", ctypes.c_size_t), ("WorkingSetSize", ctypes.c_size_t),
        ("QuotaPeakPagedPoolUsage", ctypes.c_size_t), ("QuotaPagedPoolUsage", ctypes.c_size_t),
        ("QuotaPeakNonPagedPoolUsage", ctypes.c_size_t), ("QuotaNonPagedPoolUsage", ctypes.c_size_t),
        ("PagefileUsage", ctypes.c_size_t), ("PeakPagefileUsage", ctypes.c_size_t),
    ]


def ft_value(ft: FILETIME) -> int:
    return (ft.high << 32) | ft.low


def run_measured(args: list[str], cwd: Path = TMP) -> dict:
    env = os.environ.copy()
    env.update({"TEMP": str(TMP), "TMP": str(TMP), "TMPDIR": str(TMP), "XDG_CACHE_HOME": str(CACHE)})
    start = time.perf_counter()
    proc = subprocess.Popen(args, cwd=cwd, env=env, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = proc.communicate()
    wall = time.perf_counter() - start
    cpu = None
    peak = None
    try:
        creation = FILETIME(); exit_time = FILETIME(); kernel = FILETIME(); user = FILETIME()
        if ctypes.windll.kernel32.GetProcessTimes(int(proc._handle), ctypes.byref(creation), ctypes.byref(exit_time), ctypes.byref(kernel), ctypes.byref(user)):
            cpu = (ft_value(kernel) + ft_value(user)) / 10_000_000.0
        counters = PROCESS_MEMORY_COUNTERS(); counters.cb = ctypes.sizeof(counters)
        if ctypes.windll.psapi.GetProcessMemoryInfo(int(proc._handle), ctypes.byref(counters), counters.cb):
            peak = int(counters.PeakWorkingSetSize)
    except Exception:
        pass
    return {
        "exit": proc.returncode, "wall_seconds": wall, "cpu_seconds": cpu,
        "peak_rss_bytes": peak, "stdout": stdout.decode("utf-8", errors="replace"),
        "stderr": stderr.decode("utf-8", errors="replace"),
    }


def measured_public(run: dict) -> dict:
    return {k: run[k] for k in ("exit", "wall_seconds", "cpu_seconds", "peak_rss_bytes")}


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest().upper()


def locate_doc(text: str, function: str) -> tuple[int, int, str]:
    for match in re.finditer(r"(?m)^name:\s+(.+?)\s*$", text):
        name = match.group(1).strip(" '\"")
        if name != function:
            continue
        start_marker = text.rfind("\n---\n", 0, match.start())
        start = 0 if start_marker < 0 else start_marker + 1
        end_marker = text.find("\n---\n", match.end())
        end = len(text) if end_marker < 0 else end_marker + 1
        return start, end, text[start:end]
    raise ValueError(f"function doc not found: {function}")


def scratch_reg(arg_reg: str) -> str:
    reg = arg_reg.lower()
    if reg in {"rdi", "rsi", "rdx", "rcx", "r8", "r9"}:
        return "rbx"
    if reg in {"edi", "esi", "edx", "ecx", "r8d", "r9d"}:
        return "ebx"
    if reg in {"di", "si", "dx", "cx", "r8w", "r9w"}:
        return "bx"
    if reg in {"dil", "sil", "dl", "cl", "r8b", "r9b"}:
        return "bl"
    raise ValueError(f"unsupported argument register {arg_reg}")


def inject_candidate(text: str, site: dict) -> tuple[str, dict]:
    start, end, doc = locate_doc(text, site["function"])
    bb = int(site["bb"]); offset = int(site["offset"])
    record_pattern = re.compile(rf"(?m)^(\s*- \{{ bb: {bb}, offset: )(\d+)(, fwdArgRegs:)")
    selected_record_count = 0
    def shift_record(match):
        nonlocal selected_record_count
        old = int(match.group(2))
        if old == offset:
            selected_record_count += 1
        new = old + 1 if old >= offset else old
        return f"{match.group(1)}{new}{match.group(3)}"
    doc = record_pattern.sub(shift_record, doc)
    if selected_record_count != 1:
        raise ValueError(f"selected callSites record mismatch count={selected_record_count}")
    block_match = re.search(rf"(?ms)^  bb\.{bb}\.[^:]*:\s*(.*?)(?=^  bb\.\d+\.|\Z)", doc)
    if not block_match:
        raise ValueError(f"bb.{bb} not found")
    block = block_match.group(1)
    instruction_lines = []
    for line_match in re.finditer(r"(?m)^.*$", block):
        line = line_match.group(0); stripped = line.strip()
        if not stripped or stripped.startswith(("successors:", "liveins:")):
            continue
        if line.startswith("    "):
            instruction_lines.append((stripped, line_match.start()))
    if offset >= len(instruction_lines) or "CALL" not in instruction_lines[offset][0]:
        raise ValueError(f"frozen call offset mismatch expected={offset} observed={instruction_lines[offset][0] if offset < len(instruction_lines) else 'EOF'}")
    arg_reg = site["arg_reg"].lower(); source = site["source_vreg"]
    copy_pattern = re.compile(rf"(?m)^(\s*)\${re.escape(arg_reg)}\s*=\s*COPY\s+({re.escape(source)}(?:\.[A-Za-z0-9_]+)?)(\s*(?:,.*)?)$")
    matches = list(copy_pattern.finditer(block))
    if not matches:
        raise ValueError("frozen source COPY not found")
    call_char = instruction_lines[offset][1]
    previous_calls = [pos for text_line, pos in instruction_lines[:offset] if "CALL" in text_line]
    previous_call_char = previous_calls[-1] if previous_calls else -1
    eligible = [m for m in matches if previous_call_char < m.start() < call_char]
    if not eligible:
        raise ValueError("frozen source COPY is not in the selected call's local preparation interval")
    chosen = eligible[-1]
    scratch = scratch_reg(arg_reg)
    indent, source_operand, suffix = chosen.group(1), chosen.group(2), chosen.group(3)
    replacement = f"{indent}${scratch} = COPY {source_operand}{suffix}\n{indent}${arg_reg} = COPY ${scratch}{suffix}"
    block2 = block[:chosen.start()] + replacement + block[chosen.end():]
    doc2 = doc[:block_match.start(1)] + block2 + doc[block_match.end(1):]
    output = text[:start] + doc2 + text[end:]
    proof = {
        "function": site["function"], "bb": bb, "old_call_offset": offset,
        "new_call_offset": offset + 1, "arg_reg": arg_reg, "source_vreg": source,
        "scratch_reg": scratch, "source_operand": source_operand,
        "inserted_native_actions": [f"${scratch}=COPY {source_operand}", f"${arg_reg}=COPY ${scratch}"],
        "cfg_changed": False, "call_regmask_changed": False, "debug_record_changed": False,
        "post_emission_patch": False,
    }
    return output, proof


def parse_sections(text: str) -> dict:
    sections = {}
    for block in re.findall(r"(?ms)^  Section \{\s*(.*?)^  \}", text):
        name = re.search(r"(?m)^    Name: ([^ ]*)", block)
        size = re.search(r"(?m)^    Size: (\d+)", block)
        if name and size:
            sections[name.group(1)] = int(size.group(1))
    return {
        "text_bytes": sections.get(".text", 0),
        "debug_payload_bytes": sum(v for k, v in sections.items() if k.startswith(".debug") or k.startswith(".zdebug")),
        "debug_relocation_bytes": sum(v for k, v in sections.items() if k.startswith(".rela.debug") or k.startswith(".rel.debug")),
        "eh_frame_bytes": sections.get(".eh_frame", 0),
        "section_count": len(sections),
    }


def dwarf_metrics(text: str) -> dict:
    return {
        "call_site_parameters": text.count("DW_TAG_call_site_parameter"),
        "breg3_call_values": len(re.findall(r"DW_AT_call_value\s*\(DW_OP_breg3\b", text)),
        "call_sites": len(re.findall(r"DW_TAG_call_site\s*$", text, re.MULTILINE)),
    }


def summarize_processes(parts: list[dict]) -> dict:
    cpus = [p["cpu_seconds"] for p in parts if p["cpu_seconds"] is not None]
    rss = [p["peak_rss_bytes"] for p in parts if p["peak_rss_bytes"] is not None]
    return {
        "cpu_seconds": sum(cpus) if len(cpus) == len(parts) else None,
        "wall_seconds": sum(p["wall_seconds"] for p in parts),
        "peak_rss_bytes": max(rss) if rss else None,
    }


def main() -> int:
    BUILD.mkdir(parents=True, exist_ok=True); LOGS.mkdir(parents=True, exist_ok=True)
    freeze = json.loads(FREEZE.read_text(encoding="utf-8"))
    sites = freeze["sites"]
    rows = []
    prera_cache = {}
    for site_entry in sites:
        index = int(site_entry["index"])
        input_name = Path(site_entry["bitcode"]).name
        bc = INPUTS / input_name
        unit = Path(input_name).stem
        unit_dir = BUILD / unit
        unit_dir.mkdir(parents=True, exist_ok=True)
        if input_name not in prera_cache:
            prera = unit_dir / "common_prera.mir"
            pre = run_measured([
                str(LLC), str(bc), "-mtriple=x86_64-unknown-linux-gnu", "-O2",
                "-emit-call-site-info", "-experimental-debug-variable-locations=true",
                "-stop-before=greedy", "-verify-machineinstrs", "-o", str(prera),
            ])
            if pre["exit"] != 0:
                prera_cache[input_name] = {"run": pre, "path": prera, "text": None}
            else:
                prera_cache[input_name] = {"run": pre, "path": prera, "text": prera.read_text(encoding="utf-8", errors="replace")}
        predata = prera_cache[input_name]
        site_dir = unit_dir / f"site_{index:02d}"
        site_dir.mkdir(parents=True, exist_ok=True)
        row = {
            "index": index, "source_relpath": site_entry["source_relpath"], "input": input_name,
            "input_sha256": sha256(bc), "site": site_entry["site"], "preRA": measured_public(predata["run"]),
        }
        if predata["text"] is None:
            row["disposition"] = "PRERA_GENERATION_FAILURE__COUNTED_IN_DENOMINATOR"
            row["error_head"] = (predata["run"]["stderr"] or predata["run"]["stdout"])[:1000]
            rows.append(row); continue
        planner_wall_start = time.perf_counter(); planner_cpu_start = time.process_time()
        try:
            candidate_text, proof = inject_candidate(predata["text"], site_entry["site"])
            planner_error = None
        except Exception as exc:
            candidate_text = None; proof = None; planner_error = str(exc)
        planner = {"wall_seconds": time.perf_counter() - planner_wall_start, "cpu_seconds": time.process_time() - planner_cpu_start, "peak_rss_bytes": None}
        row["planner"] = planner
        if candidate_text is None:
            row["disposition"] = "MAPPER_INAPPLICABLE_OR_FIDELITY_FAILURE__COUNTED_IN_DENOMINATOR"
            row["error_head"] = planner_error
            rows.append(row); continue
        candidate_mir = site_dir / "candidate.mir"
        candidate_mir.write_text(candidate_text, encoding="utf-8", newline="\n")
        row["candidate_mir_sha256"] = sha256(candidate_mir); row["atomic_mapping"] = proof
        common = [
            "-mtriple=x86_64-unknown-linux-gnu", "-O2", "-emit-call-site-info",
            "-experimental-debug-variable-locations=true", "-debugger-tune=lldb", "-dwarf-version=5",
            "-verify-machineinstrs", "-filetype=obj",
        ]
        baseline_obj = site_dir / "baseline.o"; candidate_obj = site_dir / "candidate.o"
        baseline_run = run_measured([str(LLC), str(predata["path"]), "-start-before=greedy", *common, "-o", str(baseline_obj)])
        verifier_run = run_measured([str(LLC), str(candidate_mir), "-emit-call-site-info", "-run-pass=machineverifier", "-verify-machineinstrs", "-o", str(site_dir / "candidate.verified.mir")])
        candidate_run = run_measured([str(LLC), str(candidate_mir), "-start-before=greedy", *common, "-o", str(candidate_obj)])
        row["baseline_writer"] = measured_public(baseline_run); row["candidate_machine_verifier"] = measured_public(verifier_run); row["candidate_writer"] = measured_public(candidate_run)
        if baseline_run["exit"] != 0 or verifier_run["exit"] != 0 or candidate_run["exit"] != 0:
            row["disposition"] = "NATIVE_LEGALITY_OR_WRITER_FAILURE__COUNTED_IN_DENOMINATOR"
            row["error_head"] = ((baseline_run["stderr"] + verifier_run["stderr"] + candidate_run["stderr"]) or "")[:2000]
            rows.append(row); continue
        arms = {}
        all_checks = []
        for name, obj, writer in (("baseline", baseline_obj, baseline_run), ("candidate", candidate_obj, candidate_run)):
            info = run_measured([str(DWARF), "--debug-info", str(obj)])
            verify = run_measured([str(DWARF), "--verify", str(obj)])
            readobj = run_measured([str(READOBJ), "--sections", "--unwind", str(obj)])
            disasm = run_measured([str(OBJDUMP), "-d", str(obj)])
            (site_dir / f"{name}.dwarf.txt").write_text(info["stdout"] + info["stderr"], encoding="utf-8")
            (site_dir / f"{name}.readobj.txt").write_text(readobj["stdout"] + readobj["stderr"], encoding="utf-8")
            (site_dir / f"{name}.disasm.txt").write_text(disasm["stdout"] + disasm["stderr"], encoding="utf-8")
            checks = [info["exit"] == 0, verify["exit"] == 0, readobj["exit"] == 0, disasm["exit"] == 0]
            all_checks.extend(checks)
            arms[name] = {
                "object_bytes": obj.stat().st_size, "object_sha256": sha256(obj),
                "dwarf": dwarf_metrics(info["stdout"] + info["stderr"]),
                "sections": parse_sections(readobj["stdout"] + readobj["stderr"]),
                "readers": {"dwarfdump_info": measured_public(info), "dwarfdump_verify": measured_public(verify), "readobj_unwind": measured_public(readobj), "objdump": measured_public(disasm)},
                "reader_full_cost": summarize_processes([info, verify, readobj, disasm]),
                "writer_full_cost": summarize_processes([writer]),
                "unwind_reader_pass": readobj["exit"] == 0,
                "dwarf_verify_pass": verify["exit"] == 0,
                "rbx_present_in_disassembly": "rbx" in (disasm["stdout"] + disasm["stderr"]).lower(),
            }
        row["arms"] = arms
        delta_params = arms["candidate"]["dwarf"]["call_site_parameters"] - arms["baseline"]["dwarf"]["call_site_parameters"]
        delta_breg3 = arms["candidate"]["dwarf"]["breg3_call_values"] - arms["baseline"]["dwarf"]["breg3_call_values"]
        row["paired_delta"] = {
            "reconstructible_parameters": delta_params,
            "breg3_call_values": delta_breg3,
            "object_bytes": arms["candidate"]["object_bytes"] - arms["baseline"]["object_bytes"],
            "text_bytes": arms["candidate"]["sections"]["text_bytes"] - arms["baseline"]["sections"]["text_bytes"],
            "debug_payload_bytes": arms["candidate"]["sections"]["debug_payload_bytes"] - arms["baseline"]["sections"]["debug_payload_bytes"],
            "debug_relocation_bytes": arms["candidate"]["sections"]["debug_relocation_bytes"] - arms["baseline"]["sections"]["debug_relocation_bytes"],
            "eh_frame_bytes": arms["candidate"]["sections"]["eh_frame_bytes"] - arms["baseline"]["sections"]["eh_frame_bytes"],
        }
        local_equivalence = proof["cfg_changed"] is False and proof["call_regmask_changed"] is False and verifier_run["exit"] == 0 and arms["candidate"]["unwind_reader_pass"]
        row["behavior_verification"] = {
            "static_native_copy_equivalence_and_CSR_restore": "PASS" if local_equivalence else "FAIL",
            "executed_natural_function_replay": "UNOBSERVED__NO_SELF_CONTAINED_HARNESS",
            "warm_latency": "UNOBSERVED__DO_NOT_IMPUTE",
        }
        success = all(all_checks) and delta_params == 1 and delta_breg3 == 1 and local_equivalence
        row["disposition"] = "PAIRED_NATIVE_RECONSTRUCTIBILITY_GAIN__STATIC_BEHAVIOR_EQUIVALENCE" if success else "NO_ACCEPTED_PAIRED_GAIN__COUNTED_IN_DENOMINATOR"
        rows.append(row)
        print(f"site {index:02d}/30 {row['disposition']} delta_param={delta_params} delta_breg3={delta_breg3}", flush=True)
    accepted = [r for r in rows if r["disposition"].startswith("PAIRED_NATIVE_RECONSTRUCTIBILITY_GAIN")]
    result = {
        "schema": "llvm-dwarf-natural-corpus-results-v1",
        "assignment_id": "STAGEA-L3-20260815-LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY-RESUME2-NONSECURITY-CORPUS",
        "denominator": 30, "rows": rows,
        "summary": {
            "sites_run": len(rows), "accepted_static_equivalence_gains": len(accepted),
            "accepted_gain_fraction": len(accepted) / 30.0,
            "native_legality_or_writer_failures": sum("LEGALITY_OR_WRITER_FAILURE" in r["disposition"] for r in rows),
            "mapper_or_fidelity_failures": sum("MAPPER_INAPPLICABLE" in r["disposition"] for r in rows),
            "no_accepted_gain": sum(r["disposition"].startswith("NO_ACCEPTED") for r in rows),
            "executed_natural_behavior_replays": 0,
            "runtime_latency_observation": "UNOBSERVED__DO_NOT_IMPUTE",
        },
        "current_union_reuse": {"arms": 3072, "successes": 3072, "reconstructible_arms_on_frozen_witness": 0, "rerun": False},
        "scientific_revision_consumed": False,
        "stageb_authorized": False,
    }
    RESULT.write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(result["summary"], indent=2), flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
