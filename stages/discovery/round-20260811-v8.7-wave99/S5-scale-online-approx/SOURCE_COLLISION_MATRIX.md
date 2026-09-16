# Six-object primary-source collision matrix

All six reviews use first-party proceedings/paper records checked through 2026-08-11. No row asserts a missing upstream action, so the v8.7 implementation-absence audit is `NOT_TRIGGERED`.

| Object / primary source | Frozen information, state action, guarantee | Fair union, full-cost and natural carrier | Disposition |
|---|---|---|---|
| [Dynamic replication](https://doi.org/10.1016/j.tcs.2026.115992) | Online requests; replica placement/movement; competitive storage/access cost. | Native online replication + prior replication algorithms; storage, access and migration. Real object-access traces reported. | `DROP`: action already complete. |
| [Competitive dynamization](https://www.cs.ucr.edu/~neal/publication/Mathieu24Competitive.pdf) | Online weighted batches/read rates; dynamic merge state; competitive cost. | Dynamization/online set-cover plus merge/compaction policies; rebuild/read/write costs. | `DROP`: direct action, and LSM reuse excluded. |
| [Metric matching with recourse](https://doi.org/10.1007/s00453-025-01299-8) | Online requests on line; rematching state; cost/recourse tradeoff. | t-net/block algorithm and online matching predecessors; service and rematch cost. | `DROP`: no new action / natural closure unfrozen. |
| [Rigid-DAG scheduling](https://doi.org/10.1145/3694906.3743329) | Ready-task online revelation; task-allocation state; makespan competitiveness. | CATBATCH + valid online schedulers; execution/makespan cost. HPC task graphs are natural carrier. | `DROP`: migration import changes object. |
| [Knapsack removal and recourse](https://doi.org/10.1016/j.jcss.2025.103697) | Online item arrivals; pack/remove/reinsert state; tight competitive tradeoff. | Native recourse algorithms; value and all removal/reinsert work. | `DROP`: no same-object natural closure or new representation. |
| [DistroMatch](https://doi.org/10.1145/3797905.3800555) | Demand-aware online optical topology; matching state; distributed matching quality. | Native distributed matching + centralized matching baseline; topology reconfiguration/communication cost. Datacenter demand matrix carrier. | `DROP`: trigger/controller only. |

## Reality/fidelity note

The primary sources establish positive native mechanisms rather than current implementation absence. Therefore no source-symbol/default-flag assertion is made. Any Stage-A killer would need to compare same information and include all service plus recourse/rebuild/migration cost; none can be honestly specified until a union-external complete action exists.
