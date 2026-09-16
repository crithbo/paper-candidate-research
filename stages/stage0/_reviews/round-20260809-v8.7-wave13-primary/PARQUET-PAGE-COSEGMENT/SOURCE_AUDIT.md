# Source and collision audit — PARQUET-PAGE-COSEGMENT

Cutoff: `2026-08-09`. Only paper originals and official/upstream sources support technical findings. The bounded search found no direct same-object constructor that jointly selects workload-conditioned standard Parquet page boundaries and legal representations; this is `SEARCH_BOUNDED_OPEN`, not proof of absence.

## Decisive current-format and source facts

| Primary source | Fact used | Review consequence |
|---|---|---|
| [Apache Parquet Thrift schema](https://github.com/apache/parquet-format/blob/master/src/main/thrift/parquet.thrift) | `ColumnMetaData.codec` is one codec per column chunk; page headers carry page encoding; Data Page V2 carries `is_compressed`; Bloom offset/length are column metadata | Arbitrary per-page codec and page-local Bloom choices are illegal. Legal per-page representation remains encoding and compressed/uncompressed retention under the fixed codec. |
| [Parquet Page Index](https://parquet.apache.org/docs/file-format/pageindex/) | ColumnIndex/OffsetIndex store page statistics and locations; indexed pages start at row boundaries | Page pruning is native and shared; candidate cuts must be row-aligned and synopsis novelty is capped. |
| [Parquet configurations](https://parquet.apache.org/docs/file-format/configurations/) | Pages are indivisible; smaller pages improve fine-grained reads while larger pages reduce headers/parsing overhead | Supports the structural boundary-overread tradeoff, not a measured candidate gain. |
| [Arrow Rust Parquet current docs](https://arrow.apache.org/rust/parquet/index.html) | `ArrowWriter` supports experimental content-defined chunking using a rolling hash | Generic nonuniform page-boundary novelty is absorbed by current source. |
| [Arrow `WriterPropertiesBuilder`](https://arrow.apache.org/rust/parquet/file/properties/struct.WriterPropertiesBuilder.html) | Exposes CDC options and Data Page V2 compression-ratio threshold; the latter may discard compressed output per page | Mandatory current action family and exact legal compression boundary. |
| [DataFusion current configuration](https://datafusion.apache.org/user-guide/configs.html) | Current reader enables PageIndex/pruning and exposes late-materialization controls; writer exposes page size/row cap, encoding, compression, dictionary/statistics/Bloom and CDC min/max/norm | Discovery’s scalar writer baseline is incomplete; B1/B2 must include current actions. |
| [Arrow late materialization deep dive](https://arrow.apache.org/blog/2025/12/11/parquet-late-materialization-deep-dive/) | Row selections use page offsets; a page containing selected rows is decompressed while irrelevant pages may be skipped | Explains cross-column row-span coupling and fixes the reader-side cost mechanism. |

## Paper genealogy and deployment boundaries

- [Liu et al., *Data formats in analytical DBMSs: performance trade-offs and future directions*, VLDB Journal 2025](https://link.springer.com/article/10.1007/s00778-025-00911-1) is the current domain/evaluation anchor. It evaluates format, encoding/compression and read-path tradeoffs, but the inspected paper does not provide the same workload-conditioned standard-page constructor.
- [DataFusion SIGMOD 2024 paper](https://github.com/apache/arrow-datafusion/files/14789704/DataFusion_Query_Engine___SIGMOD_2024-FINAL.pdf) anchors the native execution stack and systems evaluation shape.
- [Kimura et al., *Compression Aware Physical Database Design*, PVLDB 2011](https://www.vldb.org/pvldb/vol4/p657-kimura.pdf) directly subtracts the general idea of joint workload-aware compression and physical design, but selects SQL Server physical structures rather than boundaries inside a fixed standard Parquet file.
- [Oasis, arXiv:2608.02268](https://arxiv.org/abs/2608.02268) offloads Parquet decoding to a SmartNIC with DuckDB. It changes deployment hardware/reader and is not an equal-quality same-object writer baseline.
- [NYC TLC Trip Record Data](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page) is an official monthly natural Parquet corpus. Publication as natural data does not imply a natural query trace or a favorable row-clustering property.

## Current-source collision classification

### Exact/current action absorption

Current Arrow CDC absorbs:

- nonuniform data-page boundaries;
- rolling-hash, content-conditioned boundary placement;
- finite min/max/norm parameterized configurations.

Current writer properties absorb fixed/per-column choices for page limits, encodings, codec/level, dictionary behavior, statistics/index truncation, Bloom options and Data Page V2 compression retention. Arrow PageIndex/late materialization absorbs native page pruning and deferred projected-column reads.

### Surviving residual

The inspected sources do not expose arbitrary page row-boundary cuts optimized from a declared predicate/projection workload while keeping the same standard file and native reader. The residual is therefore:

`WORKLOAD_CONDITIONED_LEGAL_PAGE_CUT_AND_REPRESENTATION_CONSTRUCTOR__SEARCH_BOUNDED_OPEN`

It survives only against a pinned current CDC/fixed-writer family and must not be described as the first nonuniform Parquet writer.

### Non-fatal adjacent work

- Compression-aware physical design establishes joint optimization at a different physical object.
- Oasis reduces decode cost through hardware and may reduce achievable headroom, but does not construct the same file.
- Alternative page-index encodings or non-Parquet column formats change the output contract and are method subtractors/negative controls.

## Reality-check corrections to the Discovery package

1. Replace “per-page compression codec” with one fixed codec per column chunk plus legal per-page Data Page V2 compressed/uncompressed retention.
2. Treat Bloom filtering as column-chunk scope; treat page indexes/statistics as native derived facilities.
3. Add current Arrow/DataFusion CDC to the strongest baseline and novelty statement.
4. Freeze row groups and row order so benefits cannot come from clustering or a larger design object.
5. Give B1/B2 the same `W_train` and charge grid/model-selection cost.

These corrections narrow claims without changing the same-object research question. They must be resolved in the pre-claim fidelity gate.

## Search status and provenance limits

- Direct fatal same-object paper/current-source collision: `NOT_FOUND_IN_BOUNDED_PRIMARY_SEARCH`.
- Generic nonuniform-boundary claim: `CURRENT_SOURCE_COLLISION__ARROW_CDC`.
- Workload-conditioned legal-cut residual: `SEARCH_BOUNDED_OPEN`.
- Moving-branch Git/TLS access failures reported upstream are not evidence of absence. This review relied on rendered current official/upstream pages and requires immutable commit/blob archival before a claim-bearing run.

## Frozen upstream package verification

Locally recomputed on the accepted Discovery package:

- `PARQUET-PAGE-COSEGMENT.md`: `CEF3C6F868BD533FFF7B048EF720DE241120925B453DD87DFA0B266E679C1AFE`
- `ACTION_SPACE_COLLISION_MATRIX.md`: `853E94CB87F0DEB523647466A19C15F60A912EBC340D3C4EAF3D846351CE02CE`
- `DISCOVERY_LOG.md`: `E5F52D49D7E1A30DF035E5D19D66467155373820985CC6405F0EE3E4B66D5F62`
- upstream `handoff.yaml`: `FC2D773EBBD26B73D0BEADC95DF51607F6397A8C1DF8FC07CEC693F9E063F38A`
- upstream manifest self: `B221BD4C82389F3A1A684B630D5281AB5BDFF61C70CA8EF0BAB463DF805F3BCB`
- mainline acceptance: `4/4`

Discovery files were not modified.
