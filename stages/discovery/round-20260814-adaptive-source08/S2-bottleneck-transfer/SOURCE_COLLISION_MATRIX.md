# Source and collision matrix — Source08 R18V2

| Family | First-party/current source snapshot | Strongest same-object union | Collision result | Disposition |
|---|---|---|---|---|
| X86 stack-clash frame/probe/register | Clang command reference; LLVM CodeGenerator; current LLVM Doxygen X86FrameLowering::emitStackProbe, PrologEpilogInserter, RegAllocGreedy; LLVM Project stack-clash design blog | Clang options + X86 frame/probe emitter + prolog/epilog insertion + greedy RA + stock assembler/linker at equal flags | No bounded-source evidence of the proposed joint finite-state Pareto construction. Components are comparator; no absence claim. Stage 0 must pin exact commit and reconstruct alternatives. | PROPOSE_STAGE0__FINITE_FIDELITY_GAP |
| CFI byte-array/basic-block-section | Clang CFI design; LLVM BasicBlockSections.cpp; Clang basic-block-section reference | CFI metadata/jump-table + section clustering/list + linker reorder | Remainder is generic profile/layout packing; no target-specific guarantee frozen. | DROP__GENERIC_LAYOUT_REMAINDER |
| SanitizerCoverage depth | Clang SanitizerCoverage docs | instrumentation + callback threshold | only selector named | NOT_ADMITTED_UNFROZEN |
| SafeStack | LLVM Stack Safety Analysis docs | SafeStack analysis union | native partition action absorbed | DIRECT_SUBTRACT |
| GCC split stack | GCC instrumentation docs | split-stack/clash union | same-object semantics fail | DROP |
| ThinLTO | LLVM LTO docs/history | current ThinLTO union | historical repeat | EXCLUDED_REPEATED |

## Locators

- https://clang.llvm.org/docs/ClangCommandLineReference.html
- https://llvm.org/docs/CodeGenerator.html
- https://llvm.org/doxygen/classllvm_1_1X86FrameLowering.html
- https://llvm.org/docs/doxygen/PrologEpilogInserter_8cpp.html
- https://llvm.org/doxygen/RegAllocGreedy_8cpp_source.html
- https://blog.llvm.org/posts/2021-01-05-stack-clash-protection/
- https://clang.llvm.org/docs/ControlFlowIntegrityDesign.html
- https://llvm.org/docs/doxygen/BasicBlockSections_8cpp_source.html

No absence conclusion uses an issue, future-work statement, or old documentation.
