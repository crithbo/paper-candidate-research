# Current-upstream reality check — S81-RQ-01

Frozen observation date: 2026-08-15. Upstream snapshot is `llvm-project/main` as observed through the official raw source URLs; no immutable commit SHA was resolved in this bounded Discovery pass.

| Facet | Current evidence | Consequence |
|---|---|---|
| Compiler entry | LLVM RISC-V guide says `-mrelax` annotations are enabled by default; `-mno-relax` disables them | candidate must retain relaxable inputs |
| Linker flags | `Driver.cpp` parses `--relax` default true and `--relax-gp` default false | fair baseline must include both default and explicitly enabled `--relax-gp` |
| Native action | `RISCV.cpp` uses the resolved `riscvGlobalPointer` and signed 12-bit displacement to rewrite eligible relocations | stock LLD implements the rewrite; it is not evidence of a GP/data-layout optimizer |
| Semantic limits | official guide/spec require medlow, static position-dependent executable, suitable x3/gp use, one GP, and initialisation before accesses | candidate cannot alter ABI, use multiple GPs, or change loader/reader semantics |
| Contrary evidence | fixed-current-ISA GP/data co-layout algorithm and direct same-object literature have not been independently closed | bounded closure debt, not an absence assertion |

This check supports no claim that LLD lacks every possible layout action. It only records the observed stock flags and rewrite semantics. An immutable commit and an independent direct-collision audit remain required before any brief.
