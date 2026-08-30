# SOURCE_COLLISION_MATRIX

| Family | Current official recovery semantic surface | Classification |
|---|---|---|
| Ceph | [PG repair](https://docs.ceph.com/en/latest/rados/operations/pg-repair/) | Native recovery/scheduling union. |
| HDFS | [HDFS guide](https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-hdfs/HdfsUserGuide.html) | Native lease/block recovery union. |
| Cassandra | [Hints](https://cassandra.apache.org/doc/latest/cassandra/managing/operating/hints.html) | Hints/repair/policy union. |
| InnoDB | [Recovery](https://dev.mysql.com/doc/refman/8.4/en/innodb-recovery.html) | Redo/undo/checkpoint union. |
| MongoDB | [Rollback](https://www.mongodb.com/docs/manual/core/replica-set-rollbacks/) | Replication/rollback union. |
| BookKeeper | [Ledger recovery](https://bookkeeper.apache.org/docs/latest/api/ledger-recovery/) | Fencing/recovery union. |
