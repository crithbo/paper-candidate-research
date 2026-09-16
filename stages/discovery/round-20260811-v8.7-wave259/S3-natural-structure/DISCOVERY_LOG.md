# DISCOVERY_LOG

## Rule freeze

- Assignment: `DISCOVERY-S3-20260811-V8.7-WAVE259-VERSIONED-NATIVE-ARTIFACT-STABLE-IDENTITY-N2N3-BREADTH-II`
- Production rule: `v8.7+R5-P0`; `DISCOVERY_QUALITY_MODE=OFF`; R7 dormant and not used for a canonical decision.
- Dispatch control hashes: `plan.md=9FB53EC61E2B007A6F1787D33AA95E947622B5FE06DB90C30C14451AF1346417`; `registry.yaml=556F5319CF141C233FD925C4E1B7DEF210C22700ACFCE9195AEBCB60E0BC438B`; `ROLE_DISCOVERY.md=FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.

## Funnel

| R5-P0 record class | Count | IDs / outcome |
|---|---:|---|
| `RAW_SCREEN_ROW_EVENT` | 6 | R1–R6, each a distinct official-version native-artifact family |
| `UNIQUE_OPPORTUNITY_FAMILY` | 6 | RPM, APEX, DEX, rmeta, pyc, signed `.ko` |
| `CANDIDATE_GRADE_DEEP_REVIEW` | 3 | DEX and rmeta `NOT_ADMITTED_UNFROZEN`; pyc structural drop |
| `STAGE0_BRIEF` | 0 | No `PROPOSE_STAGE0` |

## Search and decision record

1. Read the frozen minimum control package and excluded all named prior/active objects before sourcing.
2. Used official source/spec/documentation only. The source matrix retains current-source paths, relevant options and counterevidence; no claim of absent functionality is made for DEX or rmeta.
3. RPM, APEX and signed kernel modules fail the exact fixed-artifact condition because signatures/digests authenticate the changed bytes. CPython pyc lacks a stock-reader-preserving external whole constructor. These are structural decisions, not failures caused by missing data, implementation, results, resources or AI readiness.
4. DEX and rmeta each have a possible same-reader placement witness and finite 72h closure plan, but lack a complete pinned current action/config union and a natural held-out transition chain. They remain `NOT_ADMITTED_UNFROZEN`, not Drop and not candidates.

## Result

`COMPLETE_ZERO_PROPOSALS__SIX_FRESH_VERSIONED_NATIVE_ARTIFACT_FAMILIES__TWO_WHOLE_CONSTRUCTORS_UNFROZEN__FOUR_STRUCTURAL_DROPS`
