# Source / collision / action-space matrix

Frozen cutoff: `2026-08-09`. Sources are the DWARF standard and official LLVM documents/upstream source.

| Source | Frozen factual role | Action/interface consequence | Disposition |
|---|---|---|---|
| DWARF v5 standard: <https://dwarfstd.org/doc/DWARF5.pdf> | Defines the line-number-program state machine and standard/special/extended operations. | Same-function means the ordered decoded line-row matrix and sequence boundaries are unchanged. | `FORMAL_ORACLE` |
| Current LLVM upstream source, observed 2026-08-09: <https://raw.githubusercontent.com/llvm/llvm-project/main/llvm/lib/MC/MCDwarf.cpp> | `MCDwarfLineTable::emitOne` walks line entries; `MCDwarfLineAddr::encode` computes per-delta encoding and selects special, const-add-PC+special, or advance-PC paths. `MCDwarfLineStr::getFinalizedData` finalizes strings in order. | Current native emitter is the strongest executable comparator. The potential “global line-opcode planner” has no action beyond the exact state transitions already fixed at each emitted row. | `DIRECT_SUBTRACT__CURRENT_ACTION_INTERFACE_ABSORPTION` |
| LLVM `llvm-dwarfdump` current command guide: <https://www.llvm.org/docs/CommandGuide/llvm-dwarfdump.html> | `--verify` validates DWARF structure; `--debug-line` dumps the table and `--lookup` queries address mapping. | Finite native fidelity oracle, had a residual existed. | `NATIVE_VERIFIER` |
| LLVM Test-Suite guide: <https://llvm.org/docs/TestSuiteGuide.html> | Public natural compiler inputs/artifact route. | Natural input is available but does not create an action residual. | `NATURAL_ROUTE` |

## Complete strongest union

The fair union is current Clang/LLVM `-g` emission for the same target/DWARF version, `MCDwarfLineTable::emitOne`, `MCDwarfLineAddr::encode`, standard opcode table parameters, line-string finalization, and native `llvm-dwarfdump` validation. Relevant configuration dimensions are target `min_instruction_length`, DWARF version, split/non-split table choice, address size, and producer-provided line entries. None expresses a different full state sequence while retaining the same decoded rows; choosing one is not an absence-based residual.

## Explicit drops

- Cross-row state/order/grammar planner: `DROP_DECOMPOSES_TO_CURRENT_PER_ROW_TRANSITIONS`.
- Removing/coalescing/reordering rows or sequence boundaries: `DROP_CHANGED_DEBUGGER_SEMANTICS_GUARANTEE`.
- Changing string order: `DROP_ZERO_BYTE_OBJECTIVE_UNDER_FIXED_WIDTH_REFS`.
- New opcode micro-case or LEB tweak: `DROP_LOCAL_EMITTER_PATCH`.
- External compression, postprocessor, or wrapper: `DROP_CHANGED_NATIVE_READER_FULL_COST`.
