#!/usr/bin/env python3
"""Native BLOCKINFO-versus-immediate scope legality/equivalence witness."""

from __future__ import annotations

import argparse
import copy
import hashlib
import importlib.util
import json
import pathlib
import subprocess
import sys
from typing import Any


def load_codec(path: pathlib.Path) -> Any:
    spec = importlib.util.spec_from_file_location("scope_codec", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def canonical_ir(path: pathlib.Path) -> str:
    lines = path.read_text(encoding="utf-8").splitlines()
    if lines and lines[0].startswith("; ModuleID = "):
        lines = lines[1:]
    return sha(("\n".join(lines).strip() + "\n").encode())


def emit_wrapper(codec: Any, parent: Any, parent_width: int, block_id: int,
                 code_width: int, body: bytes) -> None:
    parent.emit(codec.ENTER_SUBBLOCK, parent_width)
    parent.vbr(block_id, 8)
    parent.vbr(code_width, 4)
    parent.align32()
    parent.emit(len(body) // 4, 32)
    parent.align32()
    parent.append_aligned(body)


def emit_original(codec: Any, parent: Any, parent_width: int, block: Any) -> None:
    child = codec.BitWriter()
    active = list(block.inherited_abbrevs)
    for item in block.items:
        if isinstance(item, codec.Define):
            codec.emit_abbrev(child, block.code_width, item.abbrev)
            if block.block_id != codec.BLOCKINFO_BLOCK_ID:
                active.append(item.abbrev)
        elif isinstance(item, codec.Block):
            emit_original(codec, child, block.code_width, item)
        elif isinstance(item, codec.Record):
            abbrev = None
            if item.abbrev_id != codec.UNABBREV_RECORD:
                abbrev = active[item.abbrev_id - codec.FIRST_APPLICATION_ABBREV]
            codec.emit_record(child, block.code_width, item, item.abbrev_id, abbrev)
    child.emit(codec.END_BLOCK, block.code_width)
    emit_wrapper(codec, parent, parent_width, block.block_id, block.code_width, child.bytes())


def make_scoped(codec: Any, blocks: list[Any]) -> bytes:
    module_index = next(i for i, b in enumerate(blocks) if b.block_id == 8)
    module0 = blocks[module_index]
    direct_vsts = [
        x for x in module0.items
        if isinstance(x, codec.Block) and x.block_id == 14
    ]
    if not direct_vsts:
        raise RuntimeError("expected a module-level VALUE_SYMTAB")
    original_vst = direct_vsts[-1]
    local_defs = [x for x in original_vst.items if isinstance(x, codec.Define)]
    records = [x for x in original_vst.items if isinstance(x, codec.Record)]
    if len(local_defs) != 1 or len(records) != 1:
        raise RuntimeError("frozen witness expects one local VST definition and FNENTRY")
    shared = local_defs[0].abbrev

    blocks = copy.deepcopy(blocks)
    module = blocks[module_index]
    blockinfos = [
        x for x in module.items
        if isinstance(x, codec.Block) and x.block_id == codec.BLOCKINFO_BLOCK_ID
    ]
    if len(blockinfos) != 1:
        raise RuntimeError("scope witness requires the ordinary MODULE BLOCKINFO")
    blockinfo = blockinfos[0]

    # Move the final module VST's 34-bit (at BLOCKINFO CodeLen=2) grammar into
    # the existing block-14 group.  Preserve all block-12 IDs by replacing its
    # unused final 79-bit ID-21 grammar with a legal duplicate 47-bit grammar.
    # Net +2 bits consumes two of the original six END_BLOCK padding bits, so
    # BLOCKINFO remains 34 words and every frozen VST/FNENTRY offset is stable.
    long_last = next((
        item for item in blockinfo.items
        if isinstance(item, codec.Define)
        and item.blockinfo_target == 12
        and item.assigned_id == 21
        and item.end_bit - item.start_bit == 79
    ), None)
    short_unused = next((
        item for item in blockinfo.items
        if isinstance(item, codec.Define)
        and item.blockinfo_target == 12
        and item.end_bit - item.start_bit == 47
    ), None)
    if long_last is None or short_unused is None:
        raise RuntimeError("frozen BLOCKINFO capacity witness shape not found")
    replacement = codec.Define(
        copy.deepcopy(short_unused.abbrev), long_last.assigned_id, 0, 0, 12
    )
    blockinfo.items[blockinfo.items.index(long_last)] = replacement
    last_vst_define_index = max(
        i for i, item in enumerate(blockinfo.items)
        if isinstance(item, codec.Define) and item.blockinfo_target == 14
    )
    blockinfo.items.insert(
        last_vst_define_index + 1,
        codec.Define(copy.deepcopy(shared), 8, 0, 0, 14),
    )

    vsts = [
        x for x in module.items
        if isinstance(x, codec.Block) and x.block_id == 14
    ]
    vst = vsts[-1]
    vst.inherited_abbrevs = list(vst.inherited_abbrevs) + [copy.deepcopy(shared)]
    vst.items = [x for x in vst.items if not isinstance(x, codec.Define)]

    writer = codec.BitWriter()
    writer.buf.extend(b"BC\xc0\xde")
    for block in blocks:
        emit_original(codec, writer, 2, block)
    return writer.bytes()


def run(command: list[str]) -> dict[str, Any]:
    proc = subprocess.run(command, capture_output=True, text=True, timeout=60)
    return {
        "command": command, "returncode": proc.returncode,
        "stdout": proc.stdout, "stderr": proc.stderr,
    }


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--codec", required=True, type=pathlib.Path)
    ap.add_argument("--input", required=True, type=pathlib.Path)
    ap.add_argument("--llvm-bin", required=True, type=pathlib.Path)
    ap.add_argument("--output-dir", required=True, type=pathlib.Path)
    args = ap.parse_args()
    args.output_dir.mkdir(parents=True, exist_ok=True)
    codec = load_codec(args.codec.resolve())
    _, blocks = codec.parse_file(args.input)
    before_trace = codec.semantic_document(blocks)["canonical_sha256"]
    data = make_scoped(codec, blocks)
    output = args.output_dir / "blockinfo_scope.bc"
    ll = args.output_dir / "blockinfo_scope.ll"
    output.write_bytes(data)
    reparsed = codec.Parser(data).parse()
    after_trace = codec.semantic_document(reparsed)["canonical_sha256"]
    checks = {
        "bcanalyzer": run([
            str(args.llvm_bin / "llvm-bcanalyzer.exe"),
            "-disable-histogram", str(output),
        ]),
        "llvm_dis": run([
            str(args.llvm_bin / "llvm-dis.exe"), str(output), "-o", str(ll),
        ]),
        "opt_verify": run([
            str(args.llvm_bin / "opt.exe"), "-passes=verify",
            "-disable-output", str(output),
        ]),
    }
    baseline_ll = args.output_dir / "baseline.ll"
    baseline_dis = run([
        str(args.llvm_bin / "llvm-dis.exe"), str(args.input),
        "-o", str(baseline_ll),
    ])
    result = {
        "schema": "llvm-native-scope-witness-v1",
        "input_sha256": sha(args.input.read_bytes()),
        "output_sha256": sha(data),
        "input_bytes": args.input.stat().st_size,
        "output_bytes": len(data),
        "atomic_mapping": [
            "MODULE-contained BLOCKINFO",
            "move final module VST grammar from immediate scope to existing BLOCKINFO block-14 group",
            "replace unused final block-12 ID-21 grammar with legal shorter duplicate",
            "preserve every earlier application ID and BLOCKINFO word length",
            "remove immediate VST DEFINE_ABBREV",
            "assign unchanged FNENTRY record to inherited ID 8",
        ],
        "before_trace_sha256": before_trace,
        "after_trace_sha256": after_trace,
        "trace_equal": before_trace == after_trace,
        "canonical_decoded_ir_equal": (
            ll.exists() and baseline_ll.exists()
            and canonical_ir(ll) == canonical_ir(baseline_ll)
        ),
        "baseline_dis": baseline_dis,
        "native_checks": checks,
        "all_native_checks_pass": (
            baseline_dis["returncode"] == 0
            and all(row["returncode"] == 0 for row in checks.values())
        ),
        "nonclaim_role": "PRE_CLAIM_NATIVE_SCOPE_LEGALITY_EQUIVALENCE_WITNESS",
    }
    result_path = args.output_dir / "NATIVE_SCOPE_WITNESS.json"
    result_path.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({
        "trace_equal": result["trace_equal"],
        "canonical_decoded_ir_equal": result["canonical_decoded_ir_equal"],
        "all_native_checks_pass": result["all_native_checks_pass"],
        "result": str(result_path),
    }, sort_keys=True))
    return 0 if (
        result["trace_equal"] and result["canonical_decoded_ir_equal"]
        and result["all_native_checks_pass"]
    ) else 2


if __name__ == "__main__":
    raise SystemExit(main())
