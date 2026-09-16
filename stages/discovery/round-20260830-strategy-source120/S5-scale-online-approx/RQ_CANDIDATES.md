# Source120 S5 RQ Candidates

Frozen after exact-carrier field closure and before targeted current/contrary lookup. No carrier replacement or result-aware backfill.

## Selected primary RQs

### RQ-C01 — BurstGPT robust session-KV reservation

Given BurstGPT v2.0 arrivals, session IDs, request lengths and only past-observable session history, can an online reservation policy reduce KV-memory over-reservation and preemption cost versus fixed/empirical-quantile reservation while preserving exact generation semantics? Full cost: reserved bytes, preemption/recompute, queueing, TTFT/E2E; actual response length is oracle-only, never online input.

### RQ-C02 — Vidur reservation-policy evaluation

On Vidur's versioned trace generators and fixed simulator/model profile, can a distribution-shift-robust per-request KV reservation policy improve SLO/goodput versus fixed and empirical-quantile baselines under identical scheduler semantics? Carrier ceiling: canonical simulator evidence only unless independently replayed.

### RQ-C03 — Mooncake value-per-byte KV admission

Given Mooncake FAST'25 `conversation_trace.jsonl` and `toolagent_trace.jsonl` timestamps, lengths and 512-token prefix hash IDs, can a causal value-per-byte admission/eviction algorithm use only past hash recurrence and transfer-cost estimates to improve TTFT/goodput versus LRU/LFU/Belady-oracle ceilings under the same exact KV blocks? Full cost includes CPU/SSD capacity, lookup, GPU transfer, write amplification and missed-prefill recompute.

### RQ-C09 — LLMServingSim memory-tier policy

Within LLMServingSim 2.0's fixed request trace, scheduler, memory accounting and hardware profile, can an online heterogeneous-memory admission policy improve SLO-qualified throughput versus native/static tiering without changing model or scheduling semantics? Evidence remains canonical-simulator-only unless a real-engine replay is added downstream.

### RQ-C10 — vLLM cache-policy benchmark validity

Do vLLM's prefix-repetition, ShareGPT and Mooncake timed-trace benchmark modes preserve the ordering of cache admission/eviction policies under the same workload and complete TTFT/transfer/write-cost denominator; if not, what minimum benchmark panel prevents a decision-reversing ranking error? Contribution hypothesis: `BENCHMARK_DATASET / MEASUREMENT_CHARACTERIZATION`, not a new cache algorithm.

## RQ backlog / non-admission

- C04 LMSYS-Chat-1M: no request-arrival field; conversation ID/text alone cannot support the frozen online estimand.
- C05 WildChat-1M: conversation timestamp is last-turn time and assistant timestamps are completion observations; an arrival process cannot be recovered without unsupported assumptions.
- C06 ShareGPT: no stable, versioned arrival/session timing contract in the frozen carrier.
- C07 LLMCompass: static hardware/operator analysis does not provide an online request/memory decision carrier.
- C08 GenZ: static model/use-case/platform estimates do not provide an online arrival/session decision carrier.

Backlog items are not scientific drops and are not counted as evidence-qualified raw.
