# S5-01 Discovery Question Card

- Exact public identity: LMCache `dev` CPU offload quickstart and `examples/kv_cache_reuse/local_backends/offload.py`.
- Carrier: implementation carrier only.
- Same-object estimand: online CPU-tier KV-cache admission/eviction for vLLM requests.
- Candidate endpoint: TTFT/full-cost decision, not cache-hit count alone.
- Current loci: official Quickstart and official `offload.py` show CPU local backend, a fixed capacity, aligned chunks, prefix retrieval and LRU configuration.
- Strongest current objection: the documented system already provides CPU offload and configured eviction; a generic cache policy may absorb the proposed action.
- Missing decisive fields: a versioned current source locus defining an admission-policy interface and a finite same-object comparator/falsifier route.
- Disposition: `LOCATOR_ONLY`.

Reason: the permitted official-source closure establishes the existing offload mechanism but does not establish a non-generic, bounded residual for reuse-distance-aware admission/eviction. No novelty or current-absence claim is made.
