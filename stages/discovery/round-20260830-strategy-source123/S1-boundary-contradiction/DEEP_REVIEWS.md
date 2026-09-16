# Source123 S1 Type-Specific Anti-Collapse Review

No candidate-grade deep review was permitted because zero RQs passed the evidence-qualified raw gate. The following are bounded near-gate checks, not deep-review denominator entries.

## Placement/scheduler family (RQ01/02/04/06)

- Compiler/tool action candidate: expose or optimize node/tensor placement under split/copy cost.
- Native/current union: scheduler already assigns backends, checks buffer/op support, inserts copies, exposes split/copy counts and debug assignments; llama-bench freezes the relevant user controls and timings.
- Strongest paper subtractor: ATSInfer adds tensor-granular placement and load-aware dynamic transfer to llama.cpp on consumer CPU/GPU systems.
- Anti-collapse result: measurement-only versions are profiling; algorithmic versions are direct-subtracted or generic placement solvers; metamorphic versions repeat the active ORT assignment-stability family with a backend rename.
- Disposition: `EXCLUDED_BEFORE_RAW`.

## MoE offload family (RQ05)

- System action candidate: cache/prefetch selected experts across host/GPU boundary.
- Current llama.cpp already selectively copies used expert sub-rows, and active PR/RFC work adds persistent hot caches, hysteresis, slot remapping and prefetch variants.
- Strong baselines already provide expert tracing, caching, prefetch and hybrid scheduling: MoE-Infinity, HybriMoE, PowerInfer, KTransformers and related current work.
- Anti-collapse result: no target-specific residual with a stronger information, cost or guarantee boundary survived.
- Disposition: `EXCLUDED_BEFORE_RAW`.

## Benchmark/conformance family (RQ03/07/08)

- Native llama-bench already records model/hardware/backend/offload/split/override parameters and timing statistics.
- `test-backend-ops` is the native conformance route.
- Adding memory accounting, a dashboard, operator cases or scheduler logging is routine instrumentation without a stable novel law or decision mechanism.
- Disposition: `EXCLUDED_BEFORE_RAW`.
