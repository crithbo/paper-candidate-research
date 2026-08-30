# Raw screen row events

| Row | First-party evidence | Frozen fact / action implication | Outcome |
|---|---|---|---|
| R1 | DWARF v5 standard | `.debug_names` is a name-index section; it contains names and index entries, may have a hash table, and supports per-CU or per-module index organization. | retain for depth |
| R2 | LLVM `DWARFDebugNames` documentation | The reader treats the section as one or more units with a header and CU/local-TU/foreign-TU lists. | retain for depth |
| R3 | LLVM `AccelTable` source documentation | LLVM has a native accelerator-table abstraction with names, entries, hashes, buckets, and debug-names abbreviation objects. | retain for depth |
| R4 | `llvm-dwarfdump` current guide | `--debug-names`, `--find`, and `--verify` give a stock parsing/lookup/structural-verification route. | retain for depth |
| R5 | Current-source/collision closure | Writer/linker source revision, complete option union, output mode selection, and direct same-object planner collision were not fully pinned. | `NOT_ADMITTED_UNFROZEN` |

No absence claim is drawn from R5. Earlier review discussion or format freedom is not evidence that current LLVM lacks a complete construction action.
