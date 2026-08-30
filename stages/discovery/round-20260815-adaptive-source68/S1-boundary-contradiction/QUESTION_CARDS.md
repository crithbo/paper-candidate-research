# S68-QC01 — futex_waitv multiwait publication seam

- Exact identity: Linux futex2 `futex_waitv` vector and current waitwake implementation.
- Carrier: `IMPLEMENTATION_CARRIER_ONLY`; natural multiwait runtime workloads would matter after raw only.
- Identity: `NO_MATCH__NO_NOVELTY_INFERENCE`; network-security exclusion PASS.

## Decisive contract result

The API fixes the ordered vector and returns the index of a woken futex (or timeout/signal/error). Current source performs verification/setup and enqueue for every vector entry, then complete unqueue and retry across wake, timeout, signal and spurious wake paths. A permutation/selection that changes the vector/index changes the caller-visible endpoint. With that endpoint fixed, no target-specific action remains: only generic registration/sleep/wake timing or the existing complete multiwait path.

- Full-cost boundary: syscall CPU/RSS, hash-bucket locks, vector setup/unqueue work, latency, wakeups and contention.
- Minimum falsifier: two legal fixed-vector traces with the same index outcome and different only enqueue/order timing.
- Result: `EARLY_FATAL__CURRENT_MULTIWAIT_UNION_OR_CHANGED_ENDPOINT`.
- No resource/result inference. Disposition `EXCLUDED_BEFORE_RAW`, C0 NO.
