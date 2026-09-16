# Candidate-grade deep reviews

All code observations are first-party and current as checked 2026-08-11. A short commit identifier is a source-pin locator, not an absence claim.

## D1 — Cassandra SSTable replacement — `DROP__CURRENT_UNION_OR_CONTROLLER`

- **Pin / current union:** Cassandra trunk commit locator [`367c84d`](https://github.com/apache/cassandra/tree/367c84d) and its [current compaction documentation](https://cassandra.apache.org/doc/latest/cassandra/managing/operating/compaction/index.html) expose UCS/STCS/LCS/TWCS. The union is all such strategies and settings, selection of inputs, complete replacement-SSTable construction, tombstone treatment, reader-visible publication and normal recovery.
- **Contract/information/cost:** Fixed partition updates, CQL values/tombstones and stock read/recovery results. At decision time the constructor has current SSTables and their metadata, not future writes. Charge reads/decompression, merge CPU/RSS/temp, new SSTable/index/checksum bytes, write amplification, delete delay, query/read amplification and recovery.
- **Action witness:** Three overlapping SSTables can legally be replaced by their merged reader-equivalent result. Choosing *which* inputs or *when* to do this is a strategy/controller; the source union already supplies the whole replacement action. No union-external bounded-recourse transition was named.
- **Natural route / killer:** A versioned public Cassandra update trace was not frozen; `cassandra-stress` would be synthetic and is excluded. Conditional 72h killer: on a pinned official trace, fail if a current strategy replays the candidate, CQL/recovery differs, or charged write/read cost has no Pareto gain.
- **Decision:** structural DROP for controller-only residual, not for missing data/results.

## D2 — ClickHouse MergeTree part merge — `DROP__CURRENT_UNION_OR_CONTROLLER`

- **Pin / current union:** current upstream [`master`](https://github.com/ClickHouse/ClickHouse/tree/master) checked with official [part-merge documentation](https://clickhouse.com/docs/concepts/core-concepts/merges). It specifies immutable sorted parts, background selection, part replacement/inactivation, standard and vertical merging, and rebuild of indexes/checksums/metadata. All documented merge settings/non-default modes are included.
- **Contract/information/cost:** Fixed MergeTree DDL, inserts/mutations, SQL result/order semantics and stock reopen/recovery behavior. Information is active part metadata plus arrived inserts. Full cost includes decompression, merge/index/compression CPU, peak RAM/temp, new and inactive-part bytes, write amplification, thread time, query latency and recovery/validation.
- **Action witness:** Two adjacent sorted active parts become one sorted reader-equivalent part with rebuilt sparse index and checksums. This is precisely the native whole merge action. A bounded-recourse scheme that changes only part selection, timing, concurrency or vertical-merge switching is a scheduler/config controller, not N2.
- **Natural route / killer:** The official UK price-paid example is a natural carrier but it is not a frozen versioned update trace. Conditional 72h killer: use a pinned update sequence; fail on SQL/recovery mismatch, exact current merge replay, or no full-cost residual.
- **Decision:** structural DROP for direct native action absorption.

## D3 — Iceberg snapshot manifest/data maintenance — `DROP__CURRENT_UNION_OR_CONTROLLER`

- **Pin / current union:** Iceberg main commit locator [`c62a59e`](https://github.com/apache/iceberg/tree/c62a59e), [maintenance documentation](https://iceberg.apache.org/docs/latest/maintenance/) and current 1.11.0 docs. Union includes snapshot expiration, orphan removal, compact-data-files and rewrite-manifests procedures, catalog commit/retry semantics and their configuration.
- **Contract/information/cost:** Fixed table schema, data-file contents, snapshot-visible rows/deletes and stock reader/catalog commit semantics. Information is current snapshot/manifests and arrived writes. Charge planning, file/manifest reads, rewrite CPU/RSS/temp, generated files, object-store requests, metadata/catal​og commit/retry, old-file retention and query planning/read cost.
- **Action witness:** Two manifests can be rewritten into a reader-equivalent manifest set and committed as a new snapshot. The current maintenance union already contains the complete data/manifest rewrite and commit. Selecting a grouping or trigger does not create a new action or guarantee.
- **Natural route / killer:** No first-party versioned public table mutation trace was frozen. Static public table snapshots cannot substitute. Conditional 72h killer: fixed table history; fail on snapshot/reader mismatch, a current procedure reproducing the transition, or no full-cost residual.
- **Decision:** structural DROP for direct current union absorption.
