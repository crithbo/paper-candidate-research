# Question Card S5-121-01 — excluded before raw

## Identity

- Assignment: `DISCOVERY-S5-20260830-SOURCE121`
- Seed/RQ: `S5-121-01 / RQ_CANDIDATE_S5-121-01`
- Exact public identities: NVIDIA KVPress current `main`; LMSYS-Chat-1M data card; SCBench arXiv `2412.10319v2`.
- Carrier kind proposed before lookup: `NATURAL`, with `CANONICAL_BENCHMARK_ONLY` fallback.
- Exact object: within-session decoder KV state of one fixed model across successive turns.
- Proposed endpoint: stability of the full-cost ranking of current KV-cache compression methods across turns under a frozen output-divergence ceiling.

## Current collision

- SCBench explicitly targets the single-request benchmark gap, defines multi-turn and multi-request shared-context modes, includes 931 sessions/4,853 queries, evaluates KV dropping/compression methods including StreamingLLM, SnapKV, and PyramidKV, and reports that sub-O(n) memory methods degrade after the first request.
- This matches the object, multi-turn information condition, benchmark/measurement contribution type, and decision endpoint of the frozen primary RQ closely enough that the general measurement claim is `DIRECT_FATAL`.
- A residual restricted to a natural-chat carrier is not closed: LMSYS-Chat-1M averages two turns and short prompts and requires acceptance of its access agreement; Mooncake provides realistic arrival/length/hash structure but not prompt/response text or a quality oracle.
- Combining LMSYS content with Mooncake arrival/hash traces would be a cross-carrier construction, not evidence from one exact natural object. It also would not by itself create a nontrivial contribution beyond SCBench.

## Raw-required audit

- Exact public identity: `PASS`.
- Same-object contract: `PASS` for the proposed SCBench-like benchmark; `FAIL` for a natural-chat long-session carrier.
- Claim endpoint: `PASS`.
- Counterfactual consequence: `PASS`.
- Non-generic discriminator: `FAIL_AFTER_DIRECT_SUBTRACTION`; only carrier substitution/full-cost extension remains.
- Current-source locus: `PASS`.
- Known direct fatal: `FOUND`.
- Minimum falsifier: `DEFINED` but not eligible after direct fatal.
- Finite closure route: `NO` for a same-object natural long-session carrier within frozen inputs.
- Full-cost boundary: `DEFINED` but residual is not contribution-bearing.

## Disposition

- RQ audit: `RQ_COMPLETE`.
- RAW_REQUIRED audit: `INCOMPLETE_AFTER_DIRECT_FATAL_AND_CARRIER_FAILURE`.
- Identity relation: `DIRECT_FATAL_CURRENT_COLLISION`.
- Disposition: `EXCLUDED_BEFORE_RAW`.
- Eligible for C0: `NO`.
- No novelty or global-absence claim is made.

