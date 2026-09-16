# Source and collision matrix

| Source | First-party status | What it supports | Collision / limit |
|---|---|---|---|
| [LLVM `DIE.cpp`](https://llvm.org/docs/doxygen/DIE_8cpp_source.html) | LLVM upstream source rendering | Structural abbreviation profile, declaration emission, and unique-abbreviation machinery. | Direct native subtractor for exact declaration dedup; does not by itself close every producer path or flag. |
| [LLVM `DIE.h`](https://www.llvm.org/doxygen/DIE_8h_source.html) | LLVM upstream source rendering | Declaration data include attribute/form and implicit constant; abbreviation is a FoldingSet node. | Confirms the profile is richer than tag-only grouping. |
| [LLVM AsmPrinter API](https://www.llvm.org/doxygen/classllvm_1_1AsmPrinter.html) | LLVM upstream documentation | Native abbreviation and DIE emission entry points. | Requires commit-pinned source follow-through before action-union completeness. |
| [LLVM `llvm-dwarfdump` guide](https://llvm.org/docs/CommandGuide/llvm-dwarfdump.html) | LLVM official documentation | `--verify` offers a stock validation route for DWARF structural consistency. | Verification is necessary but does not alone prove all consumer equivalence. |
| [LLVM source-level debugging documentation](https://llvm.org/docs/SourceLevelDebugging.html) | LLVM official documentation | DWARF producer/consumer context and natural LLVM debug workflow. | Does not establish a planning gap. |
| [DWARF Version 5 standard](https://dwarfstd.org/doc/DWARF5.pdf) | Official standard | Abbreviation-table/code and reader semantics; forms and legal encoding constraints. | Format freedom is not evidence of a union-external algorithm. |

## Latest direct collision status

Bounded primary-source searching did not identify a current paper or tool whose claimed object is a joint LLVM DWARF abbreviation-table scope/dictionary/code planner with the fixed decoded-DIE contract. This is recorded as `COLLISION_NOT_CLOSED`, not as a novelty conclusion. LLVM's existing structural deduplication is the closest direct native subtractor and is already included in the baseline union.
