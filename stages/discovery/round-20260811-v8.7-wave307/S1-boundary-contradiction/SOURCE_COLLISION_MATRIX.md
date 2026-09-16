# SOURCE_COLLISION_MATRIX

All sources below are first-party documentation/source or original papers; checked 2026-08-11. A source establishes only the claim stated here.

| Family | Current official evidence / source pin | Collision or subtractor | Conclusion |
|---|---|---|---|
| SQLite WAL | [SQLite WAL](https://www.sqlite.org/wal.html), [SQLite wal.c](https://www.sqlite.org/src/doc/trunk/src/wal.c) | [TxFS (USENIX ATC 2018)](https://www.usenix.org/system/files/conference/atc18/atc18-hu.pdf), [WALDIO (USENIX ATC 2015)](https://www.usenix.org/system/files/conference/atc15/atc15-paper-lee-wongun.pdf) | Stock checkpoint modes/threshold/hook already express the policy actions; papers alter lower-layer assumptions. |
| PostgreSQL 2PC | [Current 2PC docs](https://www.postgresql.org/docs/current/two-phase.html), [current WAL contract](https://www.postgresql.org/docs/current/wal-intro.html), [current twophase source](https://github.com/postgres/postgres/blob/master/src/backend/access/transam/twophase.c) | Stock X/Open-shaped 2PC and WAL recovery union | No native complete action beyond terminal protocol transition; scheduling is external control. |
| LLVM ORC | [ORCv2 design](https://llvm.org/docs/ORCv2.html), [Core.cpp current source](https://llvm.org/doxygen/ExecutionEngine_2Orc_2Core_8cpp_source.html), [JITLink callback contract](https://llvm.org/docs/JITLink.html) | [ResourceTracker original upstream commit](https://lists.llvm.org/pipermail/llvm-commits/Week-of-Mon-20201012/842304.html) | Explicit remove/transfer/failure state machine directly absorbs candidate. |
| etcd | [persistent storage layout](https://etcd.io/docs/v3.6/learning/persistent-storage-files/), [official upstream](https://github.com/etcd-io/etcd) | not completed | `NOT_ADMITTED_UNFROZEN`; no absence claim. |
| Kafka | [official documentation](https://kafka.apache.org/documentation/), [transaction-coordinator source](https://github.com/apache/kafka/tree/trunk/transaction-coordinator) | not completed | `NOT_ADMITTED_UNFROZEN`; no absence claim. |
| Btrfs | [Linux filesystem documentation](https://docs.kernel.org/filesystems/btrfs/) | not completed | `NOT_ADMITTED_UNFROZEN`; scope too broad for finite closure. |
