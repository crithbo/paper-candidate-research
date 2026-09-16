# GPU-MOETAILSCHED source log

Search date: 2026-08-02. Query families: `CUTLASS grouped GEMM scheduler MoE`, `persistent grouped GEMM device host scheduler`, `MoE grouped GEMM tail scheduling`.

| Source | Type | Relevance / collision class |
|---|---|---|
| [CUTLASS grouped-kernel schedulers](https://docs.nvidia.com/cutlass/4.3.3/media/docs/cpp/grouped_scheduler.html) | official documentation | strongest kernel baseline: persistent grouped kernel, round-robin ownership, scheduler internals, and sorting |
| [CUTLASS scheduler modes](https://docs.nvidia.com/cutlass/4.3.2/media/docs/cpp/grouped_scheduler.html) | official documentation | establishes `kDeviceOnly` and `kHostPrecompute` as mandatory baselines and exposes their cost boundary |
| [CUTLASS repository](https://github.com/NVIDIA/cutlass) | open artifact | implementation, examples, profiler, and correctness substrate |
| [CUTLASS changelog](https://docs.nvidia.com/cutlass/latest/CHANGELOG.html) | official documentation | confirms current grouped-GEMM/profiler coverage and stream-K support; not evidence of the proposed policy |

Search-bounded result: found general grouped scheduling and sorting but no verified source whose object is router-visible end-to-end MoE tail scheduling with the stated complete ledger. Stage 0 must audit vLLM, DeepEP, and CUTLASS MoE code before any novelty claim.

