# Offline divergence seed pool

Seeds are non-evidentiary prompts made before public-source inspection; they do not count as opportunity families.

| Seed | Boundary prompt | Cluster | Selected |
|---|---|---|---|
| S98-01 | Phaser phase-advance publication may differ from registration-tree ownership. | synchronization | yes |
| S98-02 | Phase termination via `onAdvance` may split release and observability. | termination | no |
| S98-03 | Parent-child deregistration can differ from local phase completion. | hierarchy | no |
| S98-04 | Interruptible waits may differ from persistent phase state. | interruption | no |
| S98-05 | `forceTermination` may expose an abrupt-release boundary. | recovery | no |
| S98-06 | Large-party barrier contention may interact with tier topology. | placement | no |

Coverage rule: S98-01 was chosen because a stable public API fixes both phase semantics and the hierarchy primitive. The remaining prompts were not anchored this cycle.

