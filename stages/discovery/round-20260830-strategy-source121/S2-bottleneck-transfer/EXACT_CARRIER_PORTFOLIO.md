# Source121 S2 exact-carrier portfolio

Frozen before first source call; locator candidates only.

| Order | Carrier candidate | Fixed bottleneck-transfer endpoint |
|---:|---|---|
| 1 | SGLang HiCache benchmark/config/metrics | host-tier prefetch versus queue delay |
| 2 | SGLang radix-cache eviction metrics | metadata/eviction work under prefix reuse |
| 3 | LMCache MP benchmark and sparse-prefetch RPC metrics | blocking lookup/host transfer versus TTFT |
| 4 | NVIDIA Dynamo KV-router A/B benchmark with tool-agent trace | cache locality versus queue balance |
| 5 | NVIDIA AIPerf BurstGPT replay | burst admission under GPU-memory ceiling |
| 6 | TensorRT-LLM KV reuse benchmark | host/offload transfer versus batching |
| 7 | Mooncake FAST25 tool-agent trace plus single-node replay | cache-transfer setup versus queueing |
| 8 | SGLang PD/EPD local benchmark | control/transfer setup cost under short requests |
| 9 | Vidur canary prefix-cache simulator output | simulation metadata overhead and policy ordering |
| 10 | llm-d/InferenceSim public trace/config | KV-aware routing versus local queueing |

Order 1–10 is fixed. No result-aware replacement or backfill.
