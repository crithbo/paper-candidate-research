# Pre-evidence RQ Candidates

## RQ-S01 — SPIR-V cooperative matrix layout

Exact object held across variants: a fixed SPIR-V cooperative-matrix shader, numeric result contract, Vulkan feature set, and device-visible output.

1. **A:** Can a target-specific construction jointly select matrix layout transitions across producer operations while preserving the shader result contract?
2. **B:** Under fixed shader semantics and matrix types, can an interprocedural/layout-region construction minimize conversion, descriptor, and execution costs against stock compiler/runtime lowering?
3. **C:** Is there a canonical-shader no-gain boundary identifying when layout commitment cannot improve full cost?

Pre-evidence selection: B, conditional on a non-generic action and public current source locus. Excludes numerical-contract change, profile selection, a postprocessor, or generic layout tuning.

## RQ-S02 — MLIR GPU async-token lifetime

Exact object held across variants: a fixed MLIR GPU async program, token dependency semantics, produced buffer values, and runtime-visible completion behavior.

1. **A:** Can a target-specific construction choose token/materialization boundaries while preserving dependency and result semantics?
2. **B:** Can a whole-region ownership construction reduce token storage, synchronization, and runtime allocation full cost without changing async completion observables?
3. **C:** Is there a canonical GPU-IR trace condition under which early versus late token materialization is cost-equivalent?

Pre-evidence selection: B, conditional on an actual non-generic compiler/runtime residual. Excludes a scheduler/controller, generic async optimization, or a changed completion contract.

FINER-lite is only a scheduling aid. Neither RQ is an admission claim.
