# CANDIDATE_GRADE_DEEP_REVIEWS

## D01 PostgreSQL commit → NOTIFY
Atomic action would have to jointly cause database commit and exactly one externally consumed notification using only transaction/notification state. [NOTIFY](https://www.postgresql.org/docs/current/sql-notify.html) fixes commit-coupled delivery semantics. Current union contains transaction, notification queue and client consumption; an outbox/consumer retry is adapter/controller. Natural carrier and full cost are frozen in the family table. **72h killer:** rollback/commit pair with one listener; a mechanism must neither expose rollback nor duplicate effect. No complete union-external atomic action/recurrence is frozen. **`NOT_ADMITTED_UNFROZEN`**.

## D02 MySQL commit → binary-log observation
Exact action would jointly commit one transaction and make exactly the specified ordered binlog effect observable. [Binary-log documentation](https://dev.mysql.com/doc/refman/8.4/en/binary-log.html) defines the native log boundary. Native transaction/binlog/replication is the current union; a tailer/checkpoint/retry is controller. **72h killer:** commit versus rollback plus ordered observer; mismatch in log visibility fails. No complete action beyond native union was supplied. **`NOT_ADMITTED_UNFROZEN`**.

## D03 RabbitMQ publish confirm → consumer effect
Exact action would bridge publish confirmation, persistence and one consumer-visible effect without changing delivery/ack guarantee. [Publisher confirms/acks](https://www.rabbitmq.com/docs/confirms) define separate protocol points. Native confirms, delivery and ack form the union; dedupe/retry wrapper is excluded. **72h killer:** confirm then consumer failure/reconnect; duplicate/lost effect falsifies fidelity. No complete non-controller action frozen. **`NOT_ADMITTED_UNFROZEN`**.

## D04 JetStream publish ack → delivery effect
Fixed stream publish acknowledgment and consumer ack/delivery semantics under [JetStream](https://docs.nats.io/nats-concepts/jetstream). Current union is stream persistence, publish acknowledgment, consumer delivery/ack; retry or idempotency adapter is excluded. **72h killer:** acknowledged publish plus redelivery boundary; loss/duplicate fails. No complete residual action frozen. **`NOT_ADMITTED_UNFROZEN`**.

## D05 PostgreSQL commit → logical decoding
Exact action would make committed change stream visibility match commit ordering without altering slot/replication guarantee. [Logical decoding](https://www.postgresql.org/docs/current/logicaldecoding.html) supplies native decoding and commit boundary. **72h killer:** committed versus aborted transaction on a slot. An outbox/transformer is adapter; no complete new action is defined. **`NOT_ADMITTED_UNFROZEN`**.

## D06 fsync/rename → crash-visible file state
Exact action would ensure fixed file and directory durability semantics across the system call boundaries specified by [fsync](https://man7.org/linux/man-pages/man2/fsync.2.html). Native filesystem ordering is the union; a retry or external journal adapter changes object. **72h killer:** file fsync, rename and directory-fsync witness under a fixed crash model. No complete mechanism outside native semantics was frozen. **`NOT_ADMITTED_UNFROZEN`**.

All six receive deep review. They are not `DROP`: their cross-commit gap is real, but a same-object complete action has not been frozen. No brief is justified.
