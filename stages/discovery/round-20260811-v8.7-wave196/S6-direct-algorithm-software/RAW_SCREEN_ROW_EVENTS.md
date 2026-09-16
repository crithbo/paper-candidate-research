# Raw screen row events

| Row | First-party evidence checked | Exact residual question | Result |
|---|---|---|---|
| R1 | LLVM `DIE.cpp` / `DIE.h` current source renderings | Does LLVM already identify identical abbreviation declarations? | Yes. `DIEAbbrev::Profile` includes tag, children flag, and every attribute/form (including implicit-constant data); `DIEAbbrevSet` is a FoldingSet-backed structural deduplicator. |
| R2 | LLVM AsmPrinter and `DIE.cpp` source renderings | Are dictionary declarations and code emission merely abstract format freedoms? | No. LLVM emits actual abbreviation declaration codes and DIE references using ULEB, while declarations emit tag/children/attribute-form pairs. This is the native direct subtractor. |
| R3 | DWARF v5 standard | Can reassigning legal nonzero abbreviation codes preserve reader-visible meaning? | Yes in principle: a code denotes an abbreviation declaration, and `0` terminates a sibling list. Any rewritten declaration/code references must obey the table and form constraints. |
| R4 | LLVM debug and command documentation | Is the writer/configuration union closed for all CU/type-unit/split-DWARF/debug-kind paths? | No. Relevant producer paths and defaults/non-default flags require a source-pinned enumeration before any absence claim. |
| R5 | Official LLVM and DWARF materials; bounded primary-paper search | Is there a current primary direct collision for a joint LLVM abbrev dictionary/scope/code planner? | No direct same-object collision was located in this bounded pass. This is not evidence that none exists; collision closure remains open. |

No raw row was promoted solely because DWARF permits a different serialization.
