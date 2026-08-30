# SOURCE123 S2 frozen seed portfolio and primary RQ

Frozen before the first source call. Seeds are non-evidence and no result-aware backfill is allowed.

| Order | Exact public carrier candidate | Bottleneck-transfer seed |
|---:|---|---|
| 1 | SGLang HiCache local-file backend + `benchmark/hicache/bench_serving.py` | memory savings shift cost to prefetch wait and scheduler queueing |
| 2 | SGLang HiCache prefetch policies | fixed token-based timeout misses queue/load state |
| 3 | SGLang HiCache write-through-selective | hit-count metadata and host write pressure dominate reuse benefit |
| 4 | LMCache MP CPU prefetch | pinned-memory staging blocks admission |
| 5 | LMCache segmented-prefix recovery | partial retrieval creates recompute/transfer coordination cost |
| 6 | TensorRT-LLM KV cache reuse/offload sample | host transfer stalls continuous batching |
| 7 | vLLM OffloadingConnector local CPU tier | promotion/recompute changes queue delay |
| 8 | Mooncake single-GPU trace replay | cache transfer setup dominates short reused prefixes |
| 9 | llama.cpp prompt/session cache load | disk/host restore dominates cold-start admission |
| 10 | SGLang radix-cache host eviction | metadata scan/lock cost dominates high-hit workloads |

## Primary RQ

- Exact carrier candidate: current SGLang HiCache local-file backend, official HiCache serving benchmark and current server argument/source contract.
- Exact object: one GPU with GPU L1, host L2 and local-file L3; lossless KV reuse for fixed requests.
- Primary RQ: Can per-request queue pressure and recompute time be used to terminate HiCache L3 prefetch earlier or wait longer than the current fixed policy so that the same request set minimizes TTFT/SLO cost without reducing cache correctness?
- Atomic action: at admission, select `recompute_now / wait_for_prefetch` from observable queue/token budget, completed-prefetch progress and bounded recompute estimate.
- Comparator: current `best_effort`, `wait_complete`, and token-linear `timeout` policies.
- Initial full-cost boundary: queue time, TTFT/TPOT, recomputed tokens, L3 query/I/O/prefetch wait, host occupancy, scheduler CPU time and trace makespan.
- Minimum falsifier: current upstream already consumes equivalent queue/progress/recompute signals, or current strong systems implement the same action under equal information/cost.
