# Discovery log — Wave241

## Frozen controls

- plan SHA-256: `88271247BACCC0E5FCFEAF311B8324E6F7F7618ED23A345C97EA2E0B80FBF218`
- registry SHA-256: `0E777A6DCF42B53C5276FDD5C4913D37A01C308AE12F967C0FCD632A09A4147C`
- ROLE_DISCOVERY disk SHA-256: `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`
- authority: v8.7 + R5-P0; `DISCOVERY_QUALITY_MODE=OFF`; cutoff 2026-08-11.

## Funnel

| event | count | result |
|---|---:|---|
| `RAW_SCREEN_ROW_EVENT` | 6 | three candidate-grade reviews, two structural drops, one early unfrozen |
| `UNIQUE_OPPORTUNITY_FAMILY` | 6 | FDT, kmod, jimage, ReadyToRun, ORC, build-id |
| `CANDIDATE_GRADE_DEEP_REVIEW` | 3 | all three retain an explicit same-object/delta-composition route but source union is unclosed |
| `STAGE0_BRIEF` | 0 | no grounded brief |

Outcome: `COMPLETE_ZERO_PROPOSALS`.  The three deep items are `NOT_ADMITTED_UNFROZEN`, not resource or readiness drops.  The ORC and build-id rows are structural drops because the requested full constructor violates ordered lookup or observable identity, respectively.

No experiment, benchmark, release-asset download, automation, Stage0/A/B creation, shared-control edit or E-drive use occurred.
