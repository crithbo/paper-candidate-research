# Discovery log — Source09

Assignment: `DISCOVERY-S3-20260814-ADAPTIVE-SOURCE09`  
Method: canonical `V8_7_POTENTIAL_READINESS_SEPARATED`; claim-pack/V9: `OFF`; cutoff: 2026-08-14.

## Funnel

| Unit | Count | Notes |
|---|---:|---|
| `RAW_SCREEN_ROW_EVENT` | 6 | Six fresh exact-object families, distinct from Source01–08 S3 identities. |
| `UNIQUE_OPPORTUNITY_FAMILY` | 6 | No active/terminal exact-object collision found in the bounded registry check. |
| `CANDIDATE_GRADE_DEEP_REVIEW` | 2 | CLDR/ICU and RefSeq; selected because each has an immutable release panel and a named reader/consumer. |
| `STAGE0_BRIEF` / `PROPOSE_STAGE0` | 0 | No family closes a non-controller same-object action residual. |

## Raw screening

| ID | Exact natural, versioned object | Law / estimand and held-out falsifier | Required same-object action | Result |
|---|---|---|---|---|
| S09-01 | Unicode CLDR release-tagged locale data consumed by ICU locale/collation APIs | Test whether locale-transition edits have a stable, coverage-stratified concentration across release pairs; hold out later release pairs and reject if concentration vanishes after language/script/coverage stratification. | An offline, release-aware CLDR-to-ICU data construction that preserves the same locale API outputs while exploiting predicted transition cohorts. | deep review; `NOT_ADMITTED_UNFROZEN`. |
| S09-02 | NCBI RefSeq consecutive numbered releases and release-catalog replacements/suppressions | Test accession/replacement transition concentration conditional on organism, record class, and release volume; reject on later releases if no concentration beyond stratum-preserving shuffle. | An exact release-transition representation/query construction for accession/status lookup. | deep review; `NOT_ADMITTED_UNFROZEN`. |
| S09-03 | GenBank flat-file numbered releases | Test whether record-section transitions show stable accession-class concentration after controlling release growth and submitter class. | Same-record parse/query construction. | raw only: no non-generic action. |
| S09-04 | NIST NVD JSON 2.0 feeds plus signed metadata | Test CVE modification regimes conditional on CVE age, CVSS/CPE facet, and feed interval; reject on held-out intervals. | Same-CVE query materialization. | raw only: monitoring/index maintenance risk. |
| S09-05 | NIST CPE Dictionary nightly versioned feed/metadata | Test name/deprecation/relationship changes conditional on vendor/product cohort; reject if source-input change explains all transitions. | Same CPE-name matching construction. | raw only: action not closed beyond index maintenance. |
| S09-06 | NCBI dbSNP reference builds / official VCF releases | Test locus-normalized merge/withdrawal/placement transitions by assembly and submission cohort; reject on held-out builds. | Same-variant identifier/placement lookup construction. | raw only: exact stock reader/constructor union remains unfrozen. |

No proposed law is claimed observed. All stated tests are finite StageA closure plans, not Discovery results. No experiment, benchmark, build, install, E2, large download, automation, or downstream-stage action occurred.
