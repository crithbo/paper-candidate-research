# Offline divergence seed pool

Seeds are non-evidentiary prompts generated before public-source inspection; they do not count as opportunity families.

| Seed | Boundary prompt | Cluster | Selected |
|---|---|---|---|
| S100-01 | Reader admission may be constrained by blocked-writer visibility at a rwlock acquisition boundary. | lock admission | yes |
| S100-02 | Recursive read-lock depth may differ from writer reservation accounting. | ownership | no |
| S100-03 | Try-read failure may expose a progress-versus-observability seam. | nonblocking | no |
| S100-04 | Priority-scheduled rwlock waits may split fairness from ordinary admission. | priority | no |
| S100-05 | Process-shared rwlocks may change the placement of waiter metadata. | sharing | no |
| S100-06 | Writer release may select a reader cohort or writer in a way that affects cache locality. | handoff | no |

Coverage rule: S100-01 was selected because a current public POSIX contract fixes the reader/writer admission endpoint; unanchored prompts are not raw this cycle.

