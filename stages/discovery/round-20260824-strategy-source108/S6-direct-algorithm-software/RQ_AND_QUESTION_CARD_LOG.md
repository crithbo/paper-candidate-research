# Source108 S6 Audit Log

| RQ | Versioned locus (checked 2026-08-24) / frozen action | Endpoint, contrary and full-cost | Finite stop |
|---|---|---|---|
| RQ01 cache cold/warm estimator | PyTorch compile-cache tutorial, updated 2025-06-24; action = save/load Mega-Cache plus validated modular cache reuse on same PyTorch/Triton/GPU. | Endpoint: same compiled callable; costs = tracing, compilation, autotune, artifact bytes, cache lookup/load and first-invocation latency. | Existing cache artifact contract directly owns estimator inputs; no distinct action frozen. |
| RQ02 compiler-cache measurement | PyTorch caching configuration tutorial, current; action = FXGraph/AOT/Autotune cache configuration and local/remote lookup. | Endpoint: same graph/config cache hit; contrary = documented cache boundary; costs include cache storage, Redis/local lookup and compilation fallback. | A measurement dashboard/threshold has no new estimand action. |
| RQ03 autotune replication | Triton `autotune` current API; action = keyed config benchmarking, early/perf-model pruning and optional disk timing cache. | Endpoint: same `triton.jit` output; costs include repetitions, warmup, benchmark time, disk cache and selected runtime. | Configuration replication is current autotuning. |
| RQ04 cold-start artifact route | PyTorch reducing-compile-time docs, current; action = existing compile-time measurement/debug artifacts and cache reuse. | Endpoint: same callable/guards; costs = cold compilation phases, guarded recompile and warmed artifact reuse. | No public same-object nontrivial replication-negative action remains. |

Search boundary: four official PyTorch/Triton docs only. No global-newness claim, CRFEPOCH/A4/group repository input, download, resource action, build, or experiment.
