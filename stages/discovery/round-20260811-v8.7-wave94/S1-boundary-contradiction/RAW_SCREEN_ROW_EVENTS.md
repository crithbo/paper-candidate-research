# RAW_SCREEN_ROW_EVENT

| ID | Unique family / official source | Result |
|---|---|---|
| R01 | FoundationDB ACID/MVCC ([developer guide](https://apple.github.io/foundationdb/developer-guide.html), [upstream](https://github.com/apple/foundationdb)) | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R02 | etcd compare-and-transaction ([official guide](https://etcd.io/docs/v3.8/tasks/developer/how-to-transactional-write/)) | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R03 | Redis MULTI/EXEC/WATCH ([official docs](https://redis.io/docs/latest/develop/using-commands/transactions/)) | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R04 | PostgreSQL MVCC/isolation ([current docs](https://www.postgresql.org/docs/current/transaction-iso.html)) | `STRUCTURAL_DROP__ISOLATION_POLICY` |
| R05 | MongoDB transactions/read-write concern ([official docs](https://www.mongodb.com/docs/manual/core/transactions/)) | `STRUCTURAL_DROP__CONCERN_POLICY` |
| R06 | SQLite atomic commit ([official atomic commit](https://sqlite.org/atomiccommit.html)) | `STRUCTURAL_DROP__PREVIOUS_OBJECT_FAMILY_AVOIDANCE` |

No current-absence claim is made.
