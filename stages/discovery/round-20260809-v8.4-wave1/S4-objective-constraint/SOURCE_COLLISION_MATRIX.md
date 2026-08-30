# Source and collision matrix

**Assignment:** `DISCOVERY-S4-20260809-V8.4-WAVE1`  
**Result:** `ZERO_PROPOSALS_AFTER_THREE_PASS_CONVERGENCE`

| Lead / exact object considered | First-party evidence | Competing mechanism and relation | Same-object assessment | Decision |
|---|---|---|---|---|
| Lossless compressed numeric time-series chunks that must accept out-of-order inserts while serving ordered range scans under a bounded memory budget | [IoTDB PVLDB 2020](https://www.vldb.org/pvldb/vol13/p2901-wang.pdf), pp. 2–3: TsFile uses timestamp/value pages and sorted chunks; O3 files are separately written, later merged, and can require merge-sort at query time. [Apache TsFile](https://github.com/apache/tsfile) documents the page/chunk/index layout. | IoTDB's O3 TsFiles, D-files, merge sorting, and existing ordered compressed pages are direct representations for the same function. | A vague “patch overlay” is not a distinct action: it reproduces O3/D-file separation and merge.  A vague “local rewrite” has no preserved quality/cost argument against the existing designs. | `DROP_BEFORE_BRIEF__NO_DISTINCT_N_ROUTE` |
| Same object, with the new objective a hard tail-ingest / decompression-amplification bound rather than raw ingest throughput | [RedisTimeSeries official note](https://redis.io/docs/latest/develop/data-types/timeseries/out-of-order_performance_considerations/) explicitly reports whole-chunk decode for a late item and its chunk-size-versus-compression trade-off. | Smaller chunk size is the official available action.  It changes the existing knob/frontier, not the action space. | “Choose a smaller/adaptive chunk” is a reweighting or selector proposal, forbidden for S4; no novel constrained optimization or data structure was frozen. | `DROP__OBJECTIVE_DOES_NOT_CHANGE_ACTION` |
| IoTDB multi-column OOO/update storage under a space-amplification constraint | [MCC, PVLDB 2024](https://www.vldb.org/pvldb/vol17/p2974-song.pdf), with [artifact](https://github.com/column-compaction/column-compaction). | MCC performs same-system multi-column compaction and adds file prefetcher and compaction cache. | Candidate variants phrased as compaction choice, cache/prefetch, or scheduling would be a direct collision or prohibited wrapper/controller. | `DROP__DIRECT_COLLISION_OR_PROHIBITED_FORM` |
| Compressed historical time-series updates in a production columnar engine | [TimescaleDB project](https://github.com/timescale/timescaledb) and [official compression documentation](https://docs.timescale.com/use-timescale/latest/compression/about-compression/). | Direct-compressed insertion plus recompaction; existing compressed/active state separation. | Confirms that “make compressed chunks mutable” is not itself a new paper mechanism; an exact same-quality delta remains unspecified. | `DROP__NO_FAIR_RESIDUAL` |

## Negative-control checks

- No candidate is a wrapper, checker, controller, selector, cache policy, or renamed old terminal item.
- No candidate reuses `O4-DYNCACHE-PGM`'s learned-index leaf-transition object or its frozen failure kernel.
- No candidate is promoted using an unexecuted result, AI-readiness score, or a weak cross-object comparison.
- No filtered-ANN, JIT/cold-start, or LSM-tail idea was retained without a current same-object collision check and an exact new action; this avoids a quota-driven union topic.

