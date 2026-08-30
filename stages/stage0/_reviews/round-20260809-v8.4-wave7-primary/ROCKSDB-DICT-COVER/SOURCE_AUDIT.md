# ROCKSDB-DICT-COVER Source and Collision Audit

- Assignment: `STAGE0-P1-20260809-ROCKSDB-DICT-COVER-PRIMARY-V8.4`
- Role: independent `PRIMARY`
- Cutoff: `2026-08-09`
- Search status: `SEARCH_BOUNDED_OPEN`
- Direct fatal found: `false`
- Evidence mode: paper originals, official project pages, and upstream source/docs only; no candidate experiment was run.

## Provenance correction

Discovery's current-baseline wording relied on the BlockBasedTable format wiki's historical description of uniform random 64-byte samples and an older subcompaction relationship. The official 2021 RocksDB design post says the implementation moved to per-SST scope because adjacent-file training could be materially worse. More importantly, current `main` source uses a deterministic midpoint/prime-stride traversal over buffered blocks and copies each selected block up to the sample-byte cap. The current source is the implementation authority for Stage A.

This correction does not invalidate the exact object or create a direct collision. It strengthens the closest fair baseline and lowers the novelty/benefit prior. Any report or harness that calls current RocksDB sampling “random 64-byte” is stale.

## Primary source ledger

| ID | Source | Authority and checked fact | Candidate implication | Classification |
|---|---|---|---|---|
| S1 | [RocksDB current `block_based_table_builder.cc`](https://github.com/facebook/rocksdb/blob/main/table/block_based/block_based_table_builder.cc) | Upstream `main`; `GetDictGuidance` selects `DictSampling`; buffered size is bounded by target file size and `max_dict_buffer_bytes`; current sampling starts at midpoint and uses a fixed prime-stride permutation, appending whole blocks until `max_sample_bytes`; the resulting `DictSamples` is passed to `MaybeCloneSpecialized`; dictionary-aware verification is installed. | Exact current same-object baseline and integration seam. Also shows `kMisc` external writer context differs from in-LSM creation context. | `DEPLOYMENT_BASELINE` |
| S2 | [RocksDB Preset Dictionary Compression](https://rocksdb.org/blog/2021/05/31/dictionary-compression.html) | Official design: per-SST scope, buffering, raw samples versus trained mode, persistence, CDict/DDict/cache effects, `max_dict_bytes`, `zstd_max_train_bytes`, `max_dict_buffer_bytes`, and recompression/A-B measurement. | Absorbs enablement, scope, configuration and system plumbing. Candidate must retain exact path and charge every listed cost. | `DIRECT_SUBTRACT` |
| S3 | [RocksDB Compression wiki](https://github.com/facebook/rocksdb/wiki/Compression) | Official configuration overview. | Finite legal settings and no-dict/current modes belong in union. | `DEPLOYMENT_BASELINE` |
| S4 | [RocksDB BlockBasedTable format wiki](https://github.com/facebook/rocksdb/wiki/Rocksdb-BlockBasedTable-Format) | Official format layout, dictionary meta-block and reader contract; its sampling prose is historical/version-skewed relative to S1. | Use for format/equality only; do not treat stale sampling as current. | `FORMAT_AUTHORITY_WITH_VERSION_WARNING` |
| S5 | [Zstd `zdict.h` current API](https://github.com/facebook/zstd/blob/dev/lib/zdict.h) | Upstream API says `ZDICT_trainFromBuffer` redirects to single-thread FastCover defaults and recommends total sample bytes around 100x dictionary size; exposes Cover/FastCover variants. | Freeze exact trainer/version. Candidate cannot claim trainer construction or tune it for advantage. | `DIRECT_SUBTRACT` |
| S6 | [Zstd `fastcover.c`](https://github.com/facebook/zstd/blob/dev/lib/dictBuilder/fastcover.c) | Upstream source scores a length-k segment by d-mer frequency, selects the best in an epoch and zeroes frequencies for covered d-mers. | Generic coverage and redundancy removal already exist downstream. Candidate residual is only bounded online *input coreset* construction. | `DIRECT_SUBTRACT` |
| S7 | [Zstd `cover.c`](https://github.com/facebook/zstd/blob/dev/lib/dictBuilder/cover.c) | Upstream implementation identifies the Liao et al. WWW 2016 method as its construction basis. | Establishes paper genealogy and prevents novelty laundering through a system integration name. | `GENEALOGY_AUTHORITY` |
| S8 | [Zstd issue #3111](https://github.com/facebook/zstd/issues/3111) | Upstream maintainer discussion explains sample representativity and randomized capping under memory limits. | Seeded random/reservoir controls and training memory belong in the fair union/ledger. | `CURRENT_METHOD_SUBTRACTOR` |
| S9 | [Liao et al., Effective Construction of Relative Lempel-Ziv Dictionaries, WWW 2016](https://archives.iw3c2.org/www2016-Proceedings/proceedings/p807.pdf) | Paper original: formulates dictionary construction as string/k-mer covering, estimates frequent k-mers with a reservoir, and selects locally highest-coverage segments. Its object is RLZ dictionary construction over large collections and its evaluation uses a different codec/decoder. | Major method collision. It removes any broad coverage/reservoir novelty claim but does not exactly cover the RocksDB per-SST bounded pre-trainer coreset plus unchanged FastCover and full system contract. | `METHODOLOGICAL_DIRECT_SUBTRACT` |
| S10 | [Dai et al., Bourbon, OSDI 2020](https://www.usenix.org/conference/osdi20/presentation/dai) | Official paper page: integrates a non-trivial learning mechanism and cost-benefit decision into an LSM and evaluates real/synthetic workloads. | Paper-shape comparator only. | `Q1_SHAPE_CALIBRATION` |
| S11 | [Zhang et al., Finesse, FAST 2019](https://www.usenix.org/conference/fast19/presentation/zhang) | Official paper page: feature-locality algorithm for delta compression, compared on similarity cost, compression and end-to-end throughput. | Evaluation/mechanism shape comparator; different object. | `Q1_SHAPE_CALIBRATION` |
| S12 | [Dong et al., Optimizing Space Amplification in RocksDB, CIDR 2017](https://www.eecg.toronto.edu/~stumm/Papers/Dong-CIDR-16.pdf) | Author-hosted paper on RocksDB space/compaction tradeoffs. | Domain calibration, not dictionary-selection novelty evidence. | `DOMAIN_CALIBRATION` |

## Current-source collision details

### RocksDB sample construction

Current source establishes the following same-object chain:

1. the built-in compression manager provides `DictSampling` guidance and `max_sample_bytes`;
2. the builder buffers uncompressed blocks under the target-file/buffer cap;
3. once it enters unbuffered state, it visits every buffered block in a deterministic cyclic order generated by a fixed large prime modulo block count, starting at the midpoint;
4. it copies each visited block (truncating the final one if necessary) into `DictSamples` until the trainer-input byte cap is full;
5. the specialized compressor generates a serialized dictionary and the normal dictionary-aware decompressor verifies it.

Thus B1 must reproduce this exact current traversal. Random, uniform, prefix and stratified sampling are additional simple baselines, not substitutes for B1.

### FastCover/Liao absorption

FastCover already computes d-mer frequencies, scores candidate segments by their summed frequency, selects high-scoring segments, and zeroes d-mers already included. Liao et al. already uses a reservoir of frequent k-mers plus coverage-based segment selection. A candidate phrased as “cover repeated substrings to build a dictionary” is absorbed.

The narrowly surviving action is an online, memory- and byte-bounded *sample coreset* before the unchanged trainer. This is a different decision layer only if the trainer cannot see all buffered blocks under the frozen cap and the coreset changes useful downstream dictionary actions beyond all simple/current selectors. If retained samples differ but FastCover's dictionary/matches do not, there is no mechanism residual.

## Same-object direct-fatal matrix

| Required direct-fatal facet | Current RocksDB | FastCover/Liao | Generic coreset work | Exact coverage found? |
|---|---|---|---|---|
| One standard bottommost RocksDB BlockBasedTable SST | yes | no | no | only current deployment |
| Same sorted KV manifest/order/reader semantics | yes | no | no | only current deployment |
| Bounded online retained-fragment selection before trainer | fixed traversal, not marginal-coverage coreset | final dictionary segment selection from supplied corpus | generic objectives | no exact source located |
| Unchanged Zstd/FastCover downstream trainer | yes | is the trainer/genealogy | usually no | combination remains open |
| Same finite byte budgets and one-pass information | partially | no RocksDB lifecycle | objective-dependent | no exact source located |
| Full SST space/write/read/cache/RSS claim | production capabilities, no candidate result | compression-centric | no | no exact source located |

Result: `DIRECT_FATAL_NOT_FOUND`. Because the residual is narrow and generic sample-selection literature is broad, retain `SEARCH_BOUNDED_OPEN`; do not claim priority.

## Required frozen finite union

- no dictionary;
- current RocksDB raw dictionary and Zstd-trained dictionary with exact midpoint/prime-stride block selection;
- first-prefix, seeded uniform block/byte reservoir, and deterministic key-range stratified reservoir;
- a small preregistered legal grid over dictionary/train/buffer bytes, compression level, block size and cache mode;
- all trained variants use the same pinned trainer in each comparison cell;
- optional implementable facility-location/submodular selector if it uses the same streaming information and byte budget;
- tiny exact maximum-coverage only as an offline ceiling.

An unbounded “best of every possible setting” union is forbidden. Conversely, comparing only RocksDB defaults is too weak.

## Reproducibility and corpus audit requirements

- Pin RocksDB and Zstd commit hashes, compiler, build flags, CPU model, OS, filesystem/storage, thread counts and timing protocol.
- Freeze production-equivalent bottommost SST creation context. If `SstFileWriter` is used, document and test parity with the in-LSM dictionary guidance and output properties.
- Provide 20 natural structured-record manifests from at least two source families; for every source record URL, license, acquisition date, raw hash, deterministic converter version/command, manifest hash, key/value schema, record count, duplicate/tie policy and block count.
- Require at least 16 data blocks per SST; record exclusions before outcomes.
- Hash selected samples, dictionaries, SSTs, options, commands and results. Preserve deterministic seeds and failure/fallback logs.
- Verify table open, checksums, full ordered scan, point probes and range scans against the canonical manifest.
- Record all costs rather than using `sst_dump --recompress` estimates as a substitute for end-to-end writes/reads.

## Source-bound claim ceiling

Allowed after a positive Stage A probe: “On the frozen pilot manifests, the pre-registered bounded retained-set constructor produced preliminary residual actions and a non-dominated pilot point under the named union.”

Not allowed: “coverage-based dictionary training is new,” “current RocksDB uses random 64-byte sampling,” “the method generally improves Zstd,” “the candidate reduces production RocksDB cost,” or any publication-scale effectiveness claim.
