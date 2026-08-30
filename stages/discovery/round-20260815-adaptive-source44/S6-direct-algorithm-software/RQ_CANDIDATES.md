# Same-object RQ convergence

## RQ-01 — X86 AVX/SSE transition-cleanliness

For a fixed MachineFunction, ABI, subtarget and call semantics, can a target-specific whole-function constructor select a valid `vzeroupper` placement plan with a formal transition-cost/size guarantee that is not already expressible by LLVM's current `X86InsertVZeroUpper` state propagation and insertion pass?

## RQ-02 — R600 ALU-clause formation

For a fixed R600 MachineFunction and ISA semantics, can a target-specific constructor choose legal ALU-clause boundaries with a non-generic guarantee beyond the current marker-and-consecutive-clause merge path?

## RQ-03 — AArch64 condition-code reuse

For a fixed AArch64 MachineFunction and condition semantics, can a whole-function compare/condition rewrite constructor give a target-specific bound beyond LLVM's current condition optimiser?

All three preserve the same target program and stock semantic oracle. Their decisive current native source loci expose direct action absorption before raw admission; therefore none advances beyond the RQ routing point.
