# Raw screen row events

All previously reviewed storage commit families are excluded, including WAL, 2PC, AOF, LMDB, MySQL, containerd/OCI, Btrfs, ext4, OpenZFS, ZooKeeper snapshot/log, F2FS, BookKeeper, Cassandra, LevelDB, bcachefs, Mercurial, and JFS.

| ID | Fresh family | Stock checker/replay and apparent publication boundary | Admission result |
|---|---|---|---|
| R01 | etcd Raft proposal commit/apply | Raft replay/snapshot recovery and linearizable read checks exist; commit-index versus state-machine apply is a native visibility split. | `NOT_ADMITTED_UNFROZEN`: this batch did not close all raft/storage/runtime configuration paths or a non-controller construction. |
| R02 | Apache Kafka transactional `read_committed` | Broker recovery and consumer isolation check commit/abort markers; LSO hides an open transaction from `read_committed` consumers. | `STRUCTURAL_DROP`: repartitioning marker publication is transaction coordination/policy, not a target-specific same-object construction. |
| R03 | Linux livepatch task transition | Per-task patch state is observable and transition-aware, but no crash/replay oracle preserving the requested recovery contract was identified. | `NOT_ADMITTED_UNFROZEN` |
| R04 | HotSpot class initialization | Bytecode verification precedes class initialization and failure is recorded; no native replay oracle or legal grouping action that preserves Java initialization semantics was frozen. | `NOT_ADMITTED_UNFROZEN` |
| R05 | WebAssembly component instantiation | Validation is a native checker and instantiation links imports/exports, but no crash/replay publication boundary under a fixed component contract was established. | `NOT_ADMITTED_UNFROZEN` |
| R06 | QUIC/TLS handshake key availability | Protocol state verifies transcript and changes which traffic keys can be used, but recovery/replay semantics and a non-controller grouping action were not present. | `STRUCTURAL_DROP` |
| R07 | Linux eBPF program/link attachment | Verifier gates native attach/publication, yet the remaining action is attach policy or instrumentation; no same-object replay constructor was found. | `STRUCTURAL_DROP` |
| R08 | systemd unit manager reload/reexec | Unit state serialisation/reexec provides restart continuity, but publication grouping is manager policy and no checker-derived target-specific guarantee was isolated. | `STRUCTURAL_DROP` |
| R09 | LLVM thin-link / final-link publication | IR/object verification and final link publication exist, but this is an artifact/storage pipeline and falls outside the requested non-storage-commit freshness boundary. | `EXCLUDED` |
| R10 | Linux IMA policy/keyring update | Integrity checking gates activation, but no native replayable partial-publication witness preserving one fixed policy guarantee was frozen. | `NOT_ADMITTED_UNFROZEN` |

No row was promoted merely because it contains a state transition, flag, retry rule, controller, or checker.
