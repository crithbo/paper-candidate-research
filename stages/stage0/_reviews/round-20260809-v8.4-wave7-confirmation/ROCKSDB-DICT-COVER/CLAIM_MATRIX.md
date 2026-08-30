# ROCKSDB-DICT-COVER Confirmation Claim Matrix

Cutoff: `2026-08-09`. Role: independent Stage-0 confirmation sentry.

| Claim or facet | Independent source/evidence | Collision class | Disposition |
|---|---|---|---|
| One production bottommost `BlockBasedTable` SST with per-file dictionary | RocksDB official design, format, compression documentation, and current builder source | `DEPLOYMENT_BASELINE` | Exact object is definable; freeze full creation context |
| Current sample construction | Current builder buffers blocks, begins at the midpoint, and uses a fixed prime-stride cyclic traversal up to `max_sample_bytes` | `DIRECT_SUBTRACT` | Historical random-64-byte wording cannot be used as the current baseline |
| Raw and trained per-SST dictionaries | RocksDB official preset-dictionary design | `DIRECT_SUBTRACT` | Scope, buffering, persistence, cache, and trainer plumbing are not novel |
| Final dictionary coverage | Zstd Cover/FastCover scores frequent d-mer segments and discounts covered d-mers | `DIRECT_SUBTRACT` | Coverage objective and final dictionary construction are unavailable |
| Reservoir frequent k-mers plus local maximum coverage | Liao et al., WWW 2016 | `METHODOLOGICAL_DIRECT_SUBTRACT` | Generic reservoir/coverage language is unavailable; object differs from RocksDB/FastCover contract |
| Prefix, seeded reservoir, stratified selector | Standard same-information selectors | `BASELINE_SUBTRACT` | Mandatory finite controls; any equivalent mechanism is absorbed |
| Finite option grid | Legal RocksDB/Zstd dictionary, train, buffer, block, file, level, cache, compression, and Cover/FastCover settings | `DEPLOYMENT_BASELINE` | Compare every applicable member within identical frozen cells |
| Bottommost compaction versus `SstFileWriter` | Current source uses `kMisc` for external SST creation; creation context reaches compressor/dictionary guidance | `OBJECT_DRIFT_RISK` | `SstFileWriter` is fixture-only until exact path/context parity is demonstrated |
| External ingestion to a bottom level | Official external-SST documentation | `DEPLOYMENT_ADJACENT` | Placement after construction does not prove bottommost-compaction creation equivalence |
| Candidate retained-byte difference | Instrumentation plan only | `NON_CLAIM_BEARING` | Insufficient unless it causes useful dictionary/match/compressed-byte action |
| Per-SST bounded single-pass pre-trainer coreset | No checked source covers the complete exact object and claim | `SEARCH_BOUNDED_OPEN` | Retain only this conditional N2 |
| Seed/order/stratum/grid search plus FastCover | Composition of existing selector and trainer | `PRODUCT_ABSORPTION_RISK` | `STOP` if candidate reduces to this |
| Natural headroom | Sorted SSTs may contain multiple correlated regimes under a finite train-byte cap | `UNVERIFIED_HYPOTHESIS` | Stage A risk premise, not an observation |
| Strict same-function equality | Reader open, checksum, properties, ordered scan, point/range behavior, and identical logical KV manifest | `CORRECTNESS_CONTRACT` | Required and finite |
| Strong fair union | No-dict, raw, current trained prime-stride, prefix, seeded byte/block reservoir, key-range stratified, legal finite grid | `BASELINE_PASS_WITH_CAVEAT` | Union means every individually realizable member, not an impossible combination |
| Useful residual action | Candidate-only retained fragments that survive unchanged trainer into traceable dictionary/match/byte effect | `STAGEA_FALSIFIER` | Require at least 10%; raw byte-set difference is reported separately |
| Full-cost result shape | p50 and p90 frontier over SST/dictionary bytes, CPU, RSS, buffering, temporary I/O, preprocessing, reads, and cache effects | `EVIDENCE_PLAN` | Finite and claim-bearing only inside preregistered resource envelope |
| Paper tier | Narrow N2 algorithm, invariants, natural evidence, full-cost frontier, failure regions | `QUALITY_CALIBRATION` | `TIER_B_Q2_VIABLE` if successful; Tier A not established |
| Evidence readiness | Public CPU source and validation path; implementation/results absent | `READINESS_ONLY` | Moderate; absence is not a Stage-0 STOP |
| Authority | Confirmation only | `PERMISSION` | Stage A=false; Stage B=false; execution=false |

## Narrow confirmed conditional claim

On a characterized subset of natural production-equivalent bottommost-compaction RocksDB SST builds with a finite training-byte cap, a deterministic single-pass bounded-memory retained-fragment coreset may feed an unchanged pinned Zstd trainer and produce useful residual dictionary actions plus a full-cost p50+p90 Pareto point outside every applicable member of the frozen same-information union.

This is a conditional research hypothesis, not a result, universal compression claim, trainer novelty claim, priority claim, or downstream authorization.
