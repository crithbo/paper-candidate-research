# Source119 S2 frozen seed portfolio

Frozen before targeted source lookup. Seeds are non-evidence and cannot assert novelty or absence.

| ID | Exact public anchor candidate | Bottleneck-transfer seed | Fixed decision endpoint |
|---|---|---|---|
| S2-119-01 | vLLM current KV offload / sleep mode | PCIe transfer scheduling becomes the bottleneck after GPU KV capacity is relieved | when and how much KV to migrate per request phase |
| S2-119-02 | vLLM prefix caching | hash lookup and block metadata dominate when prefix hit rate is high | prefix-block indexing and admission |
| S2-119-03 | SGLang HiCache | storage-tier promotion/demotion traffic dominates after cache reuse | tier placement and prefetch timing |
| S2-119-04 | SGLang radix cache | lock/refcount and eviction traversal dominate long shared-prefix sessions | eviction candidate selection |
| S2-119-05 | LMCache current CPU connector | serialization/pinned-memory staging dominates recovered GPU capacity | chunk size and staging concurrency |
| S2-119-06 | LMCache CacheBlend | partial-prefix recomputation becomes the bottleneck after reuse | recompute-versus-fetch selection |
| S2-119-07 | vLLM disaggregated prefill | KV transfer queueing dominates compute separation | admission under transfer-aware SLO |
| S2-119-08 | SGLang PD disaggregation | bootstrap/metadata/control path dominates short requests | request routing with setup cost |
| S2-119-09 | vLLM hybrid KV cache manager | heterogeneous layer-group bookkeeping wastes capacity | group-aware block allocation |
| S2-119-10 | LMCache/vLLM multi-turn serving | session churn invalidates static reuse value | reuse-value-aware cache retention |

Precommitted convergence order: 03, 05, 09, 06, 01, 07, 04, 02, 08, 10. No result-aware replacement or backfill.
