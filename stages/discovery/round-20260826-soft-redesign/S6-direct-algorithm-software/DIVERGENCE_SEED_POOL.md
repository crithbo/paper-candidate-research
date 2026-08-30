# RocksDB multi-SST dictionary/trace redesign — non-evidence seed pool

## Pool metadata

- Assignment / lane: `DISCOVERY-S6-20260826-ROCKSDB-MULTISST-DICT-TRACE-REDESIGN / DISCOVERY_S6`
- Frozen profile: `NEW_ID_REDESIGN_ROUTE / S6_DIRECT_ALGORITHM_SOFTWARE`
- Seed ceiling: `6`
- Actual seeds: `6`
- RQ candidate ceiling: `1 primary + at most 1 same-object alternative`
- Network-security exclusion check: `PASS`
- Generation completed before new evidence lookup: `YES`
- Evidence status: all entries below are hypotheses, not locators, novelty claims, raw candidates, or scientific evidence.

## Seed records

### S6-RD-S01 — native multi-SST dictionary portfolio

- Engine: `PROBLEM_REFRAMING`
- Perspective role: `DATABASE_STORAGE_MAINTAINER`
- Starting anchor or hunch: replace the old one-manifest/one-SST estimand with the exact 20-manifest logical dataset encoded as one legal native multi-SST collection.
- Intended source roles: `ANCHOR / CURRENT / CONTRARY`
- Idea sketch: jointly train a bounded portfolio of dictionaries from fragments collected across native SST boundaries, then choose and embed one final dictionary per SST under unchanged BlockBasedTable reader semantics. The contribution would be the portfolio construction and assignment algorithm, not merely invoking Zstd or exposing counters.
- Conclusion-first test: if successful, a target-native cross-SST portfolio can outperform independent per-SST training under a full-cost budget without changing records, 4 KiB blocks, or reader semantics.
- Counterfactual consequence: RocksDB compaction/build policy would choose a collection-level portfolio instead of independently training every SST.
- Main collapse risk: generic clustering/facility-location or a current hidden multi-table dictionary path already expresses the action.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### S6-RD-S02 — cross-SST retained-fragment coreset

- Engine: `COMPOSE_DECOMPOSE_SIMPLIFY`
- Perspective role: `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor or hunch: the old retained-fragment selector was scoped inside a single SST.
- Intended source roles: `CURRENT / ESCAPE`
- Idea sketch: allocate one collection-wide retained-byte budget across SSTs, preserving fragment provenance and allowing more than one final dictionary. The nontrivial question is whether a streaming target-specific coreset can preserve rare SST-local structure while controlling portfolio size and dictionary duplication cost.
- Conclusion-first test: a collection-aware coreset is useful only if it beats equally budgeted independent, global-single-dictionary, and generic clustering baselines.
- Counterfactual consequence: sampling budget becomes a cross-SST optimization variable.
- Main collapse risk: ordinary weighted reservoir sampling or k-medoids with renamed inputs.
- Preliminary disposition: `KEEP_AS_MECHANISM_VARIANT_OF_S01`

### S6-RD-S03 — compaction-cohort dictionary lineage

- Engine: `ADJACENT_POSSIBLE_OR_BOUNDARY`
- Perspective role: `DATABASE_STORAGE_OPERATOR`
- Starting anchor or hunch: native compaction creates temporal cohorts and level transitions.
- Intended source roles: `CURRENT / ESCAPE`
- Idea sketch: maintain a dictionary lineage across a compaction cohort and reselect dictionaries when SST membership changes. This introduces temporal reuse and replacement costs that are absent from a static 20-manifest collection.
- Conclusion-first test: only a lifecycle-aware policy that changes compaction decisions and includes stale-dictionary cost would be publishable.
- Counterfactual consequence: dictionaries become compaction-lifecycle state.
- Main collapse risk: changes the frozen static object/RQ and exceeds the finite Stage A route.
- Preliminary disposition: `RQ_BACKLOG__OUTSIDE_PRIMARY_STATIC_OBJECT`

### S6-RD-S04 — denominator-preserving native shard construction

- Engine: `CONSTRAINT_MANIPULATION`
- Perspective role: `MEASUREMENT_REVIEWER`
- Starting anchor or hunch: the old one-SST construction failed a preregistered 16-block gate on one manifest/cell.
- Intended source roles: `ANCHOR / CURRENT / CONTRARY`
- Idea sketch: define shard and compaction boundaries before outcomes so every one of the 20 manifests contributes its unchanged records to a legal multi-SST collection, without copying, padding, synthesis, exclusion, or backfill. The construction is a validity prerequisite, not an independent performance claim.
- Conclusion-first test: the new object is admissible only if native source semantics can realize it deterministically and the full 20-manifest denominator remains auditable.
- Counterfactual consequence: the estimand moves from 20 independent one-SST objects to one collection whose membership is fixed before results.
- Main collapse risk: generic sharding or an outcome-aware workaround for the old failed denominator.
- Preliminary disposition: `KEEP_AS_NONNEGOTIABLE_CONSTRUCTION_COMPONENT`

### S6-RD-S05 — selector-to-dictionary-to-block causal trace

- Engine: `ABSTRACTION_LADDER`
- Perspective role: `MEASUREMENT_REVIEWER`
- Starting anchor or hunch: old aggregate selector counters could not establish which retained fragments affected the final dictionary or compressed blocks.
- Intended source roles: `CURRENT / CONTRARY`
- Idea sketch: preserve content-addressed provenance from selected fragments through the exact final dictionary bytes/tokens to matched compressed blocks. The trace is an observability contract for falsifying the mechanism, not a standalone dashboard or telemetry contribution.
- Conclusion-first test: a mechanism claim is admissible only when retained-set differences can be connected to final dictionary content and block-level matches.
- Counterfactual consequence: Stage A can distinguish genuine dictionary coverage from aggregate-counter correlation.
- Main collapse risk: generic instrumentation wrapper with no decision consequence.
- Preliminary disposition: `KEEP_AS_REQUIRED_MECHANISM_EVIDENCE_COMPONENT`

### S6-RD-S06 — full-cost budget inversion

- Engine: `NEGATION_OR_INVERSION`
- Perspective role: `SYSTEMS_REVIEWER`
- Starting anchor or hunch: more dictionaries can improve local compression while losing once repeated dictionary bytes, training, selection, compaction, and reader costs are counted.
- Intended source roles: `CONTRARY / ESCAPE`
- Idea sketch: optimize the portfolio only under a full-cost budget that includes dictionary duplication per SST, training/selection CPU and memory, temporary I/O, output bytes, and cold/warm reader overhead. The no-gain region is expected when SSTs are homogeneous or dictionaries are too small/expensive.
- Conclusion-first test: the portfolio matters only if it yields a Pareto residual after all costs and strong simple baselines are included.
- Counterfactual consequence: the optimal number of dictionaries may be one, per-SST, or an intermediate portfolio depending on collection heterogeneity.
- Main collapse risk: routine hyperparameter sweep over dictionary count.
- Preliminary disposition: `KEEP_AS_OBJECTIVE_AND_FULL_COST_CONTRACT_FOR_S01`

## Clustering and convergence

| Cluster | Seeds | Shared object/mechanism | Disposition |
|---|---|---|---|
| C1 portfolio algorithm | S01, S02, S06 | collection-wide coreset, bounded dictionary portfolio, per-SST assignment, full-cost objective | primary convergence cluster |
| C2 construction fidelity | S04 | result-independent native multi-SST denominator | mandatory prerequisite, not separate paper claim |
| C3 mechanism observability | S05 | retained fragment → final dictionary → compressed block trace | mandatory falsifier route, not telemetry paper |
| C4 temporal extension | S03 | compaction-cohort lineage | append-only backlog; outside frozen static object |

## Coverage-constrained selection

- Selected seed: `S6-RD-S01` composed with the objective contract from `S6-RD-S06`; `S6-RD-S04` and `S6-RD-S05` are mandatory validity/evidence components.
- Selected object boundary: exact 20-manifest logical dataset as a result-independent legal native multi-SST collection, 4096-byte blocks, no record duplication/padding/synthesis/exclusion, unchanged reader/ZDICT/Zstd semantics.
- Intended contribution type: `METHOD_ALGORITHM / N2`.
- RQ Candidate ID: `S6-RD-RQ01`.
- Why non-dominated: it is the only cluster combining a target-native cross-SST decision, a full-cost portfolio objective, a legal fixed denominator, and a mechanism-specific falsifier.

## Append-only backlog

- `S6-RD-S03` may only re-enter under a future assignment that explicitly freezes a temporal compaction-lifecycle object.
- Standalone sharding (`S04`) and standalone tracing (`S05`) are forbidden generic shells for this assignment.

## Advisory

- Engines used: `5`
- Perspective roles used: `5`
- Largest object share: multi-SST dictionary portfolio and its fidelity requirements
- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS`
