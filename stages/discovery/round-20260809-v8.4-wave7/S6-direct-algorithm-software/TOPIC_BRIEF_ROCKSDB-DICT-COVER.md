# ROCKSDB-DICT-COVER — 预算受限 SST 字典训练覆盖构造

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origins: `O7`
- Domain tags: `DATABASE`, `STORAGE_ENGINE`, `LOSSLESS_COMPRESSION`, `CPU_REPRODUCIBLE`
- Contribution route: `N2`
- Discovery date: 2026-08-09
- Discovery method revision: accepted/calibrated `DISCOVERY_METHOD_V2_V8_1` only. The TLS-blocked two-axis `v8.2r2` was not used.

## Research question

For a fixed, sorted key-value stream and a fixed RocksDB BlockBasedTable SST contract, can an online budgeted **training-cover construction** select representative buffered block fragments for the existing Zstd dictionary trainer so that it preserves all keys, values, order, and reader semantics while improving the fully charged space/write/read Pareto frontier over current random/uniform sample construction?

## Paper genealogy

- Anchor / deployment source: RocksDB's official [preset dictionary design](https://rocksdb.org/blog/2021/05/31/dictionary-compression.html) describes per-SST buffering, training and dictionary persistence; the official [BlockBasedTable format](https://github.com/facebook/rocksdb/wiki/Rocksdb-BlockBasedTable-Format) specifies sorted key-value blocks, metadata and the compression-dictionary block.
- Closest paper: Dong et al., [Optimizing Space Amplification in RocksDB](https://www.eecg.toronto.edu/~stumm/Papers/Dong-CIDR-16.pdf), CIDR 2017, is a storage-engine/compaction calibration source, not a dictionary-cover algorithm.
- Direct subtractors: RocksDB per-SST raw-sample and Zstd-training modes; `max_dict_bytes`, `zstd_max_train_bytes`, `max_dict_buffer_bytes`, block size, compression level and cache options; Zstd's official [dictionary builder](https://github.com/facebook/zstd/blob/dev/programs/zstd.1.md), including random sample capping, `cover`, and `fastcover`.
- Artifact / natural carrier: upstream [RocksDB](https://github.com/facebook/rocksdb), its `SstFileWriter`/`sst_dump`, and publicly redistributable naturally occurring structured records such as official Wikimedia XML/JSON dumps or public Software Heritage metadata exports, canonically converted once to a sorted key-value manifest. The carrier is not synthetic KV generation.
- Search boundary: paper originals and official/upstream sources through 2026-08-09. Searches covered RocksDB dictionary compression, compression-dictionary compaction, SSTable dictionary training and upstream Zstd training. No same-object, per-SST budgeted training-cover construction was located. This is `SEARCH_BOUNDED_OPEN`, not a priority claim; Stage 0 must repeat the search.

## Topic-origin card

- Trigger: the upstream format already has a correctness-preserving per-SST dictionary extension, but baseline sample construction is random/uniform under a finite buffer/training budget.
- Measurable observation / quantitative anchor: RocksDB documents that small blocks can benefit from dictionary presetting, that per-SST scope was adopted after adjacent-file dictionaries performed worse, and that buffering/training/dictionary caching are material costs. These are baseline facts—not candidate results.
- Baseline limitation: random/uniform block-fragment samples do not make an explicit coverage decision when a sorted SST contains distinct local record regimes and the input-to-trainer budget is capped.
- Structural cause: the effective dictionary is limited by both `max_dict_bytes` and `zstd_max_train_bytes`; choosing a fragment consumes budget and can duplicate already-covered substrings. The construction is a streaming, constrained coverage problem inside an otherwise fixed SST writer.
- Decision variable: a bounded retained fragment set `R` (and, if necessary, fragment boundaries) maximizing a declared sketch-based coverage proxy under fixed buffer, training-input and dictionary-size budgets. The Zstd trainer and all RocksDB format options remain frozen.
- Candidate Q1 venue family: FAST / SIGMOD / VLDB / ICDE storage-engine work; current forecast is deliberately Tier B until Stage 0 calibrates same-object publication precedent.

## Historical method calibration

- Source-session backtest: `stages/discovery/_method-backtests/O7_DIRECT_ALGORITHM_SOFTWARE/v2/handoff.yaml`
- Status: `CALIBRATED`; method calibration is not candidate evidence.

## Exact object

The exact object is **one bottommost-level, Zstd dictionary-compressed RocksDB BlockBasedTable SST generated from a fixed sorted key-value manifest**, using the existing per-file dictionary metadata representation and a frozen target block size. Same function/quality means the iterator returns exactly the same ordered key-value sequence; normal RocksDB reader checksums and table open/scan succeed; the file has the same comparator/format/compression contract. It is not a changed LSM compaction policy, compression library, level setting, index/filter scheme, query controller, cross-SST shared dictionary, or an external data reorder.

## Named fair baselines

- Deployment/default: current upstream RocksDB BlockBasedTable with no dictionary if that is the applicable production default.
- Strong baseline union (frozen first): current per-SST raw-sample dictionary mode; current per-SST Zstd training mode; no dictionary; and all semantically equivalent legal settings for dictionary byte budget, train byte budget, buffer limit, Zstd level and block size. Each is tuned only by a declared finite grid and fully costed—no default-only comparison.
- Closest implementation baseline: RocksDB's documented buffered-block dictionary construction, dictionary persistence, `ZSTD_CDict`/`ZSTD_DDict` paths, and `sst_dump --command=recompress` size estimator.
- Competitive simple baseline: deterministic uniform reservoir of the same fragment count/bytes, random upstream-style sampling with fixed seed, and first-buffer prefix sampling; all feed the same frozen Zstd trainer.
- Optional offline ceiling: exact maximum-coverage sample set on tiny SSTs under the same byte budget, with sketch/training/measurement time excluded from no cost category.

## Baseline-residual action-space matrix

| Union facet | Frozen current union | Candidate residual | Same-object guard |
|---|---|---|---|
| Information | Ordered blocks, configured byte limits, buffered contents, Zstd trainer, metadata-cache settings | Streaming fragment sketches and marginal repeated-substring coverage | No key/value/order or format change |
| Actions | Random/uniform sample gathering; raw concatenation or existing Zstd training; fixed options | Budgeted online retained-cover construction before the same trainer | Not a trainer-parameter sweep |
| Guarantee | Existing SST reader/decompressor/checksum semantics | Same reader and dictionary metadata; retained-set invariant respects all byte budgets | No custom decoder or external dictionary |
| Full cost | Buffering, training, compression, dictionary access/cache, space and scans | Plus sketching, replacement, retained fragments and decision CPU/RSS | No free prepass, training or cache cost |

The candidate fails if the construction can be reproduced by a baseline-union setting or the Zstd trainer alone. “Select a different dictionary size/trainer parameter” is explicitly outside the residual.

## Mechanism hypothesis

Maintain a bounded deterministic sketch for each arriving data block and a replacement heap keyed by marginal coverage per retained byte. When full, evict a fragment whose covered k-grams/minimizers are most redundant; train the **unchanged** Zstd dictionary builder from the retained set and use the normal RocksDB dictionary meta-block. The direct N2 contribution is the online training-input construction/data structure under SST constraints—not a policy layer around RocksDB.

## Competing mechanisms

- Mechanism A — marginal-coverage retained-set construction: update a compact frequency sketch and evict redundant fragments under fixed bytes. Prediction: benefits heterogeneous but internally repetitive SSTs where random sampling overrepresents a local regime.
- Mechanism B — stratified key-range reservoir with deterministic quotas: lower CPU/RSS alternative that preserves representation across distinct key ranges but does not score actual substring redundancy. Prediction: helps if locality follows keys; loses when content similarity crosses ranges.
- Mechanism C — current random/uniform sample construction feeding the same trainer. This is the mandatory deployed comparator.
- Preferred mechanism: A has a single internal optimization invariant and an exact small-SST ceiling. B is a separate competing mechanism, not a post-hoc union.

## Seed-distance test

- Relative to RocksDB: dictionary scope, format, trainer, block writer and reader are held fixed; only the bounded training-input construction changes.
- Relative to Zstd: Cover/FastCover chooses dictionary segments from its supplied sample set; it does not implement a RocksDB streaming per-SST retained-cover construction with buffered-block, table-format and cache costs.
- Not a rename/wrapper: there is no external reordering or pipeline; the algorithm executes in the SST builder before the existing trainer.
- Method-name deletion: “Construct a bounded online representative fragment set that maximizes reusable substrings for a fixed downstream trainer while preserving a streaming record representation” remains a distinct N2 problem.

## Candidate paper claim

For a characterized subset of natural, structured sorted-KV SSTs, budgeted training-cover construction can preserve exact RocksDB SST semantics and produce a non-dominated total space / compaction CPU-RSS / read-decompression point versus the frozen current union. No universal compression improvement or general Zstd-training claim is made.

## Evidence route

- `PERFORMANCE` plus reader-equivalence/format-preservation tests.

## Software/algorithm performance admissibility

- Same-function contract: identical sorted key-value manifest, comparator, block format and all iterator results; current reader open/checksum/full scan; no changed query answers.
- Algorithmic delta: deterministic bounded sketch, marginal-coverage eviction and retained-set invariant under the current per-SST dictionary path.
- Full-cost ledger: manifest conversion/hash, buffering, sketches, candidate replacements, trainer CPU/RSS, SST bytes including dictionary/meta/index/filter, compaction throughput, cold/warm point reads, range scans, dictionary cache memory, I/O and failures.
- Generality hypothesis: small-block, structured values with cross-block repetition and multiple local content regimes. It need not help incompressible values, homogeneous SSTs, large blocks, no-dictionary deployments, or tight-memory workloads.
- Why not tuning: all dict/train/buffer/block settings are already a baseline union; the residual changes the sample construction algorithm under an identical budget and trainer.
- Expected no-gain: uniform/redundant blocks; Zstd trainer already obtains equivalent dictionary from uniform samples; sketch overhead dominates; cached dictionary pressure removes any space benefit.

## Current collision classification

- DIRECT_FATAL: none found for the frozen per-SST retained-cover construction; Stage 0 must independently test this.
- DIRECT_SUBTRACT: all preset/shared dictionary enablement, per-SST scope, raw/Zstd training, sample caps, Zstd Cover/FastCover, cache management and offline recompression measurement.
- METHODOLOGICAL_ADJACENT: Cassandra/Scylla table-level or shared dictionary management; generic corpus dictionary learning; LSM compaction scheduling.
- DEPLOYMENT_BASELINE: current RocksDB BlockBasedTable dictionary path and upstream Zstd.
- SEARCH_BOUNDED_OPEN: current literature collision for this exact online construction.

## Decisive falsifier

On 20 frozen naturally sourced sorted-KV manifests that produce at least 16 data blocks per SST, stop if (a) less than 10% of retained fragments differ from the seed-fixed uniform reservoir while obeying the same byte budget; (b) any reader/checksum/full-scan equivalence fails; (c) Mechanism A has no non-dominated point versus every union member on SST total bytes, compaction CPU/RSS and predeclared cold/warm point-read plus range-scan costs at both p50 and p90; or (d) sketch/replacement/training cost consumes all apparent storage benefit. No altered block size, Zstd level or dictionary budget may be introduced after observing outcomes.

## Executable evidence path

### 72-hour first evidence

1. Pin RocksDB/Zstd commits and prepare 20 public natural-record manifests with original-source URL, license, conversion program and hash; sort once canonically and freeze keys/values.
2. Reproduce every union member with `SstFileWriter` / `sst_dump`; check reader full scans and record total format/cost ledger.
3. Implement only the retained-set data structure in the existing dictionary builder and compare its chosen fragments to the frozen reservoirs and exact tiny-instance ceiling.
4. Kill on the falsifier. If it survives, separately compare A, B and all union members; do not promote a favorable compressor-only number to a database result.

### AI core fraction and critical path

`AI_CORE_EXECUTABLE` (about 75%): manifest conversion, pinned builds, SST harness, retained-set data structure, format checks and cost collection are CPU-only/public. A storage-engine reviewer must audit integration into the current builder, equality conditions and cache/read accounting.

### Semantics-preserving open alternatives

Upstream RocksDB's existing SST writer/reader/dictionary path and upstream Zstd trainer are public. Same-manifest no-dictionary, raw-sample, Zstd-training and reservoir variants are all open equal-quality alternatives. Cassandra/Scylla shared dictionaries are explicitly non-equivalent cross-system references.

## Q1/Q2 sufficiency hypothesis

- Structural paper potential: `TIER_B_Q2_VIABLE` if the method supplies a genuine constrained construction, transparent full-cost benefit across diverse natural record corpora, strict reader equivalence and no-gain characterization.
- Current evidence readiness: `MODERATE_FINITE_CPU_ROUTE`; source, writer/reader, format, public records and finite killer are available, but no experiment has been run.
- Why Q2 is plausible: narrow same-object N2, current production baseline union, exact semantic contract, public CPU artifact, natural carriers, an offline ceiling and explicit full-cost ledger form a coherent system paper shape.
- Why it is not Tier A now: the strongest potential collision is generic training-set/coreset literature; whether its residual stays novel inside RocksDB's precise path is unverified and must be resolved by Stage 0.
- Stage B needs: independent latest collision audit; source-compatible implementation; multiple natural corpora and record regimes; all baseline-union comparisons; cache/read/full-cost ablations; complete manifests and reproduction artifacts.
- Preliminary contribution-shape analogs: CIDR 2017 RocksDB space optimization, upstream RocksDB dictionary engineering, and Zstd's official Cover/FastCover work. These are calibration only, not novelty evidence.

## Non-relaxable quality audit

- Same-object: one fixed sorted KV manifest → standard per-SST RocksDB BlockBasedTable; no external reorder or changed decoder.
- Latest collision: upstream RocksDB/Zstd and available primary search checked through 2026-08-09; novelty stays `SEARCH_BOUNDED_OPEN`.
- Strong fair baselines: no-dict plus all frozen current dictionary modes/settings; random and deterministic same-budget sample variants; not defaults only.
- Natural input: public naturally produced structured records, converted transparently and hashed; not YCSB/fillrandom as evidence corpus.
- Full-cost: all sample-construction, trainer, cache, size, write and read costs charged.
- Reproducibility: public source, pinned commits, canonical manifests and read checks.
- Evidence honesty: no code/benchmark/result was produced by Discovery; benefits are hypotheses and missing implementation does not itself lower structural potential.

## Dual-axis score

- Academic value: `47/70`
- AI executability bonus: `23/30`
- Total: `70/100`

## AI and researcher boundary

AI can implement and audit the public CPU route. A storage-engine researcher must independently assess that the selected natural record mappings do not bias the claim and that the baseline union is current and semantically equal. AI readiness is not a scientific gate.
