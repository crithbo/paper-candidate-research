# Source119 S2 source ledger

Cutoff: 2026-08-30. Only official project documentation/source pages and primary papers were used. No files were downloaded.

| Role | Source | Decision use |
|---|---|---|
| CURRENT | https://docs.vllm.ai/en/stable/design/hybrid_kv_cache_manager/ | Current hybrid-group allocation, prefix intersection, single LRU, and exact two-attention-type boundary |
| CURRENT | https://docs.vllm.ai/en/v0.23.0/features/disagg_prefill/ | Current KV connectors, offload block sizing, transfer scheduler/worker split |
| CURRENT | https://docs.vllm.ai/en/v0.23.0/api/vllm/v1/kv_offload/tiering/manager/ | Current multi-tier promotion, retry, refcount protection and cascading offload |
| CURRENT | https://docs.lmcache.ai/kv_cache_optimizations/cacheblend.html | Current non-prefix reuse and selective recomputation |
| CURRENT | https://docs.lmcache.ai/mp/index.html | Current unified sparse prefetch, paged scatter and blocking RPC path |
| CURRENT | https://docs.lmcache.ai/cli/bench.html | Canonical L0/L1/L2 thrash and RAG quality workloads |
| CURRENT | https://docs.vllm.ai/en/v0.14.1/design/prefix_caching/ | Current hash-block prefix cache and LRU eviction |
| CONTRARY | https://arxiv.org/abs/2606.02964 | AsymCache: computation-latency-aware eviction, non-contiguous attention, adaptive chunking |
| CONTRARY | https://arxiv.org/abs/2604.26968 | Predictive multi-tier KV management, architecture-aware sizing, reuse prediction and RoPE-aware prefetch |
| CONTRARY | https://arxiv.org/abs/2607.16892 | Robust request reservation/routing under output-length uncertainty |

Search boundary: bounded official-source queries for vLLM, SGLang and LMCache plus primary-paper collision queries. Search remained bounded-open; no global novelty claim is made.

