# ROCKSDB-DICT-COVER Independent Source and Collision Audit

- Role: `STAGE0-CONFIRMATION-SENTRY`
- Cutoff: `2026-08-09`
- Method: reviewer/source-verification/devil's-advocate; primary/current sources first
- Search boundary: RocksDB official documentation and current upstream builder; Zstd API and Cover/FastCover source; the Cover paper genealogy; official systems-paper pages; bounded exact-object searches for RocksDB/per-SST dictionary sample selection
- Result: `NO_DIRECT_FATAL_FOUND__SEARCH_BOUNDED_OPEN`

## Primary source ledger

| ID | Source | Independently supported fact | Audit use |
|---|---|---|---|
| S1 | [RocksDB current `block_based_table_builder.cc`](https://github.com/facebook/rocksdb/blob/main/table/block_based/block_based_table_builder.cc) | Current builder obtains dictionary guidance, bounds buffered samples, traverses buffered whole blocks from a midpoint with a fixed prime stride until `max_sample_bytes`, and distinguishes external `kMisc` creation context | Same-object baseline and `SstFileWriter` drift boundary |
| S2 | [RocksDB Preset Dictionary Compression](https://rocksdb.org/blog/2021/05/31/dictionary-compression.html) | Official per-SST scope, buffering, raw/trained paths, persistence, CDict/DDict/cache and configuration/cost design | Direct subtractor and cost ledger |
| S3 | [RocksDB Compression wiki](https://github.com/facebook/rocksdb/wiki/Compression) | Bottommost compression and legal configuration surface | Deployment baseline/grid |
| S4 | [RocksDB BlockBasedTable format wiki](https://github.com/facebook/rocksdb/wiki/Rocksdb-BlockBasedTable-Format) | File format and compression-dictionary meta-block; sampling prose is historical relative to current source | Format/equality authority with version warning |
| S5 | [RocksDB Creating and Ingesting SST files](https://github.com/facebook/rocksdb/wiki/creating-and-ingesting-sst-files) | `SstFileWriter` creates external files from supplied options and ingestion can place files at low/bottom levels | Shows that later placement is distinct from construction-context parity |
| S6 | [Zstd current `zdict.h`](https://github.com/facebook/zstd/blob/dev/lib/zdict.h) | Dictionary-training API and Cover/FastCover entry points | Freeze trainer/version; trainer construction is not candidate novelty |
| S7 | [Zstd current `fastcover.c`](https://github.com/facebook/zstd/blob/dev/lib/dictBuilder/fastcover.c) | Scores candidate segments using d-mer frequency and discounts already-covered d-mers | Directly absorbs generic coverage/redundancy-removal claim |
| S8 | [Zstd current `cover.c`](https://github.com/facebook/zstd/blob/dev/lib/dictBuilder/cover.c) | Identifies Liao et al. as the Cover construction basis | Genealogy authority |
| S9 | [Zstd issue #3111](https://github.com/facebook/zstd/issues/3111) | Upstream discussion of representative samples and randomized capping under memory constraints | Seeded reservoir and memory costs belong in union |
| S10 | [Liao et al., Effective Construction of Relative Lempel-Ziv Dictionaries](https://archives.iw3c2.org/www2016-Proceedings/proceedings/p807.pdf) | Reservoir-estimated frequent k-mers and local maximum-cover segment selection for an RLZ dictionary over a collection | Major methodological/direct subtractor; different codec/object |
| S11 | [Dai et al., Bourbon](https://www.usenix.org/conference/osdi20/presentation/dai) | LSM mechanism and full-system evaluation shape | Quality-shape comparator only |
| S12 | [Zhang et al., Finesse](https://www.usenix.org/conference/fast19/presentation/zhang) | Feature-locality compression mechanism and end-to-end evaluation shape | Quality/evaluation comparator; different object |
| S13 | [Dong et al., Optimizing Space Amplification in RocksDB](https://www.eecg.toronto.edu/~stumm/Papers/Dong-CIDR-16.pdf) | RocksDB space/compaction trade-off context | Domain calibration only |

## Source corrections and expression limits

1. The historical BlockBasedTable wiki description of uniform random 64-byte samples is not the current implementation authority. The same-object baseline must reproduce current midpoint/prime-stride whole-block traversal.
2. Cover/FastCover is not merely an adjacent alternative trainer. It directly subtracts generic frequency/coverage and redundancy-removal novelty and remains fixed downstream in the candidate claim.
3. Liao et al. is not an exact RocksDB collision, but it is a decisive method/genealogy subtractor. The candidate cannot claim that reservoir-estimated frequent substrings or maximum coverage is new.
4. `SstFileWriter` documentation establishes external-file construction and ingestion behavior, not parity with a production bottommost-compaction creation context. Current source makes that distinction claim-relevant.
5. No source supports a priority claim. The residual wording must remain search-bounded.

## Same-object direct-fatal test

| Required facet | Current RocksDB | FastCover/Liao | Generic selectors | Complete coverage found? |
|---|---|---|---|---|
| Production-equivalent bottommost per-SST object | yes | no | no | deployment only |
| Finite train-byte, single-pass bounded memory | current bounded traversal | trainer sees supplied corpus; Liao uses a reservoir | reservoir/prefix/stratified variants | partial/methodological |
| Pre-trainer retained-fragment coreset | fixed traversal, not claimed coreset constructor | final dictionary construction | simple selection | search-bounded open |
| Unchanged pinned trainer | yes | is trainer/genealogy | can feed same trainer | combination remains open |
| Useful residual-action certificate | no located claim | no RocksDB same-object certificate | no | open |
| Strict SST/reader equality and full p50+p90 cost frontier | deployment path exists | different object/costs | possible controls | no complete collision |

No direct fatal was located for all facets together. This finding is bounded by the named sources and exact-object searches through the cutoff; it is not evidence of global absence.

## Bottommost-compaction versus `SstFileWriter`

Current builder code constructs a `TableFileCreationBrief`/filter context whose fields depend on the creation reason. For external SST creation, `kMisc` omits the ordinary in-LSM compaction-style, level, and bottommost values. The compression manager is selected from that context before dictionary guidance is requested. Consequently:

- a byte-identical sorted KV manifest and matching user options are not sufficient to prove same-object execution;
- later ingestion into a bottom level does not prove the file was built under bottommost-compaction guidance;
- a fixture is admissible only after compressor, dictionary guidance, buffered blocks, selection cap/order, trainer input/output, table properties, and reader behavior match the production path;
- failing fixture parity lowers the fixture's evidence ceiling; it does not imply the production object is undefined or unavailable.

## Union and residual boundary

The mandatory finite union is: no dictionary; RocksDB raw dictionary; current trained midpoint/prime-stride whole-block selection; prefix; seeded uniform byte and block reservoirs; deterministic key-range-stratified selection; and every preregistered legal finite-grid cell for dictionary/training/buffer/block/file/compression/cache/trainer parameters. Each member is run independently with identical information and budgets.

The residual exists only before the unchanged trainer: a deterministic per-SST, single-pass, bounded-memory retained-fragment coreset with algorithmic state and replacement decisions not reducible to the union. If different retained bytes do not cause distinct useful dictionary/match/byte actions, downstream FastCover has absorbed the mechanism.

## Evidence and claim ceiling

Stage 0 supports only this statement: the narrow residual is structurally well-posed, not directly covered by the bounded source set, and has a finite CPU evidence route. It does not support natural headroom, a 10% residual-action rate, a compression improvement, a Pareto point, or generality.

Even after a positive Stage A probe, the allowed wording is preliminary: on the frozen pilot manifests, the preregistered constructor produced residual useful actions and a candidate full-cost point outside the named finite union. The main claim requires later research and Stage-B evidence closure.
