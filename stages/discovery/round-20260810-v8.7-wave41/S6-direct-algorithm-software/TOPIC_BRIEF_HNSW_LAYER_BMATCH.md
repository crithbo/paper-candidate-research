# HNSW-LAYER-BMATCH — Capacity-constrained layerwise HNSW graph construction

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origins: `O7`
- Domain tags: approximate nearest-neighbor indexing; graph construction; data structures
- Contribution route: `N2`
- Discovery date: `2026-08-10`
- Discovery method revision: accepted `v2/v8.1` + v8.6 fidelity-plan admission + v8.7 current-upstream reality check

## Research question

For a fixed vector set, metric, HNSW layer assignment, degree limits, and search interface, can a **layerwise capacity-constrained b-matching plus deterministic connectivity-repair constructor** produce a legal HNSW graph with a better build-memory/query-recall Pareto frontier than the complete current sequential-insertion union at equal construction resources?

## Paper genealogy

- Anchor paper: [Malkov & Yashunin, *Efficient and robust approximate nearest neighbor search using Hierarchical Navigable Small World graphs* (2016)](https://arxiv.org/abs/1603.09320).
- Key predecessors: the anchor's hierarchical small-world graph and neighbor-selection construction.
- Follow-up / competing artifacts: current [hnswlib](https://github.com/nmslib/hnswlib) and [FAISS](https://github.com/facebookresearch/faiss) HNSW implementations.
- Counter-evidence / negative source: current hnswlib already has insertion-local candidate search and heuristic neighbor selection; this brief does not claim it lacks HNSW construction.
- Artifact / benchmark: [ANN-Benchmarks](https://github.com/erikbern/ann-benchmarks), frozen HEAD `2e081ad32c1eccab72dcb739ad886c310b90f715`; its public real-image-descriptor GIST route is the natural carrier.
- Search boundary: primary anchor plus current official upstream/action sources through `2026-08-10`. Recent paper-level direct collision remains `SEARCH_BOUNDED_OPEN` for independent Stage 0 review; this is not a novelty conclusion.

## Topic-origin card

- Trigger: current HNSW constructors expose serial, local connection choices; a fixed layer admits a global degree-capped edge-set decision over the same candidate neighborhoods.
- Measurable observation / quantitative anchor: to be measured only after fidelity closure—index bytes, build CPU/memory, query latency, and Recall@10 on a public natural carrier.
- Baseline limitation: sequential insertion commits each point's selected neighbors before later points' competing capacity/connectivity demands are jointly resolved.
- Structural cause: local per-insertion neighbor selection is not the same optimization variable as a layerwide degree-capacitated edge assignment under a fixed candidate-edge universe.
- Decision variable: per layer, select undirected candidate edges subject to HNSW degree caps and a deterministic repair rule that restores required reachability from the frozen entry relation.
- Candidate Q1 venue family: data-management/IR/ML systems; initial sufficiency assessment is Tier B, not a Q1 claim.

## Historical method calibration

- Source-session backtest file: `stages/discovery/_method-backtests/O7_DIRECT_ALGORITHM_SOFTWARE/v2/backtest_review.md`
- Backtest status: calibrated; this calibrates method only, not the candidate.

## Exact object

One HNSW index for a fixed vector set, fixed distance metric, fixed random layer assignment/entry point, fixed per-layer candidate-edge generation budget, fixed degree limits, and the ordinary HNSW search API. The output object is the graph itself—not a selector over prebuilt indexes and not a different ANN graph family.

## Named fair baselines

- Deployment/default baseline: hnswlib HEAD `d9b3608c83d83b46c96e25088cb1d729b29dcfe9`, sequential `addPoint` with `M`, `ef_construction_`, level generation, and heuristic neighbor selection.
- Closest current implementation baseline: FAISS HEAD `02dbb4e42f49aa2ce57cd78977b0e47a11f7cb91`, including `search_level_0` and `add_links_starting_from` in `faiss/impl/HNSW.cpp`.
- Competitive simple baseline: hnswlib sequential insertion on the **same frozen candidate-edge budget**, with all legal `M`/`efConstruction` settings included in a finite grid.
- Optional offline ceiling: a per-layer exact degree-capped edge optimum on a small frozen candidate graph, used only as an upper bound and charged separately.

## Mechanism hypothesis

Generate exactly the candidate neighborhoods available to the fair sequential baseline. For each layer, solve a bounded, deterministic b-matching that selects edges jointly under degree limits and a connectivity penalty; then apply a deterministic, auditable repair that only adds legal candidate edges needed to satisfy the frozen reachability rule. The final graph uses the standard HNSW graph representation and standard search.

## Competing mechanisms

- Mechanism A: current sequential insertion—per-point candidate search followed by `mutuallyConnectNewElement` and `getNeighborsByHeuristic2`.
- Mechanism B: the proposed layerwise b-matching plus deterministic connectivity repair over the same candidate-edge universe.
- Preferred mechanism and why: B changes the construction action itself from irrevocable local edge choices to a joint degree-capacitated edge-set constructor. It is neither a configuration selector nor a wrapper around an existing index.

## Mechanism signature

`fixed vectors + fixed metric + fixed layer/candidate generation → joint legal edge-set construction → standard HNSW graph/search`. The required action divergence is the simultaneous assignment of two or more competing candidate edges under shared endpoint capacities; current serial calls choose one insertion's links before seeing the later assignment as one optimization problem.

## Seed-distance test

- What changes relative to the anchor: the anchor's insertion-local graph construction is replaced by an explicit layerwide constrained construction.
- What changes relative to the closest prior work: both hnswlib and FAISS source paths are local-link constructors; the proposed b-matching is a joint edge-assignment object.
- Why this is not an application/backend rename: vector metric, HNSW graph and native search semantics stay fixed.
- Result of method-name deletion test: “joint capacity-constrained layerwise edge construction for HNSW” remains a concrete N2 action, independent of product/library names.

## Candidate paper claim

At equal candidate-edge information and construction budget, a joint capacity-constrained HNSW layer constructor can improve the reproducible build-memory/query-recall Pareto frontier on public natural vector artifacts, while preserving the HNSW object and search contract.

## Evidence route

`PARETO_APPROXIMATION`

## Software/algorithm performance admissibility

- Same-function contract: same fixed vectors/metric, legal HNSW adjacency representation and normal HNSW query API; approximate quality is reported at the same Recall@10 denominator rather than silently weakened.
- Algorithmic delta: a new global b-matching and repair constructor, not `efConstruction`/`M` tuning.
- Full-cost ledger scope: candidate generation, matching/repair CPU and peak RAM, serialized graph bytes, build wall time, query latency, Recall@10, and failed/aborted construction.
- Generality hypothesis: advantages arise on candidate graphs with many competing local links and shared degree pressure; they should transfer across real descriptor/vector collections, not one trace.
- Why this is not routine tuning: the decisions are jointly coupled edge assignments, which cannot be replayed by selecting one existing parameter tuple.
- Expected no-gain region: sparse candidate graphs, very high degree caps, or data whose local sequential choices already satisfy the layerwise matching optimum.

## Nearest-prior facet matrix

| Facet | Candidate | Closest prior / current union | Residual |
|---|---|---|---|
| Research problem | HNSW graph construction | HNSW construction | Same problem |
| Exact object | Fixed HNSW graph/search contract | Fixed HNSW graph/search contract | Same object |
| Decision variables | Joint layer edge subset with shared capacities | Per-insertion local neighbor subset | Global coupling |
| Constraints / information | Same candidate universe, degree caps, fixed budget | Same candidate universe/budgets | No extra oracle |
| Core algorithm | Bounded b-matching + deterministic repair | Local heuristic connection | N2 constructor |
| Guarantee | Legal graph; fixed search/recall measure | Legal graph; fixed search/recall measure | No relaxed guarantee |
| Evidence object | Public natural GIST descriptor route | Same corpus/queries | Same denominator |

## Current collision classification

- DIRECT_FATAL: no current source was found that exposes the complete proposed layerwise b-matching-plus-repair action; Stage 0 must independently check paper-level direct collisions.
- DIRECT_SUBTRACT: original HNSW, current hnswlib, and current FAISS HNSW.
- METHODOLOGICAL_ADJACENT: other ANN graph families; they are not fair substitutes when the object is fixed to HNSW.
- DEPLOYMENT_BASELINE: current hnswlib and FAISS finite parameter/configuration grids.
- SEARCH_BOUNDED_OPEN: latest direct paper collision beyond the anchor requires Stage 0 confirmation.

## Decisive falsifier

On the frozen public GIST natural carrier, if the completed constructor either (a) cannot produce a legal graph under the fixed degree/connectivity contract, or (b) has no Pareto point over the full current union after charging candidate generation, matching/repair and graph bytes at equal build budget, the mechanism is stopped. A result from a proxy graph cannot support either PASS or STOP.

## Executable evidence path

### Current upstream reality check, when the action gap depends on implementation absence

- Checked current upstream commit/tag and date: hnswlib `d9b3608c83d83b46c96e25088cb1d729b29dcfe9` and FAISS `02dbb4e42f49aa2ce57cd78977b0e47a11f7cb91`, checked `2026-08-10`.
- Official current documentation location: hnswlib/FAISS upstream repositories and source paths listed above.
- Actual source symbols/paths: hnswlib `hnswlib/hnswalg.h`: `addPoint`, `mutuallyConnectNewElement`, `getNeighborsByHeuristic2`, `searchKnn`, `ef_construction_`; FAISS `faiss/impl/HNSW.cpp`: `add_links_starting_from`, `search_level_0`.
- Default and non-default flags/thresholds/configurations checked: hnswlib construction and degree surface (`M`, `maxM_`, `ef_construction_`, generated levels, deletion/replacement path); FAISS HNSW link/search paths. No setting found that changes the frozen serial local connection action into a batch degree-capped assignment.
- Evidence supporting the action distinction: the checked functions construct/search by individual-point/local neighbor paths; neither exposes a layerwide b-matching-plus-connectivity-repair action interface.
- Contrary evidence and disposition: current libraries are strong direct subtractors and may have internal heuristics with related effects; they remain mandatory baselines. This is a finite source-level action hypothesis, not a claim that no other paper or branch implements it.
- Why the residual is outside the current native mechanism and a fair finite configuration grid: the candidate selects one coupled edge set over multiple insertion events under shared degree constraints; a finite grid can vary existing local thresholds but cannot express that joint decision variable.

### Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`
- Complete atomic action and action interface: from a frozen layer candidate graph, select a degree-capped edge set by deterministic b-matching; add only specified candidate edges via deterministic connectivity repair; serialize through the native HNSW representation.
- Real comparator and native codec/solver/checker/reader/format semantics: hnswlib and FAISS HNSW current constructors/readers/search; exact brute-force neighbors provide the recall denominator.
- Same-object/same-function/guarantee boundary: same vectors, metric, fixed layer assignment, degree caps, candidate-generation budget and standard HNSW search; no alternative ANN index, oracle edge, query-specific extra information, or relaxed recall target.
- Common denominator and full-cost dimensions: build CPU/wall time, peak RAM, candidate generation, matching/repair, graph bytes, query latency, Recall@10, and construction failures.
- Small pre-corpus legality/equivalence witness: a hand-sized six-vector, one-layer candidate graph with two edges competing for one degree slot; independently enumerate legal degree-capped connected edge sets and verify candidate output is legal, searchable, and uses only frozen candidates.
- Finite closure steps and required resources: implement the constructor as a minimal hnswlib-compatible build path; run native graph/search checks on the six-vector witness; then use ANN-Benchmarks' public GIST natural artifact with frozen parameters and a finite baseline grid.
- Structural failure condition: if matching needs an edge outside the frozen candidate graph, cannot satisfy legality/connectivity, changes HNSW reader/search semantics, or degenerates to a parameter selector, STOP before a claim-bearing run.
- Reminder: this is a Stage A preflight plan, not evidence that the main claim already holds.

### 72-hour first evidence

First gate: compile only a minimal constructor and the six-vector witness; fail closed if its graph violates degree/edge/candidate legality. Second, limited natural gate: one frozen public GIST slice and matched hnswlib configuration grid. The only permitted early observation is whether the candidate has at least one valid full-cost Pareto point; it is not a paper result.

### AI core fraction and critical path

AI can implement the finite candidate-graph, matching and witness checks, but the critical path is evidence fidelity: exact HNSW semantics, fair baseline configuration and independently reproduced natural-corpus denominator. AI readiness is moderate and affects priority only.

### Semantics-preserving open alternatives

If b-matching is too costly, an explicitly specified deterministic primal-dual approximation over the same candidate graph may be evaluated only as a registered mechanism pivot; switching to a different ANN graph, pretraining an edge predictor, or selecting an existing index is out of scope.

## Q1/Q2 sufficiency hypothesis

- Why this supports at least a complete Q2 paper: it is a same-object global graph-construction N2 with a direct, fair current union and natural-data/full-cost falsifier.
- Why it may reach Q1, or why it remains Tier B: Tier B until multi-corpus, reproducible Pareto improvements and a clean direct-collision review show a broadly important construction advantage.
- What would still be required at Stage B: latest literature collision closure, several natural vector collections, robust ablations, scalability evidence, and independent artifact reproduction.
- Preliminary contribution-shape analogs, if any: the original HNSW construction is the structural anchor; this does not claim equivalent impact.
- Reminder: preliminary analogs do not replace Stage 0 Q1 calibration.

## Non-relaxable quality audit

- Same-object: frozen HNSW graph/search contract.
- Latest collision: `SEARCH_BOUNDED_OPEN`; Stage 0 must independently test direct paper absorption.
- Strong fair baselines: current hnswlib, current FAISS and their full legal finite settings.
- Natural input/evidence: public ANN-Benchmarks GIST route.
- Full-cost: build, memory, bytes, query, recall and failures are common denominators.
- Reproducibility: commits, candidate graph, seed/layer assignment, parameters and witness are all frozen.
- Evidence/claim honesty: no implementation or positive result exists; only a finite closure plan is claimed.

## Dual-axis score

- Academic value: `45/70`
- AI executability bonus: `12/30`
- Total: `57/100`

## AI and researcher boundary

The proposed Stage 0 decision is structural potential, not a prediction of outcome. Human review is especially needed for the current literature collision check and for whether a global matching formulation is sufficiently distinct from known HNSW build variants.
