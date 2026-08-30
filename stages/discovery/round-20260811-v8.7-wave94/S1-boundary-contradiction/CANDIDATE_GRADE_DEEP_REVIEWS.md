# CANDIDATE_GRADE_DEEP_REVIEWS

## D01 FoundationDB

**Contract:** fixed key range, snapshot, commit point, strict serializability, and unknown-result handling. The [developer guide](https://apple.github.io/foundationdb/developer-guide.html) states ACID/MVCC, conflict-at-commit, atomic operations and client retry boundary. **Atomic action:** use only transaction read/write/conflict information to commit a multi-key update. **Strong union:** native MVCC, conflict ranges, atomic operations, commit protocol and retry API. **Natural/full cost:** public KV workloads; reads/writes, conflict work, commit, retry, I/O/memory, final state and side effects. **72h killer:** a conflicting read-write pair plus unknown-result witness: stale/duplicated effect fails the contract; a correct action replays native conflict/atomic behavior. **Decision:** `DROP__CURRENT_UNION_OR_RETRY_CONTROLLER`.

## D02 etcd

**Contract:** one compare/then/else transaction with fixed revision-visible success/failure and atomic application. [Official docs](https://etcd.io/docs/v3.8/tasks/developer/how-to-transactional-write/) define this atomicity. **Atomic action:** choose compare and branch using existing transaction inputs. **Union:** native compare/success/failure and raft commit. **Natural/full cost:** official/client workloads; RPC, consensus, revision, failure and state. **72h killer:** one compare flip before commit—incorrect branch/state fails; equivalent branch is native union. **Decision:** `DROP__CURRENT_UNION_OR_POLICY`.

## D03 Redis

**Contract:** fixed MULTI/EXEC/WATCH command sequence, state and error behavior. [Official docs](https://redis.io/docs/latest/develop/using-commands/transactions/) define the native transaction surface. **Atomic action:** queue/execute the same commands without changing watch/abort semantics. **Union:** MULTI, EXEC, DISCARD, WATCH and server persistence. **Natural/full cost:** public command traces; queueing, execution, AOF, latency, memory, state/error. **72h killer:** watched-key modification before EXEC: wrong visibility/commit fails; correct behavior is native replay. **Decision:** `DROP__CURRENT_UNION_OR_CONTROLLER`.

Three deep reviews completed; none retains a union-external complete N1/N2/N3. No brief.
