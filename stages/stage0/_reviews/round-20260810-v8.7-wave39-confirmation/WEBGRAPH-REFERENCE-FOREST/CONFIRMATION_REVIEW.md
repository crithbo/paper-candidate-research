# WEBGRAPH-REFERENCE-FOREST — Stage 0 Confirmation Review

## Administrative record

- Assignment: `STAGE0-C1-20260810-WEBGRAPH-REFERENCE-FOREST-CONFIRM-V8.7`
- Role/mode: `STAGE0-CONFIRMATION-SENTRY / SENTRY`
- Protocol decision: `CONFIRM`
- Scientific decision: `CONFIRM_REVISE_ONCE`
- Quality tier if the revision closes: `TIER_B_Q2_VIABLE`
- Structural paper potential: `CONDITIONAL_TIER_B_Q2_VIABLE`
- Current evidence readiness: `FINITE_ATOMIC_MECHANISM_REFREEZE_REQUIRED`
- Confidence: `0.91`
- Revision budget: `0/1 consumed`; this report does not execute the revision
- Stage A authorized: `false`
- Stage B authorized: `false`
- Experiments or implementation performed: `none`

## Bottom line

I independently confirm that one Stage 0 revision remains scientifically justified, but I narrow the atomic gate's causal wording. The released first-party Rust WebGraph `BvCompZ` absorbs the broad “global bounded reference forest” mechanism. It first selects a maximum-weight best-parent forest, applies a bounded-depth dynamic program, and then performs a greedy refill that scans legal reference alternatives. Therefore, it is not enough to show that best-parent pruning discards an edge. The revision must exhibit a native-realizable action that is missed by the **entire** `best-parent forest → depth DP → all-edge greedy refill` pipeline.

The corrected complete-parent-edge problem still has a finite same-object route: a fixed compression window and reference-depth bound induce a finite backward-edge DAG, and a frontier state over the bounded recent window gives a plausible exact/FPT route rather than an unbounded oracle. This observation is a feasibility argument, not a completed theorem. The revision must bind a native action divergence to one named, nontrivial exact/FPT/approximation/formal property. If either the realizable divergence or the property is absent, the terminal result is STOP.

## Provenance and integrity

The PRIMARY package was independently recomputed before review.

| File | Frozen SHA-256 | Recomputed | Result |
|---|---|---|---|
| `STAGE0_REPORT.md` | `4C465999135884165A6C243048C2D4BF8158CB21003329F541B817BF9ECFD4B0` | same | PASS |
| `Q1_COMPARATOR_MATRIX.md` | `302395CC9F5C302D0B13712B7E5441F0125172D05C8AD972D0AC299A2D62885B` | same | PASS |
| `SOURCE_AUDIT.md` | `5FC55693E123E28569C44F33BA5114857F72ADE6874F87205E0E1D638F7C4DDD` | same | PASS |
| `handoff.yaml` | `3D774DF8122E3A3757804F5B9FD93F7E3D6C529B5D99042A78D0232CDC0C8E40` | same | PASS |
| `HASH_MANIFEST.sha256` self | `E3EED1FDB253ED703F3D546DD6A11CB64E613D2383887050E2C09E5A40A69D68` | same | PASS |

The manifest entries verify `4/4`. The registry assignment, topic, input hashes and unique write directory agree with the frozen handoff. There is no provenance conflict.

## Exact object and non-negotiable contract

The only admissible object is:

- one fixed naturally ordered immutable directed graph;
- exact sorted successor lists and unchanged vertex order;
- one ordinary native-compatible BVGraph graph stream plus offsets/properties;
- exact sequential decode and the same random-list-access semantics;
- fixed backward window, maximum reference-chain depth, native code catalog and chunk contract;
- the same graph and information supplied to every deployed comparator;
- full accounting for candidate-edge costing, construction CPU/RSS, stream and offset bytes, sequential decode, random access and fallback.

Vertex relabeling, an alternate graph format/reader, learned timing information unavailable to comparators, or changed query semantics is an object change and cannot close this revision.

## Independent current-source finding

The bounded first-party release-source evidence supports PRIMARY's decisive collision:

1. The official Rust WebGraph crate exports `BvCompZ` alongside standard `BvComp`, native readers and offsets.
2. `BvCompZ` documents and implements a maximum-weight reference forest over a chunk, a dynamic program that extracts a subforest respecting `max_ref_count`, and a subsequent greedy reintroduction pass.
3. The refill loop evaluates the root and legal window deltas whose chain constraints remain feasible, so alternate parent edges are not categorically absent after initial best-parent pruning.
4. It writes the ordinary BVGraph bitstream and offsets; this is a same-object deployment baseline, not a theoretical union.
5. Zuckerli is a direct paper subtractor for the reference-chain/global-heuristic genealogy and natural compression/decompression evaluation.

Consequently:

- Broad claim “introduce a global bounded reference forest for WebGraph”: `DIRECT_FATAL`.
- Narrow claim “complete legal-parent optimization with a native divergence and a nontrivial formal/algorithmic property beyond the full current pipeline”: `SEARCH_BOUNDED_OPEN`.
- Laconic/Log(Graph)-style alternative representations: adjacent subtractors, not equal-contract baselines.

Official anchors used in the frozen review include the [BvCompZ release source](https://docs.rs/webgraph/latest/src/webgraph/graphs/bvgraph/comp/bvcompz.rs.html), the [Rust WebGraph crate surface](https://docs.rs/webgraph/latest/webgraph/all.html), the [first-party WebGraph repository](https://github.com/vigna/webgraph-rs), and the [official Zuckerli publication record](https://research.google/pubs/zuckerli-a-new-compressed-representation-for-graphs/).

## Discovery witness audit

The Discovery witness contains only `1→0` and `2→0`. Under a path-depth constraint these are siblings of the same root. Selecting `1→0` does not consume the path-depth budget available to `2→0`; both depth-one edges can coexist. The witness therefore demonstrates neither sibling competition nor an action unavailable to `BvCompZ`.

Adding an abstract edge such as `2→1` and assigning hand-written weights can illustrate a possible conflict, but it is not evidence. Native list contents, pinned codes, interval/residual behavior, reference metadata and offset costs must induce the divergence. Author-injected edge costs are forbidden.

## Complete-edge residual and finite algorithmic route

### Why the action space is not already proven closed

The refill is greedy and ordered; the release source does not state that its final forest is globally optimal over the complete legal parent-edge DAG. A globally coupled selection can therefore remain as a search-bounded residual. However, a counterexample must beat the final refilled forest—not merely the intermediate best-parent subforest.

### Why a finite formal route exists

With fixed compression window `W` and maximum reference depth `D`, each new list has a finite root/parent action set. A frontier dynamic program can in principle retain sufficient depth information for the last `W` lists, choose a legal parent or root for the next list, and charge the native edge cost. This yields a finite parameterized route exponential in the bounded frontier rather than an unrestricted whole-graph enumeration. The revision must state and justify the actual state, recurrence, complexity and objective correspondence; this confirmation does not claim the proof is complete.

Other acceptable routes are a proved approximation property or a rigorously characterized tractable subclass. Merely invoking “DP,” “min-cost forest,” an opaque solver, or exhaustive enumeration is not a contribution.

### Atomicity finding

The gate is atomic only when phrased as one linked residual:

`REALIZABLE_COMPLETE_PIPELINE_DIVERGENCE_WITH_COMPLETE_EDGE_FORMAL_RESIDUAL`

> Under one pinned native BVGraph contract, an actual successor-list fixture induces a legal complete-edge forest with strictly lower frozen native objective than the final output of the full current `BvCompZ` pipeline, and the action causing that difference is governed by one named nontrivial exact/FPT/approximation/formal property over the same complete legal-parent DAG.

The realizable action and the property are two required observations about one claim, not two independent opportunities. A counterexample without an algorithmic property is only heuristic auditing; an algorithmic statement without a native action beyond the current pipeline has no same-object headroom.

## Fair comparator contract

The revision and any later authorized work must use the following finite comparator family:

1. Java `BVGraph 3.6.12` over the legal window/depth/interval/code/offset modes.
2. Rust `webgraph 0.6.2` standard `BvComp` over the same contract.
3. Rust `BvCompZ` plus the finite legal CLI/configuration grid, including chunk size.
4. A complete-edge exact oracle only for small instances as a ceiling/correctness oracle.

The small exact oracle is not a deployable baseline. The candidate algorithm must be compared at an equal resource budget, and its own parent-cost enumeration, optimization time and memory must be charged.

## Structural paper potential versus readiness

- `STRUCTURAL_PAPER_POTENTIAL`: conditional Tier B. If the single linked proposition holds, a complete-edge native constructor with an exact/FPT/approximation property, a current same-object heuristic baseline, natural public graph strata and full-cost evaluation has a credible focused Q2 paper shape.
- `CURRENT_EVIDENCE_READINESS`: low but finite. No native fixture, implementation, theorem or natural result is currently established.
- Missing implementation/result: not a STOP reason.
- Missing completed proof: not a STOP reason at Stage 0; the revision only has to state a nontrivial property and a finite route honestly.
- Public CPU-only sources/corpora: sufficient in principle; commercial hardware is irrelevant.

## Exact revision contents

The single revision must provide:

1. actual sorted successor lists and pinned native version, codes, window, depth and chunk settings;
2. the **final** `BvCompZ` output forest after DP and greedy refill;
3. a legal strictly better complete-edge forest under the same native cost, with exact stream/offset/decode preservation stated;
4. one named nontrivial algorithmic/formal property bound to that action, including a finite verification route;
5. a finite Stage A preclaim falsifier and natural-corpus route, without claiming that the main result already holds.

The revision need not contain an implementation, 20–50 corpus results, or a completed paper theorem.

## Terminal conditions

The candidate becomes `BELOW_Q2_STOP__CURRENT_BVCOMPZ_ZUCKERLI_REFERENCE_FOREST_ABSORPTION` if any of the following occurs:

- no native-realizable fixture differs from the **final** `BvCompZ` pipeline;
- the divergence relies only on abstract weights;
- the method is brute force, local greedy scoring, code/window/depth/chunk tuning, or a wrapper/controller;
- no nontrivial exact/FPT/approximation/formal property can be stated for the complete-edge action;
- graph order, exact lists, native stream/offsets, access contract or comparator information changes;
- full candidate construction and access costs cannot be fairly charged.

## Search/transport boundary

The source audit is bounded to the frozen official release-source and paper anchors through `2026-08-10`. During confirmation, one official-page retrieval completed and corroborated the BvCompZ release-source behavior; a subsequent bounded line-range retrieval remained pending and was terminated on mainline instruction. Local Schannel retrieval also failed. These are transport limitations only. They are not used as evidence of absence, novelty, or poor feasibility. No further source retrieval was issued after the mainline boundary.

## Final disposition

`CONFIRM_REVISE_ONCE` with the narrowed atomic gate above. Revision remains `0/1` and unexecuted. This is not Stage 0 PASS and does not authorize Stage A, Stage B, implementation or experiments.

Lane return: `IDLE_REUSABLE_AWAITING_MAINLINE`.
