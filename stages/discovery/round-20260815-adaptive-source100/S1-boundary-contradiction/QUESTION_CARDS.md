# Question cards

## QC100-01 — POSIX rwlock writer-reservation boundary

| Field | Frozen value |
|---|---|
| Exact identity | POSIX.1-2024 rwlock reader acquisition on a fixed initialized lock and fixed arrival trace. |
| Same-object estimand | Preserve acquisition/block/failure behavior, reader recursion and writer-precedence conditions while accounting for lock handoff. |
| Counterfactual consequence | A valid S1 contribution must name a rwlock-specific action/guarantee, not choose an ordinary queue order or fairness setting. |
| Current-source locus | POSIX Issue 8 `pthread_rwlock_rdlock` contract and rwlock rationale. |
| Minimum falsifier | If action divergence only decides reader-versus-writer admission among standard-permitted paths, it is generic policy and cannot enter raw. |
| Full-cost initial boundary | lock attempts, waiter bookkeeping, handoff/wakeups, CPU, RSS, latency and scheduling effects. |
| Finite route | A small standards-conforming pthread trace and acquisition/error oracle are available only if a non-generic residual survives. |
| Raw disposition | `EXCLUDED_BEFORE_RAW__ADMISSION_ORDER_IS_GENERIC_LOCK_POLICY`. |

