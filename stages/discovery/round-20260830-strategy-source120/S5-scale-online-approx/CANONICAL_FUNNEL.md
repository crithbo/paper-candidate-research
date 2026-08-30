# Source120 S5 Canonical Funnel

Cutoff: 2026-08-30. Exact carriers were frozen before lookup. No carrier replacement, result-aware backfill, build, or experiment.

| Carrier | Carrier gate | Primary-RQ result | Raw/deep disposition |
|---|---|---|---|
| C01 BurstGPT v2.0 | PASS: arrival, session, request/output lengths | Robust online KV reservation | `DIRECT_FATAL`: arXiv:2607.16892 uses BurstGPT and the same uncertainty/SLO/fixed-quantile problem. |
| C02 Vidur | PASS: arrivals, lengths, scheduling and latency metrics | Simulator reservation policy | `DIRECT_FATAL`: same robust-reservation paper plus simulator-version fidelity debt. |
| C03 Mooncake FAST'25 traces | PASS: timestamps, lengths, 512-token prefix hashes | causal value-per-byte admission | `STRUCTURAL_DROP`: SAECache/PrefixShield/Preble and generic GDSF/GreedyDual absorb the action; current vLLM session-aware policy RFC further narrows residual. |
| C04 LMSYS-Chat-1M | FAIL: conversation ID/text but no request arrival | none | `RQ_BACKLOG`. |
| C05 WildChat-1M | CONDITIONAL: conversation last-turn and assistant completion timestamps | none | `RQ_BACKLOG`: outcome-contaminated timing cannot define arrival-based online policy. |
| C06 ShareGPT | FAIL: no stable arrival contract in frozen public carrier | none | `RQ_BACKLOG`. |
| C07 LLMCompass | FAIL for online object: static hardware/operator analyzer | none | `RQ_BACKLOG`. |
| C08 GenZ | FAIL for online object: static configuration estimator | none | `RQ_BACKLOG`. |
| C09 LLMServingSim 2.0 | PASS: arrival/session/token IDs, exact memory ledgers and prefix tiers | online NPU/CPU/CXL tier admission | `DIRECT_SUBTRACT_TO_NOT_ADMITTED`: Kareto/KVDrive/AsymCache cover adaptive tiering/cost; no residual survives without changing action. |
| C10 vLLM benchmark suite | PASS: prefix-repetition, ShareGPT and Mooncake timed-trace modes; LRU/ARC/custom policy seam | policy-ranking validity | `EVIDENCE_QUALIFIED_RAW → DEEP → CLEAN_BRIEF`. |

## C10 deep review

- Exact object: current vLLM CPU/tiered `OffloadingConnector` eviction-policy comparison.
- Estimand: decision-changing rank stability of policies across official benchmark modes and cache capacities, with uncertainty intervals.
- Counterfactual: if ranking reverses, a policy recommendation from one benchmark mode is invalid for another documented workload class.
- Current union: vLLM provides LRU, ARC, custom policies and the three benchmark carriers, but no documented ranking-validity panel.
- Strongest subtractors: arXiv:2608.20280 compares semantic response-cache policies; arXiv:2607.05399 compares KV compression methods. Both subtract generic benchmark methodology but retain the exact prefix/offload-policy object.
- Falsifier: after matched information, capacity, block size, trace scaling and complete cost accounting, all policy rankings remain statistically stable across modes.
- Carrier ceiling: Mooncake is natural trace evidence; synthetic-prefix and ShareGPT modes are canonical benchmark evidence. No deployment claim before real replay.

Counts: 10 carriers; 5 selected RQs; 1 raw; 1 deep; 1 clean brief.
