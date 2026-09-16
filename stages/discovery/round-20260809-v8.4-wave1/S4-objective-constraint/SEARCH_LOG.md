# S4 objective / constraint shift — production discovery log

**Assignment:** `DISCOVERY-S4-20260809-V8.4-WAVE1`  
**Lane:** `S4-objective-constraint`  
**Cut-off:** 2026-08-09  
**Method used:** accepted production Discovery method `v2 / v8.1` only.  The TLS-blocked two-axis `v8.2r2` method was neither used nor cited as a discovery result.

## Scope and acceptance rule

This pass looked for a change in objective or constraint that changes the admissible *data-structure / algorithm / compiler / runtime action*, rather than merely changing a knob, a selector, or a background controller.  A retained item would need an exact object, same-function/quality comparison, a current strongest same-object baseline, natural input, complete cost accounting, and a finite Stage A killer.

No paper was accepted merely because it has an unimplemented mechanism or because its AI execution readiness is uncertain.  Conversely, no item was allowed to pass just because the objective is real.

## Searches and first-party sources

| UTC date | Query family | Primary / official sources opened | Result |
|---|---|---|---|
| 2026-08-09 | `out-of-order time series compression data structure`; `Apache IoTDB out-of-order TsFile compression` | [IoTDB PVLDB 2020](https://www.vldb.org/pvldb/vol13/p2901-wang.pdf); [Apache TsFile project](https://github.com/apache/tsfile) | Established exact-object pressure: sorted compressed pages conflict with late writes; IoTDB already materializes O3 files and query-time merge sorting. |
| 2026-08-09 | `compressed chunks out-of-order ingestion` | [RedisTimeSeries official performance note](https://redis.io/docs/latest/develop/data-types/timeseries/out-of-order_performance_considerations/) | Direct Pareto evidence: a late sample forces whole compressed-chunk decoding; smaller chunks reduce that cost while reducing compression. |
| 2026-08-09 | `out-of-order IoTDB space amplification compaction 2024 2025 2026` | [MCC, PVLDB 2024](https://www.vldb.org/pvldb/vol17/p2974-song.pdf); its linked [artifact](https://github.com/column-compaction/column-compaction) | Current same-system mechanism already attacks OOO/update-induced space amplification through multi-column compaction, file prefetching and cache. |
| 2026-08-09 | `compressed time-series updates / late data official project` | [TimescaleDB official project](https://github.com/timescale/timescaledb); [Timescale compression documentation](https://docs.timescale.com/use-timescale/latest/compression/about-compression/) | Independent current product line exposes direct-compressed insertion/recompression behavior; it prevents treating “mutable compressed chunk” as a vacant concept. |
| 2026-08-09 | `filtered ANN dynamic selectivity memory recall 2025 2026`; `JIT compile p99 cold start compiler 2025 2026`; `storage compaction p99 capacity 2025 2026` | Original-paper / project-source triage only; no non-wrapper same-object residual survived before a defensible frozen object could be specified. | Dropped before brief: the remaining ideas were either a controller/selector, a direct saturated family, or lacked a fair current same-object baseline plus natural artifact. |

## Three-pass convergence record

### Pass 1 — lineage / seed distance

The only technically concrete lead was *mutable, compressed, time-ordered numeric time-series chunks under out-of-order corrections*.  Its seed is not the terminal `O4-DYNCACHE-PGM`: the object is timestamp/value chunk representation, not a learned-index leaf transition.  The natural pressure is independently documented by Redis and IoTDB.

However, the initially imaginable action—choose smaller chunks, or retain a side patch stream and merge it—does not yet define a new mechanism.  The former is Redis's documented existing trade-off; the latter is structurally represented by IoTDB O3/D files plus merge/compaction.  Thus lineage did not yield an action at sufficient distance for N1/N2/N3.

### Pass 2 — current competing mechanism / same-object collision

The strongest direct evidence is that IoTDB already separates O3 data, merges overlapping chunks at query time, and uses compaction; MCC additionally targets the OOO/update-induced amplification within IoTDB.  Redis already exposes the same compressed-chunk / OOO Pareto and its available action (chunk sizing).  A proposal phrased as “adaptive chunk size,” “side buffer,” “rewrite scheduler,” “compaction controller,” or “cache/prefetch wrapper” would respectively be a selector/controller or collide with those mechanisms.

No fair residual was identified after holding fixed all of: timestamp semantics, losslessness, duplicate/update policy, memory budget, query class, compression representation, background CPU/I/O, and recovery cost.

### Pass 3 — artifact, natural-input, and AI-executability audit

The inputs and code are real and usable: Apache TsFile/IoTDB, the MCC artifact, Redis's published benchmark description, and IoTDB-oriented benchmark infrastructure exist.  This is **not** a resource or AI blocker.  It instead exposes the scientific deficiency: without a new action distinct from existing O3/compaction/chunk-size alternatives, a prototype would be a non-informative implementation contest.  No Stage A probe was authorized for that reason.

## Freshness and integrity note

Search and source inspection were performed on 2026-08-09.  Only original papers hosted by the venue and official/project documentation or repositories are relied upon in the retained record.  Search-engine snippets, vendor-independent commentary, and preprints were used only for triage and are not evidentiary sources here.

