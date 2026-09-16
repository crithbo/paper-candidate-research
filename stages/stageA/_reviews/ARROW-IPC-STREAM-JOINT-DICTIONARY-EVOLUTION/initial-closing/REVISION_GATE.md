# Frozen Stage A Revision Gate

## Identity

- Gate id: `STATEWISE_SIGNATURE_AWARE_COMPONENT_DOMINANCE_AND_DEDUP_EXACTNESS_GATE`
- Topic: `ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION`
- Revision budget after execution: `1/1 CONSUMED`
- Mechanism pivot: `forbidden`
- Corpus/configuration/object change: `forbidden`
- Stage B: `forbidden`

## Atomic permitted change

Only RP-FDP component dominance, deduplication, and the directly associated exactness tests may change.

For every materialized current state, pruning must preserve the complete nondominated relation over:

`(static cost tuple, deterministic full plan signature)`.

Specifically:

1. A deduplication fingerprint must include the statewise sorted `(cost, full plan signature)` labels, not cost alone.
2. Component `A` may dominate component `B` only if every label represented by `B` has a no-worse label in `A` under the frozen cost order and, for equal cost, a deterministic signature no larger than `B`'s signature.
3. If neither component is statewise no-worse, both must survive even when their cost-only fingerprints match.
4. Component-level structural signature may provide stable output ordering, but may not substitute for the statewise full plan signature in dominance/deduplication.
5. No change may weaken the every-boundary explicit-product equality requirement.

## Mandatory adversaries before any natural rerun

Both adversaries must compare explicit product and corrected RP-FDP at every boundary, state, cost-frontier label, deterministic signature, and final selected native plan.

### A. Delta-disabled observed cut tie

Use the frozen 16-row window from diagnostic SHA-256 `88FF37EF0BCF32CCFBD0666D77F9361D6B33C95A567D721579BAF24B1E9556C6`. It must reproduce the boundary-10 equal-cost alternatives `[0,4,10]` and `[0,9,10]` before correction and show exact product/RP equality after correction.

### B. Delta-enabled equal-cost cut tie

Freeze one minimal deterministic input before execution that exercises both continuation eligibility and replacement under `emit_dictionary_deltas=true`. It must contain an equal-cost cut/history tie whose correct survivor is determined by the full plan signature. Reusing the delta-disabled arm with the flag changed but without a live prefix/no-event/replacement branch is insufficient.

## Unchanged rerun contract

After both adversaries pass, run from scratch without changing any of the following:

- the original 40 natural windows and their frozen carrier/input hashes;
- the 16/16/8 carrier allocation and deterministic window offsets;
- the two delta arms;
- the complete reduced injective ordered dictionary catalog and every internal cut;
- exact-product feasibility caps;
- the natural `R` definition and thresholds;
- the static lexicographic objective and deterministic signature tie-break;
- the same-information strongest union;
- all full-cost dimensions, repetitions, warmup exclusion, Latin arm rotation, p50/p90 reporting, and fallback cost;
- stock writer/reader/checker semantics;
- independent replay2 and digest requirements.

No value-dependent window selection, new corpus search, threshold tuning, reader-timing oracle, posthoc envelope, or reduced comparator is allowed.

## Success rule

Revision success requires all of the following:

1. Both adversaries and the complete preclaim tiny catalog achieve product/RP equality at every boundary for full `(cost, deterministic signature)` frontiers and backpointers.
2. All 40 natural windows retain native legality/equivalence and exact product equality wherever the frozen feasibility cap permits.
3. Useful rank compression occurs on at least `10/40` windows and strict compression on at least `20/40` windows.
4. The candidate is non-dominated by the per-window executable strongest union and matches exact-product bytes where feasible.
5. Full-cost residual occurs on at least `10/40` windows, including at least `2/8` independent-carrier windows.
6. Replay2 reproduces all decision-bearing logical outputs, frontiers, classifications, and required stable digests under the frozen determinism policy.

Passing this gate supports at most `PRELIMINARY_SUPPORT` and a recommendation for `PENDING_USER_STAGEB_REVIEW`; it does not authorize Stage B.

## Failure/STOP kernel

After the corrected implementation is fidelity-valid, any of the following is a narrow scientific killer under the unchanged contract:

- any catalog, legality, product-oracle, frontier, or backpointer mismatch;
- signature-aware pruning makes the representation product-sized under the frozen rank killer (`strict < 4/40` or median ratio `>=1`);
- no full-cost strongest-union residual under the frozen rule;
- current/prior same-object direct absorption;
- replay2 decision instability.

Failure scope is only the frozen RP-FDP mechanism on the frozen object/corpus/contract. It is not a general impossibility claim about Arrow IPC dictionary evolution.

## Revision consumption point

`scientific_revision_consumed` changes from `false` to `true` at the first execution of the corrected signature-aware solver on either mandatory adversary, any preclaim input, or any natural input—whichever occurs first. Merely recording this gate does not execute or consume the revision.
