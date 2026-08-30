#!/usr/bin/env python3
"""Bridge one DP-selected native retention action into ordinary greedy RA.

The call-argument copy is expanded into a native %2 -> EBX -> EDI retention
path before RA/PEI.  The module, computed value, CFG, call regmask and debug
records remain unchanged; PEI must discover/save/restore RBX and emit CFI.
All output must pass the native verifier and reader checks.
"""

from __future__ import annotations

import hashlib
import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "witness" / "current_union_prera.mir"
TARGET = ROOT / "witness" / "candidate_rbx_prera.mir"
RECORD = ROOT / "witness" / "candidate_hint_record.json"


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest().upper()


def main() -> None:
    original = SOURCE.read_text(encoding="utf-8")
    needle = "$edi = COPY %2, debug-location !30"
    replacement = "$ebx = COPY %2, debug-location !30\n    $edi = COPY $ebx, debug-location !30"
    if original.count(needle) != 1:
        raise RuntimeError("frozen call-argument copy not unique")
    changed = original.replace(needle, replacement)
    location_needle = "- { bb: 1, offset: 4, fwdArgRegs:"
    location_replacement = "- { bb: 1, offset: 5, fwdArgRegs:"
    if changed.count(location_needle) != 1:
        raise RuntimeError("frozen call-site location not unique")
    changed = changed.replace(location_needle, location_replacement)
    TARGET.write_text(changed, encoding="utf-8", newline="\n")
    record = {
        "schema": "candidate-native-location-bridge-v1",
        "source": SOURCE.relative_to(ROOT).as_posix(),
        "source_sha256": digest(SOURCE.read_bytes()),
        "target": TARGET.relative_to(ROOT).as_posix(),
        "target_sha256": digest(TARGET.read_bytes()),
        "only_change": "call_argument_COPY_percent2_to_EDI_expanded_as_percent2_to_EBX_to_EDI_with_matching_callsite_offset_update",
        "semantic_value_CFG_call_regmask_debug_records_changed": False,
        "post_emission_patch": False
    }
    RECORD.write_text(json.dumps(record, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(json.dumps(record, separators=(",", ":")))


if __name__ == "__main__":
    main()
