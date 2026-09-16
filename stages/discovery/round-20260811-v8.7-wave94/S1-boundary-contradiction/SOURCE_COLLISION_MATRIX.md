# SOURCE_COLLISION_MATRIX

| Object | Current first-party reality | Result |
|---|---|---|
| FoundationDB | [Developer guide](https://apple.github.io/foundationdb/developer-guide.html), [upstream](https://github.com/apple/foundationdb) | MVCC/conflict/atomic/retry union absorbs. |
| etcd | [Transaction guide](https://etcd.io/docs/v3.8/tasks/developer/how-to-transactional-write/) | Compare/then/else native union. |
| Redis | [Transactions](https://redis.io/docs/latest/develop/using-commands/transactions/) | MULTI/EXEC/WATCH native union. |
| PostgreSQL | [Isolation](https://www.postgresql.org/docs/current/transaction-iso.html) | Policy/guarantee choice. |
| MongoDB | [Transactions](https://www.mongodb.com/docs/manual/core/transactions/) | Concern policy. |
| SQLite | [Atomic commit](https://sqlite.org/atomiccommit.html) | Excluded prior family. |
