# UNIQUE_OPPORTUNITY_FAMILIES

## U01 — LMDB alternating meta-page commit boundary

Fixed object: one LMDB environment, fixed key/value update trace, reader snapshot semantics, durable commit/recovery behavior and mmap-visible database format. Current union: copy-on-write dirty/new pages, transaction ID/root publication through alternating meta pages, reader validation/selection, commit/sync modes and error paths in `mdb.c`. Natural route: LMDB upstream tests and a public key/value trace; oracle is stock reader reopening and `mdb_stat`/key-value equality; full cost is CPU/RSS, pages dirtied/written, sync count, commit latency and reopen/recovery time.

## U02 — MySQL binary-log ordered group commit boundary

Fixed object: one MySQL SQL transaction trace with the same committed rows, binary-log order, replication/recovery-visible semantics and chosen durability configuration. Current union: binlog cache/flush/sync/commit ordered-group stages in `sql/binlog.cc`, current binary-log settings and storage-engine transaction handoff. Natural route: MySQL MTR binary-log tests; oracle is SQL result plus `mysqlbinlog`/recovery/replica order; full cost is CPU/RSS, binlog bytes/fsyncs, group latency, commit latency and crash recovery/replay time.
