# Evidence-qualified Question Cards

## RQ-S01-2 — LLVM musttail/statepoint boundary

| Field | Finding |
|---|---|
| Exact identity | Fixed LLVM IR call graph, calling convention, observable values/exceptions, and GC/deoptimization metadata contract. |
| Proposed action | Whole-call-graph placement of tail-call/statepoint boundaries. |
| Current locus | LLVM current tail-recursion transformation source; current statepoint material. |
| Carrier / full cost | Public LLVM IR tests; compile CPU/RSS, code bytes, stack-map bytes, stack use, execution cost. |
| Falsifier | No frozen target/runtime-specific action beyond generic tail-call/stack-map transformation. |
| Decision | **EXCLUDED_BEFORE_RAW__GENERIC_WRAPPER_OR_SOLVER.** The bounded source route did not establish a non-generic action/guarantee; it is not promoted from a generic compiler transformation. |

## RQ-S02-2 — WebGPU pipeline-layout binding commitment

| Field | Finding |
|---|---|
| Exact identity | Fixed WGSL resource interface, bind-group/pipeline-layout semantics, and visible GPU result. |
| Proposed action | Cross-pipeline binding/layout commitment construction. |
| Current locus | Current WebGPU resource-binding and pipeline-layout specification. |
| Carrier / full cost | Public WGSL/WebGPU workloads after implementation pin; translation CPU/RSS, pipeline/binding objects, runtime latency/RSS. |
| Falsifier | Current implementation owns legal commitments or candidate changes auto/explicit API contract. |
| Closure route | Pin an implementation revision, its relevant defaults/configuration entry points, and a canonical workload. |
| Decision | **LOCATOR_ONLY__PUBLIC_EVIDENCE_UNCLOSED.** Spec semantics are clear, but no current implementation union/fair comparator is frozen. |

`evidence_qualified_raw_count: 0`
