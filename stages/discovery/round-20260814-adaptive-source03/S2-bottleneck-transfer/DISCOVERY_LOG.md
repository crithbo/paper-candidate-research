# S2 adaptive-source03 — canonical saturation-aware screen

Assignment DISCOVERY-S2-20260814-ADAPTIVE-SOURCE03 used canonical v8.7 potential/readiness separation. DISCOVERY_CLAIM_PACK_MODE=OFF; no V9 material was created. GlobalISel and every MLIR-vector family were excluded before source review.

## One-to-one opportunity telemetry

| row | unique cross-layer family | frozen same-object promise | primary disposition |
|---|---|---|---|
| F01 | GCC RISC-V Zicond conditional lowering ↔ branch/memory dependence | Same scalar GCC input, fixed RISC-V ISA/ABI and executable behavior; candidate would jointly choose legal conditional form and dependence-preserving schedule. | DROP__CURRENT_IFCONV_TARGET_COST_UNION_OR_GENERIC_SCHEDULING |
| F02 | LLVM AArch64 MOPS formation ↔ caller/codegen resource coupling | Same LLVM IR, AArch64 feature/ABI and executable behavior; candidate would jointly choose legal MOPS formation, live-register boundary and outline/inline form. | DROP__MOPS_SELECTION_AND_GENERIC_CODEGEN_COMPOSITION |
| F03 | Flang descriptor lowering ↔ runtime allocation/finalization | Same Fortran allocatable-assignment result, descriptor-visible state and finalization behavior; candidate would jointly choose descriptor materialization and runtime handoff. | NOT_ADMITTED_UNFROZEN__NO_TARGET_SPECIFIC_ALGORITHM_OR_CLOSED_UNION |
| F04 | HotSpot C2 escape/codegen ↔ G1 barrier/queue protocol | Same Java result, GC reachability and memory-model observations; candidate would jointly choose escape facts, barrier placement and queue materialization. | DROP__BARRIERSET_C2_ESCAPE_ANALYSIS_CURRENT_UNION_OR_CHANGED_GC_GUARANTEE |
| F05 | LLVM XRay compiler sleds ↔ runtime patch-map construction | Same instrumented-binary tracing contract; candidate would jointly choose target sled form, map placement and runtime patchability. | DROP__CURRENT_XRAY_FLAGS_SLEDS_RUNTIME_PATCH_UNION |
| F06 | LLVM stackmap/patchpoint lowering ↔ JIT patch runtime | Same patchpoint calling convention, live-value recovery and object behavior; candidate would jointly choose reservation, register locations and map encoding. | DROP__PATCHPOINT_STACKMAP_CONTRACT_AND_GENERIC_ALLOCATION |

Counts: raw=6; fresh unique=6; repeats=0; candidate-grade deep reviews=3 (F02/F03/F04); clean briefs=0. No row was replaced to chase yield.

## Saturation finding

The source pilot found no admissible target-specific complete N1/N2/N3 action. Four sketches were directly represented by a complete current producer/runtime union or reduced to generic scheduling/registration. The remaining Flang seam remains theoretically interesting, but the bounded current review cannot name a target-specific algorithm/guarantee or freeze its full compiler–runtime action union; it is honestly not admitted rather than treated as a missing-implementation failure.

## Evidence discipline

All statements come from official manuals/current upstream source links listed in the collision matrix, retrieved 2026-08-14. Old issues, future work, resource availability, missing implementation and absent performance results were not used as negative scientific evidence.
