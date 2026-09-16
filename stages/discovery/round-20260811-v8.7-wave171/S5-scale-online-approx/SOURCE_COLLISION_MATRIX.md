# Wave171 PostgreSQL B-tree Action / Collision Matrix

| Facet | Frozen current union | Candidate / conclusion |
|---|---|---|
| Insert/split/dedup | leaf insertion, split cascade, bottom-up/simple deletion, lazy posting-list dedup; `deduplicate_items` control | Cross-nonempty-leaf redistribution is not established by docs as legal or absent. |
| Vacuum/page deletion/reindex | VACUUM retains MVCC-safe cleanup/reuse; REINDEX and concurrent rebuild exist; sparse nonempty pages can remain allocated | VACUUM/rebuild substitution is disallowed controller/rebuild work. |
| WAL/locks/recovery | page LSN/WAL, fsync/recovery configuration; REINDEX lock modes; current amcheck release fixes cover half-dead pages/incomplete splits | Exact multi-page WAL/lock/replay witness requires source closure. |
| Exact oracle | `bt_index_check`/parent/root checks, `heapallindexed`, SQL snapshots, crash recovery | Any candidate fails closed on oracle/recovery difference. |
| Full cost / killer | index bytes, page/tuple moves, update/query/vacuum, WAL/fsync, temp/RSS, I/O, locks and recovery | bounded `k` recourse must be legal and beat native union under a public versioned trace; otherwise reject. |
