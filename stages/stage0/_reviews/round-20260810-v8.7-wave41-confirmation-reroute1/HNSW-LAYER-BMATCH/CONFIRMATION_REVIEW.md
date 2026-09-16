# Stage 0 Independent Confirmation — HNSW-LAYER-BMATCH

## Review identity and scope

- Assignment: `STAGE0-C2-20260810-HNSW-LAYER-BMATCH-CONFIRM-REROUTE1-V8.7`
- Role: long-lived Stage 0 confirmation sentry replacement
- Candidate: `HNSW-LAYER-BMATCH`
- Review date / source cutoff: `2026-08-10`
- Workspace root used: `<LEGACY_LOCAL_PROJECT_ROOT>`
- Frozen PRIMARY: `stages\stage0\_reviews\round-20260810-v8.7-wave41-primary\HNSW-LAYER-BMATCH`
- Prohibited actions observed: no shared control-file edits, no Stage A/B launch, no implementation, and no experiment.

## Decision

**`CONFIRM_REVISE_ONCE`**

The broad proposal “construct HNSW globally or layerwise rather than by ordinary serial insertion” is directly absorbed by FastHNSW/FastKCNA and cannot survive. A narrower, same-object atomic proposition still has a finite closure path: on the exact frozen per-layer candidate graph, jointly select a connected, degree-capped subgraph through capacity-respecting exchanges/augmentations, with a named HNSW-specific objective and a nontrivial guarantee, while preserving native HNSW serialization and search semantics.

This residual is not yet established as novel or beneficial. It survives Stage 0 only as a single revision gate. Missing implementation or positive results is not a STOP reason at this stage. Unclosed latest-collision coverage is `SEARCH_BOUNDED_OPEN`; no absence inference is made from transport, indexing, or retrieval limits.

### Quality and evidence ceiling

- Current academic label: `TIER_B_Q2_VIABLE` **only if the atomic revision gate closes**.
- Current Q1 status: not supported; the present contribution/evidence shape is Q2-conditional.
- Evidence ceiling: `SOURCE_VERIFIED_CONDITIONAL_POTENTIAL_ONLY__NO_IMPLEMENTATION_OR_MAIN_RESULT`.
- AI executability: core closure is plausibly AI-executable because it is a bounded algorithm/source/solver/witness task; this is an execution-priority factor, not scientific evidence.
- Confidence in this confirmation decision: `0.88`.

## Frozen-input integrity

The confirmation independently recomputed the frozen PRIMARY package before substantive review.

| Item | Expected SHA256 | Recomputed result |
|---|---|---|
| `handoff.yaml` | `C2FCA75304EDD864C2C0EEBDC3E93A28E7AD0B29B365BBABB95F36782BAC3DDF` | exact match |
| `HASH_MANIFEST.sha256` | `C2862210C86F3A56A0C8FEF8D76814F44FCA6E0455A4B27E83DA02AA48EA851A` | exact match |
| PRIMARY manifest entries | `4/4` | all four exact matches |

The frozen Discovery package manifest was also recomputed as `4/4`. The confirmation does not inherit any conclusion that is not present in the valid frozen packages or independently supported below.

## Exact same-object contract

The candidate may change only the selector applied to the already frozen candidate edges `C_l` at each already frozen HNSW layer `l`.

Frozen inputs are:

1. vector identities and values, distance metric, deterministic distance/tie rules;
2. layer assignment and entry point;
3. layer-wise vertex sets, degree limits, and exact candidate-edge multiset `C_l` produced with the same information and candidate-generation budget as each comparator;
4. native HNSW search parameters/interface and native index serialization/load path.

The candidate may not add non-candidate edges, consult a complete k-NN graph unavailable to comparators, alter insertion order to obtain extra information, change layer membership or entry point, change query/search semantics, or claim a custom graph format as native HNSW.

The admissible output at layer `l` is `E_l subseteq C_l` satisfying the frozen directed/undirected interpretation, per-vertex capacity, and the declared entry-reachability/connectivity predicate. If the frozen graph is infeasible under those constraints, the algorithm must return a deterministic infeasibility certificate or a predeclared bounded fallback; it may not silently relax degree, connectivity, or candidate-edge membership.

## Independent collision and absorption review

### 1. FastHNSW/FastKCNA absorbs the broad action

Yang et al., *Fast Graph Construction for Approximate Nearest Neighbor Search* (PVLDB 18(6), 2025), Algorithm 7 and its surrounding text build HNSW by preassigning layers and constructing each layer globally with the paper's optimized graph-construction machinery. The author artifact exposes an HNSW mode, maps its graph degree parameter to HNSW `M`, and states that the resulting FastHNSW index structure is the same as hnswlib. Therefore “global/layerwise HNSW construction,” “parallel layer build,” and “replace serial insertion with a whole-layer constructor” are direct collisions, not residual novelty.

Primary sources used:

- Paper: https://www.vldb.org/pvldb/vol18/p1825-liu.pdf
- Author artifact: https://github.com/xdyangsh/FastKCNA
- Artifact build entry: https://github.com/xdyangsh/FastKCNA/blob/main/code/build_index.cpp

### 2. Connectivity boundary narrows but does not close the atomic residual

The paper distinguishes two relevant actions. Its OptKCNA/NSG construction includes DFS-based connectivity enhancement that finds components and adds edges, so a generic “repair disconnected components after pruning” claim is absorbed and must be a baseline. In the FastHNSW discussion, however, the per-layer HNSW build is described as RNG pruning without that DFS connectivity enhancement. No matching or connected degree-bounded joint selector is specified in the inspected paper.

This is a narrow action-boundary finding, not an absence claim. The public artifact page inspected in this bounded review did not close every transitive call path at a pinned commit. Consequently the latest-collision state remains `SEARCH_BOUNDED_OPEN`, and the revision must source-audit the exact FastHNSW call path before any claim-bearing run.

### 3. Native HNSW constructors absorb ordinary local pruning

The frozen PRIMARY audit of current hnswlib and Faiss source establishes serial/local candidate acquisition, heuristic neighbor pruning, reciprocal-link handling and legal degree/build-width parameters. Those systems are mandatory current baselines. The residual cannot be “use a diversity heuristic,” “cap degree,” “repair reciprocal links,” or “increase `M`/construction breadth.”

Primary source locations retained from the frozen audit:

- hnswlib: https://github.com/nmslib/hnswlib/blob/master/hnswlib/hnswalg.h
- Faiss: https://github.com/facebookresearch/faiss/blob/main/faiss/impl/HNSW.cpp

### 4. Generic b-matching and ordinary repair absorb the obvious decomposition

A degree-capped maximum-weight selection on `C_l` without connectivity is generic b-matching. A pipeline that runs such a selector and then greedily bridges components is an ordinary product control. It is not candidate-specific N2 merely because it is applied to HNSW. A post-hoc bridge can also overflow a saturated endpoint, so degree feasibility and connectivity must be coupled through explicit exchanges, reserved capacity, or augmenting structures.

The strongest objection is therefore substantive: if the revised kernel is only “generic b-matching plus a repair loop,” the paper has no distinct algorithmic contribution beyond a classical formulation and engineering integration. The revision survives only if it freezes a specific joint action and nontrivial property that the product controls do not have.

### Collision disposition

| Action/claim | Disposition |
|---|---|
| Global or layerwise HNSW construction | directly absorbed by FastHNSW/FastKCNA |
| HNSW-local heuristic pruning / reciprocal insertion | absorbed by hnswlib and Faiss |
| Unconstrained or degree-capped edge selection | absorbed by generic b-matching/degree-bounded selection |
| DFS/component bridging after graph pruning | absorbed as an ordinary repair family and specifically present in the paper's NSG path |
| Same-`C_l` joint connected degree-bounded selection with capacity-respecting exchanges and a named new guarantee | not closed by obtained sources; `SEARCH_BOUNDED_OPEN`; finite revision target |

## Sole admissible atomic revision

The revision must replace all broad wording with exactly one kernel:

> Given the frozen HNSW layer candidate graph `C_l`, entry vertex, edge scores/diversity terms, deterministic ties and degree caps, compute a deterministic entry-reachable connected degree-bounded subgraph using a jointly coupled selection-and-exchange/augmentation procedure, and establish one nontrivial HNSW-relevant property that is not provided by FastHNSW, generic b-matching alone, or the frozen ordinary-repair controls.

The property must be mathematically explicit. Acceptable finite shapes include one of:

- feasibility completeness on a named, naturally occurring candidate-graph class plus a checkable infeasibility certificate outside it;
- an approximation or bicriteria bound for the frozen quality objective while satisfying the declared connectivity and capacity constraints;
- a strictly weaker but still nontrivial exchange/augmentation invariant that implies degree safety and entry reachability and separates the method from post-hoc repair.

Merely proving that the final graph is connected and degree-capped after running the code is insufficient; those are output requirements, not an N2 contribution. A generic exact optimizer may be used as a small-instance ceiling/oracle, but “solve a generic connected degree-bounded program” is not by itself candidate-specific novelty.

## Finite closure tests

### A. Exact six-vector witness

The revision must freeze six metric-realizable vectors, their coordinates, metric, deterministic ties, layer membership, entry point, degree caps, and the exact `C_l`. It must enumerate outputs—not verbal tendencies—for:

1. current native hnswlib-style local heuristic;
2. current Faiss-style local constructor under the matched contract;
3. FastHNSW's exact layer action reconstructed from paper and author code;
4. generic b-matching with no repair;
5. at least one strongest ordinary repair with a frozen action catalog;
6. the proposed joint selector;
7. a small exact connected degree-bounded optimizer ceiling where tractable.

The witness passes only if the proposed output is inside `C_l`, never exceeds capacity, satisfies the exact connectivity/entry predicate, and differs for a mechanistic reason tied to the claimed property. If FastHNSW or an ordinary product control produces the same action under the same information, the residual is absorbed. The six-vector witness is a discriminator, not natural-workload performance evidence.

### B. Comparator/action freeze

“Ordinary repair” must not remain a moving label. Before any future claim-bearing run, freeze at least:

- greedy component bridge with deterministic endpoint/edge choice;
- bridge plus one-edge capacity swap;
- reserved-capacity or spanning-tree-first construction if legal on the same `C_l`;
- the strongest generic matching-plus-repair variant found in the bounded collision update;
- a small exact ceiling.

Candidate and baselines receive identical candidate edges, scores, entry/layer information, budgets and deterministic ties. Any baseline adaptation must be minimal and disclosed.

### C. Native end-to-end compatibility

The selected edges must be written through the native hnswlib-compatible layout, saved, loaded, and queried using the native search path. The following must be checked exactly: neighbor-list directionality, upper-layer degree limit versus base-layer limit, reciprocal-edge semantics, entry/max-level metadata, serialization bytes, reload equivalence, and query results before versus after reload. A sidecar graph or custom reader changes the object and cannot support the claim.

### D. Natural evidence route

A later authorized Stage A would need GIST plus at least one independent natural corpus already used by the direct comparator family, such as SIFT, DEEP, GLOVE, CRAWL, or MSONG. The revision must predeclare subset/full-set roles, seeds, query sets, matched recall targets, build budgets and failure handling. A positive toy witness alone cannot justify PASS.

### E. Full-cost route

The cost ledger must include candidate generation, distance computations, scoring, matching/solver time, connectivity/exchange time, integration/conversion, peak RSS, temporary storage, final serialized bytes, save/load time, build failures/fallbacks, and native search QPS/tail latency at matched recall. Solver preprocessing and exact-oracle time must not disappear from the denominator. This route is finite and implementable without changing the frozen object.

## Gate logic

`CONFIRM_REVISE_ONCE` is warranted because the sole atomic proposition has a finite falsifiable route:

1. pin and audit the exact FastHNSW layer call path and bounded latest collisions;
2. define the joint selector, its HNSW-specific objective and one nontrivial guarantee/invariant;
3. close the exact six-vector output table against the full comparator union;
4. demonstrate degree/connectivity legality and native serialization/search equivalence on a small fixture;
5. freeze GIST plus another natural corpus and a complete cost ledger for a later, separately authorized stage.

The revision must terminate as `BELOW_Q2_STOP` if any of the following occurs: FastHNSW already expresses the same frozen action; the candidate collapses to generic b-matching plus a frozen ordinary repair; no candidate-specific guarantee/invariant can be stated; the witness needs extra information or non-candidate edges; feasibility requires violating degree/connectivity semantics; or native serialization/search changes the object.

No implementation or positive experimental result is required to issue this Stage 0 confirmation. Conversely, this confirmation is not permission to start Stage A or Stage B.

## Final sentry state

- Delivery status: complete after the three required artifacts are hashed.
- Lane state after delivery: `IDLE_REUSABLE_AWAITING_MAINLINE`.
- Archival action: none.

