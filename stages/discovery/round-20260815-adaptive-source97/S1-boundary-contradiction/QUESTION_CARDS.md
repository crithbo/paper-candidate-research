# Question cards

## QC97-01 — Executor termination boundary

| Field | Frozen value |
|---|---|
| Exact identity | Java SE 25 `ExecutorService` lifecycle methods on one executor and a fixed submitted-task set. |
| Same-object estimand | Preserve documented execution/cancellation, termination, and `Future`-result endpoint; count end-to-end executor work and waiting. |
| Counterfactual consequence | A valid contribution would need a target-specific lifecycle construction, not a choice among `shutdown`, `shutdownNow`, `awaitTermination`, or `close`. |
| Current-source locus | Java SE 25 API page, lifecycle overview and `close` method contract. |
| Minimum falsifier | If native lifecycle methods already enumerate the required behavior and the remaining freedom is task scheduling/policy selection, no S1 N1/N2 survives. |
| Full-cost initial boundary | submitted-task execution/cancellation, shutdown wait, CPU, RSS, latency, and executor resource reclamation. |
| Closure route | Official API contract plus a small public Java lifecycle program could serve as Stage0 evidence only if a non-generic constructor survives. |
| Raw disposition | `EXCLUDED_BEFORE_RAW__FIXED_ENDPOINT_LEAVES_ONLY_GENERIC_LIFECYCLE_POLICY`. |

