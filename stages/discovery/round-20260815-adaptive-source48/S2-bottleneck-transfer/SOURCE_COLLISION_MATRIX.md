# Current-source and collision matrix

| Family | Current official/source evidence | Current complete same-object union | Decision |
|---|---|---|---|
| cuDNN graph plan/workspace | Graph API and frontend source expose operation graph validation, engine/configuration, heuristics, explicit selection/filter/autotune, plan build and workspace size/query. | Engine plan + selected-plan workspace is native. No paper-owned or wrapper mechanism is needed to express the suggested action. | `STRUCTURAL_DROP` — direct current-union absorption. |
| PyTorch CUDA-graph tree/pool | Official CUDA notes plus current upstream implement graph-private pools, capture/replay, liveness tracking, tree branches and pool checkpoints. | Tree construction and pool state are native action, including liveness-dependent rerecording. | `STRUCTURAL_DROP` — direct current-union absorption. |
| ROCr queue scratch residency | Official current docs specify default and non-default scratch reclaim/retention behavior and queue-affiliated residency. | The suggested switch is an environment/runtime configuration or runtime controller; no independent target-specific whole-constructor was named. | `STRUCTURAL_DROP` — configuration/controller, not N1/N2/N3. |

Latest-collision ceiling: these source-level direct subtractors decide the three raw rows. No claim of exhaustive literature novelty or performance conclusion is made.
