# Research Question Cards — Source34 S2

## QC-S34-01 — CUDA graph allocation lifetime

- Identity: one fixed CUDA graph (node payloads, dependencies, outputs and repeat count), stock CUDA graph execution semantics; `NATURAL` carrier route is an official CUDA graph workload/example.
- Target endpoint: a same-object graph-construction algorithm for graph allocation lifetime, not a runtime scheduler.
- Current official locus: CUDA Programming Guide §4.2, current at 2026-08-14, describes definition/instantiation/execution, graph memory allocation and freeing nodes, and GPU-ordered allocation lifetimes.
- Opposing/current-union result: CUDA already represents the graph, dependencies and graph memory nodes; internal node scheduling is left to CUDA. The proposed remaining “joint plan” has no frozen target-specific action or guarantee beyond this union.
- Full-cost if a distinct action emerges: graph definition/instantiation CPU and memory, graph allocation lifetime, launch latency, device memory, copy bytes, and kernel completion.
- Minimum falsifier: name a legal graph action and guarantee not expressible by the stock graph/node/dependency union. No such action was frozen.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_UNION_OR_SCHEDULER_ONLY`.

## QC-S34-02 — Level Zero command-list form

- Identity: fixed Level Zero program with identical kernels, copy operations, dependencies, device context and output.
- Target endpoint: target-specific command-list construction, not selecting a runtime policy.
- Current official locus: Level Zero Core Programming Guide, current spec 1.17.24 at access; it defines command lists, queues, immediate lists, batching, relaxed ordering, throughput mode and driver optimization.
- Opposing/current-union result: the spec expressly makes list creation, queue binding, batching and immediate/default form native actions; modes/flags describe the latency-throughput trade-off. No non-product, target-specific action/guarantee was isolated.
- Full-cost if reopened: command-list construction/reset, submission CPU, queue latency, device execution, host/device memory and copied bytes.
- Minimum falsifier: a semantic list-construction action outside the spec union with a target-specific exact/FPT/approx/Pareto guarantee. None frozen.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_UNION_CONFIGURATION_COMPOSITION`.

## QC-S34-03 — XLA collective form

- Identity: fixed HLO module, tensor values, replica semantics and target.
- Target endpoint: target-specific compiler construction with a bounded guarantee, not a compiler flag grid.
- Current official locus: OpenXLA XLA Flags Guidance, current at 2026-08-14.
- Opposing/current-union result: documentation lists async collective-permute rewrite, analytical overlap estimator and latency-bound collective thresholds (including defaults and enabled values). The locator therefore reduces to a current configuration/compiler action union rather than a new full action.
- Full-cost if reopened: compilation, communication, overlap, device memory, temporary buffers, end-to-end runtime and output equivalence.
- Minimum falsifier: a fixed-HLO action/guarantee that cannot be represented by the documented transformations and controls. None frozen.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_UNION_CONFIGURATION_COMPOSITION`.

No card entered `EVIDENCE_QUALIFIED_RAW`; hence no C0, deep review or brief was created.
