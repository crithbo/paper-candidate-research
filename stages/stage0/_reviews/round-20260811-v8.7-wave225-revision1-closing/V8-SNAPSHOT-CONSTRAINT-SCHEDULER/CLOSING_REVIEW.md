# V8-SNAPSHOT-CONSTRAINT-SCHEDULER — revision1 independent closing review

## Frozen disposition

- Assignment: `STAGE0-C2-20260811-V8-SNAPSHOT-CONSTRAINT-SCHEDULER-REVISION1-CLOSING-V8.7`
- Decision: `CONFIRM_STAGE0_PASS`
- Tier: `TIER_B_Q2_VIABLE__CONDITIONAL_STATIC_CERTIFICATE`
- Revision budget: consumed (`1/1`); no further revision is created or authorized here.
- StageA/B: `false` / `false`
- Evidence ceiling: `STATIC_SAME_OBJECT_ACTION_AND_BOUNDED_EXACT_CERTIFICATE_ONLY`. This is neither a regenerated snapshot nor a raw/compressed-size, startup, RSS, locality, convergence, or natural-carrier result.

## Frozen-input integrity

The control hashes matched the assignment: `AGENTS.md` `66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063`; `plan.md` `05E9F5FA2E666942C062BE9893E5C3C43396ADA0D49F96156877C70C873D89F6`; `registry.yaml` `1AB0FCE0893AE8DA30C35AB19434BC597168EDB770F7F91578BD61E37570DC2F`; and `ROLE_STAGE0_REVIEW.md` `741EC3544797FF8A5BF337E1E3448B5F683823E5229F818F162834400581626E`.

The supplied PRIMARY (`2/2` referenced handoff/manifest), confirmation (`2/2`), and revision1 (`4/4`) package hashes matched their frozen files. Collision status remains `SEARCH_BOUNDED_OPEN`; a failed source-transport attempt is not treated as absence evidence.

## Independent closing attack

### 1. Native same-object action surface and R/A/B/C legality

The revision confines the object to one pinned V8 startup-snapshot build, fixed graph, roots, aliases, partitions, builtins and matching stock deserializer. The candidate changes only writer scheduling among native pending/defer/select/resolve operations; it neither creates a bytecode nor substitutes a reader, profile, external codec, graph, or partition contract.

The typed witness is materially stronger than the earlier schematic one. `R`, `A`, `B`, and `C` are declared old-space `FixedArray` objects reached through ordinary `kAnySlot` paths; their maps are already available via the native map/reference path, and the excluded map/internalized-string/typed-array/byte-array/embedder-field cases are not used. This makes the eligible-defer precondition explicit. The two traces preserve pending obligations and terminate without unresolved forward references. They differ in native pending/reference/hot transitions, not merely in abstract heap position.

The certificate does not claim that stock V8 exposes this schedule as a flag: that absence is the scheduling opportunity. It identifies the legal writer-side selection/intentional-defer policy as operating through the existing pending protocol and stock bytecodes. Stage A must replay the transcript; lack of that replay today is an evidence ceiling, not a static object failure.

### 2. Complete grammar and bounded-live-interface certificate

The catalog includes mandatory root/cache/phase/partition obligations, immediate serialization, eligible intentional deferral, deterministic frontier selection, pending-ID registration/resolution, back-reference/hot/raw/alignment/synchronization forms, and termination only with native obligations discharged. Fixed map-first, read-only/shared, code/partition, nondeferrable-slot and phase rules remain preconditions. This is a complete candidate decision surface rather than arbitrary heap permutation.

V8-DSP retains every future-distinguishable interface value: phase/partition/space/cursor and alignment, typed labelled boundary objects, deferred-frontier class, pending-ID-to-target and reference-map relations, the ordered eight-hot state, native sink/ULEB residue, remaining ports, and exact declared raw-stream/page-proxy cost. State equality is label-preserving over those fields. The recurrence thus has an explicit future-action and declared-cost preservation condition; it does not hide identity enumeration behind an unnamed quotient.

The guarantee is appropriately narrow and honest: exact Pareto computation for the declared bounded interface, with `O(N*f(w))` and exponential visible interface dependence, or a `WIDTH_CAP_EXCEEDED` certificate. It makes no claim of a universal polynomial algorithm, exact compressed size, or an unbounded-graph FPT result. The removal of native pending/reference/hot/allocation terms would reduce the method to the rejected generic scheduling kernel. On the declared contract, this is a nontrivial N2 route rather than a generic ILP, arbitrary beam, or one-score heuristic.

### 3. Strongest union and collision boundary

The revision carries forward a fair same-information union: the pinned stock LIFO protocol; relevant native snapshot controls/partitions/fixed compression path; `reorder_builtins`; stable legal queue; finite raw-byte-only, page-only and hot-recency-only scalar-policy grids; and a tiny exhaustive oracle only as a validator. The `A,C,B` trace is outside the fixed stock-LIFO and declared scalar-policy catalogue because its choice relies jointly on future typed ports, pending IDs, reference relation, and ordered hot state rather than a single declared local feature. It establishes **action divergence only**, not a measured benefit.

CAHPs (OOPSLA 2025) and Native Image ordering (CGO 2025) remain strong broad method/claim subtractors. Their profile/cross-build information, runtime, image format, reader and action grammar are not the frozen V8 same-object contract. They narrow the paper to native V8 deferral scheduling but do not directly absorb the certificate. No current same-object direct absorption or formal failure was established in the frozen first-party source review.

### 4. Full-cost and finite falsification route

The 20–50 frozen V8/Node carrier route is finite in the relevant sense: first replay the tiny schedules through stock deserialization and graph/alias/partition/JavaScript checks, then replay the full union and record scheduler construction, `mksnapshot` CPU/RSS/temp bytes, raw/compressed snapshot sizes, decompression/deserialization/cold-start, RSS/page counters, verification, failure and fallback. Its killer is explicit: native/fidelity failure, union reproduction of the action or guarantee, empty/cap-only frontier, or no strict p50/p90 full-cost Pareto residual. This is a valid Stage A fidelity closure plan, not proof that a natural result already exists.

## Decision rationale

`CONFIRM_STAGE0_PASS` is warranted. The revision closes the single static gate with a same-object native action contract, typed witness, complete constrained grammar, visible target-specific state, bounded exact/certified-failure guarantee, fair strongest-union boundary, and finite Stage A killer. `CONFIRM_STAGE0_PASS` does not certify a performance result.

`STOP` is not justified: no reader/object violation, formal certificate contradiction, current-union absorption, or direct same-object collision was shown. `INCONCLUSIVE_POLICY_HOLD` is also not triggered because the sole revision gate is statically closed rather than left underdefined.

## Mandatory first Stage A preclaim fidelity gate

Before any claim-bearing observation, an authorized Stage A owner must establish all of the following:

1. Build the pinned source and replay both typed `R/A/B/C` schedules using the declared native serializer path and unmodified stock deserializer.
2. Verify exact roots, graph/alias digest, partitions, bytecode legality and JavaScript behavior; reject any trace that needs a new bytecode, reader, profile or object.
3. Demonstrate catalog coverage and replay every declared current-union comparator on the same action surface and information.
4. On tiny instances, compare V8-DSP traces/frontiers against exhaustive legal scheduling; reject any merged-state suffix/action/cost mismatch.
5. Charge the complete planner-to-`mksnapshot`-to-snapshot/decompression/deserialization/verification/fallback ledger, retaining the pre-registered natural-carrier killer.

No Stage A/B is started by this closing lane.
