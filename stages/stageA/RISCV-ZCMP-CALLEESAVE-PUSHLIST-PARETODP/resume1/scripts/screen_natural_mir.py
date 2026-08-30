#!/usr/bin/env python3
"""Apply the frozen, result-independent natural MIR eligibility rule."""

from __future__ import annotations

import argparse
import hashlib
import json
import re
from pathlib import Path

from zcmp_frontier_planner import discover_one_call_interface


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest().upper()


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--input-dir", required=True)
    ap.add_argument("--eligible-dir", required=True)
    ap.add_argument("--out", required=True)
    ap.add_argument("--max-w", type=int, default=4)
    ap.add_argument("--module-manifest")
    args = ap.parse_args()
    input_dir = Path(args.input_dir)
    eligible_dir = Path(args.eligible_dir)
    eligible_dir.mkdir(parents=True, exist_ok=True)
    discovered_modules = sorted(input_dir.glob("*.mir"))
    selected_modules = discovered_modules
    manifest_sha256 = None
    if args.module_manifest:
        manifest_path = Path(args.module_manifest)
        manifest = json.loads(manifest_path.read_text(encoding="utf-8-sig"))
        allowed = {Path(row["module"]).stem for row in manifest["rows"] if row["success"]}
        selected_modules = [module for module in discovered_modules if module.stem in allowed]
        missing = sorted(allowed - {module.stem for module in selected_modules})
        if missing:
            raise ValueError(f"manifest modules missing pregreedy MIR: {missing}")
        manifest_sha256 = sha256(manifest_path)
    rows = []
    for module in selected_modules:
        text = module.read_text(encoding="utf-8")
        header_match = re.match(r"(?ms)\A(--- \|.*?^\.\.\.\s*$)", text)
        if not header_match:
            rows.append({"module": str(module), "function": None,
                         "eligible": False, "reason": "missing_ir_header"})
            continue
        header = header_match.group(1)
        docs = re.findall(r"(?ms)^---\s*\nname:.*?^\.\.\.\s*$", text[header_match.end():])
        for doc in docs:
            name_match = re.search(r"(?m)^name:\s+(.+?)\s*$", doc)
            name = name_match.group(1).strip("'\"") if name_match else "unknown"
            body_match = re.search(r"(?ms)^body:\s*\|\s*\n(.*?)^\.\.\.\s*$", doc)
            bb_count = (len(re.findall(r"(?m)^\s{2}bb\.[^:]*:", body_match.group(1)))
                        if body_match else 0)
            call_count = doc.count("PseudoCALL")
            reason = "eligible"
            values: tuple[str, ...] = ()
            if bb_count != 1:
                reason = f"basic_block_count_{bb_count}"
            elif call_count != 1:
                reason = f"pseudo_call_count_{call_count}"
            else:
                try:
                    values = discover_one_call_interface(header + "\n" + doc)
                    if not (1 <= len(values) <= args.max_w):
                        reason = f"interface_width_{len(values)}"
                except ValueError as exc:
                    reason = "interface_parse_" + re.sub(r"[^A-Za-z0-9]+", "_", str(exc)).strip("_")
            eligible = reason == "eligible"
            out_path = None
            if eligible:
                safe_name = re.sub(r"[^A-Za-z0-9_.-]+", "_", name)
                out_path = eligible_dir / f"{module.stem}__{safe_name}.mir"
                out_path.write_text(header + "\n" + doc + "\n", encoding="utf-8")
            rows.append({
                "module": str(module),
                "module_sha256": sha256(module),
                "function": name,
                "basic_block_count": bb_count,
                "pseudo_call_count": call_count,
                "interface_values": values,
                "interface_width": len(values),
                "eligible": eligible,
                "reason": reason,
                "eligible_mir": str(out_path) if out_path else None,
                "eligible_mir_sha256": sha256(out_path) if out_path else None,
            })
    payload = {
        "schema": "embench-natural-eligibility-v1",
        "input_module_count": len(selected_modules),
        "discovered_module_count": len(discovered_modules),
        "module_manifest_sha256": manifest_sha256,
        "function_count": len(rows),
        "eligible_count": sum(1 for row in rows if row["eligible"]),
        "max_w": args.max_w,
        "result_independent_rule": True,
        "rows": rows,
    }
    Path(args.out).write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
