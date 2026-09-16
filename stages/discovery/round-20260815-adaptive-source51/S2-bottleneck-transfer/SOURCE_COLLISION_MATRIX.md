# Current-source collision matrix

| Raw | Complete current union | Decision |
|---|---|---|
| TensorRT streaming engine | Strongly-typed weight-streaming build flag, runtime V2 budget, explicit scratch/weight queries and automatic retained-weight selection already jointly govern host-device residency and compute/fetch overlap. | `STRUCTURAL_DROP__CURRENT_ENGINE_BUDGET_AND_AUTOMATIC_RESIDENCY_UNION` |
| NCCL fixed collective | Tuner-plugin selection/loading plus the internal tuner comprise policy/path tuning. A plugin/controller is excluded, not a target-specific same-object constructor. | `STRUCTURAL_DROP__EXTERNAL_TUNER_CONTROLLER_OR_CURRENT_TUNER_UNION` |

No exhaustive literature-novelty claim is made; direct current-source absorption decides the two rows.
