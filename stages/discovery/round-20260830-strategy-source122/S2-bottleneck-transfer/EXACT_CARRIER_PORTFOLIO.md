# Source122 S2 exact carrier portfolio

Frozen before the first source call. Locator candidates only.

| Order | Exact official carrier candidate | Frozen decision class |
|---:|---|---|
| 1 | LMCache MP `prefix-suffix-tuner` L0/L1/L2 workload | host-tier prefetch/admission under LRU thrash |
| 2 | LMCache MP sparse-prefetch/CacheBlend V3 RPC path | blocking lookup/prefetch versus recompute admission |
| 3 | LMCache CPU RAM prefetch configuration | pinned-host staging concurrency versus TTFT |
| 4 | LMCache Mooncake connector benchmark/config | remote KV transfer admission versus local recompute |
| 5 | vLLM OffloadingConnector exact block-size/CPU-byte config | block-granularity transfer versus queue pressure |
| 6 | vLLM tiering manager promotion/retry path | promotion-aware admission under host pressure |
| 7 | vLLM KV transfer LookupBuffer blocking `drop_select` | transfer wait versus scheduler queue |
| 8 | vLLM KV offload metrics/API | host-hit value versus routing/admission cost |
| 9 | Mooncake FAST25 trace replay through LMCache/vLLM | prefix-hit savings versus transfer load |
| 10 | LMCache fault-inject segmented-prefix carrier | partial retrieve failure recovery admission |

Precommitted closure order is 1–10. No result-aware backfill.
