# Stage 0 Revision-Final Closing Confirmation

## Assignment

- assignment: `STAGE0-C2-20260811-ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION-REVISION1-CLOSING-V8.7`
- topic: `ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION`
- role: `STAGE0_CLOSING_CONFIRMATION`
- review date: `2026-08-11`
- revision budget: `1/1 CONSUMED`
- second revision authorized: `false`
- Stage A started: `false`
- Stage B started: `false`

## Mechanical closing decision

`CONFIRM_STAGE0_PASS`

- quality tier: `TIER_B_Q2_VIABLE`
- confidence: `0.85`
- SENTRY disposition: `CONFIRM`
- evidence ceiling: `STATIC_RP_FDP_CERTIFICATE_ACCEPTED__NO_IMPLEMENTATION_PROOF_COMPLETION_NATURAL_RANK_REDUCTION_OR_PERFORMANCE_GAIN`
- latest-collision status: `SEARCH_BOUNDED_OPEN`

Revision1 now defines a narrow same-object optimizer rather than merely selecting an Arrow writer option: over a finite, dominance-reduced catalog of native-legal cuts and physical dictionaries, RP-FDP jointly chooses all fields' dictionary states and shared batch cuts while preserving exact equality/prefix/replacement semantics. The min-plus lower-envelope representation is an exact implicit representation of the explicit Cartesian-product dynamic program under the frozen additive static ledger. It is therefore a recognizable, conditional N2 route beyond local per-field planning and cut pooling.

This is not a finding that useful rank compression, natural gains, a completed proof, or a working implementation already exists. The paper residual survives Stage 0 only if Stage A closes exact catalog coverage, exhaustive-oracle equivalence, native serialization parity, nontrivial natural rank compression, and a full-cost win against the strongest current union. Failure of any of those frozen preclaim gates is a killer, not an invitation to a second Stage 0 revision.

## Review scope and integrity

The closing review read only the project control/rule entry and the assigned revision1 minimum package. It did not read other candidates, start retrieval, run the candidate, execute an experiment or benchmark, or modify shared control files.

The supplied revision1 package was independently hashed and passed `4/4` manifest verification:

| Artifact | SHA256 | Result |
|---|---|---|
| `REVISION_REPORT.md` | `5B583D0159CBEE0578734B18EA304162DBEB4E130B75AAA2A1916F76219ACD48` | PASS |
| `CURRENT_NATIVE_FAMILY_AND_ALGORITHM_AUDIT.md` | `7DE8A7F81CFC46C5E7D0CE9C080B873EC4D5AE78F7715819C0158B7D2B81A43B` | PASS |
| `CLAIM_MATRIX.md` | `70D7B887BF1A792D421E877F99139631AF3A3B9E3B8F9B12E5E8A3EF17E8ED76` | PASS |
| `handoff.yaml` | `55E9D54CDFB01B096E74F1C8101F52128A6E0237CCADE5B4EF637FA9F9D59F17` | PASS |
| manifest self | `02FB4E646FF0847CD72D1C3A72B65B2FF50CA51E2C2CE8DEF214633DD5AF8B5C` | PASS |

Frozen control inputs used for this assignment:

| File | SHA256 at read |
|---|---|
| `AGENTS.md` | `66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063` |
| `plan.md` | `D27AA40E05567899993F2FE86A48DB816CC39862C91991917B56DAD8FA1CC009` |
| `registry.yaml` | `064A2024247198DED4100F9590562761E0D06FF45739EFAF54AA714CCE0E2C94` |
| `rules/ROLE_STAGE0_REVIEW.md` | `741EC3544797FF8A5BF337E1E3448B5F683823E5229F818F162834400581626E` |

## Academic re-review configuration

- workflow: `academic-research-suite / re-review verification`
- primary field: algorithms, data formats, and systems optimization
- contribution paradigm: static formal algorithm certificate plus finite systems-fidelity route
- target tier: credible Q2 minimum
- maturity: Stage 0 revision-final closing
- evidence policy: proposition-level evaluation only; no implementation or positive-result requirement

This verification round ran on the same model family that drove the revisions; over-optimization to this judge's latent biases is possible (Ren et al. 2026, arXiv:2607.13104 §8.1.2). No cross-model adjudication was requested or performed. The decision is therefore grounded in auditable definitions and frozen killer gates rather than stylistic agreement with the revision.

## Priority-item verification record

| Priority item | Closing status | Independent finding |
|---|---|---|
| Complete native action catalog | `FULLY_ADDRESSED_AT_STAGE0` | The finite catalog retains cuts, legal ordered dictionary permutations, optional future values, capacity, null handling, equality, prefix-delta, and replacement. Only duplicate/out-of-universe states are removed under an explicit co-delete/reindex dominance argument. Native completeness remains an executable Stage A gate. |
| Replacement reset and prefix-continuation state sufficiency | `FULLY_ADDRESSED_AT_STAGE0` | Replacement is available only through an eligibility mask; once taken, its emitted cost and future semantics depend on the selected current dictionary, not the earlier predecessor. Equality and proper-prefix continuation retain exact predecessor dependence. |
| Min-plus envelope versus Cartesian-product oracle | `FULLY_ADDRESSED_AT_STAGE0` | For each fixed cut and resource label, distributivity of `min` over the sum of field-local kernels gives the same recurrence as enumerating the full predecessor tuple. Union across legal cuts and removal only of pointwise-dominated components preserve the exact optimum/frontier. |
| Crossing-payload witness `4u < 5u` | `FULLY_ADDRESSED_AT_STAGE0` | With `u=8` bytes the asserted strict comparison is `32 < 40` bytes. The occurrence intervals make the two independent optima choose opposite outer cuts while the joint optimum chooses the excluded middle cut. Exact native buffer/padding realization is deliberately frozen as a preclaim gate; it is not claimed as measured evidence here. |
| Same-`Q` merge safety | `FULLY_ADDRESSED_AT_STAGE0` | Under the frozen static ledger, two histories reaching the same current ordered dictionary `Q` and the same explicit resource label have identical legal futures. Dictionary order is part of `Q`; predecessor order still matters before replacement and is not erased on continuation. |
| Complexity and worst case | `FULLY_ADDRESSED_AT_STAGE0` | The revision explicitly states output-sensitive dependence on surviving rank `R` and admits `R = product(d_f)` in the worst case. It makes neither a worst-case polynomial improvement nor an approximation claim. Envelope-maintenance cost remains a proof/implementation audit item. |
| N2 residual beyond generic product DP/ILP | `FULLY_ADDRESSED_AT_STAGE0` | The residual is not the existence of a generic shortest path or ILP; it is an Arrow-native, exact implicit lower-envelope optimizer whose useful regime is `R * sum(d_f) << product(d_f)`. This is conditionally nontrivial but collapses if natural instances do not exhibit strict rank reduction. |

No priority item is `PARTIALLY_ADDRESSED`, `NOT_ADDRESSED`, or `MADE_WORSE` at the Stage 0 proposition level. The remaining obligations are empirical/proof-completion fidelity gates appropriate to Stage A.

## Independent technical attack

### 1. Native action catalog

The catalog is broad enough for the frozen same-object proposition:

1. The object remains the fixed ordered Arrow stream rows, flat dictionary fields, schema, logical values, nulls, index capacity, and stock-reader semantics.
2. Shared cuts range over all legal row boundaries.
3. Each field state includes every injective ordered physical dictionary covering the values required by the selected interval, including permutations and optional values useful to later intervals.
4. Equality, proper-prefix delta, and replacement are determined from the prior and current ordered dictionaries under fixed writer options.
5. The chosen state maps to caller-built native `DictionaryArray` batches and ordinary record-batch writing; it is not an external codec, modified reader, or input-object substitution.

Removing dictionaries with duplicate entries or values outside the finite stream universe is acceptable only because the plan may co-delete those entries and remap indices without changing decoded rows, while weakly reducing every nonnegative static cost dimension. The revision does not incorrectly remove permutations or optional future values. Null-token treatment is explicitly conditional and must be enumerated in the Stage A catalog audit.

The strongest current comparator remains the union of native caller-defined cuts/dictionaries and current builder/writer policy, not a default-only path. That union absorbs the earlier mere action gap, but it does not itself define the complete joint optimizer or the lower-envelope representation. No direct current-union absorption is established by the frozen package.

### 2. Reset/continuation state sufficiency

The kernel decomposition is coherent:

`K_f(P,Q) = min(K_replace(P,Q), K_continue(P,Q))`.

`K_replace` is finite only when the native eligibility mask permits replacement. On that eligible branch, serialization of the newly selected physical dictionary `Q`, remapped indices, and later legal transitions no longer depends on the earlier dictionary `P`. The mask may still be tested using `P`; this does not invalidate the separable local minimization.

`K_continue` retains the cases that truly depend on the predecessor: equality/no-event and proper-prefix delta continuation. Thus the certificate does not erase history on a branch where the native format still observes it. If peak memory, counter limits, or another resource affects the future, it must be carried in the explicit resource label. The proposition is exact only for the declared label set and static ledger.

### 3. Exactness of the lower envelope

Assume an incoming component

`alpha_r + sum_f v_rf(P_f)`

and a fixed next interval/cut whose shared cost is `c_shared`. The full product transition is

`min_(P_1,...,P_F) [alpha_r + c_shared + sum_f (v_rf(P_f) + K_f(P_f,Q_f))]`.

Because the predecessor domain is the Cartesian product and every nonshared term is field-local, the minimum separates exactly:

`alpha_r + c_shared + sum_f min_(P_f) [v_rf(P_f) + K_f(P_f,Q_f)]`.

This produces one new separable component per incoming component and legal cut/resource case. Taking the union over all previous cuts/components is the Bellman minimum. Removing a component only after pointwise dominance over every current tuple and resource label preserves both the scalar optimum and a properly labelled Pareto frontier. Backpointers recover a native plan.

This argument is conditional on the ledger actually being separable except for terms explicitly placed in `alpha`, and on resource labels preventing an illegal merge. A hidden cross-field serializer cost or state-dependent shared resource would break the stated recurrence; Stage A must either encode it in the shared label/component or kill the proposition. At Stage 0, the decomposition is sufficiently explicit and finitely falsifiable.

### 4. Crossing-payload witness

The witness uses two fields and exactly one internal cut among `b1`, `b2`, and `b3`. Its marginal replacement contributions are:

| Cut | Field A | Field B | Joint |
|---|---:|---:|---:|
| `b1` | `0` | `5u` | `5u` |
| `b2` | `2u` | `2u` | `4u` |
| `b3` | `5u` | `0` | `5u` |

For `u=8`, the middle cut costs 32 bytes while either outer cut costs 40 bytes. Field A's local frontier prefers `b1`; field B's prefers `b3`; an independent-frontier cut pool excludes `b2`, but the joint optimizer selects it. The placement of A's weights over the middle/right regions and B's over the left/middle regions is mutually realizable with fixed ordered rows and per-region filler. Scaling or choosing padded string buffers can preserve the strict crossing while common one-cut metadata cancels.

What is not yet established is an exact byte-for-byte Arrow file instance covering offsets, validity, alignment, dictionary messages, index buffers, and both delta modes. This is a native fidelity obligation, not a need for a new scientific proposition. The witness may support only static action divergence until the exact serialization ledger is checked; it may not be reported as natural gain.

### 5. Same-state merging

The proposed merge does not silently equate `[x,z]` and `[z,x]` while those states remain current. They are distinct ordered dictionaries and therefore distinct `P` states. If both make an eligible replacement into the same `Q=[y]`, the emitted replacement and all subsequent native transitions see `Q`, not the displaced order. Merging them after replacement is valid.

The merge would be invalid if any charged future term retained predecessor identity—for example an incremental construction cache, order-sensitive retained allocation, or a writer counter not represented in the state. Those are precisely the hidden-state cases the tiny exhaustive oracle and catalog audit must test. No such dependency is established in the frozen static model.

### 6. Complexity honesty

The claimed useful bound is output-sensitive, approximately

`O(N^2 L^2 R sum_f d_f^2)`

for the stated catalog parameters, with memory proportional to the stored envelope and backpointers. The explicit product oracle has state factor `product_f d_f`. The revision honestly admits that `R` can equal the product, leaving no asymptotic advantage.

Two qualifications are frozen:

- The published bound must explicitly charge creation, comparison, pointwise-dominance testing, deduplication, and backpointer storage. Pairwise pruning can otherwise add an unreported `R^2`-type term. Retaining unpruned components preserves exactness but changes the operational definition of `R`.
- A useful paper claim requires natural windows with repeated strict rank reduction, not one hand-selected state or an abstract worst-case possibility.

These qualifications limit the claim ceiling but do not refute the algorithmic proposition.

### 7. N2 and generic-optimizer boundary

Min-plus distributivity and Cartesian-product DP are generic facts. They are not, alone, an Arrow paper. The residual N2 is the conjunction of:

- an action-complete native Arrow dictionary-evolution state space;
- exact eligibility-masked reset and equality/prefix continuation kernels;
- joint optimization of multiple field dictionaries with shared cuts;
- an implicit separable lower envelope that can avoid materializing the full product; and
- a declared, measurable residual regime in which surviving rank is strictly smaller than the product.

An ILP or generic product shortest path is a correct exact oracle and comparator, not direct absorption of this implicit representation. Likewise, constructing arbitrary dictionaries and batches is the native action substrate, not the claimed optimizer. Conversely, if RP-FDP stores product-size rank on natural traces, or if a current native planner already exposes the same complete exact lower-envelope optimization, the N2 residual disappears. Those are Stage A/latest-collision killers.

## New-issue scan

No new Priority-1 structural failure was introduced by revision1. The following bounded issues remain below the Stage 0 rejection threshold:

1. `SEARCH_BOUNDED_OPEN`: the assigned closing scope authorized no additional retrieval. No absence inference is made about a latest unseen collision.
2. The complexity expression needs proof-level accounting for envelope maintenance and Pareto/resource labels.
3. The `4u < 5u` witness needs an exact native literal instantiation; until then it proves only a finitely realizable static crossing, not measured whole-stream savings.
4. Genericity risk is high: the contribution is Q2-viable only if Arrow-specific catalog semantics plus natural rank compression deliver a residual beyond ordinary product DP/ILP.

None is a direct-absorption, same-object, or formal-exactness failure on the frozen proposition. Accordingly, `BELOW_Q2_STOP` would be unsupported. `INCONCLUSIVE_POLICY_HOLD` is also unnecessary because the revision provides a static, auditable proposition and a finite preclaim closure route.

## Frozen first Stage A preclaim fidelity gate

No claim-bearing natural run may begin until the following gate is passed in order:

1. **Tiny raw-action catalog equivalence.** Exhaustively enumerate native-legal cuts and raw physical dictionaries for tiny streams, including permutations, optional future values, duplicate/outside-value dominance, null variants, capacity, equality, proper-prefix delta, replacement eligibility, and delta-disabled behavior. Prove that every nondominated raw native plan has a reduced-catalog representative with identical decoded rows and no higher charged cost.
2. **Exact product-oracle equivalence.** Compare RP-FDP against explicit Cartesian-product enumeration and a generic exact oracle for every tiny boundary, current dictionary tuple, resource label, scalarization/frontier point, and backpointer plan—not only the final optimum.
3. **State-sufficiency adversaries.** Exercise same-`Q` histories with different predecessor orders, all event branches, and all shared/resource counters. Any future-cost or legality difference hidden by an RP-FDP merge kills the certificate.
4. **Native crossing witness.** Instantiate fixed rows and exact string literals; audit dictionary metadata, validity/offset/data/index buffers, eight-byte padding, stream framing, and whole-stream bytes. Require the promised strict middle-cut crossing, both configured delta arms, stock-reader decoded equality, and reference graph equality.
5. **Complexity accounting.** Specify the dominance test and charge component generation, pruning/deduplication, resource labels, backpointers, planning time, peak memory, and worst-case product fallback. Verify reported `R` against the stored representation.
6. **Natural rank-compression preregistration.** Freeze finite natural Arrow windows and a nontrivial success threshold before observation. Require repeated strict `R * sum_f d_f < product_f d_f`; product-size behavior throughout is a paper-shape killer.
7. **Full-cost strongest-union killer.** Compare arbitrary caller-defined batch/dictionary plans, current local/builder policies, independent per-field complete frontiers plus optimal shared-cut merge/reoptimization, the explicit product oracle on feasible small cases, and the generic exact formulation. Charge construction/remapping, planner/solver time, writer/reader time, bytes, temporary and peak memory, validation, fallback, and failed search.

Only after items 1–5 pass may natural rank and full-cost observations support a claim. Stage A may narrow the evidence ceiling; it may not silently change the object, catalog, objective, or exactness claim.

## Claim ceiling and killer conditions

Allowed after this closing decision:

- a conditional Stage 0 statement that RP-FDP is a statically defined, exact, output-sensitive same-object optimizer with Q2 paper potential;
- a future Stage A assignment proposed by mainline after registration;
- proposition, catalog, complexity, and fidelity work under the frozen gate.

Not allowed from current evidence:

- implementation completeness;
- proof completeness;
- a natural Arrow rank-compression claim;
- native whole-stream byte, latency, memory, or energy gain;
- superiority to the strongest current union;
- a worst-case polynomial improvement or approximation guarantee;
- Q1 potential.

Scientific killers include catalog incompleteness, an illegal native action, a nonseparable hidden dependency invalidating the recurrence, an RP-FDP/product-oracle mismatch, an unsafe same-state merge, failure to instantiate the native crossing, natural `R` remaining product-size under the preregistered test, no full-cost residual, or direct current/prior-work absorption.

## Final closing statement

Revision1 has consumed the only revision and has repaired the Stage 0 proposition sufficiently for conditional Q2 admission. The decision is therefore `CONFIRM_STAGE0_PASS`, not a request for another revision and not authorization to start Stage A or Stage B. Mainline alone may register the transition and issue any later Stage A assignment.

Lane post-handoff state: `IDLE_REUSABLE_AWAITING_MAINLINE`.
