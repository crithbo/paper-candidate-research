# Offline divergence seed pool

Seeds are non-evidentiary prompts made before public-source inspection; they do not count as opportunity families.

| Seed | Boundary prompt | Cluster | Selected |
|---|---|---|---|
| S99-01 | A barrier's serial-return thread may separate phase release from serial-section ownership. | barrier lifecycle | yes |
| S99-02 | Barrier reset after the last arrival may differ from post-phase visibility. | reset | no |
| S99-03 | Thread cancellation near a barrier can expose a release/consistency edge. | cancellation | no |
| S99-04 | Process-shared barriers may have a different ownership boundary. | sharing | no |
| S99-05 | Nested barrier phases may couple leader reuse and worker locality. | locality | no |
| S99-06 | Barrier implementation can differ from a mutex/condition-variable emulation. | primitive choice | no |

Coverage rule: S99-01 was selected because the current POSIX contract fixes a serial-return and reset endpoint. The remaining prompts were not anchored this cycle.

