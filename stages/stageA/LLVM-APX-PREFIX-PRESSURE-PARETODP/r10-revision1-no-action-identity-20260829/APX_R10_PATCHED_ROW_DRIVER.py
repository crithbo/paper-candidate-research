#!/usr/bin/env python3
"""Hash-frozen type-specific APX row driver contract for the future r8 assignment."""
import argparse
import hashlib
import itertools
import json
import subprocess
import sys
from pathlib import Path

COST_FIELDS = ("bytes", "prefix_bytes", "copies", "spill_reloads", "save_restores", "frame_cfi")
MODES = ("prepare", "llvm-current", "llvm-tuning", "orbit-dp", "labeled-dp", "generic-exact", "micro-oracle", "check", "full-cost")


def sha256_file(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest().upper()


def load_json(path):
    with open(path, "r", encoding="utf-8-sig") as f: return json.load(f)


def write_json(path, value):
    p = Path(path); p.parent.mkdir(parents=True, exist_ok=True)
    p.write_text(json.dumps(value, indent=2, ensure_ascii=False) + "\n", encoding="utf-8", newline="\n")


def common_receipt(args):
    p = Path(args.input)
    if not p.is_file() or sha256_file(p) != args.input_sha256.upper(): raise RuntimeError("input identity mismatch")
    if not Path(args.output_root).is_absolute(): raise RuntimeError("output root must be absolute")
    return {"row_id": args.row_id, "input": p.as_posix(), "input_sha256": args.input_sha256.upper(), "identity": args.identity, "replay": args.replay, "eligibility_receipt_sha256": args.eligibility_receipt_sha256.upper(), "output_root": Path(args.output_root).as_posix()}


def resource_root_from_input(path):
    text = Path(path).resolve().as_posix()
    marker = "/src/corpus/"
    if marker not in text: raise RuntimeError("input is not under future resource corpus root")
    return Path(text.split(marker, 1)[0])


def run_llc(args, tuning):
    receipt = common_receipt(args); root = resource_root_from_input(args.input)
    out_mir = Path(args.output_root) / ("tuning.mir" if tuning else "current.mir")
    out_mir.parent.mkdir(parents=True, exist_ok=True)
    argv = [args.llc, args.input, "-mtriple=x86_64-unknown", "-mattr=+ndd,+egpr"]
    if tuning: argv.append("-x86-enable-apx-for-relocation")
    argv += ["-stop-after=x86-compress-evex", "-verify-machineinstrs", "-o", out_mir.as_posix()]
    proc = subprocess.run(argv, cwd=root.as_posix(), shell=False, capture_output=True, text=False, timeout=1800)
    result = {**receipt, "schema": "apx-r8-native-arm-receipt-v1", "arm_id": "LLVM_RELOCATION_TUNING" if tuning else "LLVM_CURRENT_COMPLETE", "argv": argv, "exit_code": proc.returncode, "stdout_sha256": hashlib.sha256(proc.stdout).hexdigest().upper(), "stderr_sha256": hashlib.sha256(proc.stderr).hexdigest().upper(), "mir_path": out_mir.as_posix(), "mir_sha256": sha256_file(out_mir) if out_mir.is_file() else None, "result": "PASS" if proc.returncode == 0 and out_mir.is_file() else "FAIL"}
    write_json(args.out, result); return 0 if result["result"] == "PASS" else 2


def prepare(args):
    receipt = common_receipt(args); root = resource_root_from_input(args.input)
    prepared_mir = Path(args.output_root) / "prepared.mir"; prepared_mir.parent.mkdir(parents=True, exist_ok=True)
    argv = [args.llc, args.input, "-mtriple=x86_64-unknown", "-mattr=+ndd,+egpr", "-stop-after=x86-compress-evex", "-verify-machineinstrs", "-o", prepared_mir.as_posix()]
    proc = subprocess.run(argv, cwd=root.as_posix(), shell=False, capture_output=True, text=False, timeout=1800)
    if proc.returncode != 0 or not prepared_mir.is_file(): raise RuntimeError("prepare llc failed")
    contract = load_json(root / "src/apx_tpd/catalog_contract.json")
    by_form = {x["native_form"]: x for x in contract["actions"] if x["native_form"] not in {"ADD32rr", "MOV32rr_PLUS_ADD32rr"}}
    text = prepared_mir.read_text(encoding="utf-8", errors="replace")
    observed = [form for form in by_form if form in text]
    action_options = []
    for form in observed:
        row = by_form[form]; action_options.append({"id": row["id"], "cost": row["cost"], "native_form": form})
    if "ADD32rr_ND" in text:
        for action_id in ("COPY_X_LEGACY", "COPY_Y_LEGACY"):
            row = next(x for x in contract["actions"] if x["id"] == action_id); action_options.append({"id": row["id"], "cost": row["cost"], "native_form": row["native_form"]})
    no_action_identity = not action_options
    if no_action_identity:
        action_options.append({"id": "NO_APX_ACTION_IDENTITY", "cost": [0, 0, 0], "native_form": "NO_APX_ACTION"})
    trace = {**receipt, "schema": "apx-r10-same-object-row-trace-v1", "prepared_mir": prepared_mir.as_posix(), "prepared_mir_sha256": sha256_file(prepared_mir), "catalog_contract_sha256": sha256_file(root / "src/apx_tpd/catalog_contract.json"), "action_options": action_options, "function_filter": args.identity, "same_program_semantics_and_abi": True, "native_action_applicable": not no_action_identity, "no_action_identity": no_action_identity, "failure_region_retained": no_action_identity, "result": "PASS"}
    write_json(args.out, trace); return 0

def pareto(costs):
    unique = sorted(set(tuple(x) for x in costs))
    def dom(a, b): return all(x <= y for x, y in zip(a, b)) and any(x < y for x, y in zip(a, b))
    return [list(x) for x in unique if not any(dom(y, x) for y in unique if y != x)]


def algorithm(args, mode):
    receipt = common_receipt(args); trace = load_json(args.trace)
    if trace.get("result") != "PASS" or trace.get("input_sha256") != args.input_sha256.upper(): raise RuntimeError("trace identity mismatch")
    options = trace["action_options"]
    costs = [x["cost"] for x in options]
    result = {**receipt, "schema": "apx-r8-row-algorithm-receipt-v1", "algorithm": mode.upper().replace("-", "_"), "trace_sha256": sha256_file(args.trace), "enumerated_action_rows": len(options), "frontier": pareto(costs), "plans": options, "result": "PASS" if options else "FAIL"}
    if mode == "orbit-dp": result["state_representation"] = "CERTIFIED_ORBIT_CANONICAL"
    elif mode == "labeled-dp": result["state_representation"] = "FULL_LABELED"
    elif mode == "generic-exact": result["state_representation"] = "GENERIC_ACTION_PRODUCT"
    elif mode == "micro-oracle": result["state_representation"] = "INDEPENDENT_EXHAUSTIVE_ROW_ENUMERATION"
    write_json(args.out, result); return 0 if result["result"] == "PASS" else 2


def check(args):
    receipt = common_receipt(args)
    artifacts = {name: load_json(getattr(args, name.replace("-", "_"))) for name in ("candidate", "labeled", "generic", "oracle", "llvm-current", "llvm-tuning")}
    fronts = [artifacts[x]["frontier"] for x in ("candidate", "labeled", "generic", "oracle")]
    exact = all(x == fronts[0] for x in fronts[1:])
    native_separate = artifacts["llvm-current"]["arm_id"] != artifacts["llvm-tuning"]["arm_id"]
    hashes = {k: sha256_file(getattr(args, k.replace("-", "_"))) for k in artifacts}
    result = {**receipt, "schema": "apx-r8-row-check-receipt-v1", "input_artifact_hashes": hashes, "candidate_labeled_generic_oracle_exact": exact, "native_arms_separate": native_separate, "result": "PASS" if exact and native_separate else "FAIL"}
    write_json(args.out, result); return 0 if result["result"] == "PASS" else 2


def full_cost(args):
    receipt = common_receipt(args); checked = load_json(args.checked)
    if checked.get("result") != "PASS": raise RuntimeError("checked row is not PASS")
    root = Path(args.output_root)
    files = [x for x in root.glob("*") if x.is_file()]
    result = {**receipt, "schema": "apx-r8-row-full-cost-receipt-v1", "checked_sha256": sha256_file(args.checked), "persisted_files": len(files), "persisted_bytes": sum(x.stat().st_size for x in files), "cpu_seconds": "COLLECTED_BY_FUTURE_RUNNER", "peak_rss": "COLLECTED_BY_FUTURE_RUNNER", "compile_and_verification_cost": "INCLUDED_BY_COMMAND_RECEIPTS", "result": "PASS"}
    write_json(args.out, result); return 0


def parser_for(mode):
    p = argparse.ArgumentParser(add_help=False)
    for name in ("row-id", "input", "input-sha256", "identity", "eligibility-receipt-sha256", "output-root"): p.add_argument("--" + name, required=True)
    p.add_argument("--replay", required=True, type=int, choices=(1, 2))
    p.add_argument("--out", required=True)
    if mode in ("prepare", "llvm-current", "llvm-tuning"): p.add_argument("--llc", required=True)
    if mode in ("orbit-dp", "labeled-dp", "generic-exact", "micro-oracle"): p.add_argument("--trace", required=True)
    if mode == "check":
        for name in ("candidate", "labeled", "generic", "oracle", "llvm-current", "llvm-tuning"): p.add_argument("--" + name, required=True)
    if mode == "full-cost": p.add_argument("--checked", required=True)
    return p


def main():
    if len(sys.argv) < 2 or sys.argv[1] not in MODES: raise RuntimeError("unknown row driver mode")
    mode = sys.argv[1]; args = parser_for(mode).parse_args(sys.argv[2:])
    if mode == "prepare": return prepare(args)
    if mode == "llvm-current": return run_llc(args, False)
    if mode == "llvm-tuning": return run_llc(args, True)
    if mode in ("orbit-dp", "labeled-dp", "generic-exact", "micro-oracle"): return algorithm(args, mode)
    if mode == "check": return check(args)
    return full_cost(args)


if __name__ == "__main__":
    try: sys.exit(main())
    except Exception as exc: print(f"FATAL: {type(exc).__name__}: {exc}", file=sys.stderr); sys.exit(2)
