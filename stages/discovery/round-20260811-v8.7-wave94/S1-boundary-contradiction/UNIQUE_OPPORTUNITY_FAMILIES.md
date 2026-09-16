# UNIQUE_OPPORTUNITY_FAMILIES

| Family | Fixed object/atomic action | Current union; natural carrier/full cost | Status |
|---|---|---|---|
| FoundationDB | KV transaction with fixed strict-serializable commit/unknown-result semantics; choose conflict/atomic action. | Native MVCC, conflict sets, atomic ops, commit/retry; public KV workloads; reads/writes, commit, retries, latency, I/O, memory, state/side effects. | Deep |
| etcd | Compare + success/failure block with identical revision-visible outcome. | Native compare/then/else transaction; public etcd workloads; RPC, raft commit, revision, errors, latency. | Deep |
| Redis | Fixed MULTI/EXEC/WATCH command group and visible state/error. | Native transaction queue/exec/watch; public command traces; queue, execution, persistence, state and failures. | Deep |
| PostgreSQL | SQL transaction with fixed isolation/result. | Native MVCC/isolation levels; query workloads; planning/execution, locks, WAL, state/errors. | Drop |
| MongoDB | Transaction with fixed read/write concerns. | Native transaction/coordinator concern semantics. | Drop |
| SQLite | Excluded prior storage object family. | N/A | Drop |
