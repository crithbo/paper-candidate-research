# Targeted current-union closures

## D1 — XSched preemptive XPU task construction

Fixed object: an arrival trace, task semantics and device capabilities, with completion/ordering semantics fixed. The authors' OSDI 2025 artifact supplies the current reproduction route and points to the current XSched repository. Its actionable state is task-to-XPU placement and preemption; a minimal two-action witness is two legal task/device assignments with different preemption sequences and identical task semantics.

However, the proposed whole constructor is an online scheduling/controller problem. Under this assignment's exclusions it has no target-specific exact/FPT/approximation guarantee distinct from online policy selection; an offline replacement would change information conditions. **`STRUCTURAL_DROP__CONTROLLER_AND_CHANGED_INFORMATION_RISK`** applies to this residual only. Natural carrier would be the artifact's task traces; full cost would include dispatch/preemption overhead, device time, queue latency, CPU/RSS and migration/state cost; killer: any proposed construction needs future arrivals or reduces to a policy selector.

## D2 — Medusa serverless LLM state-materialization construction

Fixed object: model/runtime version, request semantics, output tokens and stock vLLM/PyTorch execution. Official source documents state materialization, CUDA-graph save/recovery, SPDK storage, runtime dependencies and version restrictions. The complete current union cannot be sealed from bounded public inspection because modified PyTorch/CUDA-library behavior and deployment configuration are decisive. A proposed legal action is joint selection of materialized graph/state blocks and recovery order; a two-action witness is two stock-output-equivalent checkpoints with different legal materialization partitions.

**`NOT_ADMITTED_UNFROZEN`**: a finite closure would pin Medusa/PyTorch revisions, enumerate materialization/recovery options and prove the two layouts are accepted before comparing against current union. It is not a resource or readiness judgment. Natural carrier: official versioned model/request route; full cost: capture, storage bytes, restore/startup latency, GPU/CPU/RSS/temp/I/O. Killer: current configuration already expresses the same joint partition, or recovery changes output/runtime semantics.

No candidate meets the unchanged v8.7 clean-brief gate.
