# Question cards

## QC102-01 — Robust mutex recovery/publication boundary

| Field | Frozen value |
|---|---|
| Exact identity | One POSIX robust mutex and a fixed protected application state after owner death. |
| Same-object estimand | Preserve acquisition with `EOWNERDEAD`, state restoration plus `pthread_mutex_consistent`, or permanent nonrecoverability after unlock. |
| Counterfactual consequence | A valid S1 mechanism must recover a frozen protected-state object; generic cleanup/retry or switching to a transaction/log object fails same-object. |
| Current-source locus | POSIX.1-2024 mutex lock and robust-mutex rationale. |
| Minimum falsifier | The standard says recovery depends solely on the application and robust support only notifies the owner-death/nonrecoverable condition. Without a frozen state schema, no same-object target-specific action exists. |
| Full-cost initial boundary | owner-death detection, lock/recovery steps, consistency publication, failure handling, CPU, RSS and recovery latency. |
| Finite route | A public multiprocess robust-mutex trace can be a carrier only after a particular protected-state schema and non-generic recovery construction are frozen. |
| Raw disposition | `EXCLUDED_BEFORE_RAW__UNFROZEN_APPLICATION_RECOVERY_OR_CHANGED_OBJECT`. |

