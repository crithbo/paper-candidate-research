# QEMU-TCG-BOUNDED-RECOURSE-CODE-CACHE — Q1/Q2 comparator

- Stage: `STAGE0`
- Venue family: DBT / systems / EDA infrastructure
- Calibration status: `PARITY_CONDITIONAL`
- Quality tier: `TIER_B_Q2_VIABLE`
- Cutoff: 2026-08-14

| Role | Reference | Status/read scope | Why it calibrates shape |
|---|---|---|---|
| Contribution anchor | QEMU MTTCG design | official current documentation | fixes the native global-state, quiescence, invalidation and direct-chain contract |
| Evaluation anchor | QEMU translator internals and official tests | official current documentation | fixes guest/exception equality and the stock oracle route |
| Method neighbor | Dynamic binary translation code-cache management | `SEARCH_BOUNDED_OPEN`; no same-object direct source verified | adjacent only unless all QEMU semantic predicates close |
| Negative anchor | QEMU current `tcg/region.c` + `tb-maint.c` | official current source | rules out treating multi-region allocation or `tb_flush` reset as an unreviewed absence gap |

| Dimension | Candidate if revision closes | Current anchor | Gap | Disposition |
|---|---|---|---|---|
| Problem | costly capacity reset of retained translations | current flush/reset behavior | natural magnitude unmeasured | Stage A |
| Method | reference-closed bounded migration | region allocation + full flush + invalidation | must exclude generic compactor | revision gate |
| Correctness | guest/exception and stale-reference safety | host-PC/page/direct-chain contracts | two-plan witness absent | revision gate |
| Baseline | full native union under equal information | flags and source actions | finite, complete replay plan | closed design gate |
| Evaluation | QTest/unit + system/user subset + full cost | official test route | no results asserted | Stage A |
| Reproducibility | pinned blob catalog | current master locators | immutable commit pending | revision gate |

Reviewer assessment: conditional Q2 shape is plausible only with a target-specific recurrence/guarantee and the complete repair certificate. A policy that merely chooses TB victims or `tb-size` is not a paper contribution. Q1 is not currently plausible without broad target-host validation and stronger theory.
