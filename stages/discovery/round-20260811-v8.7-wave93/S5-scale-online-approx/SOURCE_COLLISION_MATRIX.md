# Primary-source collision / state-transfer matrix

All sources were checked through 2026-08-11. No implementation-absence claim is made; v8.7 source/flag absence review is `NOT_TRIGGERED` for the deep lines.

| Family / primary source | Frozen same object / guarantee | Strongest fair union and full-cost | Disposition |
|---|---|---|---|
| [Progressive BFT state transfer](https://doi.org/10.1016/j.jpdc.2025.105215) | Replicated divisible state, including larger-than-memory checkpoints and recovery correctness. | Partitioned/differential checkpoints and state transfer; bytes, checkpoint work, recovery time, replica load. | `DROP`: complete partition-transfer action. |
| [Styx state migration](https://doi.org/10.1007/s00778-026-00971-x) | Stateful serverless transactions with serializability and exactly-once behavior. | Dataflow state transfer plus deterministic transaction protocol; transfer, transaction, cache and reply cost. | `DROP`: complete native semantics. |
| [Elastic state machine replication](https://doi.org/10.1109/TPDS.2017.2686383) | Crash/Byzantine SMR dynamic partition creation/destruction. | Modular partition transfer + compatible SMR reconfiguration; availability/safety and transfer cost. | `DROP`: direct complete construction. |
| [History-equivalence migration](https://arxiv.org/abs/2412.08314) | Process workflow/Petri-net state migration via history-equivalent mapping. | Native mapping/consistency relation and migration legality. | `DROP`: equivalence action already named. |
| [PAM reactive stream reconfiguration](https://2024.eurosys.org/posters/eurosys24posters-paper25.pdf) | Stateful stream reconfiguration under moving-state cost. | Stream state movement and reactive reconfiguration. | `DIRECT_SUBTRACT`: related same semantic/cost union. |
| [DEFT state management](https://arxiv.org/abs/2311.18595) | Elastic and fault-tolerant network-function state. | Complete state-management system and compatible NF transfer. | `DIRECT_SUBTRACT`: current generic state-management union. |
| [Replication-free failover](https://conf.researchr.org/details/fse-2026/fse-2026-industry-papers/25/Replication-Free-Failover-Protocol-Fenced-Takeover-for-Stateful-Services) | Stateful service failover under protocol-fenced takeover. | Local/cloud-block state and takeover protocol; failover latency/cost. | `METHODOLOGICAL_ADJACENT`: failure takeover, not a residual reconfiguration action. |
| [Stateful DT cross-domain migration](https://doi.org/10.3390/electronics15101995) | Digital-twin state migration with legitimacy/continuity/revocation. | Authentication, protected transfer and stale-source invalidation. | `EXCLUDED`: security-protocol object. |
| [ReStore](https://doi.org/10.1145/3802104) | Multi-tier storage placement/migration under changing access. | RL policy over page migrations, industry traces. | `EXCLUDED`: generic controller. |
| [CLAPS](https://doi.org/10.1145/3788853.3803082) | Stateful cloud-storage proxy pooling. | Elastic proxy-pool management. | `EXCLUDED`: resource-pooling/controller object. |

## Current-reality record

| Deep line | Current first-party material checked | Outcome |
|---|---|---|
| Progressive BFT | Original 2026 journal paper record, checked 2026-08-11. | Positive transferable-state action; no upstream absence claim. |
| Styx | Author institution / VLDB Journal record, checked 2026-08-11. | Positive exact transaction/state semantics; no source/flag absence claim. |
| Elastic SMR | Original author publication page and DOI record, checked 2026-08-11. | Positive transfer/protocol union. |
| History equivalence | Original author preprint, checked 2026-08-11. | Positive equivalence action union. |

This is a bounded collision record, not a global novelty assertion.
