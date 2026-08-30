# Raw screen row events

| Row | First-party evidence | Frozen result |
|---|---|---|
| R1 | LLVM BOLT README | Current BOLT consumes a profile and exposes `-reorder-blocks=ext-tsp`, `-reorder-functions=cdsort`, `-split-functions`, `-split-all-cold`, `-split-eh`, and debug-update options. |
| R2 | LLVM BOLT README | Input constraints include supported ELF ISA, symbols/relocations, and no dependence on code-layout properties. |
| R3 | LLVM BOLT reordering source | Current BOLT contains multiple basic-block reorder algorithms, including ext-tsp. |
| R4 | LLVM branch-relaxation source | LLVM has native trampoline insertion/branch retargeting machinery. |
| R5 | Direct primary collision | BOLT, Improved Basic Block Reordering, and Codestitcher are direct same-object/interprocedural layout comparators. |
| R6 | Closure outcome | Current source has explicit multiscale primitives, but the complete commit-pinned pass ordering, flags, target-specific relaxation/island paths, and collision subtraction were not closed to prove a residual. |

R6 is an `UNFROZEN` state, not an absence or scientific STOP claim.
