# Discovery log — DISCOVERY-S6-20260809-V8.7-WAVE24

- Frozen cutoff: `2026-08-09`.
- Method: accepted discovery v2/v8.1 plus calibrated v8.6 fidelity-plan admission and v8.7 current-upstream reality check. The TLS-blocked two-axis v8.2r2 was not used.
- Scope: only this assignment directory was written; no experiment/benchmark, Stage 0/A/B directory, or main-control file was created or changed.

## Screened formal-natural object

LLVM-generated DWARF `.debug_line` programs were screened as a potential exact-state, native-verifier compression constructor. The formal object is the ordered line-table row matrix mapping machine addresses to source locations. DWARF v5 is the formal oracle; `llvm-dwarfdump --verify`, `--debug-line`, and `--lookup` are native validation routes. Natural artifacts would be ordinary `-g` LLVM-built programs.

## Current-union result

Current upstream `llvm/lib/MC/MCDwarf.cpp` is a direct subtractor. `MCDwarfLineTable::emitOne` iterates ordered mandatory `MCDwarfLineEntry` rows, establishes every observable file/column/discriminator/ISA/flag state, then calls `emitDwarfAdvanceLineAddr` for each address/line transition. `MCDwarfLineAddr::encode` already selects among special opcodes, `DW_LNS_const_add_pc` plus a special opcode, and `DW_LNS_advance_pc`, including LEB costs. A current-vs-absent implementation claim is not made; the source is evidence of the deployed algorithm.

Because a row emission makes the decoder state observable at that row, a purported global grammar/order planner cannot carry a different state across rows while preserving the same line matrix. It decomposes into the current per-transition opcode choice. Skipping/coalescing rows, resetting a sequence, or reordering addresses changes debugger line semantics/guarantee. String-table order changes no byte total for null-terminated unique strings under fixed-width references. Thus only local emitter changes remain, which are not N2 paper candidates.

## Result

`COMPLETE_ZERO_PROPOSALS`. This is a current-union/action-interface absorption disposition, not an experiment-derived performance conclusion and not a claim about all DWARF tooling.
