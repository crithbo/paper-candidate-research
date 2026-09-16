# Wave171 PostgreSQL B-tree depth red-team

Assignment `DISCOVERY-S5-20260811-V8.7-WAVE171-POSTGRES-BTREE-ONLINE-RECOURSE-DEPTH-REDTEAM`; cutoff 2026-08-11; v8.7/R5-P0 and quality mode OFF. Required materials and academic-research-suite were reread. No experiment, benchmark, download, Stage0/A/B or shared edit occurred.

## Frozen same object

PostgreSQL 18 B-tree on a fixed table/index/operator class: SQL equality/range query results under standard MVCC visibility, concurrent INSERT/UPDATE/DELETE arrivals, and ordinary index scans. The comparator must preserve the access-method reader, visibility, locks and crash recovery—not replace MVCC, the reader, or the index representation.

Current native union covers insert/page split (including upward cascade), bottom-up deletion and simple deletion before anticipated splits, lazy deduplication (default; `deduplicate_items` can disable it), VACUUM cleanup/page reuse, REINDEX/REINDEX CONCURRENTLY, WAL/recovery configuration, and ordinary maintenance controls. The official B-tree description specifically says bottom-up deletion has no strong age guarantee and VACUUM remains necessary; it does **not** by itself prove that cross-page redistribution is legal or absent.

## Candidate action and red-team result

The only non-controller shape worth freezing was: when a leaf overflows or becomes persistently sparse, perform a bounded, adjacent-leaf tuple redistribution with bounded page writes, preserving ordering/downlinks/visibility and producing replayable WAL, instead of split or full rebuild. This is a possible N2 local-global maintenance constructor, with a parameter `k` bounding touched neighbor pages/tuple moves. The desired guarantee would be a conditional bound on page-growth/recourse (and no worse exact query semantics) under a stated update locality model.

`UNFROZEN`, not `PROPOSE_STAGE0`: the inspected official docs establish the native behavior and oracles, but do not close the decisive legality witness—exact nbtree source-path behavior for locks, incomplete splits, page deletion, WAL records and recovery replay for a multi-page redistribution. Declaring an absence would violate current-reality rules; implementing/running it is prohibited in Discovery. Conversely, treating VACUUM, `deduplicate_items`, REINDEX, or a scheduling threshold as the mechanism would be controller/configuration work and is rejected.

## FIDELITY_CLOSURE_PLAN / 72-hour killer

1. Freeze PostgreSQL 18 source commit and inspect `nbtinsert`, split, dedup, vacuum/page-delete and WAL/recovery paths, plus default/nondefault maintenance and lock settings.
2. Freeze a public natural database and versioned update trace (candidate route: official PostgreSQL-derived workload/trace must be identified and checksummed before admission; none is claimed here).
3. Oracle: `amcheck`/`pg_amcheck` parent/root checks plus `heapallindexed`, SQL query-result comparison at fixed snapshots, and crash/WAL recovery equivalence.
4. Ledger: index size, update/query/vacuum time, WAL bytes/fsync, temporary space, RSS, dirty writes, page/tuple moves, locks/blocked work and recovery time.
5. Kill the claim if any structural or heap-index oracle fails, replay differs, action exceeds the frozen `k` bound, or 72-hour bounded trace run has no full-cost Pareto/conditional guarantee gain versus the native union.

## Sources

- [PostgreSQL B-tree internals/current](https://www.postgresql.org/docs/current/btree.html)
- [PostgreSQL 18 routine reindexing](https://www.postgresql.org/docs/18/routine-reindex.html) and [REINDEX](https://www.postgresql.org/docs/18/sql-reindex.html)
- [PostgreSQL 18 amcheck](https://www.postgresql.org/docs/18/amcheck.html) and [pg_amcheck](https://www.postgresql.org/docs/18/app-pgamcheck.html)
- [PostgreSQL 18 routine vacuuming](https://www.postgresql.org/docs/18/routine-vacuuming.html), [WAL configuration](https://www.postgresql.org/docs/18/runtime-config-wal.html), and [page layout](https://www.postgresql.org/docs/18/storage-page-layout.html)

Decision: `COMPLETE_ZERO_PROPOSALS__POSTGRES_BTREE_ACTION_WITNESS_UNFROZEN`. No scientific STOP claim.
