# PARQUET-PAGE-COSEGMENT — Stage 0 Confirmation Review

- Assignment: `STAGE0-C1-20260809-PARQUET-PAGE-COSEGMENT-CONFIRM-V8.7`
- Mode: independent `STAGE0-CONFIRMATION-SENTRY`
- Cutoff: 2026-08-09
- Protocol disposition: `CONFIRM`
- Scientific disposition: `CONFIRM_STAGE0_PASS`
- Conditional quality tier: `TIER_B_Q2_VIABLE`
- Current evidence readiness: `FINITE_FIDELITY_GAP`
- Stage A authorized: `false`
- Stage B authorized: `false`
- Experiment or implementation performed: `false`
- Lane after delivery: `IDLE_REUSABLE_AWAITING_MAINLINE`

## Bottom line

I independently confirm PRIMARY's corrected Stage 0 PASS at conditional Tier B. The viable object is not generic nonuniform Parquet paging, per-page codec selection, Bloom placement, PageIndex design, late materialization, or a controller over existing writer knobs. It is the narrower `WORKLOAD_CONDITIONED_LEGAL_PAGE_CUT_AND_REPRESENTATION_CONSTRUCTOR`: under fixed rows, fixed row groups, one standard self-contained Parquet file, and an unmodified native Arrow/DataFusion reader, jointly construct row-aligned page cuts and only format-legal page representations from a declared predicate/projection workload.

Current Arrow content-defined chunking (CDC) directly absorbs generic content-dependent and nonuniform boundary claims. Parquet fixes the compression codec and Bloom metadata at column-chunk scope. Those facts sharply lower the claim ceiling, but they do not close the frozen residual: current CDC boundaries are generated from content fingerprints and `min/max/norm` parameters, not from the declared SQL workload, and the inspected current writer does not expose the proposed globally budgeted workload-conditioned joint constructor.

The residual is capable of a non-product N2 only if the algorithm searches a legal cut/representation space rather than selecting an existing configuration. The same `W_train`, resource budget, legal representation set, and full selection cost must be given to the complete fixed-writer grid and to the complete preregistered CDC `min/max/norm` plus representation grid. If every candidate action is reproduced by that family, or if the implementation requires per-page codecs, page-local Bloom filters, a custom reader, changed row order/row groups, or nonstandard metadata, the residual closes and the work must STOP. No such closure is established by the frozen material.

This is a paper-potential judgment, not a finding that the constructor works or improves performance. Missing implementation and results lower readiness only.

## Input and provenance integrity

All frozen inputs were recomputed before judgment.

| Item | SHA-256 | Result |
|---|---|---|
| Discovery brief | `CEF3C6F868BD533FFF7B048EF720DE241120925B453DD87DFA0B266E679C1AFE` | match |
| Discovery collision matrix | `853E94CB87F0DEB523647466A19C15F60A912EBC340D3C4EAF3D846351CE02CE` | match |
| Discovery log | `E5F52D49D7E1A30DF035E5D19D66467155373820985CC6405F0EE3E4B66D5F62` | match |
| Discovery handoff | `FC2D773EBBD26B73D0BEADC95DF51607F6397A8C1DF8FC07CEC693F9E063F38A` | match |
| Discovery manifest | `B221BD4C82389F3A1A684B630D5281AB5BDFF61C70CA8EF0BAB463DF805F3BCB` | match |
| PRIMARY report | `0D33E6A547FE3BEAAC7732FB9D2FC638C327B4A27E5BB2AB110A12F05A03FBAB` | match |
| PRIMARY comparator matrix | `0D5864436C686AABE235E1F50D51577C6231E29C10877951591F46D7F885140F` | match |
| PRIMARY source audit | `D5F4EDD2AD37C4704A93A86E71294A298633FDE13D631568CB6D0FA221724FDA` | match |
| PRIMARY handoff | `90E562C79C293879EB5EFDAA2262AABC134C8FBB71942EBA5A0196F1DC908900` | match |
| PRIMARY manifest | `77EA9AF69BB4775DF859F7C1C1F12D724A05F1F210C467FE47A847FC83EF2FE3` | match (4/4) |

Registry state and disk inputs are consistent with a confirmation-active Stage 0 item. Stage A, Stage B, and execution permissions remain closed. No provenance conflict was found.

## Independent format and current-source verification

### Legal action boundary

The official [Parquet Thrift schema](https://github.com/apache/parquet-format/blob/master/src/main/thrift/parquet.thrift) places `codec` in `ColumnMetaData`; it is therefore one compression codec for the whole column chunk. Bloom-filter offset and length also live in column metadata, so page-local Bloom selection is not a legal action. `DataPageHeaderV2`, by contrast, carries an encoding and `is_compressed`, supporting page-level encoding metadata and per-page compressed/uncompressed retention while remaining under the column-chunk codec.

The official [Parquet format README](https://github.com/apache/parquet-format/blob/master/README.md) further constrains dictionary use: a column chunk may mix dictionary and non-dictionary data pages, but it has at most one dictionary page and that page must occur first. Consequently, “representation” cannot mean an arbitrary independent encoder per page. It must mean a type-correct standard page encoding under this dictionary contract, plus legal Data Page V2 retention. A constructor violating this boundary is not the same object.

The official [Page Index specification](https://parquet.apache.org/docs/file-format/pageindex/) makes ColumnIndex/OffsetIndex optional native metadata derived for pages and requires row-boundary information for navigation. PageIndex is therefore a held-constant shared facility, not N2. The [format configuration guidance](https://parquet.apache.org/docs/file-format/configurations/) confirms the structural tradeoff: smaller indivisible pages enable finer reads, whereas larger pages reduce header and parsing overhead. This establishes natural headroom in principle without establishing a positive result.

### Current Arrow/DataFusion action family

Current [Arrow Rust Parquet documentation](https://arrow.apache.org/rust/parquet/index.html) describes experimental content-defined chunking based on rolling hashes. The current [`WriterPropertiesBuilder`](https://arrow.apache.org/rust/parquet/file/properties/struct.WriterPropertiesBuilder.html) exposes CDC and fixed/per-column writer properties, and Data Page V2 compression-ratio thresholding can retain a page uncompressed. Current [DataFusion configuration](https://datafusion.apache.org/user-guide/configs.html) exposes CDC `min`, `max`, and `norm` parameters alongside page-size/row limits and representation-related writer settings.

Therefore the fair current union absorbs:

- uniform/fixed page size and row-count choices;
- content-conditioned, nonuniform rolling-hash boundaries;
- every preregistered CDC `min/max/norm` point;
- global/per-column encoding, compression, dictionary, statistics/PageIndex and Bloom settings exposed by the pinned writer;
- legal Data Page V2 compression retention behavior already produced by the pinned writer.

The candidate cannot claim “first adaptive pages,” “first nonuniform pages,” or novelty from merely searching this property grid. The [Arrow late-materialization account](https://arrow.apache.org/blog/2025/12/11/parquet-late-materialization-deep-dive/) shows that current readers already use page offsets, pruning, and deferred projected-column reads. These mechanisms explain why writer-side row spans matter, but remain fixed consumers in the comparison.

### Additional independent comparator: GSOP

[GSOP: Skipping-oriented Partitioning for Columnar Layouts (PVLDB 2017)](https://www.cs.sfu.ca/~jnwang/papers/vldb2017-gsop.pdf) is an important methodological subtractor omitted from the PRIMARY comparator matrix. It uses a query workload to reorganize data inside horizontal partitions for skipping, and its prototype emits Parquet files. It does not, however, preserve the frozen object: GSOP repartitions/reorders tuples into row-group blocks, permits different column groupings, represents absent columns, stores additional union-vector metadata, and performs tuple reconstruction in a modified read path. It therefore absorbs the broad framing “use a workload to organize Parquet-like blocks for skipping,” but not the fixed-row-order, fixed-row-group, standard-file, native-reader page constructor.

The independent search found no primary/current source that both preserves this exact contract and supplies the same workload-conditioned legal page-cut plus representation constructor. This is a search-bounded residual, not proof of novelty.

## Claim and collision matrix

| Claim | Same object? | Finding | Collision class | Consequence |
|---|---|---|---|---|
| Choose a compression codec independently per page | no | Parquet stores codec at column-chunk scope | `DIRECT_FORMAT_FATAL` | Prohibited claim/action |
| Choose Bloom filters independently per page | no | Bloom metadata is column-chunk scoped | `DIRECT_FORMAT_FATAL` | Prohibited claim/action |
| Arbitrary page-local dictionary/encoding choice | only under strict constraints | Encoding is page metadata, but dictionary state is column-chunk scoped with at most one leading dictionary page | `PARTIAL_FORMAT_CLOSURE` | Freeze a type-correct legal subset; no arbitrary page freedom |
| First nonuniform/content-aware Parquet page writer | yes | Current Arrow CDC already provides rolling-hash nonuniform pages | `DIRECT_CURRENT_SOURCE_COLLISION` | Claim removed |
| Tune/select among current writer and CDC parameters | yes | Complete finite fixed/CDC grid already owns those actions | `METHOD/PRODUCT_COLLISION` | Not N2; STOP if this is the mechanism |
| PageIndex or late materialization is candidate novelty | yes | Native current reader facilities | `DIRECT_SHARED_FACILITY` | Hold constant for every arm |
| Workload-aware physical layout broadly | no | Kimura physical design and GSOP establish the broad method lineage | `METHODOLOGICAL_COLLISION` | Broad novelty prohibited |
| GSOP is the same constructor | no | It changes row organization, row-group/column-group layout, metadata, and reader behavior | `OBJECT/DEPLOYMENT_COLLISION` | Strong subtractor, not same-object fatal |
| Oasis is the same baseline | no | It changes hardware and reader/decode deployment | `DEPLOYMENT_COLLISION` | Subtractor only, not a fair writer baseline |
| Workload-conditioned legal cuts plus representation outside the complete current family | yes | Not found in inspected primary/current sources | `SEARCH_BOUNDED_RESIDUAL` | Conditional N2 remains open |
| Residual already improves size/query time | yes | No implementation or result in Stage 0 | `UNESTABLISHED_RESULT` | Readiness gap only; not STOP |

## Exact object and non-product N2 boundary

The same-object contract is mechanically definable:

1. input: the identical typed, ordered table and one declared `W_train`;
2. output: one self-contained standard Parquet file;
3. invariants: identical schema, typed values, nulls, row order, and row-group boundaries;
4. legal actions: per-column row-aligned page cuts; standard page encodings consistent with physical type and the single column-chunk dictionary contract; per-page Data Page V2 compressed/uncompressed retention under one column-chunk codec; derived standard page metadata;
5. prohibited actions: row reorder/reclustering, row-group changes, custom/external indexes, custom metadata needed for correctness, custom reader, per-page codecs, and page-local Bloom filters;
6. consumer: one pinned unmodified Arrow/DataFusion native reader, with identical SQL results.

The contribution is non-product only if it supplies a genuine constructor—e.g. a globally budgeted optimization or algorithm with a stated property—over coupled cut and legal representation decisions. Hotness thresholds, policy selection, per-column independent knob tuning, or choosing the best existing grid member are controller/product work and structurally fail N2.

Natural headroom is credible but conditional: current page pruning and late materialization pay at page granularity, while CDC is content-fingerprint driven and not predicate/projection aware. A fixed-order workload can therefore induce cut objectives not represented by the CDC family. Whether those objectives yield useful natural actions and non-dominated full-cost points is precisely the later research question, not a Stage 0 premise that must already be true.

## Strongest finite fair baseline

All executable arms receive the identical input file, `W_train`, held-out workload, hardware, native reader, legality checks, optimization budget, and full-cost accounting.

- `B0`: pinned current Arrow/DataFusion default writer.
- `B1`: complete preregistered finite grid over fixed page byte/row caps and the legal representation properties exposed by the pinned writer.
- `B2`: complete preregistered finite CDC `min/max/norm` grid crossed with the same legal representation grid.
- candidate: workload-conditioned constructor over only the frozen legal actions.

“Complete” means the grid is fixed before results and spans the practical current action family justified by source/API bounds. Each reported point must be one executable configuration; a metric-wise best-of synthetic union is forbidden. Every arm receives the declared workload for model/configuration selection, and planning/search time and memory are charged symmetrically. PageIndex and late materialization are identical across all arms.

GSOP, compression-aware DTA, and Oasis are genealogy/deployment subtractors because they change the object or consumer. They must appear in related-work positioning but must not be mixed into an impossible same-object union.

## Finite Stage A preclaim/killer route

The route is finite and CPU/open-source same-semantics. It is a risk probe, not proof of the paper claim.

1. Pin immutable Arrow Rust/DataFusion/Parquet-format revisions and enumerate the legal action schema.
2. Use 20 preregistered natural NYC TLC Parquet files without changing row order or row groups; freeze one declared train/test SQL workload split.
3. Mechanically enumerate B1 and B2, and give them the same `W_train` and comparable selection budget.
4. Check strict typed equality, null/order/row-group preservation, standard single-file self-containment, metadata legality, native-reader acceptance, and identical SQL results.
5. Record whether the constructor produces legal actions outside every B1/B2 configuration and whether at least 10% of eligible page decisions/files contain useful retained residual actions. This is the claim-bearing observation; without it, N2 collapses to tuning.
6. Report full planning/search CPU and RSS, write CPU/wall/RSS, file and index bytes, query p50/p90 latency, bytes/pages decoded, and repeated-run variance for every executable point.
7. Use the preregistered potential-screening falsifier: no candidate point is retained unless size is within `+5%` of the strongest same-object baseline and held-out p50 query latency is at least `10%` better on at least `12/20` files, without a p90/full-cost regression that erases the point.

Stage 0 does not assert that these thresholds will be met. The route is adequate because it can cheaply distinguish an action-space collapse, a fidelity failure, and an initial non-dominated signal before full research execution.

## Structural potential versus readiness

### Structural paper potential: `TIER_B_Q2_VIABLE`

Conditional on the residual, the paper shape is coherent:

- N1: a formal legal action/cost model for workload-conditioned Parquet page cuts and representations under the fixed standard-file/native-reader contract;
- N2: a nontrivial joint constructor outside the complete fixed/CDC configuration family;
- N3: natural-file, same-information, full-cost native-reader evidence with strict semantic/format fidelity.

The Q1 ceiling is not supported by current materials. Tier A would require broader workload/data families, reusable algorithmic theory or guarantees, and stronger generalization evidence.

### Current evidence readiness: `FINITE_FIDELITY_GAP`

No constructor, residual action, or positive Pareto result has yet been established. The largest risks are legal-action closure and absorption by the complete CDC/representation family. Public specifications, upstream Arrow/DataFusion, standard readers, and natural public files provide a finite CPU route. Lack of implementation or current positive results is not used as a STOP reason.

## Decision and permissions

- Confirm PRIMARY PASS recommendation: **yes**.
- Confirm conditional tier: **`TIER_B_Q2_VIABLE`**.
- Direct same-object fatal collision found: **no**.
- Current-source absorption requiring claim correction: **yes—generic nonuniform/content-aware pages are absorbed by Arrow CDC**.
- Additional comparator required in future positioning: **GSOP as methodological/object-changing subtractor**.
- Revision required before Stage 0 disposition: **no**; the PRIMARY correction plus the explicit legal dictionary boundary are sufficient as a pre-claim fidelity gate.
- Claim that the constructor or benefit already exists: **no**.
- Stage A/B, experiment, implementation, or downstream project authorized: **no**.
- Registry, plan, Discovery, PRIMARY, rules, or templates modified: **no**.

## Confidence and search boundary

- Format/current-source correction confidence: `0.98`.
- Same-object residual assessment confidence: `0.85`.
- Conditional Tier B assessment confidence: `0.83`.
- Search boundary: Apache Parquet official format/schema, current Arrow Rust/DataFusion official documentation and source-facing API, primary papers on Parquet/columnar evaluation, compression-aware physical design, GSOP, and Oasis, checked through 2026-08-09. Absence is explicitly search-bounded.
