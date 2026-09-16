# Source44 — RQ convergence before evidence

## RQ01 — RVV fixed-point rounding-state across calls

1. With a fixed RISC-V Vector target, vector calling convention, VLEN policy, call graph and bitwise fixed-point results, can an interprocedural constructor jointly choose `vxrm`/`vxsat` transition, register residency and spill boundaries with a target-specific cost/legality guarantee?
2. Does the construction differ from merely selecting a rounding mode, instruction scheduling, or a generic register allocator?
3. Can one legal caller→callee→caller trace force a different but same-result state path than independent local lowering?

Converged RQ: **For fixed RVV integer fixed-point programs and unchanged rounding/saturation results, is there a target-specific interprocedural state-transition construction that avoids redundant `vxrm`/`vxsat` transitions while remaining legal under the vector ABI and paying all code-size, spill and execution cost?**

Precommitted evidence order: official RISC-V vector specification → official RISC-V psABI → current LLVM RISC-V documentation/source locus.  Fallback is `NONE`: this is one source family, not a disjunctive engine choice.

## RQ02 — ELF IFUNC relocation/call-form commitment

1. With fixed ELF IFUNC resolver and observable selected implementation, can compiler/linker form selection change relocation grouping without changing loader semantics?
2. Is the action more than a linker flag, policy or resolver wrapper?

Converged RQ: **For a fixed ELF IFUNC binary and resolver semantics, is there a target-specific compiler/linker constructor with a non-generic relocation/call-cost guarantee?**

Precommitted evidence order: ELF gABI/psABI → glibc dynamic-loader documentation/source → current LLVM lld source.  This RQ is a control and will be discarded if it reduces to implementation selection or linker policy.
