#!/usr/bin/env python3
"""Construct and verify the frozen native abbrev-ID width-step witness.

The script imports the paused trace codec read-only.  It changes only native
bitstream grammar metadata in the final STRTAB block: the expanded block and
record trace, record assignment, blob, and decoded module remain unchanged.
"""

from __future__ import annotations

import argparse
import copy
import hashlib
import importlib.util
import json
import pathlib
import subprocess
import sys
import time
from typing import Any


def load_codec(path: pathlib.Path) -> Any:
    spec = importlib.util.spec_from_file_location("paused_bitstream_lab", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import codec: {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def sha256_file(path: pathlib.Path) -> str:
    return sha256_bytes(path.read_bytes())


def canonical_ir_sha256(path: pathlib.Path) -> str:
    """Hash decoded IR after removing llvm-dis's filename-derived ModuleID."""
    lines = path.read_text(encoding="utf-8").splitlines()
    if lines and lines[0].startswith("; ModuleID = "):
        lines = lines[1:]
    canonical = ("\n".join(lines).strip() + "\n").encode("utf-8")
    return sha256_bytes(canonical)


def dummy_abbrev(codec: Any, literal: int) -> Any:
    # A legal but deliberately unused native grammar.  Different literals
    # make the four/five definitions byte-auditable without changing records.
    return codec.Abbrev([
        codec.AbbrevOp(literal=literal),
        codec.AbbrevOp(encoding=codec.VBR, data=6),
    ])


def emit_block_flexible(codec: Any, parent: Any, parent_width: int, block: Any) -> None:
    """Emit parsed items exactly, allowing a changed legal block word length."""
    child = codec.BitWriter()
    active = list(block.inherited_abbrevs)
    for item in block.items:
        if isinstance(item, codec.Define):
            codec.emit_abbrev(child, block.code_width, item.abbrev)
            if block.block_id != codec.BLOCKINFO_BLOCK_ID:
                expected = codec.FIRST_APPLICATION_ABBREV + len(active)
                if expected != item.assigned_id:
                    raise codec.FormatError(
                        f"definition ID drift: expected {expected}, got {item.assigned_id}"
                    )
                active.append(item.abbrev)
        elif isinstance(item, codec.Block):
            emit_block_flexible(codec, child, block.code_width, item)
        elif isinstance(item, codec.Record):
            abbrev = None
            if item.abbrev_id != codec.UNABBREV_RECORD:
                index = item.abbrev_id - codec.FIRST_APPLICATION_ABBREV
                if index < 0 or index >= len(active):
                    raise codec.FormatError(f"unavailable abbreviation {item.abbrev_id}")
                abbrev = active[index]
            codec.emit_record(child, block.code_width, item, item.abbrev_id, abbrev)
        else:
            raise codec.FormatError(f"unexpected item {type(item)}")
    child.emit(codec.END_BLOCK, block.code_width)
    child_bytes = child.bytes()

    parent.emit(codec.ENTER_SUBBLOCK, parent_width)
    parent.vbr(block.block_id, 8)
    parent.vbr(block.code_width, 4)
    parent.align32()
    parent.emit(len(child_bytes) // 4, 32)
    parent.align32()
    parent.append_aligned(child_bytes)


def reemit_flexible(codec: Any, blocks: list[Any]) -> bytes:
    writer = codec.BitWriter()
    writer.buf.extend(b"BC\xc0\xde")
    for block in blocks:
        emit_block_flexible(codec, writer, 2, block)
    return writer.bytes()


def construct_variant(codec: Any, source: pathlib.Path, definitions: int) -> tuple[bytes, dict[str, Any]]:
    if definitions not in (4, 5):
        raise ValueError("witness requires exactly four or five definitions")
    _, parsed = codec.parse_file(source)
    blocks = copy.deepcopy(parsed)
    strtabs = [b for b in blocks if b.block_id == 23]
    if len(strtabs) != 1:
        raise RuntimeError(f"expected one top-level STRTAB block, got {len(strtabs)}")
    block = strtabs[0]
    original_defs = [x for x in block.items if isinstance(x, codec.Define)]
    records = [x for x in block.items if isinstance(x, codec.Record)]
    if len(original_defs) != 1 or len(records) != 1 or records[0].abbrev_id != 4:
        raise RuntimeError("frozen witness expects one local ID-4 STRTAB blob grammar")

    new_defs = [copy.deepcopy(original_defs[0])]
    for index in range(1, definitions):
        new_defs.append(codec.Define(
            dummy_abbrev(codec, 40 + index),
            codec.FIRST_APPLICATION_ABBREV + index,
            0,
            0,
        ))
    block.code_width = max(2, (codec.FIRST_APPLICATION_ABBREV + definitions - 1).bit_length())
    block.items = new_defs + records
    output = reemit_flexible(codec, blocks)
    reparsed = codec.Parser(output).parse()
    return output, {
        "definitions": definitions,
        "highest_application_id": codec.FIRST_APPLICATION_ABBREV + definitions - 1,
        "block_code_width": block.code_width,
        "trace_sha256": codec.semantic_document(reparsed)["canonical_sha256"],
        "bytes": len(output),
        "sha256": sha256_bytes(output),
    }


def run_checked(command: list[str], timeout: int = 60) -> dict[str, Any]:
    start = time.perf_counter()
    proc = subprocess.run(command, capture_output=True, text=True, timeout=timeout)
    return {
        "command": command,
        "returncode": proc.returncode,
        "wall_seconds": time.perf_counter() - start,
        "stdout": proc.stdout,
        "stderr": proc.stderr,
    }


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--codec", required=True, type=pathlib.Path)
    ap.add_argument("--input", required=True, type=pathlib.Path)
    ap.add_argument("--llvm-bin", required=True, type=pathlib.Path)
    ap.add_argument("--output-dir", required=True, type=pathlib.Path)
    args = ap.parse_args()

    codec = load_codec(args.codec.resolve())
    args.output_dir.mkdir(parents=True, exist_ok=True)
    _, original_blocks = codec.parse_file(args.input)
    original_trace = codec.semantic_document(original_blocks)["canonical_sha256"]

    variants: list[dict[str, Any]] = []
    for count in (4, 5):
        data, row = construct_variant(codec, args.input, count)
        bc_path = args.output_dir / f"id_width_{count}_definitions.bc"
        ll_path = args.output_dir / f"id_width_{count}_definitions.ll"
        bc_path.write_bytes(data)
        checks = {
            "bcanalyzer": run_checked([
                str(args.llvm_bin / "llvm-bcanalyzer.exe"), "-disable-histogram", str(bc_path)
            ]),
            "llvm_dis": run_checked([
                str(args.llvm_bin / "llvm-dis.exe"), str(bc_path), "-o", str(ll_path)
            ]),
            "opt_verify": run_checked([
                str(args.llvm_bin / "opt.exe"), "-passes=verify", "-disable-output", str(bc_path)
            ]),
        }
        row["native_checks"] = checks
        row["decoded_ir_file_sha256"] = sha256_file(ll_path) if ll_path.exists() else None
        row["canonical_decoded_ir_sha256"] = (
            canonical_ir_sha256(ll_path) if ll_path.exists() else None
        )
        variants.append(row)

    result = {
        "schema": "llvm-native-id-width-step-witness-v1",
        "source": str(args.input.resolve()),
        "source_sha256": sha256_file(args.input),
        "source_bytes": args.input.stat().st_size,
        "frozen_trace_sha256": original_trace,
        "variants": variants,
        "step_observed": (
            variants[0]["block_code_width"] == 3
            and variants[1]["block_code_width"] == 4
        ),
        "trace_equal": all(v["trace_sha256"] == original_trace for v in variants),
        "decoded_ir_canonicalization": (
            "remove filename-derived leading '; ModuleID = ...' line; retain all IR"
        ),
        "decoded_ir_equal": len({v["canonical_decoded_ir_sha256"] for v in variants}) == 1,
        "all_native_checks_pass": all(
            check["returncode"] == 0
            for variant in variants
            for check in variant["native_checks"].values()
        ),
        "nonclaim_role": "PRE_CLAIM_LEGALITY_EQUIVALENCE_WITNESS",
    }
    out = args.output_dir / "ID_WIDTH_STEP_WITNESS.json"
    out.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({
        "step_observed": result["step_observed"],
        "trace_equal": result["trace_equal"],
        "decoded_ir_equal": result["decoded_ir_equal"],
        "all_native_checks_pass": result["all_native_checks_pass"],
        "result": str(out),
    }, sort_keys=True))
    return 0 if all([
        result["step_observed"], result["trace_equal"],
        result["decoded_ir_equal"], result["all_native_checks_pass"],
    ]) else 2


if __name__ == "__main__":
    raise SystemExit(main())
