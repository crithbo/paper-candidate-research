# Raw screen row events

| ID | Family | Native split-commit witness | Result |
|---|---|---|---|
| R01 | ext4 Fast Commit / JBD2 | An eligible fsync is logged through Fast Commit; an ineligible complex operation uses JBD2. Both recover to the same ext4 contract. | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R02 | OpenZFS ZIL / transaction group | A synchronous write has a ZIL intent-log recovery path while durable main-tree propagation occurs through a transaction group. | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R03 | ZooKeeper snapshot / transaction-log replay | Startup recovers a snapshot plus ordered transaction log, while snapshot creation establishes a later recovery base. | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R04 | F2FS checkpoint / node-data logs | Checkpoint and log replay form the stock recovery split, but the current composition and direct subtractors were not closed here. | `NOT_ADMITTED_UNFROZEN` |
| R05 | Apache BookKeeper journal / entry-log flush | Journal durability and entry-log persistence are distinct stock commitments; no complete current action union was pinned. | `NOT_ADMITTED_UNFROZEN` |
| R06 | Apache Cassandra commit-log / SSTable flush | Commit-log acknowledgement and later table flush are distinct recovery commitments; source/config union not closed. | `NOT_ADMITTED_UNFROZEN` |
| R07 | LevelDB log / MANIFEST-CURRENT publication | Log recovery and version-manifest publication expose different commit points; current source and collision closure not completed. | `NOT_ADMITTED_UNFROZEN` |
| R08 | bcachefs journal / replay | Native journal and recovery states exist, but complete current semantics and direct collision were not frozen. | `NOT_ADMITTED_UNFROZEN` |
| R09 | Mercurial transaction / rollback journal | Transaction completion and rollback journal removal are a natural split, but official current documentation/source closure was unavailable in this batch. | `NOT_ADMITTED_UNFROZEN` |
| R10 | JFS journal recovery | Journaling gives a recovery boundary, but no current upstream action-union closure was established. | `NOT_ADMITTED_UNFROZEN` |

Excluded before screening: registry-reviewed WAL, 2PC, AOF, LMDB, MySQL, containerd, OCI, and Btrfs objects.
