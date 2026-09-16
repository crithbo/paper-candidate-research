# Discovery log — Wave90

## Frozen scope

- Assignment: `DISCOVERY-S3-20260811-V8.7-WAVE90-NATURAL-VERSION-SKEW-COHORT-STRUCTURE`
- Lane/write boundary: `S3-natural-structure` / this directory only.
- Cutoff: 2026-08-11.
- Authoritative rule: `v8.7+R5-P0`; `QUALITY_MODE=OFF`. No v8.8/R7 shadow or dormant semantics were used.
- Method: accepted production Discovery v2/v8.1, R5-P0 funnel records, and current-upstream review when relevant. No implementation, benchmark, large download, downstream stage or shared-control write occurred.

## Funnel

| Record | Count | Result |
|---|---:|---|
| `RAW_SCREEN_ROW_EVENT` | 9 | RAW-90-01 through RAW-90-09 |
| `UNIQUE_OPPORTUNITY_FAMILY` | 4 | UF-90-01 through UF-90-04 |
| `CANDIDATE_GRADE_DEEP_REVIEW` | 4 | CD-90-01 through CD-90-04 |
| `STAGE0_BRIEF` | 0 | none |
| final `PROPOSE_STAGE0` | 0 | none |
| final `DROP` | 3 | Nix, Cargo, OCI: direct current-union absorption or object change |
| `NOT_ADMITTED_UNFROZEN` | 1 | Debian index-history constructor |
| `EXCLUDED` | 5 | compatibility/installer/controller or no constructor |

## Result

`COMPLETE_ZERO_PROPOSALS`. Natural version skew was real in all four deep-reviewed artifact classes, but stable skew alone did not yield a non-absorbed same-object N2/N3 action. Nix and Cargo directly expose the proposed equality/resolution actions; OCI preserves object identity only where current digest sharing applies. Debian's delta-publisher line remains an unfrozen screen record rather than a claim that the current stack is missing functionality.
