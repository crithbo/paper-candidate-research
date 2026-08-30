# HNSW-LAYER-BMATCH — Stage 0 Revision 1 Report

## Administrative record

- assignment_id: `STAGE0-P1-20260810-HNSW-LAYER-BMATCH-REVISION1-V8.7`
- topic_id: `HNSW-LAYER-BMATCH`
- role: `STAGE0-BATCH-GATE / PRIMARY`
- revision: `1/1 consumed`
- atomic_gate: `CONNECTED_DEGREE_BOUNDED_HNSW_ACTION_DIVERGENCE_BEYOND_FASTHNSW_AND_GENERIC_BMATCHING`
- recommendation: `RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`
- quality_tier: `TIER_B_Q2_VIABLE`
- q1_status: `NOT_SUPPORTED_AT_STAGE0`
- confidence: `0.86`
- structural_paper_potential: `TIER_B_Q2_VIABLE`
- current_evidence_readiness: `STATIC_MECHANISM_CLOSED__FINITE_STAGEA_FIDELITY_GAPS`
- evidence_ceiling: `STATIC_CONTRACT_AND_ACTION_DIVERGENCE_ONLY__NO_NATIVE_OUTPUT_OR_NATURAL_GAIN`
- latest_collision_status: `SEARCH_BOUNDED_OPEN`
- confirmation_required: `true`
- stageA_authorized: `false`
- stageB_authorized: `false`
- implementation_or_experiment_performed: `none`

## Single proposition, falsifier and result

### Proposition

On one frozen same-information HNSW layer candidate graph, a deterministic constructor can maintain entry-rooted connectivity and degree legality throughout bounded portal-ear growth and capacity-safe exchange bundles, optimize a standard-HNSW greedy-reachability objective, and provide a nontrivial completeness/local-optimality property that is absent from FastHNSW's layerwise RNG pruning, additive generic b-matching, and the frozen ordinary matching-plus-repair controls.

### Falsifier

The gate fails if the construction needs a noncandidate edge, extra complete-kNN information, changed layer/search/serialization semantics, or if its only action is FastHNSW/RNG pruning, generic b-matching followed by component bridging, parameter/insertion-order tuning, or an unrestricted exact solver.

### Result

`PASS_FOR_CLOSING_REVIEW`. The revision defines one concrete constructor, one HNSW-specific objective, one bounded formal property, one metric-realizable six-vector action-divergence instance, a finite comparator action catalog, and a finite Stage A fidelity/killer route. It does not claim that the method is implemented, that the exact native adapters already emit the stated graph, or that natural performance is positive.

## Input integrity

### Discovery package

| File | SHA-256 |
|---|---|
| `TOPIC_BRIEF_HNSW_LAYER_BMATCH.md` | `CA7AF7C3834DA6DE771589E50B5DF54A94C0F53A1666A233D91EEA0D60599EF1` |
| `SOURCE_COLLISION_MATRIX.md` | `7EE8211FABBD3F46943C6A558E097C3EDB58C5C916A3C12E3642FB4FC10F0101` |
| `DISCOVERY_LOG.md` | `F61101B7529CAD9368B9DFE8F38002FBE6A179D65DACD4860F17696368049F31` |
| `handoff.yaml` | `7EE6CEC349B2556F917D26CB1B431609B3AE4EB415C21C4DB1CE24539DA96DFD` |
| manifest self | `01C3B8A778CF49EF7A102CFFFF744D00CF6727C8A9F015B1D08BE611668C4A15` |

Manifest verification: `4/4 PASS`.

### PRIMARY package

| File | SHA-256 |
|---|---|
| `STAGE0_REPORT.md` | `2961BB20CB0FB8A112D71C7F02268F8B20C4352CD957DFD0F9A16153960A9A8D` |
| `Q1_COMPARATOR_MATRIX.md` | `57B5176AFC02D42AA4362F47737C60BFE80036C8F374B7AE80C9FDEBCE6C0E5F` |
| `SOURCE_AUDIT.md` | `9A16D58A7C3A602DCBE85AD4B9A9E72E58C32381942AFE77162400866107FC18` |
| `handoff.yaml` | `C2FCA75304EDD864C2C0EEBDC3E93A28E7AD0B29B365BBABB95F36782BAC3DDF` |
| manifest self | `C2862210C86F3A56A0C8FEF8D76814F44FCA6E0455A4B27E83DA02AA48EA851A` |

Manifest verification: `4/4 PASS`.

### D-root confirmation package

| File | SHA-256 |
|---|---|
| `CONFIRMATION_REVIEW.md` | `F7EF1BA8576C7A091007BB2970AB72EC5681178DAE01AA0F45215C89B25B7143` |
| `handoff.yaml` | `7914714D8D0C826C14BAC97024E22A7261ACBC7D87D747149711A9F819B17462` |
| manifest self | `E4D042551026B5714FF1532DAE06E782EBD929207A2FF344F53F824D6B1AE60A` |

Manifest verification: `2/2 PASS`.

The invalid non-D confirmation partial is not an input. No control or upstream file was modified.

## Frozen exact object

The revision keeps:

- a fixed vector set, immutable IDs and Euclidean metric with exact deterministic distance/ID tie-breaking;
- fixed HNSW layer membership, entry vertex, degree caps and one exact per-layer candidate graph `C_l`;
- identical candidate edges, coordinates, scores, entry/layer information and budgets for every static selector comparator;
- an undirected symmetric edge-selection contract for the static action discriminator; any later native adapter must write reciprocal neighbor-list entries without exceeding the native layer cap;
- unchanged native HNSW serialization, load and standard greedy/beam search semantics;
- a separate native end-to-end track for current hnswlib, Faiss and FastHNSW, so a static common-`C_l` adapter is never mislabeled as their unmodified dynamic candidate-generation behavior.

Candidate generation is not optimized by this topic. It is a frozen input. No complete-kNN edge unavailable to comparators may be added.

## Revised N2: PAX-HNSW

The single retained mechanism is **Portal-Augmenting Exchange HNSW (`PAX-HNSW`)**.

### Decision object

For a frozen layer candidate graph `C=(V,E_C)`, entry `r`, degree budgets `b(v)`, coordinates and deterministic ties, construct `E⊆E_C` such that:

1. `deg_E(v)≤b(v)` for every vertex;
2. every vertex is reachable from `r` in `(V,E)`;
3. all selected links are reciprocal native-compatible HNSW layer links;
4. no graph/layer/query/serialization semantic changes.

### HNSW-specific objective

The lexicographic objective is `Q(E)=(G(E), D(E), -L(E), lex(E))`:

- `G(E)` is the number of build vectors `q∈V` for which standard single-layer `ef=1` HNSW greedy search, starting at `r`, terminates at `q`. At each step it selects the neighbor minimizing `(d(q,v), id(v))` and moves only on strict distance improvement.
- `D(E)` is the sum of deterministic bidirectional HNSW diversity ranks derived from the frozen candidate order; it rewards neighborhood angular/distance coverage rather than edge count alone.
- `L(E)` is total selected metric edge length, a final compactness tie-break.
- `lex(E)` makes the constructor deterministic.

`G` is path-dependent and is not an additive edge-weight b-matching objective. It uses only the frozen build vectors and entry and is provided to every adapted comparator. Held-out query performance remains a later evaluation metric, not an input to construction.

### Joint constructor

`PAX-HNSW(L,k)` never constructs a disconnected maximum-weight matching and then repairs it.

1. Begin with the entry vertex as the connected processed set.
2. Enumerate deterministic candidate **portal ears** of at most `L` edges: a path whose endpoints are processed vertices or whose first endpoint is processed, and whose internal vertices are new. An ear is admitted only if all edges are in `E_C`, all endpoint/internal capacities remain legal, and the processed set stays entry-connected.
3. Select the feasible ear or atomic exchange bundle with maximal `Q` improvement. A bundle may add and delete up to `k` edges atomically; every deleted edge must be accompanied by a connectivity certificate for the final bundle. Intermediate degree or connectivity violations are not observable states.
4. After all vertices are processed, enumerate all feasible `k`-exchange bundles and accept strict `Q` improvements until none remains.
5. If no legal bounded ear exists, return the checkable status `UNSUPPORTED_PORTAL_EAR_CLASS(frontier, saturated_endpoints, L,k)` and invoke the predeclared native fallback. This is not falsely presented as global infeasibility.

The connector, capacity handling and HNSW objective are therefore one algorithmic action, not matching plus MST/DFS/component repair.

## Named formal property and invariant

### Portal-ear completeness target

Define `PE(L,b)` as candidate graphs admitting an entry-rooted open-ear certificate in which every ear has at most `L` edges and the total incidence assigned to each vertex does not exceed `b(v)`. Because `PAX-HNSW` enumerates the complete deterministic legal-ear catalog, it is complete for this declared class: if the certificate exists, the growth phase finds an entry-connected degree-legal spanning subgraph. For fixed `L`, exhaustive legal-ear enumeration is polynomial in the graph size, with a conservative target bound `O(|V|·|E_C|^L)` before exchange refinement.

### Persistent invariants

- `I1 Candidate fidelity`: `E⊆E_C` after every committed bundle.
- `I2 Degree safety`: `deg_E(v)≤b(v)` after every committed bundle.
- `I3 Rooted connectivity`: every processed vertex remains reachable from `r`.
- `I4 Determinism`: coordinates, candidate ranks and ID ties determine one output.
- `I5 HNSW-object fidelity`: selected pairs map to reciprocal native layer entries only.

### Local-optimality target

After refinement, no feasible symmetric difference with at most `k` additions and `k` deletions can improve `Q`; for this revision `k=3`. This is a checkable `3`-exchange local-optimality guarantee, not a global approximation claim.

These are formal property targets for Stage A proof/checker closure. Stage 0 establishes that they are precise, nontrivial and bound to the candidate action; it does not claim a completed proof or implementation.

## Static six-vector action divergence

The complete witness is in `SIX_VECTOR_WITNESS.md`. In summary:

- six Euclidean vectors form two equilateral triples;
- the same candidate graph contains the two triples plus two cross-cluster portal edges;
- degree cap is two and entry is `v0`;
- RNG/local pruning and additive maximum-weight b-matching select two disconnected triangles;
- deterministic one-portal matching repair reaches a connected path but is a fixed point for the frozen one/two-edge repair/refill catalog;
- `PAX-HNSW(3,3)` selects two portal ears and emits a six-cycle using only candidate edges;
- standard `ef=1` greedy reachability on the six build-vector targets is `6/6` for the candidate versus `3/6` for the frozen one-portal repair;
- the exact small connected degree-bounded ceiling agrees with the candidate under `Q`.

Moving from the one-portal path to the candidate requires the atomic symmetric difference `+{01,25,34} -{12,35}`. This three-add/two-delete bundle is outside the frozen ordinary one/two-edge repair catalog and cannot be achieved safely by adding a bridge to saturated endpoints.

## Complete comparator action catalog

1. **hnswlib-style fixed-`C` replay:** insertion-order-local RNG/diversity pruning, reciprocal update and cap pruning; deterministic distance/ID ties.
2. **Faiss-style fixed-`C` replay:** local candidate selection and reciprocal pruning under the same cap and tie contract.
3. **FastHNSW/FastKCNA layer action:** whole-layer candidate construction followed by its RNG/alpha-style pruning; the broad global/layerwise claim remains absorbed.
4. **Additive maximum-weight b-matching:** same `E_C`, caps and bidirectional local diversity weights, without connectivity.
5. **Greedy component bridge:** lexicographically first inter-component edge; saturated endpoints cause deterministic deletions of removable incident edges.
6. **Bridge plus one/two-edge capacity swap and maximal refill:** bounded ordinary local repair; no path-dependent `G` optimization.
7. **Reserved-capacity/spanning-tree-first control:** deterministic first portal and additive local completion under the same cap.
8. **Small exact connected degree-bounded optimizer:** optimizes `Q` only on the six-vector/small fixtures; ceiling and checker, not a deployable baseline.

The static selector track gives every method the same `C`. The later native track runs each official constructor on its actual candidate-generation path and reports it separately. No universal union or exact ceiling is used to declare deployment inferiority.

## Collision boundary after revision

- `DIRECT_FATAL`: first global/layerwise HNSW construction; batch/offline HNSW as a broad action.
- `DIRECT_SUBTRACT`: FastHNSW/FastKCNA, native local HNSW pruning, generic b-matching, generic DFS/component bridging, spanning-tree-first repair.
- `SEARCH_BOUNDED_OPEN`: the exact `PAX-HNSW` portal-ear/greedy-reachability action and guarantee. No first-of-kind assertion is made.

The revised claim is only: a concrete entry-connected, capacity-safe, path-objective constructor with bounded portal-ear completeness and exchange local optimality is structurally distinct from the obtained current union and merits finite Stage A falsification.

## Structural paper potential versus readiness

### Structural paper potential

`TIER_B_Q2_VIABLE`. If the formal property, native fidelity and natural full-cost residual survive Stage A, the paper has a focused N2 shape: a path-aware HNSW layer constructor, a capacity-safe joint exchange algorithm, formal scope/failure certificates, current global/native comparators and natural ANN evidence. The narrowness of the residual and absence of a global approximation result keep it below Tier A today.

### Current evidence readiness

The mechanism/witness/comparator contracts are static and finite. Native graph writing, exact FastHNSW call-path parity, natural occurrence, runtime and recall remain open. These are Stage A fidelity and empirical risks, not Stage 0 STOP reasons.

## Stage A preclaim route and killer

Before any claim-bearing observation, an authorized Stage A must:

1. pin hnswlib, Faiss and FastKCNA commits, toolchain, CPU threads and native serialization;
2. materialize one common-`C_l` selector fixture and separately preserve each official native end-to-end candidate-generation track;
3. implement only `PAX-HNSW(3,3)` and the full frozen comparator catalog;
4. reproduce the six-vector edge tables and `G` values; serialize, reload and query through native HNSW;
5. freeze GIST plus at least one of SIFT/DEEP/GloVe/Crawl/Msong, with separate build landmarks and held-out queries;
6. charge candidate generation, distance evaluations, `G` evaluation, ear enumeration/exchange, CPU/wall time, peak RSS, temporary memory, native graph bytes, save/load, failures/fallbacks and matched-recall QPS/tail latency.

Pre-registered killers:

- any selected edge is outside `C_l`, any final/native list exceeds the layer cap, or reciprocal serialization/search changes the object;
- the exact FastHNSW path or a frozen ordinary repair already implements the same portal-ear action and guarantee;
- the six-vector static table does not reproduce in the faithful comparator adapters;
- eligible portal-ear/action coverage is below `10%` on both natural corpora;
- `G` computation or exchange overhead consumes every full-cost advantage;
- no p50/p90 matched-recall Pareto point survives against the finite deployed comparator family;
- any apparent gain requires insertion-order tuning, extra KNN information or query leakage.

A positive result would be preliminary support only. No Stage A run is authorized by this report.

## Claim ceiling

Allowed after closing review: conditional structural claim that the bounded `PAX-HNSW` proposition is precise and finitely falsifiable.

Not allowed: first global HNSW construction, implemented native constructor, natural occurrence, compression/build/query improvement, approximation ratio, universal connectivity, or superiority to FastHNSW.

## Dual-axis score

- Academic value: `46/70` (problem 12; N2 clarity 15; latest-work delta 7; baseline/venue 6; falsifiability 6)
- AI executability: `25/30` (artifacts 8; core algorithm/checker 9; bounded probe 8)
- Total: `71/100`
- AI core fraction: `0.80`
- AI class: `AI_CORE_EXECUTABLE`

The score supports priority only; the atomic gate and quality audit control the recommendation.

## Final recommendation

`RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`, revision `1/1` consumed. This is not a formal Stage 0 status transition. Only the long-lived confirmation sentry may close the review, and only mainline may update registry or route a later Stage A assignment.

