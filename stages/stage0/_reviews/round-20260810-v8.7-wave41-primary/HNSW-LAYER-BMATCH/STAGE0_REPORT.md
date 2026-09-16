# Stage 0 PRIMARY Review — HNSW-LAYER-BMATCH

## Review identity

- assignment_id: `STAGE0-P1-20260810-HNSW-LAYER-BMATCH-PRIMARY-V8.7`
- topic_id: `HNSW-LAYER-BMATCH`
- role: `PRIMARY`
- cutoff: `2026-08-10`
- decision: `REVISE_ONCE`
- tier_if_atomic_revision_closes: `TIER_B_Q2_VIABLE`
- current_evidence_readiness: `LOW_BUT_FINITE`
- confidence: `0.95`
- confirmation_required: `true`
- stageA_authorized: `false`
- stageB_authorized: `false`
- revision_budget: `0/1 consumed`
- evidence_ceiling: `SOURCE_VERIFIED_CONDITIONAL_POTENTIAL_ONLY__NO_MAIN_RESULT`
- collision_status: `SEARCH_BOUNDED_OPEN`

## Outcome first

The broad Discovery claim—global, layerwise HNSW construction—is no longer a defensible novelty boundary. Yang et al., PVLDB 2025, already preassign all HNSW layers and construct them globally, layer by layer, with FastHNSW/FastKCNA; their public artifact emits an HNSW structure compatible with hnswlib and exposes the HNSW degree parameter. Current hnswlib and Faiss still supply strong local insertion/pruning actions, while generic b-matching literature supplies the optimization kernel. These sources jointly subtract most of the original framing.

A narrower structural paper core remains plausible but is not yet frozen well enough for a PASS: given exactly the same per-layer candidate graph, jointly choose degree-capped HNSW edges and preserve deterministic entry reachability/connectivity through capacity-respecting swaps or augmentations, with a nontrivial legality/complexity/approximation property. That residual is not established by merely running generic b-matching and attaching an MST/DFS-style repair. Because the missing definition is one atomic mechanism boundary—not a demand for implementation or positive results—the proper decision is `REVISE_ONCE`, not STOP.

## Structural paper potential versus readiness

### Structural paper potential

Conditional `TIER_B_Q2_VIABLE`.

If the revision defines a connected degree-bounded selection algorithm whose legal action cannot be reproduced by current hnswlib/Faiss local pruning, FastHNSW's global layer builder, or generic b-matching followed by an ordinary component repair, the work can form an N2 paper: a new constrained graph-construction algorithm over the native HNSW object, with a finite correctness/performance evaluation route. Q1 potential is not yet established because the remaining gap is narrow and the expected benefit, approximation strength, and generality are unknown.

### Current evidence readiness

`LOW_BUT_FINITE`. No implementation, natural-corpus result, six-vector realized instance, approximation theorem, or full-cost ledger is present. Those absences do not negate paper potential at Stage 0. The CPU/open-source route is finite: pin native implementations and datasets, materialize identical candidate graphs, validate a small action-divergence witness, then compare construction and query behavior. No hardware or user-resource blocker was found.

## Frozen exact object

The only admissible object for revision and later work is:

- one fixed vector set and immutable vector identifiers;
- one fixed distance or similarity metric and its exact implementation/precision;
- one fixed HNSW layer assignment, entry point, `M`/per-layer degree caps, and candidate-edge budget;
- one fixed per-layer candidate graph `C_l`, including provenance and all tie-breaking;
- one standard native HNSW search contract, with the same query parameters and distance-counting convention;
- one native-compatible serialized HNSW graph/index, with unchanged vectors, layers, metric, search semantics, and recall ground truth.

The candidate may change only edge selection and the deterministic capacity-respecting connectivity procedure inside `C_l`. It may not use noncandidate edges, a complete-KNN oracle unavailable to comparators, vertex reordering, a different ANN graph, changed layers, changed search, or changed serialization semantics.

## Current-upstream reality check

### hnswlib

The pinned `hnswalg.h` path exposes the relevant current action surface: `M`, `maxM_`, `maxM0_`, `ef_construction_`, insertion order/random seed, `getNeighborsByHeuristic2`, reciprocal insertion in `mutuallyConnectNewElement`, and native save/load. Selection is local to a newly inserted element and the current partial graph; reverse lists are pruned when full. This does not implement the proposed layerwide b-matching action, but it is a mandatory native baseline and defines one candidate-information parity hazard.

### Faiss

Current Faiss HNSW source remains centered on local candidate search, neighbor selection, reciprocal link addition, and pruning. The reviewed current surface also includes `M`, `efConstruction`, preset levels, `keep_max_size_level0`, `prune_headroom`, similarity handling, and query-side search controls. These default and nondefault actions must be included or explicitly held fixed. No absence claim is made from a failed Git transport; the review relies on already retrieved official source/docs and records the rest as open.

### Direct same-object collision: FastHNSW/FastKCNA

Yang et al. explicitly revisit proximity-graph index construction, preassign HNSW layers, and build the graph globally layer by layer. Their Algorithm 7 constructs each layer using the paper's iterative graph construction, and their author artifact exposes a FastHNSW mode whose output structure is described as the same as hnswlib. This is a direct subtractor to “global layerwise HNSW construction,” batch/offline construction, and generic claims that local incremental insertion is the only available method.

It is not, on the reviewed evidence, a direct-fatal collision with a formally connected, degree-capped b-matching selector on a frozen candidate graph. That narrower residual remains `SEARCH_BOUNDED_OPEN`, not established novelty.

## Strongest fair comparator set

The revision must define one same-information comparator experiment rather than a universal union:

1. **Native hnswlib grid:** legal finite settings for `M`, `efConstruction`, insertion order/seed, and its native neighbor heuristic, with fixed layers and resource budget where the interface permits.
2. **Native Faiss grid:** corresponding legal finite settings plus current pruning/headroom and level-0 choices; search parameters are evaluation controls, not construction advantages.
3. **FastHNSW/FastKCNA:** same vectors, layers, candidate budget, degree cap, and build-resource envelope; its whole-layer K-CNA/alpha-style pruning is the strongest current same-object global subtractor.
4. **Generic b-matching controls:** a pinned weighted b-matching method (including a documented approximation where used) on the exact same `C_l`, both without repair and with the strongest ordinary deterministic capacity-respecting component repair.
5. **Oracle/ceiling only:** exact ILP/CP-SAT on small layers. It is not a deployment baseline and cannot automatically kill a bounded algorithm.

Candidate information must be fair. Replaying hnswlib's sequential candidate lists is not automatically equivalent to a whole-layer candidate graph because those lists depend on the partial graph and insertion order. The study must either log/freeze one common `C_l` and give it to every selector, or define separate native and same-information tracks without mixing their claims.

## Atomic revision gate

### Gate identifier

`CONNECTED_DEGREE_BOUNDED_HNSW_ACTION_DIVERGENCE_BEYOND_FASTHNSW_AND_GENERIC_BMATCHING`

### Single proposition

Under one frozen native HNSW contract and one frozen same-information per-layer candidate graph, there exists a deterministic construction that jointly selects degree-capped edges and preserves entry reachability/connectivity through capacity-respecting choices, and whose legal action is not expressible by (a) current native local pruning, (b) FastHNSW/FastKCNA layer construction, or (c) generic b-matching followed by ordinary post-hoc component repair; the construction also admits one nontrivial legality, complexity, or approximation property and a finite same-object Stage A killer.

The `AND` phrases are components of this single action-divergence certificate, not permission to submit several unrelated gates.

### Required revision contents

- A complete finite action catalog for native local pruning, FastHNSW, generic b-matching, and ordinary capacity-respecting repair on the same `C_l`.
- A realizable six-vector metric/layer/candidate-edge instance, with coordinates or an auditable distance matrix, all ties fixed, and native-compatible degree/entry constraints.
- Exact outputs of each catalogued action on that witness, demonstrating candidate divergence without extra information or illegal edges.
- A deterministic repair/selection specification that never exceeds degree caps. If connectivity requires swaps or augmenting paths, those are part of the optimization action rather than an after-the-fact wrapper.
- One nontrivial property: for example feasibility/completeness on a stated graph class, an approximation bound for a stated objective, or a complexity improvement over a precisely defined exact formulation.
- A finite Stage A route over GIST plus at least one additional published FastKCNA corpus (such as SIFT, DEEP, GloVe, Crawl, Msong), with native serialization/search validation and full costs.

### Forbidden substitutes

- tuning `M`, `efConstruction`, insertion order, seed, or pruning thresholds;
- renaming FastHNSW's global layer construction;
- generic b-matching plus MST/DFS/component-link wrapper with no joint guarantee;
- additional complete-KNN, distance, future-layer, or oracle information denied to comparators;
- noncandidate repair edges or temporary/final degree-cap violations hidden from the contract;
- a different ANN graph, reordered vectors, changed layer assignment, changed search, or changed serialization/query semantics.

### Terminal condition if revision fails

`BELOW_Q2_STOP__FASTHNSW_GLOBAL_CONSTRUCTION_PLUS_GENERIC_BMATCHING_REPAIR_ABSORPTION`

## Six-vector witness attack

Discovery promises but does not instantiate the witness. A mere abstract graph is insufficient if it cannot arise from the frozen metric and candidate-generation contract. The revision must show:

- six explicit vectors or a valid metric distance matrix;
- fixed layers, entry point, degree cap, candidate budget, candidate edges and weights;
- deterministic tie-breaking;
- native/FastHNSW/b-matching-plus-repair/candidate outputs;
- why the candidate is legal and connected/reachable while the closest comparator cannot reproduce it under identical information.

The witness is a mechanism discriminator, not evidence of natural performance.

## Repair-soundness attack

Maximum-weight b-matching can saturate endpoints. A later “add a bridge” step may therefore exceed `M`; deleting a selected edge to make room may disconnect another component or invalidate the objective guarantee. The revision must integrate reserved capacity, swaps, augmenting paths, or an equivalent construction and prove at least degree legality and the claimed connectivity/reachability condition. An unconstrained MST/DFS over components is not sound if its edges are absent from `C_l` or its endpoint capacities are exhausted.

## N1/N2/N3 assessment

- `N1`: not established. The HNSW object, candidate edges, and b-matching primitives are known.
- `N2`: conditionally viable. The paper core must be the joint connected degree-bounded selector/repair algorithm and guarantee, not global construction alone.
- `N3`: not established. No new natural workload law is claimed or required for the N2 route.

## Natural corpus and finite Stage A killer

The route is executable on CPU/open artifacts and does not require current positive results.

1. Pin hnswlib, Faiss, FastKCNA, metric precision, compiler/toolchain, CPU threads, memory cap, vector manifests, and ground-truth procedure.
2. Use GIST plus at least one additional natural corpus already used by the same-object genealogy.
3. Freeze common candidate graphs and log hashes; separately retain native end-to-end tracks.
4. Validate native serialization/reload, exact vector/id equality, reachable entry semantics, degree caps, and query outputs.
5. Measure graph build wall time, CPU time, peak RSS, candidate generation, optimization/repair, serialization, index bytes, distance computations, recall/QPS or latency curves, and fallback/failure rates.

Pre-registered killer conditions:

- candidate action coverage below 10% on eligible natural layers;
- any object, serialization, metric, degree, reachability, or recall-ground-truth mismatch;
- the action-divergence witness collapses under FastHNSW or generic b-matching plus fair repair;
- optimization/repair overhead consumes the build or index/query benefit;
- no p50/p90 full-cost Pareto point against the finite fair union;
- the only gain uses information not supplied to baselines.

These are future Stage A falsifiers, not Stage 0 failures today.

## Full-cost and same-object ledger

Required dimensions are candidate generation, edge scoring, selector time, repair time, native build integration, peak build RSS, serialized graph/index bytes, load time, query distance computations, QPS/latency at matched recall, degree/connectivity checks, ground-truth cost, failures and fallback. Vector contents, IDs, metric, layer assignment, entry, native search code and output contract must remain fixed.

## Paper-shape calibration

- HNSW/TPAMI anchors the native object and contribution scale: algorithm, analysis and extensive ANN evaluation.
- FastKCNA/PVLDB 2025 is the closest current same-object comparator and establishes that global layer construction plus broad natural evaluation is already publishable and already occupied.
- ANN-Benchmarks/Information Systems anchors reproducible multi-dataset ANN comparison, but benchmark participation alone is not a contribution.

For Q2, the candidate needs a named connected degree-bounded construction, a defensible property, a direct comparison to FastHNSW and native implementations, and natural full-cost evidence. For Q1, it would additionally need a stronger general theorem or broadly recurring natural advantage across corpora and operating points. Current shape is below Q1 parity.

## Score

### Academic potential: 42/70

- importance and relevance: 12/15
- N2 mechanism depth if gate closes: 10/15
- novelty after FastHNSW and b-matching subtraction: 7/15
- baseline/venue-calibrated paper shape: 6/15
- falsifiability and reproducibility route: 7/10

### AI execution: 24/30

- artifact and source accessibility: 8/10
- AI share of core algorithm/harness work: 8/10
- finite preclaim/killer route: 8/10

- total: `66/100`
- AI core fraction estimate: `0.78`
- AI classification: `AI_CORE_EXECUTABLE`

The score is conditional and is not inherited from Discovery.

## Decision rationale

`PASS_RECOMMENDED` would be premature because the closest same-object paper was omitted and the residual algorithm is not yet distinguished from a generic b-matching-plus-repair product. `STOP_RECOMMENDED` would also be premature because a finite, same-object, nontrivial connected degree-bounded selection residual remains logically possible. One atomic revision can settle the mechanism boundary without requiring implementation or positive results.

Final PRIMARY decision: `REVISE_ONCE`, `PENDING_CONFIRMATION`.

