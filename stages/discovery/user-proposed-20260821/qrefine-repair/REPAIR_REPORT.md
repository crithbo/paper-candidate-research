# QRefine-Triton-W4A16: two targeted repairs

## 1. Single verifier-input boundary

The sole verifier input is now frozen as **LLVM-dialect MLIR text immediately after `pm.run(mod, "make_llir")` and immediately before `llvm.to_module(mod, context)`**. It is not the returned LLVM IR string, PTX, AMDGCN, cubin, or HSACO.

The capture locus is the frozen Triton v3.7.1 NVIDIA `CUDABackend.make_llir` and AMD `HIPBackend.make_llir` function at that program point, one capture per target lowering. The NVIDIA source at the frozen commit shows `pm.run(..., "make_llir")`, followed by `llvm.to_module`; the current official AMD backend has the same phase boundary. The default capture route does not enable ASan, IR-extract debug passes, custom instrumentation, or `DISABLE_LLVM_OPT`; any such non-default route is excluded from the first-stage object unless independently frozen.

This fixes the earlier ambiguous phrase “post-`make_llir` target MLIR”: the accepted object is the MLIR module at the specified pre-conversion instant. The TCB still includes parsing that text, the future frozen solver, and all vendor/binary generation after the boundary. No binary-level claim is made.

## 2. vLLM W4A16 anchor role

The frozen vLLM `triton_w4a16.py` path is a **packing/shape and real-kernel anchor only**. It identifies the relevant int4 packing family (eight nibbles in an `int32`, shifts 0 through 28) and supplies a natural kernel context. It is **not** a legal performance comparator for the frozen proof grammar.

Accordingly, this package makes no coverage claim for `tl.dot`, tensor-core paths, WMMA, MFMA, or any other excluded operation. A legal Stage-A performance comparator must itself compile a schedule admitted by the frozen grammar, retain the same W4A16 object and targets, and be evaluated under the frozen full-cost contract. The executable operational interpreter is a semantic oracle, not a performance baseline.

## Repair decision

`READY_FOR_INDEPENDENT_STAGE0`. The repairs eliminate the two stated ambiguity defects without asserting proof success, an existing collision result, a detected bug, or performance improvement. Independent Stage 0 must still assess novelty/collision, Q2/Q1 shape, and the adequacy of the future Stage-A comparator construction.
