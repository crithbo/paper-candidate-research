# Question cards

## QC99-01 — POSIX serial-return/reset boundary

| Field | Frozen value |
|---|---|
| Exact identity | POSIX.1-2024 `pthread_barrier_wait()` on one fixed barrier and participant population. |
| Same-object estimand | Preserve participant release, one unspecified serial return, reset/reuse and per-phase program effects. |
| Counterfactual consequence | An eligible mechanism must be a barrier-specific whole construction, not leader selection, generic scheduling or a substitute synchronization primitive. |
| Current-source locus | POSIX Issue 8 function index and barrier rationale, including serial-thread behavior, reset and permitted implementation freedom. |
| Minimum falsifier | If all candidate divergence chooses only the arbitrary serial worker or groups existing phases, it is generic policy rather than S1 N1/N2. |
| Full-cost initial boundary | arrivals, waiting/release, serial section, CPU, RSS, barrier latency and any extra synchronization. |
| Finite route | A small standards-conforming C phase program and return-value checker are conceivable only if a non-generic residual survives. |
| Raw disposition | `EXCLUDED_BEFORE_RAW__SERIAL_THREAD_SELECTION_IS_GENERIC_POLICY`. |

