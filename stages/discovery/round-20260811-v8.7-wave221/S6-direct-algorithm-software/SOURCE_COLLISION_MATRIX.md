# Source and collision matrix

| Purpose | First-party source | Supported point | Boundary |
|---|---|---|---|
| Standard semantics | [DWARF Version 5 standard](https://dwarfstd.org/dwarf5std.html) | `.debug_names` replaces earlier pubname indexes; names refer to index-entry sequences and may use an optional hash table. | Does not state LLVM writer union or novelty. |
| Normative layout | [DWARF 5 PDF](https://dwarfstd.org/doc/DWARF5.pdf) | Name-index section, DIE relation, per-CU/per-module organization. | No current producer behavior. |
| Native reader | [LLVM `DWARFDebugNames`](https://llvm.org/doxygen/classllvm_1_1DWARFDebugNames.html) | Reader has units with header and CU/local/foreign TU lists. | Not a whole writer audit. |
| Native writer substrate | [LLVM `AccelTable` source](https://llvm.org/doxygen/AccelTable_8h_source.html) | Names, entries, hashes, buckets, and DebugNames abbreviations already exist in a native abstraction. | Exact revision/path/config union must be pinned. |
| Verification oracle | [llvm-dwarfdump guide](https://www.llvm.org/docs/CommandGuide/llvm-dwarfdump.html) | `--debug-names`, `--find`, `--verify`, and structural section parsing. | Does not establish semantic equivalence alone. |

## Collision result

No collision-free finding is claimed. LLVM's existing accelerator-table machinery is a strong same-object comparator. A future review must first pin current producer paths/options and search primary same-object layout/planning work; otherwise an alleged residual could be direct absorption or routine emission engineering.
