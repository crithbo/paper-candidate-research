#!/usr/bin/env python3
"""Generate two native post-RA plans from one frozen semantic call-cut input.

This is the executable tiny instance of the bounded call-cut constructor.  It
enumerates the complete two-action location catalog, retains ABI/CFI/source
class state, and emits native MIR before the ordinary LLVM verifier/writer.
It does not edit emitted objects or DWARF.
"""

from __future__ import annotations

import hashlib
import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
OFFICIAL = ROOT / "src" / "llvm-project-e72ba6cf366a3180cbf5a8690d9e50665880ab76" / "llvm" / "test" / "DebugInfo" / "MIR" / "X86" / "debug-call-site-param.mir"
CONTRACT = ROOT / "inputs" / "witness_contract.json"
OUT = ROOT / "witness"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest().upper()


def module_prefix(text: str) -> str:
    begin = text.index("--- |")
    end = text.index("\n...", begin) + len("\n...")
    return text[begin:end] + "\n"


def plan_doc(register: str) -> str:
    if register == "rax":
        body = """  bb.0.entry:
    successors: %bb.1(0x80000000)
    liveins: $edi, $esi

    frame-setup PUSH64r undef $rax, implicit-def $rsp, implicit $rsp
    CFI_INSTRUCTION def_cfa_offset 16
    JMP_1 %bb.1

  bb.1:
    liveins: $edi, $esi

    renamable $eax = MOV32rr $edi, implicit-def $rax, debug-location !24
    renamable $eax = ADD32rr renamable $eax, $esi, implicit-def dead $eflags, implicit-def $rax, debug-location !24
    $edi = MOV32rr $eax, debug-location !24
    CALL64pcrel32 @foo, csr_64, implicit $rsp, implicit $ssp, implicit $edi, implicit-def $rsp, implicit-def $ssp, debug-location !24
    $rax = frame-destroy POP64r implicit-def $rsp, implicit $rsp, debug-location !24
    CFI_INSTRUCTION def_cfa_offset 8, debug-location !24
    RET64 debug-location !24
"""
    elif register == "rbx":
        body = """  bb.0.entry:
    successors: %bb.1(0x80000000)
    liveins: $edi, $esi, $rbx

    frame-setup PUSH64r killed $rbx, implicit-def $rsp, implicit $rsp
    CFI_INSTRUCTION def_cfa_offset 16
    CFI_INSTRUCTION offset $rbx, -16
    JMP_1 %bb.1

  bb.1:
    liveins: $edi, $esi

    renamable $ebx = MOV32rr $edi, implicit-def $rbx, debug-location !24
    renamable $ebx = ADD32rr renamable $ebx, $esi, implicit-def dead $eflags, implicit-def $rbx, debug-location !24
    $edi = MOV32rr $ebx, debug-location !24
    CALL64pcrel32 @foo, csr_64, implicit $rsp, implicit $ssp, implicit $edi, implicit-def $rsp, implicit-def $ssp, debug-location !24
    $rbx = frame-destroy POP64r implicit-def $rsp, implicit $rsp, debug-location !24
    CFI_INSTRUCTION def_cfa_offset 8, debug-location !24
    RET64 debug-location !24
"""
    else:
        raise ValueError(register)

    return """---
name:            baa
tracksRegLiveness: true
callSites:
  - { bb: 1, offset: 3, fwdArgRegs:
      - { arg: 0, reg: '$edi' } }
body:             |
""" + body + "\n...\n"


def main() -> None:
    contract = json.loads(CONTRACT.read_text(encoding="utf-8"))
    assert contract["llvm_commit"] == "e72ba6cf366a3180cbf5a8690d9e50665880ab76"
    base = module_prefix(OFFICIAL.read_text(encoding="utf-8"))
    OUT.mkdir(parents=True, exist_ok=True)
    emitted = {}
    for action in contract["actions"]:
        register = action["location"].lower()
        path = OUT / f"plan_{register}.mir"
        path.write_text(base + plan_doc(register), encoding="utf-8", newline="\n")
        emitted[action["id"]] = {
            "path": path.relative_to(ROOT).as_posix(),
            "sha256": sha256(path),
            "state": {
                "location": action["location"],
                "alias_and_clobber": "csr_64_call_cut",
                "frame_cfi": "saved_CSR" if action["csr_save_restore"] else "alignment_only",
                "source_class": action["source_class"],
                "entry_value_eligible": False,
                "expected_reconstructible": action["expected_reconstructible"]
            }
        }
    record = {
        "schema": "tiny-bounded-call-cut-constructor-v1",
        "official_template": OFFICIAL.relative_to(ROOT).as_posix(),
        "official_template_sha256": sha256(OFFICIAL),
        "contract_sha256": sha256(CONTRACT),
        "complete_action_count": len(contract["actions"]),
        "emitted": emitted
    }
    (OUT / "constructor_record.json").write_text(json.dumps(record, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(json.dumps(record, separators=(",", ":")))


if __name__ == "__main__":
    main()
