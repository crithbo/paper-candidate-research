# Candidate-grade deep reviews

## Arrow dictionary-stream maintenance — NOT_ADMITTED_UNFROZEN

Fixed object would be an Arrow stream with identical materialized arrays and stream-reader semantics. The format permits dictionary delta batches and batch interleaving, so a plausible whole action is choosing when to emit a complete dictionary replacement versus a delta while preserving all subsequent record-batch meanings. Minimal witness: two batches whose later values either extend or replace a shared dictionary without altering materialized values.

The natural carrier, full ledger (stream bytes, writer CPU/RSS, reader CPU/RSS/latency, and update bytes), and ≤72-hour killer are clear: freeze a released streaming trace, a current Arrow writer revision/config, compare two legal message histories, then reject if current writer already represents the action. This pass has not frozen that complete writer union/corpus, so it cannot claim an action gap or brief.

## rustc query-DAG reuse — STRUCTURAL_DROP

The official rustc guide states that cached queries and their DAG persist and that try-mark-green recursively reuses green inputs or re-executes and compares output. The natural carrier would be a public Cargo workspace edit trace; full cost includes compile CPU/RSS, incremental directory bytes, invalidated queries and produced artifacts. Minimal witness (a changed input whose dependent query result is unchanged) is exactly the green-after-recheck mechanism. Any alternate is cache policy/controller or direct algorithm collision.

## ThinLTO per-module maintenance — STRUCTURAL_DROP

Same output is the linked executable for a fixed bitcode/module edit trace. Current LLVM documentation/source explicitly supplies summary indices, import lists, per-task cache keys, cache-hit skip, and cache pruning. A natural carrier could be a public LLVM/Clang incremental build trace; full cost includes thin-link/backend/link CPU/RSS, cache bytes, I/O, and executable semantics. Minimal cache-hit/miss witness is already represented. Cache retention policy or distributor scheduling is controller/configuration, not N2.

## SQLite R-tree update — NOT_ADMITTED_UNFROZEN

The reader/oracle and finite route are native SQLite: pin `ext/rtree` source, fixed R-tree schema/queries, public spatial insert trace, SQL equality/integrity, and charge index/WAL/build/update/query CPU/RSS/bytes. A small overflow/underfill node witness is conceivable, but complete split/reinsert/auxiliary-table/config union was not frozen, so no residual is named.

## HDF5 chunk-index maintenance — NOT_ADMITTED_UNFROZEN

Object would fix HDF5 dataset content, chunk layout and HDF5 reader semantics. A candidate needs a complete current chunk-index update/resize/rebuild union, a public evolving scientific HDF5 trace, equality check and ledger of file bytes, update/read CPU/RSS/I/O. Without an exact library/version/config union, no action-divergence witness is admissible.

## Iceberg manifest maintenance — STRUCTURAL_DROP

Snapshot/manifest reader semantics can be frozen, with public table commit traces and complete data/manifest/delete-file/CPU/RSS cost. But the named actions—compaction, expiration and when to rewrite manifests—choose maintenance timing; they are a controller/policy layer. It is not a direct whole-output constructor.

No grounded brief is formed.
