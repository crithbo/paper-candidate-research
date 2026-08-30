# RAW_SCREEN_ROW_EVENT

| ID | Unique current family / first-party source | Whole atomic action sketch + same-object guarantee | Strongest union / result |
|---|---|---|---|
| R01 | Ceph PG recovery ([docs](https://docs.ceph.com/en/latest/rados/operations/pg-repair/)) | Restore a PG so reads observe exactly the committed object versions after OSD failure. | Native peering/recovery/scrub; only heuristic is scheduling/controller. `NOT_ADMITTED_UNFROZEN`. |
| R02 | HDFS lease recovery ([docs](https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-hdfs/HdfsUserGuide.html)) | Recover a file so completed block sequence is visible once and partial writer state is not. | Native lease/block recovery; no union-external action sketch. `NOT_ADMITTED_UNFROZEN`. |
| R03 | Cassandra hinted handoff/repair ([docs](https://cassandra.apache.org/doc/latest/cassandra/managing/operating/hints.html)) | Reconcile one partition to the documented consistency/visibility point after replica failure. | Native hints/repair/consistency policy; controller only. `NOT_ADMITTED_UNFROZEN`. |
| R04 | MySQL InnoDB crash recovery ([docs](https://dev.mysql.com/doc/refman/8.4/en/innodb-recovery.html)) | Replay committed state and discard incomplete transaction effects. | Native redo/undo/checkpoint recovery. `NOT_ADMITTED_UNFROZEN`. |
| R05 | MongoDB replica-set rollback ([docs](https://www.mongodb.com/docs/manual/core/replica-set-rollbacks/)) | Recover one replica to the primary-observable committed history. | Native rollback/election/replication protocol; no complete action. `NOT_ADMITTED_UNFROZEN`. |
| R06 | Apache BookKeeper ledger recovery ([docs](https://bookkeeper.apache.org/docs/latest/api/ledger-recovery/)) | Fence/recover ledger such that acknowledged entries remain and writer failure cannot append stale effects. | Native fencing/recovery; retry wrapper only. `NOT_ADMITTED_UNFROZEN`. |
