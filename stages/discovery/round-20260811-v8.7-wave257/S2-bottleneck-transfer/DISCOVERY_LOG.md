# Discovery log — S2 ORC stripe/row-index/Bloom workload joint-N2 closure

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE257-ORC-STRIPE-ROWINDEX-BLOOM-WORKLOAD-JOINT-N2-CLOSURE`  
**Cutoff:** 2026-08-11  
**Result:** `COMPLETE_ZERO_PROPOSALS`

Frozen method: `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`; `DISCOVERY_QUALITY_MODE=OFF`. Dispatch hashes: registry `AACC97E49B06E3AEDD530502CCDA1806765E9F0E2BCDD04F7506F519706B6DDA`, plan `D2ABA3693567443065EB0522FB71F01F1A3742B358F406D7C6FBEEF7D70095A3`, ROLE `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.

## Frozen contract and current native union

**Exact object:** fixed ORC schema and rows in the same order, with stock ORC reader results for a declared query workload. File format/read semantics, projection/predicate result, null behavior and reader compatibility are fixed. Row reordering, a new reader/format, external index/wrapper, dictionary-constructor work, and a compression-only change are excluded.

**Source pin:** Apache ORC `main` = `af4cbf36b051c176f0d13ae5a7ac436ada8aeccf`, queried 2026-08-11. Official [Java configuration](https://orc.apache.org/docs/core-java-config.html) exposes `orc.stripe.size`, stripe row cap, index creation, row-index stride, compression codec/buffer/strategy, encoding strategy, Bloom columns and Bloom versions. [Spark configuration](https://orc.apache.org/docs/spark-config.html) records defaults including 64 MiB stripe, 10,000 row index stride, ZSTD, and Bloom FPP `0.01`. [ORC v2 specification](https://orc.apache.org/specification/ORCv2/) fixes row-index and Bloom streams per row group, their placement, seek positions and bloom representation; [Indexes](https://orc.apache.org/docs/indexes.html) fixes their predicate-pushdown role. The current core API also exposes row-group selection and stream placement ([API index](https://orc.apache.org/api/orc-core/index-all.html)).

The fair union is therefore complete configuration/composition: stripe size and row cap/cuts chosen by stock writer behavior, create-index flag, a global row-index stride, Bloom column/FPP/version options, compression codec/chunk/strategy/levels, legal encoding strategy and physical stream placement. A candidate cannot compare against a single default parameter setting.

## Attempted whole N2 and static witness

The admissible proposition would be `ORCJointSegIndex(W)`: for fixed ordered rows and query trace `W`, choose a sequence of **legal contiguous stripe cuts**, one allowed global stride, and a byte-budgeted set of native Bloom/index decisions, with an exact/FPT/Pareto guarantee against the best legal composition. The state would be `(row boundary, selected global stride, remaining metadata budget, workload summary)` and dynamic programming would add a contiguous stripe's data/index/Bloom cost plus expected stock-reader scan cost. It is not a generic ILP or a runtime controller.

The required action-divergence certificate is two stock-readable files with identical rows/order/schema. F0 is the strongest fixed global stock configuration; F1 is constructed using a workload-conditioned sequence of different legal stripe boundaries, while retaining the same global stride/reader options. F1 must demonstrate that the writer can realize these planned cuts without injecting a custom writer/format or using an external index; both must have equal row results for every declared query. Full cost includes planning, write CPU/RSS/temp/bytes and reader metadata/open/index/Bloom/decompress/scan latency.

This certificate does not close. The published configuration and format sources establish the action atoms but not a source-pinned native interface/semantics by which a planner fixes an arbitrary sequence of stripe boundaries independent of stock memory/size triggers, nor the exact permissible per-stripe variation under the same writer configuration. A candidate that only chooses the documented global settings is a forbidden selector; one that injects per-stripe metadata behavior without current writer support is a custom writer/format change. Thus no legal whole action can yet be frozen.

## Literature, natural route and finite falsifier

The original ORC specification and [recent empirical evaluation of columnar formats](https://arxiv.org/abs/2304.05028) are closest same-format context. Bloom-filter-aware query optimization work concerns query plans, not a same-file ORC constructor. No direct same-object workload-conditioned stripe/index/Bloom construction algorithm was identified through official/primary searching, but this is `SEARCH_BOUNDED_OPEN`, not a novelty result.

A finite Stage A route exists only conditionally: pin a public versioned ORC corpus and its declared query trace, current writer/reader commits and all configs; construct F0/F1 through the native writer; require reader equality; account planner/write/open/index/Bloom/decompress/full scan CPU/RSS/bytes/temp/latency. The ≤72-hour killer fails on no legal planned-cut interface, custom writer/format need, changed rows/order/reader result, global-config equivalence, missing natural corpus/trace or no full-cost residual. No corpus was downloaded or run here.

## Outcome

`NOT_ADMITTED_UNFROZEN`; `PROPOSE_STAGE0: []`. The limitation is an unclosed whole-action certificate, not missing implementation, result, resource or AI readiness. No experiment, benchmark, download, Stage0/A/B, automation or shared-control modification occurred. State: `IDLE_REUSABLE_AWAITING_MAINLINE`.
