# WEBGRAPH-REFERENCE-FOREST — Stage 0 Decisive Review

## 1. Administrative record

- Assignment: `STAGE0-D1-20260810-WEBGRAPH-REFERENCE-FOREST-DECISIVE-V8.7`
- Role/mode: `STAGE0_CONFIRMATION_SENTRY_D / DECISIVE`
- Decision: `DECISIVE_STAGE0_PASS`
- Quality tier: `TIER_B_Q2_VIABLE`
- Confidence: `0.84`
- Latest-collision status: `SEARCH_BOUNDED_OPEN`
- Evidence ceiling: `STATIC_SAME_OBJECT_EXACT_FPT_CONSTRUCTION_AND_FIRST_PARTY_COLLISION_AUDIT_ONLY__NO_NATIVE_DIVERGENCE_NATURAL_GAIN_OR_PERFORMANCE_RESULT`
- Stage A authorized by this review: `false`
- Stage B authorized: `false`
- Implementation, experiment or benchmark performed: `none`
- Same-ID revision remaining: `false`

This DECISIVE review resolves only the frozen disagreement between revision1's scientific STOP recommendation and the closing confirmation's policy objection. It does not conduct a third full Stage 0 screen, create a second revision, modify shared state, or start later stages.

## 2. Frozen-input provenance

All four assigned packages were independently hash-checked before adjudication.

| Package | Canonical manifest SHA256 | Entries | Result |
|---|---|---:|---|
| PRIMARY | `E3EED1FDB253ED703F3D546DD6A11CB64E613D2383887050E2C09E5A40A69D68` | 4/4 | PASS |
| Initial confirmation | `24D1112D9CAC73898D84D7483A3AE3D45FB59A9556647E36C4420814386AA07D` | 2/2 | PASS |
| Revision1 | `00DAF995B0A8CCEE08C5DE64291B0CBB829EDD568E41DD03DDD8009055195DD3` | 4/4 | PASS |
| Revision-final closing | `B5E577E5828ED325D8E20913839543D84F5D711BAA722566D4711F4D9BB7CB7E` | 2/2 | PASS |

The accepted closing hashes also match mainline's freeze: report `1F838AA6D361FEB25B2AE2392392AF8F78D080FEDB89AB9E56118DA78333A9E6`, handoff `056B6092AB9A7521EFF05FA9FE9EC759BC75F41089A973B70382744CE68896C1`.

## 3. The disagreement being decided

The parties agree on the following evidence:

1. Current first-party BvCompZ absorbs the broad contribution “introduce a global bounded WebGraph reference forest.”
2. The original `1→0, 2→0` sibling witness is invalid.
3. The abstract `6/10/9` weights and the unfrozen nested-list family are not native divergence evidence.
4. The fair baseline is the complete BvCompZ pipeline: native root/all-reference cost enumeration → best-parent forest → bounded-depth DP → all-edge greedy refill → native stream/offset write.
5. No native successor-list fixture, final-output divergence, natural gain or performance result has been produced.
6. A bounded-window/depth frontier-DP route is finite and same-object in principle.

The sole dispute is whether item 5 means the narrow mechanism is structurally undefined and absorbed (`STOP`), or merely not yet empirically tested after its static mechanism has been defined (`PASS` with a strict evidence ceiling). Under the user's clarified Stage 0 semantics and `ROLE_STAGE0_REVIEW.md`, an already-run native divergence is not a Stage 0 prerequisite. The decisive question is instead whether the narrow proposition is a concrete same-object nontrivial algorithm with a finite fidelity route, rather than a generic oracle.

## 4. Static mechanism closure

### 4.1 Same-object complete-action problem

For each native BvCompZ chunk, freeze:

- exact ordered successor lists and unchanged vertex order;
- native `webgraph 0.6.2` coding semantics and fixed endianness, codes, interval threshold, chunk size, backward window `W`, and finite maximum reference depth `D`;
- the legal action set `A_i`, containing the root action `δ=0` and every nonempty predecessor list at legal delta `1≤δ≤min(W,i)`;
- `c_i(δ)`, the native estimator's emitted graph-stream bit cost for encoding list `i` with action `δ`.

The native source computes each `c_i(δ)` from the exact current and predecessor successor lists. It does not depend on how the predecessor itself was encoded. Thus the frozen graph-stream objective is additive:

`min Σ_i c_i(δ_i)`

subject to `δ_i∈A_i`, root depth `d_i=0` for `δ_i=0`, referenced depth `d_i=d_{i-δ_i}+1`, and `d_i≤D`.

The output remains the ordinary native-compatible BVGraph stream plus offsets/properties and the same exact sequential/random-access reader semantics. No vertex reorder, alternate representation, learned timing oracle, changed query, or extra comparator information is introduced.

### 4.2 Exact frontier dynamic program

After processing lists through `i-1`, retain a frontier state

`s_i=(d_{i-k},…,d_{i-1})`, where `k=min(W,i)`.

Let `F_i(s)` be the minimum prefix graph-stream bit cost among all legal decisions producing frontier state `s`. For every reachable `s`:

1. root transition: choose `δ=0`, append depth `0`, add `c_i(0)`;
2. reference transition: for each legal `δ>0` whose corresponding frontier depth is `<D`, append that depth plus one and add `c_i(δ)`;
3. drop the oldest depth when the frontier exceeds `W`; retain a deterministic predecessor backpointer for reconstruction.

At chunk end, take the minimum over terminal states and reconstruct one optimal legal parent forest.

There are at most `(D+1)^W` depth states and at most `W+1` actions per state. A direct bound is therefore

`O(n·(W+1)·(D+1)^W)` time and `O((D+1)^W)` rolling-value memory, plus reconstruction storage; chunking can bound reconstruction memory.

### 4.3 Exactness argument

The recurrence is exact by the Bellman principle:

- nodes older than `W` cannot be referenced by any future list;
- future action legality depends on a legal predecessor only through its already-fixed chain depth and whether the predecessor list is empty, which is frozen input;
- future transition cost is `c_j(δ)` and is independent of earlier encoding choices except for that depth legality;
- therefore two prefixes with the same last-`W` depth vector have identical feasible future actions and future costs, so retaining only the lower-cost prefix is lossless.

Induction on `i` proves that `F_i` stores the minimum cost for every reachable frontier state and that the terminal minimum is globally optimal over the complete legal native action space.

### 4.4 Why this is not a generic oracle

The candidate method is not “call an optimizer” or brute-force enumeration:

- it names an explicit state, recurrence, reconstruction rule and parameterized complexity;
- it runs linearly in graph length for fixed `W,D`;
- it consumes the same native action-cost table and emits a deployable native forest;
- it guarantees exact optimality over all legal parent actions, whereas the inspected BvCompZ source optimizes a best-parent subforest and then performs sequential greedy refill.

The [first-party BvCompZ source](https://docs.rs/webgraph/latest/src/webgraph/graphs/bvgraph/comp/bvcompz.rs.html) does not state complete-action optimality or an equivalent approximation guarantee. Hence the broad mechanism is absorbed, but the narrow decision rule and guarantee are not directly absorbed on the frozen evidence.

This exact FPT construction is a specific `N2` algorithmic contribution candidate. Its practical usefulness and native headroom remain hypotheses; they are not promoted to results here.

## 5. Three-way decisive test

### `DECISIVE_BELOW_Q2_STOP`

Rejected. Scientific STOP would require direct absorption of the narrow exact optimizer/guarantee, same-object failure, a formal equivalence/impossibility result, a decisive natural counterexample, or full-cost evidence of zero residual. The frozen packages establish none of these. They establish only broad-claim absorption and absence of an already-run native divergence.

### `DECISIVE_INCONCLUSIVE_POLICY_HOLD`

Rejected. HOLD would be required if the existing record lacked either a static same-object proposition, a nontrivial algorithm/guarantee, or a finite fidelity route. The closing record supplies the exact native-cost proposition and depth-frontier construction; the recurrence, complexity and exactness argument above mechanically validate that already-listed construction. The remaining gaps are Stage A risk tests, not an undefined mechanism requiring a second revision.

### `DECISIVE_STAGE0_PASS`

Selected. The narrow fixed-order native complete-action optimizer has:

- a frozen same-object/same-information contract;
- an explicit nontrivial exact FPT algorithm;
- an exact-optimality guarantee over the complete legal action space;
- a finite current-baseline and native serialization fidelity route;
- a falsifiable native-divergence and natural full-cost evidence plan;
- no established direct fatal collision.

It therefore meets conditional `TIER_B_Q2_VIABLE` paper potential. `TIER_A_Q1_POTENTIAL` is not justified: current evidence has no native divergence, scalable state-reduction result, natural-corpus headroom, or full-cost result.

## 6. Evidence ceiling and claim boundaries

Permitted Stage 0 claim:

> Under a fixed finite window/depth native BVGraph contract, complete legal reference selection admits an explicit exact frontier DP/FPT construction, while current inspected BvCompZ source exposes a different heuristic decision pipeline without a checked complete-action optimality guarantee.

Not established:

- that any native graph makes the exact forest differ from final BvCompZ;
- that any such divergence saves bits after native write;
- that the algorithm is practical at default or large `W,D`;
- that natural corpora contain useful residual;
- that total graph-plus-offset size, construction time, memory, decoding or random access improves;
- that the result is novel against every theorem outside the bounded search.

Latest novelty therefore remains `SEARCH_BOUNDED_OPEN`. Transport limitations provide no absence inference.

## 7. First Stage A preclaim fidelity gate

If and only if mainline separately registers Stage 0 PASS and assigns Stage A, the first claim-bearing observation must be preceded by this gate:

`PRECLAIM_NATIVE_COMPLETE_ACTION_DP_FIDELITY_GATE`

The gate closes only when all items below pass on a tiny hand-checkable fixture; none requires a positive BvCompZ divergence:

1. pin `webgraph 0.6.2`, `webgraph-cli 0.4.2`, native source identity, endianness, codes, interval threshold, `chunk_size`, `W`, and finite `D`;
2. enumerate exactly the same root/nonempty legal-reference actions as BvCompZ and extract `c_i(δ)` through the same native compressor/estimator;
3. verify action-cost additivity and match each selected action's estimator cost to the native writer's graph-stream bit delta; scope the theorem to graph-stream bits unless offset-coder state is explicitly added;
4. implement the frozen depth-frontier recurrence and compare its optimum/forest against exhaustive legal-forest enumeration on tiny chunks;
5. send the selected forest through the unchanged native writer and verify exact successor-list equality, offsets/properties readability, sequential decoding and random-list access;
6. run the complete final BvCompZ pipeline under identical information/settings and freeze the full-cost denominators before any comparative claim;
7. exclude divergences caused only by ties, floating-point rounding, incompatible flags, empty-reference mistakes, or a changed chunk boundary.

Failure of any fidelity item fails closed without supporting PASS or STOP. After fidelity closure, the first claim-bearing Stage A killer is a predeclared bounded search for a structural native complete-action divergence from final BvCompZ. No divergence in the frozen search domain, or divergence only from numeric/tie artifacts, is strong negative evidence. A positive tiny fixture is preliminary mechanism support only.

## 8. Later finite evidence route and kill conditions

Only after the preclaim gate and a structural native divergence may an authorized Stage A proceed to GIST plus at least one other natural ordered corpus. The ledger must include graph-stream and offset/property bytes, cost-table construction, DP time, peak RSS/state count, native encode time, sequential decode, random-list access, search/tuning cost and fallback/no-gain strata.

The direction is killed by any of:

- proof or current source showing final BvCompZ already has the same complete-action guarantee;
- failure of the native action-cost/additivity or writer/reader fidelity contract;
- no structural divergence in the predeclared bounded native search;
- only tie/rounding/flag artifacts rather than non-myopic action divergence;
- impractical state growth with no nontrivial reduction and no useful oracle/theory role;
- no natural residual or no residual after the full-cost ledger.

These are later falsifiers, not Stage 0 prerequisites.

## 9. Final mechanical disposition

`DECISIVE_STAGE0_PASS`

Mainline may register a Stage 0 PASS at `TIER_B_Q2_VIABLE` with the evidence ceiling above. This review does not itself mutate registry state or authorize/dispatch Stage A. The consumed revision remains `1/1`; no second revision is requested or permitted.

Post-delivery lane state: `IDLE_REUSABLE_AWAITING_MAINLINE`.
