# Unique families, contracts and subtractors

| Family | Exact object / information | Strongest same-information union | Natural carrier and full-cost | State |
|---|---|---|---|---|
| PG-WAL-REDO | Pinned data pages plus WAL prefix/checkpoint and native recovery settings; redo durable records to consistency. | Checkpoint/redo, full-page-write, `fsync`, recovery prefetch/decode-buffer and recovery target settings. | PostgreSQL regression/recovery inputs; normal WAL volume/fsync/checkpoint cost, recovery CPU/I/O/time, data checksums. | Deep |
| KAFKA-TXN-RESTART | Transactional producer state, input offsets and output partitions after crash. | Idempotence, transactional ID, transaction-state log, atomic output+offset commit and abort-on-restart. | Kafka transaction tests; producer/broker/consumer CPU, log I/O/replication, abort/commit and exactly-once outcome. | Deep |
| BK-LEDGER-RECOVERY | Fenced ledger ensemble and acknowledgement prefix after writer failure. | Ledger fencing, quorum acknowledgement, recovery/read and metadata actions. | BookKeeper integration tests; network/quorum I/O, fencing/recovery time and readable-prefix guarantee. | Deep |
| FDB-LOG-RECOVERY | Native transaction-log/state failure model. | Recovery pipeline's commit/proxy/resolver/log state machine. | Official tests; all recovery coordination/storage costs. | Raw drop |
| BADGER-VLOG | Value log/file state under crash. | Native GC/rewrite/replay plus manifest and checksum semantics. | Upstream tests; write amplification, recovery and reader correctness. | Raw drop |
| BBOLT-FREELIST | Page/freelist state after interrupted commit. | Native commit, page checksum/freelist reload/rebuild action. | Upstream tests; commit/recovery I/O and tree correctness. | Raw drop |
| JETSTREAM-ACK | Consumer sequence/ack state after restart. | Native stream/consumer state and delivery/ack policies. | JetStream tests; storage, replay and delivery costs. | Raw drop |
| PULSAR-TXN | Transaction coordinator/log state after failure. | Native transaction coordinator, marker and acknowledgement union. | Pulsar tests; log/replication/recovery and visibility. | Raw drop |
