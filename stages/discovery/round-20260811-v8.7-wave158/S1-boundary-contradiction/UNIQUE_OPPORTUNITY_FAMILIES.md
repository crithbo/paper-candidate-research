# UNIQUE_OPPORTUNITY_FAMILIES

## VOLT/Vortex compiler--runtime boundary

The exact object is a fixed OpenCL/CUDA kernel and its Vortex execution under one frozen hardware/configuration profile—not a new GPU target, different source semantics, hardware change, or external dispatcher. The fixed guarantee is source-level observable result equivalence together with the selected Vortex profile's runtime/ISA contract.

The candidate witness is genuine at the compiler boundary: divergent work-items require a choice of lowering representation. But the current first-party union already contains both the end-to-end front ends and the mechanism that makes the choice meaningful: VOLT extends PoCL and CuPBoP, extends LLVM with SIMT-aware IR optimizations, and augments LLVM-RISC-V for Vortex ISA support. The paper specifically identifies centralized SIMT analyses/optimizations as its contribution. Thus merely offering a different divergence policy, pass order, or configuration choice is inside the existing union or is forbidden tuning.

Result: one unique family, zero union-external complete actions.
