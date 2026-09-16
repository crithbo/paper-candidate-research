# Primary-source collision/action matrix

Sources were checked to 2026-08-11. The table makes no claim that a current upstream lacks an action: v8.7 implementation-absence audit is therefore `NOT_TRIGGERED` for all deep reviews.

| Family / first-party source | Exact online object and guarantee | Fair native + generic union / full-cost | Disposition |
|---|---|---|---|
| [RangeReduce](https://disc.bu.edu/papers/icde26-kaushik) | LSM range queries with updates; correct query output. | Query-driven compaction + standard LSM merge; query I/O/CPU, compaction reads/writes, space debt. | `DROP`: residual is invoke/score policy. |
| [SynchroStore](https://arxiv.org/abs/2503.18688) | Hybrid update/query storage; incremental row-to-column transformation. | Native incremental row state, freeze/transform/compaction, column-store comparators. | `DROP`: representation action already supplied. |
| [Mycelium](https://arxiv.org/abs/2506.08923) | Transformation-embedded LSM compaction; unchanged KV function. | TE-LSM transformer interface, cross-column-family merge, standard compaction. | `DROP`: direct action plus excluded RocksDB lineage. |
| [LSM-Raft](https://bishtref.com/articles/10.1145/3769805) | Strongly consistent log replication with compacted SSTable entries. | Native compacted-log representation, Raft/LSM union; replication + compaction traffic and correctness. | `DROP`: complete construction. |
| [Coordinated sorted-runs partitioning](https://doi.org/10.1186/s40537-025-01298-0) | LSM merge/compaction across sorted runs. | Leveled/stack-based and partitioned sub-compactions; read/write/space costs. | `DIRECT_SUBTRACT`: generic compaction union. |
| [EcoTune compaction policies](https://doi.org/10.1145/3725344) | LSM compaction under workload characterization. | Dynamic-program policy selection over compaction action space. | `EXCLUDED`: controller/policy. |
| [Mnemosyne BF tuning](https://cs-people.bu.edu/mathan/publications/pacmmod25-zhu.pdf) | Dynamic Bloom-filter tuning/rebuild in LSM. | Statistics plus BF parameter/rebuild choices. | `EXCLUDED`: configuration controller. |
| [GDH+](https://doi.org/10.1145/3799980) | LSM KV store with key-value separation/migration. | GPU hierarchy, GC and adaptive migration. | `EXCLUDED`: GPU/hardware line; also migration selection. |
| [Incr](https://www.usenix.org/conference/osdi26/presentation/xie-yizheng) | Incremental re-execution of shell programs. | Automatic incrementalization and re-execution semantics. | `EXCLUDED_REPEAT`: prior non-storage incrementalization family. |
| [NoSQL refactoring study](https://doi.org/10.1016/j.is.2026.102743) | Schema evolution and data migration over public SkyServer history. | Schema/migration decision framework and offline snapshots. | `EXCLUDED`: migration decision/controller, not a complete online construction. |

## Current-reality record

| Deep line | Material checked | Result |
|---|---|---|
| RangeReduce | Author lab ICDE 2026 project record, checked 2026-08-11. | Positive compaction action and cost collision; no source/flag absence claim. |
| SynchroStore | Author original technical-report record, checked 2026-08-11. | Positive row/column transformation action; no current-upstream absence claim. |
| Mycelium | Author original preprint, checked 2026-08-11. | Positive transformation-embedded action; RocksDB lineage is exclusion, not an absence claim. |
| LSM-Raft | Original article record, checked 2026-08-11. | Positive compacted-log action; no source/configuration absence claim. |

This bounded review does not claim worldwide novelty absence.
