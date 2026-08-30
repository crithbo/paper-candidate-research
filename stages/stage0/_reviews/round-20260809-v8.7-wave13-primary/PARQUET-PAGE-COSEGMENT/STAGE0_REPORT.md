# Stage 0 PRIMARY report — PARQUET-PAGE-COSEGMENT

## Administrative record

- Assignment: `STAGE0-P1-20260809-PARQUET-PAGE-COSEGMENT-PRIMARY-V8.7`
- Role: `PRIMARY`
- Review cutoff: `2026-08-09`
- Decision: `PASS_RECOMMENDED / PENDING_LONG_LIVED_CONFIRMATION_SENTRY`
- Quality tier: `TIER_B_Q2_VIABLE`
- Structural paper potential: `CONDITIONAL_TIER_B_Q2_VIABLE`
- Current evidence readiness: `FINITE_FIDELITY_GAP__LEGAL_ACTION_AND_CURRENT_CDC_PARITY_REQUIRED`
- Stage A / Stage B authorized: `false / false`
- Confidence: `0.81`

The Discovery recommendation and score were not inherited. No experiment was run. Missing implementation and natural results are readiness risks, not negative scientific evidence.

## Outcome first

The candidate retains a credible Tier-B N2 paper shape, but only under a legality-corrected action space and a materially stronger current baseline than the Discovery package stated.

Current Parquet and Arrow facts remove two overclaims. A compression codec is recorded once in `ColumnMetaData` for a column chunk, so arbitrary per-page codec switching is not a legal standard-Parquet action. Bloom filters are likewise column-chunk metadata, not an independently chosen page synopsis. Conversely, a data page carries its encoding, Data Page V2 can mark an individual page compressed or uncompressed under the fixed column-chunk codec, and ColumnIndex/OffsetIndex provide page-level pruning metadata. The candidate must use only these standard actions.

Current Arrow/Parquet also already provides content-defined chunking (CDC): a rolling hash produces nonuniform page boundaries, with exposed minimum, maximum and normalization parameters. This decisively subtracts the generic claim “nonuniform pages are new.” It does not, on the inspected current source, express arbitrary page cuts chosen from a declared predicate/projection workload. That workload-conditioned legal-cut residual is the candidate’s surviving action.

The viable paper core is therefore:

> Given fixed row order, schema, row groups, native reader semantics and a declared training workload, jointly construct legal page row-boundary cuts and standard per-page representations under file-size, metadata and write-cost budgets, so that the result is not expressible by any preregistered fixed-writer or current CDC configuration and improves a full write-plus-query Pareto frontier.

If this mechanism succeeds on natural files, it is more than a controller choosing among existing writer configurations: it constructs a layout inside the standard file. It can support a credible systems/algorithms paper. If all chosen files are reproducible by the current fixed/CDC grid, or if the method reduces to independent scalar tuning, the N2 collapses and the future scientific outcome is `BELOW_Q2_STOP`.

## Frozen exact object and information contract

The review accepts only this same-object contract:

- Input is one fixed, typed, ordered table plus a declared training workload `W_train` of SQL predicate/projection templates and weights.
- Output is one self-contained, standard Parquet file per input file. No sidecar index, external metadata service, custom page type, custom reader, file splitting/merging or nonstandard codec is allowed.
- Schema, typed values, null semantics, row sequence and row-group boundaries are invariant. Sorting, clustering, row reordering and row-group redesign are outside the object.
- The primary execution contract is a pinned unmodified Arrow/Parquet reader through pinned DataFusion. Each candidate and baseline must return the identical SQL value multiset; ordered queries must return identical order.
- The candidate may choose row-aligned data-page boundaries, legal page encodings, dictionary/fallback behavior exposed by the pinned writer, Data Page V2 compressed/uncompressed retention under one fixed column-chunk codec, and standard page-index/statistics settings.
- Compression codec is fixed per column chunk. Bloom-filter construction is column-chunk-level. ColumnIndex/OffsetIndex content is derived from legal pages and is not an independent novel synopsis language.
- `W_train`, data and all static column summaries available to the candidate are available to baseline model selection. Literal held-out query endpoints and `W_test` outcomes are unavailable to both.

This object is definable and reproducible. The legality correction does not change the research problem; it removes unsupported actions from it.

## Structural headroom

Parquet pages are indivisible decode/pruning units. For a range predicate over naturally clustered rows, a fixed page capacity `k` can force up to `2(k-1)` boundary rows into pages that intersect the selected interval. Legal cuts aligned to recurring workload boundaries can eliminate that boundary over-read while preserving row order. The benefit is paid for through extra headers/index entries, possibly worse compression, writer work and more I/O requests.

This establishes finite structural headroom, not a natural positive result. NYC TLC files may be weakly clustered, queries may be full scans, or current CDC/fixed pages may already align well. Those are honest killer outcomes. With no public production query log frozen, the claim ceiling is a workload-conditioned benchmark result rather than a production-workload generalization.

## Current strongest baseline family

The fair comparator set is finite and action-relevant, not a universal best-of union:

1. **B0 — pinned current DataFusion/Arrow default:** unmodified standard writer and the same fixed reader configuration.
2. **B1 — same-information fixed-writer grid:** a preregistered finite grid over legal page bytes/row caps, Data Page V1/V2, per-column fixed encoding, column-chunk codec/level, dictionary options, statistics/index truncation, Bloom settings and Data Page V2 compression-retention threshold. `W_train` may select the best configuration, just as it guides the candidate.
3. **B2 — current Arrow CDC grid:** pinned current CDC with finite min/max/norm settings, crossed only with a preregistered bounded representation grid. It receives identical data and `W_train` selection.
4. **B3 — candidate ablations and bounded ceiling:** boundary-only and representation-only ablations; an exact bounded DP/MILP is an oracle for small instances, never a deployable baseline.

Arrow PageIndex and late materialization are shared reader facilities held constant across all layouts. Oasis changes deployment hardware and reader execution, so it is a deployment subtractor/orthogonal reference rather than a same-hardware writer baseline. Compression-aware physical database design establishes the broader workload-plus-compression joint-optimization genealogy but changes the physical-design object.

The baseline grid must not be weakened to one scalar page-size sweep. Equally, it must not combine incompatible systems metric-by-metric. Each reported point must be one executable writer/reader configuration with its complete cost ledger.

## N1 / N2 / N3 assessment

- `N1`: not supported. Pages, encodings, page indexes, dictionary fallback, Data Page V2 compression choice and nonuniform CDC already exist.
- `N2`: conditionally supported. The residual is a workload-conditioned, globally budgeted constructor over legal page cuts and representations, preferably with a DP/Pareto, shortest-path, approximation or certificate result. Cross-column co-segmentation is meaningful because predicate-page selections determine projected-column page reads over common row spans.
- `N3`: not presently supported. A stable law connecting clustering, workload boundaries and page-level gains could become secondary evidence but has not been observed.

The paper fails structurally if the algorithm is only a meta-selector over `WriterProperties`, a CDC parameter search, or independent per-column scalar tuning without a nontrivial shared constraint/guarantee.

## Fairness and declared-workload audit

A declared workload is legitimate input to physical design only when the comparison is symmetric. Before any result, freeze query templates, parameter-generation rules, weights, train/test split and model-selection budget. Baselines may use exactly the same `W_train` and full data statistics. Neither side may inspect `W_test` outcomes when constructing files.

For NYC TLC, a defensible route is temporal: earlier frozen months or a preregistered subset supply `W_train`; distinct held-out months and query parameters supply `W_test`. If the workload is researcher-synthesized rather than a natural trace, label it as such and cap the claim. Report random/unclustered predicates and full scans as negative controls.

## Full-cost ledger

Every point must include:

- input scan and statistics collection;
- candidate planning/solver time and peak RSS;
- baseline grid/model-selection time under the same selection budget;
- end-to-end file write wall time, CPU and peak RSS;
- data, dictionary, page-header, ColumnIndex/OffsetIndex and Bloom bytes;
- final file plus index size;
- native reader planning, range-request count/bytes, decompression/decode CPU, and query p50/p90;
- cold and warm point/range workloads, full scans and failure/fallback rates;
- exact SQL result equivalence and native strict read validation.

Sorting cost is zero only because sorting is prohibited. Any hidden preprocessing, page-boundary materialization or replay cost is charged.

## Fidelity closure plan

The public CPU route is finite. Before the first claim-bearing Stage A observation, the owner must:

1. pin immutable Arrow/Parquet and DataFusion versions/commits, the Parquet format revision, build commands and reader/writer flags;
2. freeze 20 public NYC TLC monthly Parquet inputs with URL, license, schema, file hash and one-file-per-input conversion rule;
3. archive a machine-readable action table proving every emitted choice is standard: fixed column-chunk codec, legal page encoding, Data Page V2 `is_compressed`, row-aligned page cuts and native indexes;
4. implement a one-file witness and verify row order, typed value equality and all frozen SQL results through the unmodified reader;
5. register `W_train/W_test`, B0/B1/B2 grids, solver budget and the full-cost ledger before measuring the candidate.

No proprietary stack or GPU is required. Failure to obtain a public file/toolchain would be a resource blocker rather than scientific STOP.

## Finite Stage A killer

On the 20 frozen monthly files, first measure natural page/workload misalignment. Then compare B0, B1, B2, candidate and ablations under equal selection information and budget.

Stop the mechanism if any of the following occurs:

- any output is not standard-reader-valid or any frozen SQL result differs;
- a claimed action requires per-page codec switching, nonstandard metadata, row reorder, changed row groups, external indexes or reader changes;
- current fixed-writer or CDC configurations reproduce every candidate layout/action of interest;
- fewer than 20% of files expose natural workload/page-boundary choice after the current baselines;
- no candidate point has final size plus metadata within `+5%` of the strongest fixed/CDC point and at least `10%` lower cold-query p50 on at least `12/20` files;
- planning, model-selection and write costs erase the apparent p50/p90 Pareto advantage.

Passing this pilot would be preliminary support only. It would not establish a publishable end-to-end result or authorize Stage B.

## Q1/Q2 shape and claim ceiling

The conditional Tier-B shape is a standard-format physical-design algorithm with a legal same-object constructor, a current native baseline, natural files, symmetric workload information, ablations and full-cost evaluation. Tier A would require a reusable cost model or formal guarantee, robustness across multiple data/workload families and readers, and a stronger general law than one NYC workload.

Present claim ceiling:

> Current Arrow CDC already supplies content-defined nonuniform Parquet pages, while the Parquet format forbids arbitrary per-page codec selection. A bounded, workload-conditioned legal page-cut and representation constructor remains search-bounded open and has a finite CPU-only falsification route.

No novelty-firstness, performance, natural-frequency, optimality or production-workload claim is permitted.

## Fresh score

### Academic 70

- importance and natural carrier: `9/10`
- exact object and same-function guarantee: `9/10`
- novelty after current-source subtraction: `8/15`
- mechanism/theory depth: `10/15`
- fair evaluation/full-cost design: `9/10`
- reproducibility/falsifiability: `9/10`

Academic subtotal: `54/70`.

### AI 30

- public CPU artifact path: `9/10`
- AI core-work fraction: `9/10` (`~0.80`: writer integration, DP/solver, harness, correctness and cost ledgers)
- bounded validation/iteration route: `8/10`

AI subtotal: `26/30`. Combined: `80/100`. The score does not override the legality/current-baseline hard gates.

## Final decision

`PASS_RECOMMENDED / TIER_B_Q2_VIABLE / PENDING_LONG_LIVED_CONFIRMATION_SENTRY`

Reason: after correcting the legal Parquet action space and subtracting current Arrow CDC, a same-object workload-conditioned page-construction residual remains definable, nontrivial if jointly budgeted, and finitely falsifiable on public CPU artifacts. Current evidence readiness is limited, but no direct fatal collision, irreparable fairness defect or structural baseline absorption was found. Stage A and Stage B remain closed.
