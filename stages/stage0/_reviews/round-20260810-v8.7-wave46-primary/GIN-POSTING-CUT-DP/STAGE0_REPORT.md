# GIN-POSTING-CUT-DP Stage 0 Report

- Lane id: `STAGE0-BATCH-GATE / PRIMARY`
- Assignment id: `STAGE0-P1-20260810-GIN-POSTING-CUT-DP-PRIMARY-V8.7`
- Input freeze SHA-256: brief `9715270E28906B28E976A74C990D127A10AA787133697960E9C5BFD94C2D83E6`; handoff `A1BBFE63F661DA9ED45F468B05EC853AE1F5E8CC55DDD2395A7EAE95EE726B33`; source manifest `7CF1DF10736DCF06D63E6CD0FDEE37666452ADC56969F3E77CC01EED1A9FA698` (`4/4 PASS`)
- Cross-assignment contamination declaration: prior assignments were cleared; no scientific claim or score was inherited.
- Decision: `REVISE_ONCE`
- Quality tier: `TIER_B_Q2_VIABLE` **if the single atomic algorithm-contract gate closes**
- Confidence: `0.88`
- Evidence ceiling: `CURRENT_SOURCE_AND_STATIC_ALGORITHM_AUDIT_ONLY__NO_IMPLEMENTATION_NATIVE_OUTPUT_OR_NATURAL_GAIN`
- Novelty route: `N2`
- Candidate venue family: `PVLDB / SIGMOD / ICDE / EDBT`; current shape is Q2-viable, not Q1-ready.
- Stage semantics: conditional paper-potential screen; this report does not establish the main claim.

## Structural paper potential vs current readiness

- Structural paper potential if successful: `TIER_B_Q2_VIABLE`. A native-format, exact-semantics constructor that converts a frozen GIN query trace into an optimal or bounded legal posting-tree hierarchy is a recognizable systems/algorithm contribution. It is narrower than a new index structure but more substantial than selecting `fastupdate`, memory, worker count, or a fill threshold.
- Current evidence-acquisition readiness/risk: `FINITE_STATIC_ALGORITHM_CONTRACT_GAP`. PostgreSQL source, legal format and CPU-only execution route are public; however the proposed recurrence does not yet represent the actual reader trace and all internal-page grouping decisions.
- Why missing implementation/results/proof/hardware is not structurally fatal: Stage 0 does not require them. The revision is required because the proposition and recurrence are not yet complete enough to tell whether success would be a new algorithm or only native full-packing plus a weighted wrapper.

## Discovery provenance

- Opportunity origin: natural skew in query-key combinations and `advancePast` skip positions may make two legal page-boundary hierarchies have different read/decode costs.
- Domain tags: database systems; inverted indexes; physical index construction; dynamic programming.
- Paper genealogy: native PostgreSQL GIN representation and scan algorithm; workload-aware physical design; sorted-integer/posting-list partitioning; workload-robust index tuning.
- Discovery method revision: accepted v2/v8.1 plus v8.6 fidelity plan and v8.7 current-upstream reality check.
- Backtest reference and status: method backtest is calibration only and is not candidate evidence.

## Frozen object and claim

The immutable object is one PostgreSQL 18 GIN index over a fixed table, operator class/key extraction and mapping from each GIN key to its sorted heap TID sequence. The output remains one standard on-disk GIN entry tree plus native posting lists/trees; SQL answers, lossy/recheck behavior, TID order, WAL/crash semantics, locks, vacuum behavior and the native reader are unchanged.

The allowed input is a frozen training trace containing complete query-key combinations and their logical scan progression, not merely a scalar frequency per key. The comparator receives the same trace for parameter selection. No future trace, result cardinality oracle unavailable to PostgreSQL, changed operator class, reordered heap TIDs, approximate `gin_fuzzy_search_limit`, external side index or query controller is allowed.

The candidate claim is deliberately conditional: a bounded hierarchical dynamic program chooses native-legal compressed-segment/page boundaries and internal posting-page groupings, with a declared objective covering trace-replayed page descent/right-link reads, decoded bytes, index bytes, construction/WAL and a fixed maintenance term. It must provide feasibility plus exact optimality for that finite model, or a stated approximation bound after pruning.

## Positive opportunity map

- Current source uses fixed compressed-segment targets (`128/256/384` bytes) and heuristic page splitting. During build, it fills the left page as tightly as possible; non-build splits balance pages, with an append heuristic around 75%.
- The reader is not a pure full sequential scan in every query. `entryLoadMoreItems` can descend using `advancePast`, follow right links, skip pages whose right bound is not beyond the requested TID, and decode the relevant segment. Therefore a full query-key-combination trace can, in principle, assign different costs to legal boundaries.
- The opportunity disappears for a workload consisting only of single-key complete scans: multiplying every page of one key by the same key frequency cannot change the within-key optimum. This is a preregistered no-gain stratum, not an exception to hide.
- Natural carriers are public document/tag/array relations with auditable query logs or replayable extracted query-key combinations. Synthetic TIDs are legality-only.

## Facet matrix

| Facet | Frozen candidate | Current status |
|---|---|---|
| Problem | Construct a legal GIN posting hierarchy for a fixed logical relation and trace | defined |
| Decision variables | leaf segment/page cuts plus internal posting-page grouping/height | intended, but current state omits part of hierarchy |
| Information | sorted TIDs, native constants, frozen complete query-key trace | fair if trace is exposed equally; key-frequency-only is insufficient |
| Constraints | native page format, right bounds, fanout, depth, WAL/reader/maintenance semantics | finite and auditable |
| Objective | trace page/decode cost plus bytes/build/WAL/maintenance | must be written as one exact additive or bounded model |
| Algorithm | hierarchical interval/frontier DP | not yet complete; `D[i,h]` alone is inadequate |
| Guarantee | optimum or bounded approximation for the frozen model | credible target, not yet mechanically stated |
| Evidence | static source audit and finite Stage A route | no result claimed |

## Named baselines and fairness contract

1. `PG18-BULK`: pinned PostgreSQL 18 `CREATE INDEX`/`REINDEX`, serial and legal parallel builds, a finite `maintenance_work_mem` and worker grid. It retains the native build-full page policy.
2. `PG18-DYNAMIC`: native incremental insertion with `fastupdate={on,off}`, finite `gin_pending_list_limit`, explicit pending cleanup, VACUUM and the same update/query trace. This covers the deployed maintenance alternative.
3. `PG18-TRACE-TUNED-UNION`: select among B1/B2 with the same training trace and full-cost objective; this prevents an information advantage.
4. `FIXED-FORMAT-PARTITION-DP`: a shortest-path/partition baseline that optimizes legal GIN leaf intervals for bytes or the declared local page cost while leaving the native internal builder unchanged. This subtracts generic sorted-posting partition DP; only coupled native hierarchy/scan behavior can remain.

A small exact MILP/exhaustive solver is an oracle/ceiling, not a deployable fifth baseline. `gin_fuzzy_search_limit > 0` is excluded from equal-quality baselines because official PostgreSQL semantics return a random subset rather than identical answers.

Full cost includes trace extraction, cost-table generation, optimizer/DP time and memory, index build CPU/wall time, WAL bytes, index bytes, cold/warm buffer reads, decode CPU, updates, pending cleanup, VACUUM/REINDEX, failure fallback and retained index size.

## Collision analysis

### Current-source classification

- PostgreSQL 18 GIN documentation and source are `DEPLOYMENT_BASELINE` plus strong `DIRECT_SUBTRACT`: posting list/tree, native compressed segments, page splits, bulk/parallel build, pending list and maintenance are already implemented.
- Current configuration is finite: `fastupdate` and per-index `gin_pending_list_limit`; build resources include `maintenance_work_mem` and parallel workers. None is a trace-aware page-boundary/hierarchy constructor.
- Native compressed segments explicitly target random-access efficiency, so “introducing searchable sublists” is already absorbed. The residual must be global legal page/hierarchy construction, not segment creation.
- Sorted-integer partitioning, workload-aware physical design and robust index tuning are `METHODOLOGICAL_ADJACENT`/`DIRECT_SUBTRACT`. A generic partition shortest path cannot be claimed as new.
- Bounded search found no current primary source that covers the exact PostgreSQL GIN object, trace-driven `advancePast` cost, complete legal hierarchy, same reader and the proposed guarantee. Status is `SEARCH_BOUNDED_OPEN`, not proof of absence.

### Nearest-prior facet matrix

| Source/mechanism | Same object | Same action | Same objective/info | Same guarantee | Disposition |
|---|---:|---:|---:|---:|---|
| PostgreSQL 18 native GIN | yes | page/segment build, but heuristic | no trace objective | native legality, no candidate optimum | strongest deployment baseline |
| Native compressed posting segments | yes | local segment partition | random access/update locality, fixed thresholds | no complete hierarchy optimum | direct subtract; removes local segmentation claim |
| Generic posting-list partition DP / Partitioned Elias–Fano lineage | no fixed GIN format/reader | interval partition | compression/access model | partition optimum/approximation | methodological subtractor |
| Workload-aware physical design / Endure | different index family | configuration/layout tuning | workload/full-cost | robust or model-based tuning | paper-shape and objective subtractor |
| Candidate residual | yes | complete leaf+internal legal constructor | real GIN scan trace | exact/bounded frozen model | open only after revision |

### Seed-distance and method-name deletion test

Deleting “GIN” and “trace-aware” leaves “optimal partition of a sorted integer sequence,” which is known. The proposal survives only if its state explicitly captures the native posting-tree hierarchy and real `advancePast` reader events while preserving PostgreSQL concurrency/WAL/maintenance semantics. Thus the name is not the novelty; the residual must be the native hierarchical state/guarantee.

## Competing mechanism decision

- Selected mechanism: complete hierarchical trace-replay DP over legal GIN posting pages.
- Registered backup: robust/minimax objective over a frozen uncertainty set, but only after the nominal exact state is valid. It is not authorized as a current pivot.
- Pivot boundary: changing to another inverted-index format, heap/TID reordering, query controller, cache policy, approximate answers or generic segment compression requires a new ID.

## Residual paper kernel

One paper kernel remains: a PostgreSQL-GIN-specific hierarchical interval DP whose input trace is reduced to physical-layout-independent logical scan events, whose state represents both leaf cuts and internal page frontiers, and whose output is a native-decodable posting tree with an exact or bounded model guarantee. The kernel is not “choose a better fill factor.”

## Why the current recurrence is not yet sufficient

The Discovery state `D[i,h]` prices a suffix and a remaining height, but it does not say how child pages are grouped into internal pages, how right bounds and open-page slack enter the state, or how a query's `advancePast` sequence is derived independently of the candidate layout. An outer enumeration of root fanout/height does not by itself close those dependencies. Conversely, if internal grouping is fixed by the native builder once leaves are chosen, “height optimization” is not an independent candidate action and must be removed from the claim.

A scalar query frequency per key is also insufficient: for a single-key full scan it scales every legal layout uniformly. The revision must use complete query-key combinations (or an equivalent logical event trace) and prove the cost reduction preserves the native scan semantics.

## Atomic revision gate

- Gate id: `NATIVE_GIN_ADVANCEPAST_TRACE__HIERARCHICAL_PAGECUT_DP_CERTIFICATE`
- Single proposition: under one pinned PostgreSQL 18 GIN reader contract, a frozen logical query trace can be deterministically reduced to layout-independent per-key scan events, and one finite DP state/transition system can construct all and only a declared class of native-legal leaf/internal posting trees while optimizing a predeclared full-cost proxy with a stated exactness or approximation guarantee.
- Required static closure package: (a) formal trace event schema and information timing; (b) complete state, transitions, base cases and legality predicates; (c) complexity bound; (d) guarantee statement; (e) one small native-legal action-divergence witness with two trees and hand-computable objective; (f) comparator mapping showing why PG18 and fixed-format leaf partition DP cannot replay the complete action.
- Falsifier: `BELOW_Q2_STOP` if trace reduction depends on the candidate physical layout, only key frequencies remain, internal grouping is omitted, the action requires a changed reader/format/semantics, or the complete model collapses to local byte-minimizing partition/full packing already covered by B1/B4.
- Scope: one atomic algorithm-contract certificate. It does not require implementation, native output, natural positive results or a finished theorem proof.

## Performance-optimization admissibility

- Same-function contract: exact SQL/index results and native scan/recheck/WAL/concurrency/maintenance semantics.
- Algorithmic delta: hierarchical legal construction with a formal model guarantee; not a flag grid.
- Strong-implementation fairness: current PostgreSQL 18 source, all compatible GIN paths and same-information trace tuning.
- Generality and failure boundary: frequent posting trees with multi-key scans that produce skip opportunities; single-key full scans and short inline posting lists are declared no-gain strata.
- Why not routine tuning: no current flag selects per-key page boundaries or solves the hierarchy. The revision must prevent the proposal from degenerating into a generic local partition heuristic.

## Q1/Q2 paper shape

- Problem: physical GIN layout ignores stable natural scan structure even though the native reader can skip by TID bounds.
- Contribution: formal same-format construction problem, exact/bounded hierarchical algorithm, PostgreSQL integration and honest no-gain map.
- Evidence plan: static proof/oracle checks, native legality/equivalence, 20–50 natural slices across at least two corpus families, PG18 union, cold/warm and update/maintenance full-cost.
- Expected narrative: current heuristic boundary → native scan-event model → hierarchical constructor → full-cost systems validation and failure strata.

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Reference set: Endure (PVLDB 2022); Compression Aware Physical Database Design (PVLDB 2011); Workload-Aware Indexing of Continuously Moving Objects (PVLDB 2009); Partitioned Elias–Fano (SIGIR 2014) as a method boundary rather than a venue-shape anchor.
- Status: `PARITY_CONDITIONAL`
- Contribution-shape gap: recurrence and guarantee are not yet complete; current novelty is narrower than the Q1 anchors.
- Evidence-shape gap: no native artifact, natural trace result, robustness, or multi-corpus ledger yet; these belong to Stage A/B, not the current stop decision.
- Stage A closure plan: close fidelity first, then execute a small witness and 72-hour natural killer before scaling.

## Non-relaxable quality audit

- Same-object: `PASS_CONDITIONAL`; exact object is coherent, but revision must make the trace/read-cost interface exact.
- Latest collision: `SEARCH_BOUNDED_OPEN`; current upstream independently checked, no direct fatal found.
- Strong fair baselines: `PASS_DESIGN`; finite four-member union is implementable and same-information.
- Natural input/evidence: `FINITE_ROUTE`; public relations and auditable traces are required; no result claimed.
- Full-cost: `PASS_DESIGN`; ledger defined above.
- Reproducibility: `FINITE_ROUTE`; pinned source, trace hashes, deterministic event extractor, legality checker and command ledger are feasible.
- Evidence/claim honesty: `PASS`; report claims structural potential only.

## Evidence path and AI completion

- AI executability class: `AI_CORE_CONDITIONAL`
- Estimated ai_core_fraction: `0.68`
- 72-hour first evidence after a closing PASS: pin source; implement only the logical trace-event extractor and tiny exact enumerator; verify one legal two-tree witness against native scan semantics; then compare the PG18 union on 3–5 slices. This is preliminary support only.
- Human-only items: final systems judgment about maintainability and paper framing; neither is required for the scientific kernel.

## Fidelity closure plan audit

- Discovery status: `FINITE_FIDELITY_GAP`
- Complete action and native semantics are finite and same-object: yes, if the revision formalizes hierarchy and trace events.
- Comparator, denominator, full-cost and small-witness plan: finite and listed.
- Why an unimplemented interface is not structurally fatal: source-level builder instrumentation and reader-preserving pages are public and bounded. The current issue is specification completeness, not absent code.

## Independent current upstream reality check

- Frozen upstream: PostgreSQL `REL_18_STABLE` head observed at commit `545e2a9d74c3ccca3189e56a515a5793b782eb9b` (2026-07-20); check date `2026-08-10`. Raw source behavior was cross-checked against current master where the branch raw cache was unavailable.
- Official docs: PostgreSQL 18 current GIN internals and `CREATE INDEX` storage parameters.
- Source paths/symbols: `src/backend/access/gin/README`; `gindatapage.c` (`GinPostingListSegment*Size`, `leafRepackItems`, build/non-build split policy, right bounds); `ginget.c` (`entryLoadMoreItems`, `advancePast`, right-link skip); `gininsert.c` (`GinBuffer*`, `ginEntryInsert`, parallel merge); `ginfast.c`; `ginvacuum.c`; `ginpostinglist.c`; `src/include/access/gin_private.h`.
- Default/non-default controls: `fastupdate` default on; per-index `gin_pending_list_limit`; global `gin_fuzzy_search_limit` default zero but nonzero changes result semantics; `maintenance_work_mem`; `max_parallel_maintenance_workers`/table `parallel_workers`; standard vs concurrent build and VACUUM/pending cleanup.
- Discovery absence claim: narrowed, not contradicted. Native source already owns local segmenting and all page paths, but no checked flag/source path expresses trace-aware complete hierarchical construction.
- Non-tuning residual: the atomic gate above.

## Stage A highest-risk probe plan

- Risk-bearing premise: logical query traces yield layout-independent `advancePast` events for which two legal GIN hierarchies have different full-cost proxy values.
- Cheap discriminating probe: one heavy key plus at least two intersecting keys, two legal leaf cut sets and one internal grouping; replay the logical scan and compare a hand ledger with a tiny exact enumerator and native reader instrumentation.
- Negative result that kills the direction: no differing legal action; event sequence depends circularly on layout; native union reproduces the optimum; or the only delta is compressed bytes already found by B4.
- Positive-result ceiling: preliminary non-falsification only.

## Stop conditions

- Any query/result/WAL/concurrency/maintenance semantic change.
- Need for non-native page format, external query controller, TID reordering, future oracle or approximate result set.
- Atomic revision certificate cannot define the complete hierarchy or guarantee.
- Current/nearest work covers the same exact object/action/guarantee/full-cost claim.
- Stage A later finds zero legal action divergence or no full-cost residual on every preregistered natural stratum.

## Dual-axis score

- Academic value: `45/70` (problem 10/15; N2 12/20; nearest-work delta 9/15; baseline/venue 7/10; falsifiability 7/10)
- AI executability bonus: `24/30` (artifact/baseline 9/10; core execution 7/10; first-risk probe 8/10)
- Total: `69/100`

## Decision rationale

`REVISE_ONCE` is warranted because the structural opportunity survives current-source and strong-baseline subtraction, but the present `D[i,h]` is not yet a complete algorithm for the promised native hierarchy. The one revision closes a static proposition, not Stage A evidence. PASS is recommended only if the certificate closes without changing the object or reducing the contribution to local partition tuning.

Stage A and Stage B remain unauthorized. Any PASS is only `PENDING_CONFIRMATION` for the long-lived D-root confirmation sentry.
