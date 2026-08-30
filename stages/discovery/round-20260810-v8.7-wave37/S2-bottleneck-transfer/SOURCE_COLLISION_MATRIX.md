# Action-divergence and collision matrix — WAVE37 S2

| Object | Native action space / strongest union | Candidate divergence beyond action names | Information and resource requirement | Quality / full-cost / no-gain boundary | Classification |
|---|---|---|---|---|---|
| SQLite WAL | WAL checkpoint modes, reader/writer semantics, automatic checkpoint threshold | stateful slice-plus-admission sequence | reader/writer/WAL state; must retain transactional semantics | account for commit latency, reader blocking, WAL growth and fsync; no gain without contention | DROP: no frozen divergence witness |
| Kafka tiered storage | remote log, fetch path, local cache/retention | coupled hydrate/evict decision | partition offset, fetch locality, local capacity | account for remote bytes, local disk, latency, retention; no gain if fully local or cold | DROP: no finite same-object comparator contract |
| Flink checkpointing | aligned/unaligned modes and recovery state | coupled capture/materialization decision | barrier/backpressure/state topology | account for checkpoint duration, state size, recovery and end-to-end throughput; no gain without backpressure | DROP: same-guarantee witness absent |
| io_uring | provided buffer rings, buffer selection, completion/recycling | ownership-aware group/recycle rule | SQE/CQE ordering and buffer ownership | account for syscalls, ring contention, pinned memory, tail completion; no gain at low queue depth | DROP: non-wrapper atomic action not frozen |
| ClickHouse | data-skipping index construction and query use | joint granule/index evidence construction | table distribution, predicate and index state | account for build/storage/query CPU/IO and false-positive skip cost; no gain on nonselective predicates | DROP: changed representation or configuration selection |

## Reality-check disposition

Every native mechanism in the first column is treated as a deployable strong
baseline.  The matrix does **not** infer automatic algorithmic absorption from
an API/hook.  The DROP decisions instead record failure to identify a concrete
algorithmic action with a legal divergence witness and finite same-object
fidelity closure.  No implementation-absence gap is carried forward.
