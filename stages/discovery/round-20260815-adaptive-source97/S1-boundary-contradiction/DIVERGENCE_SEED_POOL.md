# Offline divergence seed pool

Seeds are non-evidentiary prompts, generated before source inspection; they are not opportunity-family counts.

| Seed | Boundary prompt | Cluster | Selected |
|---|---|---|---|
| S97-01 | Executor close publishes shutdown while completed-task visibility is collected through futures. | lifecycle | yes |
| S97-02 | `invokeAll` cancellation at timeout may split completion and result collection. | bulk completion | no |
| S97-03 | Work-stealing pool termination may expose task accounting distinct from worker retirement. | runtime | no |
| S97-04 | Scheduled-executor delayed-task cancellation can differ from shutdown policy. | delayed work | no |
| S97-05 | Virtual-thread per-task executor closure may couple lexical scope and thread termination. | virtual threads | no |
| S97-06 | Fork/join quiescence may differ from externally observable future completion. | quiescence | no |

Coverage rule: one lifecycle seed was selected because it has an exact public API anchor and a fixed submitted-task endpoint; the remaining seeds were not evidence-qualified this cycle.

