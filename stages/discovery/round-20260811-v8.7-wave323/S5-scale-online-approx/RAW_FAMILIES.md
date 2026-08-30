# Online checkpoint/compaction family screen

| ID | Fixed object and stock semantics | Official current entry | Result |
| --- | --- | --- | --- |
| R1 | Berkeley DB transactional database + recovery-visible key/value state | [checkpoint](https://docs.oracle.com/database/bdb181/html/programmer_reference/transapp_checkpoint.html), [recovery](https://docs.oracle.com/database/bdb181/html/programmer_reference/transapp_reclimit.html) | deep |
| R2 | ZooKeeper znode state, snapshots, transaction logs and server recovery | [3.9 admin guide](https://zookeeper.apache.org/doc/current/zookeeperAdmin.html) | deep |
| R3 | Pulsar compacted topic and consumer-visible latest-per-key stream | [topic compaction](https://pulsar.apache.org/docs/4.1.x/concepts-topic-compaction/) | deep |
| R4 | TensorFlow trackable object graph and restored values | [CheckpointManager](https://www.tensorflow.org/api_docs/python/tf/train/CheckpointManager) | `DROP__RETENTION_CONTROLLER` |
| R5 | PyTorch module/optimizer checkpoint and stock `torch.load` result | [PyTorch serialization](https://docs.pytorch.org/docs/stable/notes/serialization.html) | `NOT_ADMITTED_UNFROZEN`: no versioned natural training-update/recovery carrier frozen |
| R6 | BookKeeper ledger entries and recovery/read result | [Apache BookKeeper project](https://bookkeeper.apache.org/) | `NOT_ADMITTED_UNFROZEN`: current source/action union was not closed from accessible first-party material |

R4 is retention selection; R5/R6 are not scientific negatives.
