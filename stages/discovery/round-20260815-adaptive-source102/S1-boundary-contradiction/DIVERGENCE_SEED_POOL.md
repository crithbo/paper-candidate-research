# Offline divergence seed pool

Seeds are non-evidentiary prompts generated before public-source inspection; they do not count as opportunity families.

| Seed | Boundary prompt | Cluster | Selected |
|---|---|---|---|
| S102-01 | Robust-mutex owner death may separate lock acquisition from protected-state recovery publication. | recovery | yes |
| S102-02 | `EOWNERDEAD` can distinguish recovery ownership from normal ownership. | ownership | no |
| S102-03 | Marking consistency may differ from making protected state durable/visible. | commit | no |
| S102-04 | Permanent non-recoverability may create a state-machine terminal boundary. | failure | no |
| S102-05 | Process-shared robust mutexes may expose cross-process recovery metadata. | sharing | no |
| S102-06 | Condition-wait reacquisition after owner death may alter recovery handoff. | wait/reacquire | no |

Coverage rule: S102-01 was selected because POSIX provides an exact current standard contract for recovery notification and the consistent/nonrecoverable decision. Other prompts were not anchored this cycle.

