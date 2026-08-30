# Same-object RQ candidates

## RQ-01 — AMDGPU i1-value representation plan

For a fixed AMDGPU MachineFunction and ISA semantics, can a target-specific complete constructor choose i1/lane-mask copy lowerings with a guarantee beyond LLVM's current dominator/post-dominator-aware `SILowerI1Copies` producer?

## RQ-02 — AMDGPU WWM physical-register plan

For a fixed AMDGPU MachineFunction with whole-wavefront-mode requirements, can a target-specific allocator select WWM physical registers with an exact or certified frontier beyond the current preallocation pass and the registered LLVM allocator composition?

## RQ-03 — AMDGPU whole-quad-mode region plan

For a fixed pixel shader/AMDGPU MachineFunction and derivative/side-effect semantics, can a target-specific constructor choose WQM/Exact/StrictWWM regions with a non-generic semantics-preserving switch-cost guarantee beyond current `SIWholeQuadMode`?

RQ-01 and RQ-02 are directly absorbed by current producer actions. RQ-03 remains locator-only: current source identifies region-switch analysis, but no non-generic complete algorithm, direct collision subtraction, or finite natural route was frozen.
