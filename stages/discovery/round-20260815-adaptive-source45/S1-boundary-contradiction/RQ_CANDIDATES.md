# Source45 — pre-evidence RQ convergence

## RQ01 — x86 MXCSR and embedded rounding

Converged RQ: with a fixed x86-64 program, strict floating-environment endpoint and calling convention, can a target-specific interprocedural construction decide MXCSR transitions versus instruction-local rounding forms while preserving all observable results and floating exceptions?

Primary route: Intel x86 instruction documentation → LLVM/Clang floating-point environment documentation/source. Fallback: none.

## RQ02 — PowerPC MMA accumulator call boundary

Converged RQ: with a fixed PowerPC MMA program and ABI, can a target-specific whole-function constructor decide accumulator lifetime/spill/call boundaries with equal matrix results and a complete code/frame cost guarantee?

Primary route: Power ISA MMA documentation → LLVM PowerPC current documentation/source. Fallback: none.

## RQ03 — AArch64 SVE FFR call boundary

Converged RQ: with a fixed SVE fault-first program and ABI, can a target-specific construction preserve first-fault observations across a call boundary without changing memory-fault or vector-result semantics?

Primary route: Arm SVE/PCS documentation → LLVM AArch64 SVE source/documentation. Fallback: none.
