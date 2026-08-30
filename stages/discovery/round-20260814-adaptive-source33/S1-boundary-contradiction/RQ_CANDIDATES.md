# Pre-evidence RQ Candidates

## RQ-S01 — LLVM musttail/statepoint seam

Shared object: a fixed LLVM IR call graph, calling convention, observable values/exceptions, and GC/deoptimization metadata contract.

1. Determine a same-IR construction preserving both musttail and statepoint semantics.
2. Construct whole-call-graph placement of tail-call/statepoint boundaries with full code/stack-map/runtime cost.
3. State a canonical no-gain condition for legal tail-call/stack-map co-occurrence.

Selected variant: 2, only if a non-generic target/runtime-specific action survives current-source inspection.

## RQ-S02 — WebGPU pipeline-layout commitment

Shared object: fixed WGSL shader interface, bind-group/pipeline-layout semantics, and visible GPU output.

1. Preserve resource-interface semantics while choosing legal layout commitments.
2. Construct a cross-shader layout/binding commitment minimizing creation/binding/full runtime cost.
3. Identify a canonical no-gain workload condition.

Selected variant: 2, only if a public implementation source/config union and non-generic mechanism are available. API configuration or external controller changes are excluded.
