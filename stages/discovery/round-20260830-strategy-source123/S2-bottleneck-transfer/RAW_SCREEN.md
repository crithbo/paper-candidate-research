# SOURCE123 S2 raw screen

| Seed | Disposition | Reason |
|---|---|---|
| HiCache local-file benchmark | LOCATOR_ONLY | total latency carrier lacks per-request queue/prefetch/recompute breakdown |
| queue-aware prefetch timeout | DEEP_REVIEWED_NOT_ADMITTED | typed RQ exists, but single-GPU carrier cannot observe decisive estimand; multi-worker issue changes object |
| selective write-through | EXCLUDED_BEFORE_RAW | current hit-count policy plus ordinary write-pressure tuning; no new action |
| LMCache CPU prefetch | EXCLUDED_BEFORE_RAW | Source122/current systems absorb loading-aware admission |
| segmented-prefix recovery | EXCLUDED_BEFORE_RAW | diagnostic fault path, not natural healthy-path evidence |
| TensorRT-LLM offload | LOCATOR_ONLY | exact current same-object carrier not closed in bounded route |
| vLLM local CPU offload | EXCLUDED_BEFORE_RAW | recently deep-reviewed promotion/loading family |
| Mooncake replay | EXCLUDED_BEFORE_RAW | distributed cache-aware scheduling already current baseline |
| llama.cpp session load | LOCATOR_ONLY | no fixed continuous-batching admission endpoint |
| radix host eviction | EXCLUDED_BEFORE_RAW | generic metadata/cache-policy route |

Funnel: 10 frozen seeds → 1 primary RQ → 0 evidence-qualified raw → 1 candidate-grade deep review → 0 clean briefs. No backfill.

