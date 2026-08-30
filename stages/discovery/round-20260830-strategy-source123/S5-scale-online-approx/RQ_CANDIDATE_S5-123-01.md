# RQ candidate S5-123-01

- Assignment: `DISCOVERY-S5-20260830-SOURCE123`
- Seed: `S5-123-01`
- Exact anchors: current vLLM V1 scheduler/config/prefix-cache/sampling sources; SGLang scheduling source; vLLM serving benchmark; Mooncake trace directory.
- Stable object: single-GPU active-set admission and prefill chunking for block-based KV memory.
- Immutable guarantee: no KV-capacity recompute preemption for requests once admitted under their declared generation cap; identical model/token semantics.
- Primary RQ: Can prefix-tree-aware future-private-KV reservation improve full-cost throughput/latency over current incremental/preemptive scheduling without violating exact capacity or request semantics?
- Contribution hypothesis: `SYSTEM_ARCHITECTURE / METHOD_ALGORITHM`, `N2`.
- Information: arrival/prompt length, declared cap, prefix block identities/refcounts, current occupancy, queue state; no actual future output length.
- Comparators: current vLLM FCFS/priority and tuning; static worst-case reservation; no-reservation preemption; prefix/LPM ordering; chunked-prefill baseline; SGLang current policy; offline output-length oracle.
- Full cost: GPU KV blocks, stranded reservation, prefill/decode compute, queueing, TTFT, ITL, throughput, preemption count, discarded/recomputed tokens, prefix lookup/accounting.
- Minimum witness: a block-level prefix tree with two shared-prefix sessions and one independent request where naive incremental admission preempts but safe marginal reservation avoids recompute.
- Pre-evidence selection: `YES`; `ORDINARY_CLOSURE`; nomination `NONE`.
- Disposition before evidence: `RQ_READY_FOR_ORDINARY_CLOSURE`.

