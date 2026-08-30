# Corrected Pre-claim Contract Fidelity Gate

- Gate: `STATEWISE_SIGNATURE_AWARE_COMPONENT_DOMINANCE_AND_DEDUP_EXACTNESS_GATE`
- Status: `PASS`
- Scientific revision: `1/1 CONSUMED`
- First corrected execution: `scripts/revision_exactness.py`, exit 0

The corrected component relation compares every materialized state and label.
A label can cover another only by strict cost dominance, or by equal cost and a
lexicographically no-larger deterministic full-plan signature. Deduplication
fingerprints the sorted statewise `(cost, full signature)` projection. A
component structural signature is used only to order already-identical
projections.

## Mandatory tie adversaries

| Arm | Input | Required branches | Boundaries checked | Result |
|---|---|---|---:|---|
| delta disabled | frozen initial window-11 diagnostic SHA `88FF37EF...E9556C6` | INITIAL, NO_EVENT, REPLACEMENT | 17 | exact full frontier/signature equality |
| delta enabled | rows SHA `530AEBE1...AB555`; freeze SHA `CB345BBD...BF62` | DELTA, INITIAL, NO_EVENT, REPLACEMENT | 11 | exact full frontier/signature equality |

The delta-enabled input was frozen using the uncorrected solver. It exhibited
equal-cost signature mismatches at boundaries 6 and 10 before correction. The
corrected solver matched explicit product at every boundary/state afterward.

## Complete original preclaim

- 26 raw actions reduced to 14 non-increasing representatives.
- Six tiny cases (three inputs, both delta arms) matched explicit product at
  every boundary and at the final deterministic backpointer.
- All seven native event-arm cases and predecessor/dictionary-order/cross-field
  adversaries passed.
- The native 4u<5u crossing witness was accepted by the stock Arrow 25.0.0
  reader with equal ordered values, nulls, schema, and stream determinism.
- Measured cost: 16.737151 s wall, 16.609375 s CPU, 131,633,152 B peak RSS,
  103,151 B maximum deep temporary storage.

Evidence: `artifacts/preclaim_revision_exactness/results.json` and
`artifacts/preclaim/preclaim_results.json`.
