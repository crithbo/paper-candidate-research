# PARQUET-PAGE-COSEGMENT — Predicate-aware Parquet page co-segmentation

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origins: `O2`
- Domain tags: `columnar-storage, Parquet, query-runtime, compression, metadata`
- Contribution route: `N2`
- Discovery date: 2026-08-09
- Discovery method revision: `v2/v8.1 + v8.6 fidelity-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`

## Research question

For a standard-compliant Parquet file that must return identical SQL results, can a workload-conditioned algorithm jointly choose page boundaries, per-page encoding/compression, and page synopsis metadata to reduce **total write-plus-query cost** under Arrow/DataFusion page pruning, rather than independently tuning a page-size threshold and reading-side selection policy?

## Paper genealogy

- Anchor paper: Durner et al., *Data formats in analytical DBMSs: performance trade-offs and future directions*, VLDB Journal (2025), which separates workload-agnostic columnar-format analysis from workload-driven partitioning/co-design.
- Key predecessors: Apache Parquet format/current writer; Apache Arrow `arrow-rs` late materialization and page pruning (2025); compression-aware physical design (2011).
- Follow-up / competing papers: *Oasis* (2026) moves Parquet decoding into the network datapath; it is a strong reader-side/deployment subtractor, not a writer-side co-segmentation algorithm.
- Counter-evidence / negative source: Arrow documents that its reader already skips fully irrelevant pages and only decompresses a page that contributes rows; any gain therefore disappears when existing fixed pages already align with predicates.
- Artifact / benchmark / specification: Apache Parquet 1.17.0 and format specification; Arrow/DataFusion; NYC TLC public Parquet trip records.
- Search boundary: primary/official sources refreshed through 2026-08-09. `SEARCH_BOUNDED_OPEN` is not a novelty claim.

## Topic-origin card

- Trigger: after page-index pruning and late materialization avoid unnecessary reads, the residual is the **indivisible compressed page**: one selected row forces decompression of the whole page.
- Measurable observation / quantitative anchor: Arrow explicitly records that compression boundaries prevent finer reads; Oasis reports that Parquet decoding can account for about half of query runtime in its evaluated setting.
- Baseline limitation: current writer interfaces expose scalar page/row thresholds and optional Bloom/index settings; reader mechanisms make the best use of those fixed pages after they exist.
- Structural cause: page partitioning determines, simultaneously, compression locality, index/synopsis granularity, page-index size, object-store range count, and the CPU decompression paid by a selective query.
- Decision variable: an ordered segmentation of each sorted/clustered column chunk, an encoding/codec option for each segment, and compatible `ColumnIndex`/offset-index/Bloom synopsis parameters, optimized against a declared predicate workload under standard Parquet semantics.
- Candidate Q1 venue family: VLDB/SIGMOD/FAST; admitted here only as `TIER_B_Q2_VIABLE` pending independent novelty and feasibility review.

## Historical method calibration

- Source-session backtest file: v8.6 isolated calibration recorded in project registry/plan (`6TP/0FN/6TN/0FP`).
- Backtest status: calibrated method; calibration is not candidate evidence.

## Importance and group fit

Parquet is a common storage substrate. The object is CPU-reproducible, the format supplies exact correctness semantics, and official natural Parquet corpora make a bounded Stage A possible without accelerator access.

## Exact object

A pre-existing public Parquet relation is rewritten as a **standard-compliant Parquet file** and queried by Apache Arrow/DataFusion-style predicate-first page pruning. The final object is query result rows and values, not a proprietary index, a different file format, or a reader-only cache policy.

## Named fair baselines

- Deployment/default baseline: Apache Parquet Java `apache-parquet-1.17.0` writer with its documented page/row/dictionary settings, with standard PageIndex/Bloom options where supported.
- Closest recent-paper baseline: Arrow `arrow-rs` PageIndex + late-materialization reader, and Oasis for the hardware-assisted decoder case.
- Competitive simple baseline: fixed page-size/row-limit grid over current writer flags, with independently chosen codec/dictionary/Bloom settings, evaluated on the same rewritten file and the same query set.
- Optional offline ceiling: an exact/DP page-boundary oracle over a bounded candidate-cut set and the same measured codec costs; it is not a deployable baseline unless its complexity and costs are retained.

## Mechanism hypothesis

The proposed N2 algorithm forms an explicit per-column dynamic program/Pareto frontier over legal page cuts. A state carries compressed byte cost, synopsis bytes, estimated range-read count, and query-weighted decompression/decode cost. A transition chooses a legal next page boundary and an allowed standard encoding/codec; its output writes ordinary Parquet pages and standard metadata only. The read path remains native Arrow/DataFusion semantics. This is a joint construction algorithm, not a runtime choice controller.

## Competing mechanisms

- Mechanism A — fixed writer + reader exploitation: set page size/row limits and compression options, then let PageIndex/late materialization prune pages. It predicts little gain where pages are already selective.
- Mechanism B — reader-side compute removal: Arrow late materialization/cache or Oasis decoder offload. It predicts gains without changing file layout, especially when decode/network overlap dominates.
- Mechanism C — workload-aware physical partitioning outside Parquet: repartition rows/files or add a separate index. It may help but can violate the frozen single standard-Parquet-file object or change write/full-cost semantics.
- Preferred mechanism and why: only the co-segmentation mechanism jointly controls the storage boundary whose indivisibility causes the residual while preserving the same file format and reader semantics.

## Mechanism signature

The atomic action is **not** `withPageSize(x)` or a selector: it computes a sequence of nonuniform page cuts and per-page representation/synopsis decisions from values plus declared query predicates, with one objective that includes writer, metadata, object-range, decompression, and decode cost.

## Seed-distance test

- What changes relative to the anchor: from format comparison/reader optimization to an explicit constrained page-construction algorithm with a full write+query cost model.
- What changes relative to the closest prior work: Arrow optimizes selection over existing pages; Oasis overlaps decoding of existing pages. The candidate changes the pages themselves while retaining their standard reader semantics.
- Why this is not an application/backend rename: the exact format, writer and reader are frozen; neither a new backend nor an external index is introduced.
- Result of method-name deletion test: “compute a legal partition and representation of a compressed column stream that minimizes storage plus selective-query materialization cost” remains a distinct algorithmic problem.

## Candidate paper claim

For a declared selective-query workload, page co-segmentation can expose a Pareto region that fixed-size writer configurations plus current reader pruning cannot reach, while preserving standard Parquet conformance and exact query answers. This is a hypothesis for Stage 0/Stage A, not a present result.

## Evidence route

- `PERFORMANCE`

## Software/algorithm performance admissibility

- Same-function contract: identical ordered/unordered SQL result multiset and values for each query; no false page pruning; native reader consumes emitted files.
- Algorithmic delta: finite candidate-cut dynamic program/Pareto pruning jointly constructs pages, encodings and metadata.
- Full-cost ledger scope: input scan/sort assumptions, writer CPU/wall time, compression, output and index bytes, query planning, object-range I/O, decompression/decode CPU, cache state, and result verification.
- Generality hypothesis: gains require clustered predicate columns with selective but non-page-aligned predicates; uniform scans and random/unclustered predicates are expected no-gain regions.
- Why this is not routine tuning: a scalar grid cannot express nonuniform cuts coupled to measured per-segment codec/synopsis cost under the same global budget.
- Expected no-gain region: full scans, already predicate-aligned pages, and workloads dominated by compute after decoding.

## Nearest-prior facet matrix

| Facet | Candidate | Closest prior | Residual |
|---|---|---|---|
| Research problem | Full write-plus-selective-query Parquet cost | Arrow/Oasis reduce read/decode of existing files | Page construction remains a separate decision layer |
| Exact object | Standard Parquet file and native reader result | Same Parquet query object | Same object retained |
| Decision variables | Nonuniform cuts + codec/encoding + synopsis | Reader selection/cache; hardware decoder; scalar writer settings | Joint writer-side action |
| Constraints / information | Declared workload, Parquet legality, byte/cost budget | Existing metadata/pages and runtime selection | New information used at construction time |
| Core algorithm or mechanism | DP/Pareto co-segmentation | Page pruning, late materialization, decode overlap | Neither constructs workload-conditioned pages |
| Guarantee | Exact answers and no false pruning | Exact reader semantics | Same guarantee |
| Evidence object | Public natural Parquet + native readers | Parquet query workloads | Same object, full cost |

## Current collision classification

- DIRECT_FATAL: none identified; Stage 0 must specifically search same-format workload-aware page segmentation plus encoding/synopsis algorithms.
- DIRECT_SUBTRACT: Arrow PageIndex/late materialization; Oasis datapath decoding; fixed Parquet writer configuration; compression-aware physical design.
- METHODOLOGICAL_ADJACENT: external indexes, row/file repartitioning, generic learned index design.
- DEPLOYMENT_BASELINE: Oasis hardware decoder, if hardware is available; it does not remove writer-side construction cost.
- SEARCH_BOUNDED_OPEN: not used as a novelty conclusion.

## Decisive falsifier

On a predeclared 20-file natural corpus and held-out query months, if the exact DP frontier has **no** candidate that is result-equivalent and has both (i) total stored bytes plus metadata within +5% of the best fixed writer configuration and (ii) cold-cache end-to-end query p50 at least 10% lower on at least 12/20 files, the structural mechanism is not supported for this object and should STOP. A direct same-object paper/source that already constructs workload-conditioned Parquet pages jointly with representation and synopsis under the same ledger is a Stage 0 `DIRECT_FATAL`.

## Executable evidence path

### Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`
- Complete atomic action and action interface: input is a typed column chunk, legal candidate cut offsets, allowed standard codec/encoding choices, page-synopsis construction, and a frozen predicate workload; output is only standard Parquet pages plus standard `ColumnIndex`/offset-index/Bloom metadata.
- Real comparator and native codec/solver/checker/reader/format semantics: Parquet 1.17.0 writer/format; native Arrow/DataFusion reader path; Zstd/Snappy as selected through native Parquet codec plumbing; exact result comparison against DuckDB or DataFusion over original and rewritten files.
- Same-object/same-function/guarantee boundary: no external index, no changed query semantics, no approximate filtering, and no reader patch needed to recognize a new format.
- Common denominator and full-cost dimensions: bytes, write CPU/wall time, index bytes, query planning, range-read bytes/count, decompress/decode CPU, query latency/throughput, and correctness-check time.
- Small pre-corpus legality/equivalence witness: one NYC TLC monthly file slice, two predicates (range and equality), native `parquet-tools`/Arrow metadata validation, and result hashes/counts equal across original and rewritten files.
- Finite closure steps and required resources: (1) extract page/codec costs on bounded cut candidates; (2) implement DP planner and writer adapter; (3) verify emitted metadata with official Parquet reader; (4) run one witness; (5) run the finite 20-file killer. Requires only public CPU tools/data.
- Structural failure condition: any necessary gain requires a nonstandard reader, external index, changed result semantics, or fails the declared killer.
- Reminder: this is a Stage A preflight plan, not evidence that the main claim already holds.

### 72-hour first evidence

Use 20 pre-listed NYC TLC Parquet monthly files; hold out one month/query trace for selection. Compare original, fixed-size/codec grid, and a bounded-cut DP on two numeric predicate columns. First gate: all outputs are valid Parquet and result-equivalent. Second gate: whether any DP point clears the decisive-falsifier threshold on the frozen subset.

### AI core fraction and critical path

`AI_CORE_EXECUTABLE`: the planner, writer adapter, metadata/result checks, and CPU measurements are automatable; semantic review of the cost ledger and Stage 0 novelty attack remain human/judgment work.

### Semantics-preserving open alternatives

Apache Parquet Java 1.17.0, Apache Arrow/DataFusion, DuckDB, official NYC TLC Parquet files, and standard compression libraries.

## Q1/Q2 sufficiency hypothesis

- Why this supports at least a complete Q2 paper: it has an N2 algorithm, an exact standard-format contract, same-object current baselines, a concrete full-cost ledger, and a bounded natural corpus falsifier.
- Why it may reach Q1, or why it remains Tier B: it becomes Q1-shaped only if an analytically justified frontier and robust cross-workload Pareto gains remain after Arrow/Oasis/current-configuration baselines; current evidence is insufficient, so admitted at Tier B.
- What would still be required: independent current-collision review, implementation, full fidelity preflight, natural workload scale, ablations, negative regions, and reproducible scripts.

## v8.7 CURRENT_UPSTREAM_REALITY_CHECK

| Target | Frozen upstream reference | Official current evidence checked | Source symbols/defaults/configs | Result / counter-evidence |
|---|---|---|---|---|
| Parquet writer | release tag `apache-parquet-1.17.0`; `master` source snapshot fetched 2026-08-06 (three days before cut-off) | Official Parquet Java README identifies 1.17.0 as current release; current raw `ParquetWriter.java` inspected | `withPageSize`, `withPageRowCountLimit`, `withDictionaryPageSize`, `withBloomFilter*`, `withMin/MaxRowCountForPageSizeCheck`; legacy constructor defaults 128MB block, 1MB page, uncompressed, dictionary disabled | Establishes existing scalar/configurable actions. It does **not** prove global absence of any workload-aware writer; the action gap remains a Stage 0-attackable hypothesis. |
| Parquet format | official format repo `master`, docs revision `90ea0a7` (2026-02-24) | Page Index, compression and checksum specifications inspected | pages are legal compression units; optional ColumnIndex; per-page CRC; spec states page-size tradeoff | Confirms legal target and that boundaries affect access granularity/metadata cost. |
| Arrow reader | official Arrow blog/source linked from current project, published 2025-12-11 | `ReadPlanBuilder`, `RowSelection`, `ArrayReader`, PageIndex behavior inspected | auto selection threshold 32; PageIndex forces selector/RLE safety fallback; pages with any selected row are fully decompressed | Strong counter-evidence to claims of reader absence and quantitative reason for the proposed boundary objective. |
| Lakehouse defaults | Apache Iceberg `main` source snapshot inspected 2026-08-09 | `TableProperties.java` current source | Parquet page size default 1MiB; page-row limit 20,000; adaptive Bloom default false; vectorization default true | Fixed/default configuration must be included in baseline union, not treated as unavailable. |

The `git ls-remote` attempt to independently resolve moving-branch commits failed with local Schannel `SEC_E_NO_CREDENTIALS`; this does not support any scientific inference. Immutable release tag and documentation/source snapshots above are the frozen reproducibility anchors. Stage 0 must re-resolve the moving branches before any novelty conclusion.

## Discovery conclusion

Recommend `PROPOSE_STAGE0` with `FINITE_FIDELITY_GAP`. The action gap is a sourced structural hypothesis, not proof of novelty or performance. It is admissible because the remaining gap is a finite writer/preflight closure, not a change of object or guarantee.
