# Source121 S2 primary RQ

- Exact carrier: NVIDIA Dynamo agent trace / Mooncake-style replay plus documented end-to-end router and SGLang spans.
- Exact observable fields: arrivals, input/output lengths, shared prompt blocks, session/parent relations; router `compute_block_hashes`, `find_matches`, `compute_seq_hashes`, `schedule`; engine request/prefill/decode spans.
- Primary RQ: On a fixed public tool-agent replay, is there a reproducible prefix-overlap/load crossover at which KV-router metadata and queue-balancing cost erase cache-locality savings and reverse the end-to-end ranking of KV-aware versus round-robin routing?
- Contribution type: `MEASUREMENT_CHARACTERIZATION` with a decision-changing policy-selection threshold.
- Fixed decision endpoint: choose routing mode and overlap/load weighting for a fixed worker count and KV budget.
- Full-cost boundary: router CPU/span time, prefill recompute, queue delay, TTFT, TPOT, e2e, peak KV occupancy and trace completion.
- Minimum falsifier: official current benchmarks already report the same metadata-cost crossover, or no ranking reversal exists across a precommitted overlap/load grid.
