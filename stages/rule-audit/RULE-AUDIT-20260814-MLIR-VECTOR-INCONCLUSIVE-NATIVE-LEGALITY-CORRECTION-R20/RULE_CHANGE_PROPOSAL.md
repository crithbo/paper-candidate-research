# Assignment-local change proposal — MLIR Vector R20A

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260814-MLIR-VECTOR-INCONCLUSIVE-NATIVE-LEGALITY-CORRECTION-R20`
- `proposal_id`: `MLIR-VECTOR-EXCEPTIONAL-STATIC-NATIVE-LEGALITY-CORRECTION-20260814-R20A`
- `decision_label`: `USER_POLICY_DECISION_REQUIRED`
- `user_policy_approval_required`: `true`
- `global_rule_patch_required`: `false`
- `backtest_required`: `false`

## Problem statement

Revision1's only `N/M/F` witness used a non-native `vector.interleave` signature: inputs `2x1x4` cannot directly produce `2x2x4`; native semantics double the trailing dimension and produce `2x1x8`. This invalidates the submitted common plan family and the dependent action/path frontier certificate. It does not prove direct absorption or structural impossibility.

## Current rule and observed behavior

- Ordinary revision `1/1` is consumed.
- Closing correctly placed the topic in `INCONCLUSIVE_POLICY_HOLD__INTERLEAVE_WITNESS_NOT_NATIVE_LEGAL`.
- A second construction is prohibited unless the user freezes the exact topic, atomic gate, count, ceiling and write boundaries; a different reviewer must close it.
- No global rule defect was found.

## Proposed minimum delta

| Surface | Frozen failed semantics | R20A-only semantics |
|---|---|---|
| External object | two `2x1x4` inputs, one `2x2x4` output | unchanged |
| `P_N` | illegal direct `2x1x4 -> 2x2x4` interleave | input casts to `2x2x2`; legal `2x2x2 -> 2x2x4` interleave |
| `P_M` | depended on invalid common base | input casts to `2x4`; legal `2x4 -> 2x8`; result cast to `2x2x4` |
| `P_F` | depended on invalid common base | input casts to `8`; legal `8 -> 16`; result cast to `2x2x4` |
| Value semantics | asserted but not closed for illegal op | explicit index-level ordered-16-f32 equivalence |
| Certificate | action/path and frontier rejected | rebuild typed catalog, cast obligations, `O/Q/H/C`, unchanged-cost frontier and claim delta |
| Method | AVX2 Representation Frontier DP | unchanged |

This is the smallest correction that preserves both input and result types. Merely changing an external type is not acceptable. No new operation is permitted: `vector.shape_cast` and `vector.interleave` were already in the frozen action grammar.

## Exact write boundaries if approved

- Mainline contract: `stages\stage0\_assignments\20260814\MLIR-VECTOR-REPRESENTATION-REGISTER-PRESSURE-PARETO-DP\EXCEPTIONAL_STATIC_NATIVE_LEGALITY_R20A_ASSIGNMENT.yaml`
- Correction output: `stages\stage0\_revisions\MLIR-VECTOR-REPRESENTATION-REGISTER-PRESSURE-PARETO-DP\exceptional-static-native-legality-r20a\`
- Mainline closing contract: `stages\stage0\_assignments\20260814\MLIR-VECTOR-REPRESENTATION-REGISTER-PRESSURE-PARETO-DP\EXCEPTIONAL_STATIC_NATIVE_LEGALITY_R20A_CLOSING_ASSIGNMENT.yaml`
- Independent closing output: `stages\stage0\_reviews\round-20260814-mlir-vector-exceptional-native-legality-r20a-closing\MLIR-VECTOR-REPRESENTATION-REGISTER-PRESSURE-PARETO-DP\`

Required correction artifacts:

- `EXCEPTIONAL_NATIVE_LEGALITY_CORRECTION_REPORT.md`
- `N_M_F_TYPED_ACTION_AND_VALUE_ORDER_CERTIFICATE.md`
- `FRONTIER_AND_CLAIM_DELTA.md`
- `handoff.yaml`
- `HASH_MANIFEST.sha256`

## Safety invariants

- Q2 minimum preserved: yes; no automatic Stage 0 PASS.
- Q1 priority preserved: yes; no tier promotion.
- Same-object preserved: external signature, target, ABI, pipeline and value oracle fixed.
- Latest collision preserved: `SEARCH_BOUNDED_OPEN`; no absence claim.
- Fair current strong baseline preserved: nested stock, VectorLinearize `F`, complete option grid, VPlan/RA/downstream pipeline.
- Natural input/evidence preserved: no Stage A result is claimed.
- Full-cost preserved: all new casts must be charged; static frontier does not replace downstream full-cost testing.
- Reproducibility preserved: immutable old packets, additive directories, exact typed table and strict manifests.
- Claim ceiling preserved: static legality/value-order/frontier only.
- STOP non-revival preserved: current state is nonterminal; STOP only on new true scientific negative.
- User Stage B approval preserved: Stage A/B remain false.

## Fail-closed boundary and fallback

R20A cannot choose a fourth witness or adapt after seeing which type path works. Any need to change target, pipeline, external signature, value mapping, operation/action family, cost model or mechanism is `EXCEPTIONAL_SCOPE_VIOLATION__NO_PASS`. It returns to hold with no further exceptional correction.

After such a failure, the user may separately choose:

- `HUMAN_RESEARCH_RESERVE__USER_DIRECTED_POLICY_HOLD__NO_SCIENTIFIC_STOP`, preserving all artifacts and the exact resume point; or
- reversible withdrawal/parking, also without scientific STOP.

Neither fallback is automatic under R20A.

## Provenance prerequisite

Before dispatch, mainline must resolve the registry/on-disk mismatch for the prior closing handoff:

- manifest-bound/on-disk: `175F9ACE249F4C166EEF598D6641BA144AD0EB0D02F92911A0E5DCDEA3A5D362`
- registry record observed by R20: `175F9ACEFD0060058A6647680337103739B4406CCF32AA4A941A7F3DB0F4D362`

Fail closed until the R20A assignment states which immutable bytes are authoritative and records the mismatch resolution. This is a mechanical provenance fix, not scientific evidence.

## Validation and rollback

- Validate the original PRIMARY, confirmation, revision1 and closing manifests before dispatch.
- Validate every type-product/trailing-dimension equation and every value index independently at closing.
- Recompute, rather than inherit, cast costs and frontier membership under the frozen cost vector.
- Rollback by sealing R20A outputs and preserving the current hold; never overwrite revision1/closing.

## Exact decision request

Use verbatim the authorization block in `RULE_AUDIT_REPORT.md` under “精确用户授权措辞”. Until that text is approved, mainline may only resolve the provenance mismatch; no correction, lane contact, closing or state transition is authorized.

