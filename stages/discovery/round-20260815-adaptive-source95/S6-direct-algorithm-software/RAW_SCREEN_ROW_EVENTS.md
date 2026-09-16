# Source95 funnel event log

| Order | ID | Transition | Decision and non-compensatory reason |
|---:|---|---|---|
| 1 | S95-01..S95-06 | `SEED` | Six non-evidence seeds frozen before lookup; none counts as a candidate. |
| 2 | S95-RQ01..RQ04 | `SEED → RQ_CANDIDATE → SELECTED_LOCATOR` | Four exact anchors and same-object RQs converged before results. |
| 3 | S95-QC01 | `SELECTED_LOCATOR → EXCLUDED_BEFORE_RAW` | Coupled Skyframe framing has only generic dependency-invalidation/evaluation actions. |
| 4 | S95-QC02 | `SELECTED_LOCATOR → EXCLUDED_BEFORE_RAW` | Snapshot/delta-base framing is generic delta representation selection. |
| 5 | S95-QC03 | `SELECTED_LOCATOR → EXCLUDED_BEFORE_RAW` | Exact-layout framing reduces to generic constrained line-layout DP. |
| 6 | S95-QC04 | `SELECTED_LOCATOR → EXCLUDED_BEFORE_RAW` | Explicit codec action union plus generic rate-distortion/order kernel absorbs the stated action. |

Counts: seeds 6; RQ candidates 4; selected locators 4; evidence-qualified raw 0; C0 0; D1 0; deep 0; clean briefs 0; source-closure queue items 0. There was no quota, substitution, or outcome-aware backfill.
