# Raw screen row events

| Row | Unique family | Frozen failure/recovery guarantee | Official/current anchor | Result |
|---:|---|---|---|---|
| 01 | PostgreSQL WAL redo start | Crash after arbitrary WAL/page persistence prefix; restore a consistent database with all durable transactions. | [WAL configuration](https://www.postgresql.org/docs/current/wal-configuration.html), [WAL runtime settings](https://www.postgresql.org/docs/18/runtime-config-wal.html) | `DEEP_DIVE_REQUIRED` |
| 02 | Kafka transactional restart | Producer/consumer crash with transaction/offset state; outputs and offsets are atomic or aborted. | [Kafka design](https://kafka.apache.org/41/design/design/) | `DEEP_DIVE_REQUIRED` |
| 03 | BookKeeper ledger recovery | Failed writer with fenced ledger; recover a readable prefix without violating fencing/quorum semantics. | [BookKeeper docs](https://bookkeeper.apache.org/docs/) | `DEEP_DIVE_REQUIRED` |
| 04 | FoundationDB log recovery | Process/storage failure; recover a committed transaction history with native consistency. | [FoundationDB docs](https://apple.github.io/foundationdb/) | `STRUCTURAL_DROP` |
| 05 | Badger value-log GC/replay | Crash during value-log rewrite; preserve key/value visibility and reclaim safety. | [Badger upstream](https://github.com/dgraph-io/badger) | `STRUCTURAL_DROP` |
| 06 | bbolt freelist recovery | Crash with dirty pages/freelist; preserve B+tree and single-writer semantics. | [bbolt upstream](https://github.com/etcd-io/bbolt) | `STRUCTURAL_DROP` |
| 07 | NATS JetStream consumer ack replay | Consumer restart with acknowledged/delivered sequence state; preserve documented delivery guarantee. | [NATS JetStream docs](https://docs.nats.io/nats-concepts/jetstream) | `STRUCTURAL_DROP` |
| 08 | Apache Pulsar transaction recovery | Broker/client failure; preserve atomic visibility of transaction messages and acknowledgements. | [Pulsar transactions](https://pulsar.apache.org/docs/) | `STRUCTURAL_DROP` |

`RAW_SCREEN_ROW_EVENT=8`, repeat/rescreen=`0`, `UNIQUE_OPPORTUNITY_FAMILY=8`. Wave54 verifier/protocol/CSE lines and active cross-lane objects were excluded before screening.
