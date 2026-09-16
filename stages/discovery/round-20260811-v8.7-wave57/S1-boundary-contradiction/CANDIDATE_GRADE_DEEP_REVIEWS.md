# Candidate-grade deep reviews

## PG-WAL-REDO — `DROP__CURRENT_UNION_OR_TUNING`

The exact claim must preserve the database state corresponding to durable WAL, not merely reduce replay reads. PostgreSQL documents checkpoint-derived redo start, full-page writes and `fsync` as recovery-correctness boundaries; `recovery_prefetch`, `wal_decode_buffer_size`, checkpoint interval and I/O concurrency are current action/configuration surfaces. A proposed reordering/prefetch schedule is tuning; a method that skips a needed record/page changes recovery correctness. Finite killer: a WAL prefix containing a post-checkpoint torn-page full image and a committed update; reject if data checksums/state differ or if the action is expressible by the documented settings.

## KAFKA-TXN-RESTART — `DROP__CURRENT_ATOMICITY_UNION`

Exactly-once processing already binds producer transaction, output records and consumer offset update. The official design states that a restarted application with the same `transactional.id` aborts an in-flight transaction; transactional producer/consumer/transaction-state log form the same-information comparator. A new retry/checkpoint chooser either replays the native state machine or weakens atomic visibility. Finite killer: one input record, two output partitions and a crash between send/offset commit; reject on any duplicate/visible partial output or when the native transaction path reproduces it.

## BK-LEDGER-RECOVERY — `DROP__FENCING_GUARANTEE_OR_CONTROLLER`

Ledger recovery must preserve fencing, quorum acknowledgements and readable prefix. A new bookie-selection/retry order is an online controller over current ensemble/recovery actions; any shortcut that accepts writes after fencing changes the safety guarantee. Finite killer: a writer failure after partial acknowledgements with a competing writer; reject if a candidate yields a non-prefix read or bypasses native fencing/quorum rules.

All three drops are structural and are not due to missing implementation, evidence, resources, or AI readiness.
