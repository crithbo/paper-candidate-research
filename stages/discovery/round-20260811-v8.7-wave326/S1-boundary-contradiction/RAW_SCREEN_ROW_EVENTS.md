# RAW_SCREEN_ROW_EVENTS

| ID | Fresh family | Concrete same-object native two-action witness before deep promotion | Result |
|---|---|---|---|
| R01 | Redis AOF manifest/rewrite commit | Redis may append to the active incremental AOF during rewrite, then atomically switch manifest/base/incremental files; recovery rebuilds from the manifest. | Deep |
| R02 | containerd content ingest/commit/lease release | A writer may commit a digest-verified ingest, or abort it; a lease can retain content across the ownership transition. | Deep |
| R03 | OCI Distribution resumable upload/finalize | A client PATCHes a current upload UUID then finalizes with PUT digest, versus deleting/aborting the same upload. | Deep |
| R04 | MySQL binlog/group-commit visibility | A transaction joins a group flush or forces a direct flush according to binlog sync/order paths. | `NOT_ADMITTED_UNFROZEN` |
| R05 | LMDB meta-page root publication | Writer alternates durable meta pages; reader selects latest valid transaction ID. | `NOT_ADMITTED_UNFROZEN` |
| R06 | QEMU migration switchover/runstate | Source stops and destination resumes only after migration state transition. | `NOT_ADMITTED_UNFROZEN` |
| R07 | Linux OverlayFS copy-up / fsync | Operation selects metacopy/copy-up and upper fsync path. | `NOT_ADMITTED_UNFROZEN` |
| R08 | systemd journal rotate/seal visibility | Active journal append and rotation/seal transition expose different durable files. | `NOT_ADMITTED_UNFROZEN` |
| R09 | Wasmtime store/instance resource teardown | Instance/resource state can be consumed or dropped under store ownership. | `NOT_ADMITTED_UNFROZEN` |
| R10 | NATS JetStream stream snapshot/consumer ack | Consumer acknowledgement and stream snapshot/recovery are distinct state transitions. | `NOT_ADMITTED_UNFROZEN` |

Cross-dedup exclusions: all existing registry objects; active S2 Wave327 end-to-end bottlenecks, S3 Wave328 versioned reuse, S4 Wave329 regime change, S5 Wave330 recourse migration, S6 Wave331 artifact residual; S1 historical Btrfs, SQLite WAL, PostgreSQL 2PC, LLVM ORC, all ISA/backend families, Git/RocksDB/Arrow/Parquet and io_uring/QUIC.
