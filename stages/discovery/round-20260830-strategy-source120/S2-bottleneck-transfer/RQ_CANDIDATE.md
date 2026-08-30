# Source120 S2 primary RQ

- Exact carrier: `kvcache-ai/Mooncake`, FAST25-release JSONL trace, current public release.
- Frozen fields: millisecond request arrival timestamp, input length, output length, ordered 512-token remapped prefix-block hash IDs.
- Exact object: single-GPU continuous-batching replay of the public Mooncake trace with lossless prefix reuse.
- Primary RQ: Under the Mooncake trace’s natural arrival and reusable-prefix structure, does prefix reuse shift the dominant bottleneck from prefill compute to decode KV residency and queueing strongly enough to reverse the ordering of fixed admission policies?
- Fixed decision endpoint: choose among FIFO, shortest-remaining-prefill-first, and prefix-hit-first admission under one GPU-memory budget.
- Immutable guarantee: identical request set, token lengths and exact lossless-prefix reuse semantics; no request dropping or output-quality change.
- Initial full-cost boundary: TTFT/TPOT/SLO, recomputed prefill tokens, peak KV blocks, preemption/restart work, scheduler overhead and trace-completion time.
- Minimum falsifier: policy ordering does not reverse across a precommitted memory-load grid, or a current same-object method already optimizes the same endpoint using the same information.
