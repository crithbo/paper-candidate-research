# RAW_SCREEN_ROW_EVENTS

| Event | Family | Boundary witness sketched before deep review | Disposition | Reason |
|---|---|---|---|---|
| R01 | SQLite WAL commit/checkpoint/read-endmark | A committed WAL frame can be visible to a new reader while its page has not been checkpointed. | `CANDIDATE_GRADE_DEEP_REVIEW` | Native state, fixed visibility point, stock checker, public SQL corpus. |
| R02 | PostgreSQL prepared transaction / checkpoint handoff | A prepared transaction crossing a checkpoint moves durable state from WAL/shared memory to `pg_twophase`, while only COMMIT/ROLLBACK PREPARED may follow. | `CANDIDATE_GRADE_DEEP_REVIEW` | Strong recovery boundary and stock regression route. |
| R03 | LLVM ORC resource-tracker materialization/removal | A resource removal races a still materializing unit; the responsibility must fail rather than publish removed code. | `CANDIDATE_GRADE_DEEP_REVIEW` | Explicit native ownership state machine and upstream tests. |
| R04 | etcd WAL/snapshot replay | Replay begins from snapshot plus subsequent WAL segments. | `NOT_ADMITTED_UNFROZEN` | Public documentation exists, but this breadth pass did not close exact current WAL/snapshot source union and flags without downloading source. |
| R05 | Kafka transaction marker/recovery | Transactional visibility changes only after coordinator/partition marker handling. | `NOT_ADMITTED_UNFROZEN` | Official coordinator subtree identified, but complete current broker/config union and direct-collision subtraction were not finitely closed. |
| R06 | Linux Btrfs transaction commit/tree-root publication | Root-pointer publication follows transaction commit semantics. | `NOT_ADMITTED_UNFROZEN` | Kernel source/config/fault-model union is too broad for an honest 72h same-object closure in this batch. |

Excluded before counting: Git/RocksDB/Arrow/Parquet/SQLite FTS5, all registered active or terminal objects, all S1 ISA/backend families, io_uring and QUIC prior lineages, and all current S2–S6 assignment objects.
