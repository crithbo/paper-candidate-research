# RAW_SCREEN_ROW_EVENT

All rows are new cross-commit/object-effect families, screened against active-object names in the frozen registry.

| ID | Object / official source | Deep outcome |
|---|---|---|
| R01 | PostgreSQL transaction + `NOTIFY` ([docs](https://www.postgresql.org/docs/current/sql-notify.html)) | `NOT_ADMITTED_UNFROZEN` |
| R02 | MySQL transaction + binary log ([docs](https://dev.mysql.com/doc/refman/8.4/en/binary-log.html)) | `NOT_ADMITTED_UNFROZEN` |
| R03 | RabbitMQ publish confirm/consumer acknowledgement ([docs](https://www.rabbitmq.com/docs/confirms)) | `NOT_ADMITTED_UNFROZEN` |
| R04 | NATS JetStream publish acknowledgement / consumer ack ([docs](https://docs.nats.io/nats-concepts/jetstream)) | `NOT_ADMITTED_UNFROZEN` |
| R05 | PostgreSQL logical decoding commit stream ([docs](https://www.postgresql.org/docs/current/logicaldecoding.html)) | `NOT_ADMITTED_UNFROZEN` |
| R06 | Linux filesystem `fsync`/rename durability ([man-pages](https://man7.org/linux/man-pages/man2/fsync.2.html)) | `NOT_ADMITTED_UNFROZEN` |
