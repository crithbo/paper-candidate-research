# UNIQUE_OPPORTUNITY_FAMILIES

| Family | Exact object and frozen observable semantics | Natural carrier/full cost |
|---|---|---|
| R01 | One PostgreSQL transaction whose commit releases notification to listening session; commit/rollback and delivery visibility fixed. | Public PostgreSQL applications; SQL, commit/WAL, notification delivery, latency/memory, state/effect. |
| R02 | One MySQL transaction and its binary-log commit-visible record; engine commit, log order and consumer observation fixed. | Public MySQL workloads; transaction, binlog I/O, replication/consumer visibility, storage/latency. |
| R03 | One broker publish with fixed confirm and consumer-ack semantics; broker persistence vs application effect fixed. | RabbitMQ public traces; publish, confirm, delivery, ack, persistence, latency/memory. |
| R04 | One JetStream publish/ack and consumer-visible delivery; stream commit/effect fixed. | NATS examples/traces; protocol, storage, delivery, ack, latency/memory. |
| R05 | One PostgreSQL committed transaction and logical-decoding output boundary; transaction order and output fixed. | Logical replication samples; commit/decode/output, WAL, slot state, latency/storage. |
| R06 | One file replacement with fixed directory/file durability and reader-visible name/content after crash. | Upstream/filesystem test traces; write/fsync/rename/dir fsync, I/O, latency, post-crash state. |
