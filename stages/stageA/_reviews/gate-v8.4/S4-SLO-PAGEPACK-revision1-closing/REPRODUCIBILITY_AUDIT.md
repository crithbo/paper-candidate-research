# Reproducibility Audit

## Frozen artifact checks

- Revision manifest: `18/18`, no extra files.
- Primary and replay stable files: byte-identical, each `82,975` bytes.
- Stable file SHA-256: `2CA67973C4A80A0470CF354B13F80B48F4802F995BD161CFDF474EFBEF40E19B` for both.
- Validation artifact: `75D311672EC3F2B134AAFF271F39A767A208270CD933CA7B3A70B70286F3AF4E`.
- Contract hash in stable result equals current contract: `86A55019EC2A55B8F1ACC83EDC2359E3D01FAED57D11CE3C0419C16EBEF389A4`.
- Parent stable hash in stable result equals actual parent file: `C4FB253A84F118D828CDACCF7E5F8024EA5FA939C1CD79C86EFBBDE64D942F6E`.
- Parent selection/key/footprint/prediction/initial-page tuples: exact equality in epochs 1–3.
- Stage boundary in both stable files: `stageb=false`, `stageb_user_approval_id=null`.

## Independent arithmetic replay

The recorded policy arithmetic recomputes from stable JSON:

| Epoch | Candidate avg | Composition avg | Composition SLO legal | Recorded residual | Full-cost positive |
|---:|---:|---:|---|---:|---|
| 1 | 4096 | 1092 | false | 4096 against legal-zero fallback | false |
| 2 | 0 | 4232 | true | -4232 | false |
| 3 | 4096 | 1501 | true | 2595 | false |

The five fields rejecting every candidate point are exact solver states, exact solver transitions, target-subset evaluations, capacity probes and hash invocations. No budget values for those fields exist in the frozen contract.

Method relocation streams are distinct and contain 2/0/4 candidate commits and 11/12/9 composition commits across the three epochs. Semantic/final-state hashes match, but this equality is insufficient because semantic replay is keyed by Guide and ignores physical slot overlap.

## Validator coverage gap

`validate_revision.mjs` checks byte equality, selection, layouts, policy JSON, semantic hashes, relocation hashes, cost vectors, decision fields, aggregate legality and Stage B fields. It does not independently reconstruct slot intervals, verify first-fit/adaptive-threshold fidelity, or normalize reclaimed benefit by each layout's total page footprint.

Verdict: `REPRODUCIBLE_PROGRAM_OUTPUT__SCIENTIFIC_CONSTRUCT_VALIDITY_FAILS`.

No owner experiment was rerun and no candidate artifact was modified during this review.

