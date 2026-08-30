# Discovery log — Wave103

- Assignment: `DISCOVERY-S3-20260811-V8.7-WAVE103-NATURAL-SKEW-LOCALITY-CONSTRUCTOR-DEEP`.
- Cutoff/rules: 2026-08-11; accepted v8.7+R5-P0; `DISCOVERY_QUALITY_MODE=OFF`.
- Boundary: this directory only. No experiment, benchmark, download, Stage0/A/B, automation or shared-control write occurred.

## Funnel accounting

| Record type | Count | Outcome |
|---|---:|---|
| `RAW_SCREEN_ROW_EVENT` | 6 | RAW-103-01..06 |
| `UNIQUE_OPPORTUNITY_FAMILY` | 6 | UF-103-01..06 |
| `CANDIDATE_GRADE_DEEP_REVIEW` | 6 | CD-103-01..06 |
| `STAGE0_BRIEF` | 0 | none |
| `PROPOSE_STAGE0` | 0 | none |
| `DROP` | 5 | CRAM, Zarr, AAB/APK, FITS, OpenEXR |
| `NOT_ADMITTED_UNFROZEN` | 1 | PCAPNG |

## Result

`COMPLETE_ZERO_PROPOSALS`. Every carrier exhibits natural locality/skew, but five map exactly onto an existing complete native constructor. The PCAPNG action has not been made auditable against a current writer union, so it is retained only as `NOT_ADMITTED_UNFROZEN`. No absence of implementation, positive result, resources or AI readiness was used as a DROP reason.
