# UNIQUE_OPPORTUNITY_FAMILIES

| ID | Exact same-object contract | Current native union / commit invariant | Natural carrier and oracle | Screening result |
|---|---|---|---|---|
| U01 | Fixed SQLite WAL database, SQL result and atomic-commit/read-snapshot semantics. | Commit record establishes reader end-mark; PASSIVE/FULL/RESTART checkpoint actions, auto-checkpoint threshold, reader locks, WAL reset/recycle. | SQLite speedtest/TH3-style SQL workload plus stock `PRAGMA integrity_check`, WAL/checkpoint return values and recovery reopen. | Deep; structural drop. |
| U02 | Fixed PostgreSQL 2PC transaction graph with XA-style prepared/commit/rollback semantics. | `PREPARE`, only `COMMIT PREPARED` or `ROLLBACK PREPARED`, WAL/shared-memory to `pg_twophase` checkpoint path, recovery. | `src/test/regress` prepared-transaction cases; SQL/catalog/WAL recovery oracle. | Deep; structural drop. |
| U03 | Fixed LLVM ORCv2 JITDylib, symbol/interface and safe-to-call ownership semantics. | ExecutionSession lookup/materialization, dependencies, MaterializationResponsibility, ResourceTracker transfer/remove, failure notification. | LLVM ORC unit tests and examples; JIT symbol lookup/error and removal oracle. | Deep; structural drop. |
| U04 | Fixed etcd member WAL+snapshot recovery to identical KV/revision state. | Snapshot then WAL replay, persisted member layout. | etcd integration tests and member data fixtures. | Unfrozen. |
| U05 | Fixed Kafka transactional records and read-committed visibility. | Coordinator state, producer epoch, transaction markers and recovery configuration. | Kafka transactional test suite / generated event traces. | Unfrozen. |
| U06 | Fixed Btrfs transaction/root state under a stated crash model. | Transaction commit and root publication paths, mount and fault-injection configuration. | xfstests and Btrfs checker/replay route. | Unfrozen. |

U01–U03 are mutually distinct and distinct from registered database/index/format topics: their objects are respectively SQLite WAL visibility, PostgreSQL 2PC durable prepared state, and ORC JIT resource ownership—not a reader/writer format, RocksDB, GIN, Arrow, Parquet, Git, or a current S2–S6 object.
