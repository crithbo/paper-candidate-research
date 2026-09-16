# Discovery log — S2 HDF5 chunk-index migration current-source depth

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE184-HDF5-CHUNK-INDEX-MIGRATION-CURRENT-SOURCE-DEPTH`  
**Cutoff:** 2026-08-11  
**Result:** `COMPLETE_ZERO_PROPOSALS`

## Frozen method and source pins

Method: `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`; revision: `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__discovery-six-lanes-direct-20260811__p1-shadow-not-authoritative`; `DISCOVERY_QUALITY_MODE=OFF`.

**Release pin:** [HDF5 2.1.1 release](https://github.com/HDFGroup/hdf5/releases), released 2026-03-23. **Current documentation/source pin:** [HDFGroup/hdf5 `develop`](https://github.com/HDFGroup/hdf5), [develop Field Guide](https://hdfgroup.github.io/hdf5/develop/index.html), observed 2026-08-11 (Field Guide dated 2026-07-14), and [FMT4](https://portal.hdfgroup.org/documentation/hdf5/latest/_f_m_t4.html), observed 2026-08-11. No repository clone/download was authorized. The accessible official pages did not yield an exact source-commit plus verified migration/rewrite call graph; this is recorded as a fidelity gap, not an absence inference.

## Exact object and reader contract

One chunked HDF5 dataset with identical logical values, datatype/dataspace, chunk grid, fill behavior, filter/checksum semantics, hyperslab results and stock-reader behavior. The fixed observable boundary includes reopen/read values and selections, dataset/filter/layout metadata that a stock reader can interpret, and failure/recovery behavior. A changed reader, a new file format requirement, an external rewrite wrapper, cache tuning, or a different filter/value contract is excluded.

## Current index/action/configuration union

FMT4 explicitly defines the **single-chunk**, **implicit**, **fixed-array**, **extensible-array**, and **version-2 B-tree** chunk-index representations; older-format v1 B-tree compatibility remains relevant for old files. Current chunking documentation states that chunked datasets use the same read/write API as contiguous datasets, chunks are independently placed, and chunks enable filters and extension. The public union includes creation-time layout/chunk choice, fixed versus unlimited dimension/extension regime, filter pipeline, early/late/incremental allocation, chunk allocation/free-space metadata, normal extend/write/backfill operations, and all associated creation/access property flags. The record does not treat a missing one-key public migration API as evidence that migration is impossible.

## Candidate-grade depth red-team

**Proposed complete N2, if it existed:** for a dataset initially using an extensible-array index because of append behavior, jointly choose a bounded sequence of backfilled chunk writes and an in-file index-type migration to fixed-array or v2 B-tree, reconstruct all chunk records/index metadata/free-space state, preserve filters/checksums, and guarantee identical stock-reader/recovery outcomes. This is not index selection at dataset creation.

**Minimum legal action-divergence witness required:** a finite sequence of append and late/backfilled chunk coordinates on the same dataset for which (a) the native union cannot represent a reader-compatible index-metadata conversion, and (b) the proposed conversion yields identical logical/filter/checksum results and bounded recourse/full-cost gain without changing format/reader. No legal witness is frozen.

Why the witness remains unclosed:

1. The official format establishes multiple reader-visible index encodings and current creation/extension selection, but does not by itself specify a library-supported in-place conversion path for an already-created dataset.
2. The accessible current-source pin is insufficient to enumerate every create/extend/backfill/allocation/rewrite/conversion/recovery path and every property flag. Claiming their absence would violate current-source reality.
3. NASA LAADS VIIRS naming supplies version/acquisition/processing identifiers and HDF5 files, but not a verified append-plus-late-backfill provenance trace for one evolving HDF5 dataset. Separate product versions are not silently treated as a mutable-dataset history.

Therefore the line is `NOT_ADMITTED_UNFROZEN`; it is neither direct absorption nor a resource/readiness STOP.

## Natural route, oracle, denominator and finite killer

**Natural route:** [NASA LAADS VIIRS documentation](https://ladsweb.modaps.eosdis.nasa.gov/learn/) specifies HDF5/netCDF4 products with acquisition, collection-version and processing-time identifiers. It is a versioned file carrier, but an append/late-backfill trace still must be sourced before Stage A.

**Native oracle:** stock HDF5 reader materialized-value digest; exact hyperslab reads; dataspace/datatype/chunk/filter metadata; checksum/filter decode; `h5dump`-level structural inspection; close/reopen and recovery checks.

**Full-cost denominator:** application writes and filter CPU + chunk/index/free-space metadata writes + data I/O + temporary/rewrite bytes and RSS + read/reopen/query CPU/I/O/latency + recovery/validation time. File size or metadata bytes alone is insufficient.

**≤72h killer, conditional and not executed:** pin a release/commit and all property-list flags; obtain one official natural append/backfill trace; enumerate native index selection and mutation paths; construct a minimal late-write coordinate witness; compare stock-reader/checksum/reopen results and the full denominator. Fail if current native union already performs the same conversion, any requirement changes reader/format/filter/recovery semantics, no real append/backfill carrier exists, or no bounded recourse advantage remains.

## Outcome

`PROPOSE_STAGE0: []`. No experiment, benchmark, asset download, automation, Stage0/A/B creation or shared-control mutation occurred. State: `IDLE_REUSABLE_AWAITING_MAINLINE`.
