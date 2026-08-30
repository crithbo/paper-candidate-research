# Question cards — Source65

## S65-01 — Cranelift register/spill/frame construction

- Same-object contract: fixed CLIF function set, ISA, ABI, and native executable behavior.
- Current locus: Cranelift has explicit allocator-algorithm selection, including a backtracking/range-splitting option, and explicit spill-temporary/frame constraints.
- Full-cost boundary: compilation CPU/RSS/temp, code size, stack-frame/spill bytes, and runtime latency.
- Strong skeptical explanation: this is an ordinary register-allocation/spill scheduling problem; its stated sketch does not identify a target-specific action, information condition, or guarantee.
- Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_REGISTER_ALLOCATION_SKELETON`.

The outcome does not say that register-allocation research is exhausted. It excludes this generic source-lane sketch, which cannot become N2 merely by re-labelling an allocator option or stack-slot decision.

## S65-02 — rustc incremental dep-graph/work-product construction

- Same-object contract: fixed crate graph/compiler target, diagnostics, and output artifacts.
- Current locus: rustc loads the previous dep-graph immutably, uses fingerprints and try-mark-green, then copies old unchanged nodes/edges and builds changed parts.
- Full-cost boundary: graph loading/validation/construction CPU/RSS/temp/storage, recomputation, work-product bytes, artifact bytes, and wall time.
- Strong skeptical explanation: caching policy or generic dynamic-DAG maintenance; no separate target-specific algorithmic invariant was frozen.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_INCREMENTAL_DEPGRAPH_UNION_OR_GENERIC_CACHE_POLICY`.

The exclusion is not based on lack of implementation or results; it follows from no union-external complete action beyond cache policy/generic dependency maintenance.

## S65-03 — WebGPU bind-group/pipeline-layout construction

- Same-object contract: fixed shaders, resource types, bindings, and GPU-observable output.
- Current locus: WebGPU fixes layout creation from bind-group layout descriptors, defines compatibility and validation, supports explicit layouts and normative automatic layout creation.
- Full-cost boundary: descriptor/layout construction and validation CPU/RSS, command encoding/submit CPU, resource/state bytes, and end-to-end GPU latency.
- Strong skeptical explanation: user-level binding reordering or pipeline-cache choice; changing shader group/binding decorations would change the fixed object.
- Disposition: `EXCLUDED_BEFORE_RAW__NO_SAME_OBJECT_UNION_EXTERNAL_LAYOUT_ACTION`.

For fixed shader binding addresses and descriptor contract, the suggested ordering mechanism is already a spec-advised layout decision or requires a changed shader/object; it is not a same-object N2 constructor.
