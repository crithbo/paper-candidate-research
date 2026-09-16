# Source123 S1 Source Ledger

- Assignment: `DISCOVERY-S1-20260830-SOURCE123`
- Cutoff: `2026-08-30 Asia/Shanghai`
- Source calls: `24/24`
- Retrieval: official/primary source search/open only; no download, build, experiment or result-aware backfill.

## Call accounting

| Calls | Role | Surfaces | Decision effect |
|---|---|---|---|
| 1-4 | ANCHOR | ggml backend scheduler, llama-bench, offload/MoE options | Located exact code/config/test carriers for all frozen RQs. |
| 5-8 | CURRENT/CONTRARY | current scheduler split/copy source, expert-cache PR/RFC, MoE papers | Directly subtracted simple expert cache/prefetch and exposed scheduler observability. |
| 9-12 | CURRENT | scheduler public API/debug, backend-op tests, placement fixes/issues | Reduced RQ01/02/07 to native instrumentation, regression testing or ordinary conformance. |
| 13-16 | CURRENT/ESCAPE | llama-bench schema, tensor overrides, ATSInfer/PowerInfer | ATSInfer directly covers automated tensor-level hybrid scheduling in llama.cpp; RQ03/04/06 lost a nontrivial residual. |
| 17-20 | CONTRARY | MoE-Infinity, HybriMoE, KTransformers, active llama.cpp cache/prefetch work | RQ05 became current-union absorbed rather than a fresh mechanism. |
| 21-24 | DECISIVE OPEN | ggml scheduler source, llama-bench README, ATSInfer, MoE-Infinity | Confirmed zero raw and honest abstention. |

## Decisive official/primary sources

1. [ggml backend scheduler source](https://github.com/ggml-org/llama.cpp/blob/master/ggml/src/ggml-backend.cpp) — backend support/buffer checks, split inputs, tensor copies, assignment debug and scheduler structure.
2. [ggml backend API](https://github.com/ggml-org/llama.cpp/blob/master/ggml/include/ggml-backend.h) — public split/copy counts, backend assignment and buffer-size interfaces.
3. [llama-bench source](https://github.com/ggml-org/llama.cpp/blob/master/tools/llama-bench/llama-bench.cpp) and [schema](https://github.com/ggml-org/llama.cpp/blob/master/tools/llama-bench/README.md) — current n-GPU-layer, n-CPU-MoE, split mode, tensor split/override and timing controls.
4. [llama.cpp repository](https://github.com/ggml-org/llama.cpp) — CPU+GPU hybrid inference and canonical benchmark tool.
5. [ATSInfer](https://arxiv.org/abs/2607.10183) — current tensor-granular automated CPU/GPU placement and load-aware transfer on consumer devices, implemented by extending llama.cpp.
6. [MoE-Infinity](https://arxiv.org/abs/2401.14361) — activation tracing, expert prefetch/cache and host/GPU offload, with llama.cpp as a baseline.
7. [PowerInfer](https://ipads.se.sjtu.edu.cn/_media/publications/song-sosp24.pdf) — hot/cold activation-aware CPU/GPU hybrid inference on consumer GPUs.
8. [HybriMoE](https://arxiv.org/abs/2504.05897) — dynamic CPU/GPU scheduling, prefetch and score-based expert caching.
9. [KTransformers](https://madsys.cs.tsinghua.edu.cn/publication/ktransformers-unleashing-the-full-potential-of-cpu/gpu-hybrid-inference-for-moe-models/SOSP25-chen.pdf) — strong current hybrid MoE inference comparator.
10. [llama.cpp expert-cache request](https://github.com/ggml-org/llama.cpp/issues/20757), [active expert-cache PR](https://github.com/ggml-org/llama.cpp/pull/26563), and [batch-aware prefetch discussion](https://github.com/ggml-org/llama.cpp/discussions/19030) — current upstream contrary/action loci, not paper evidence by themselves.

## Stopping rationale

The budget is exhausted with no unresolved same-object residual meeting the raw gate. Absence of a proposal is not a category STOP: a future merged scheduler change, new canonical trace, or distinct guarantee may justify a new assignment, but this wave cannot backfill one after seeing results.
