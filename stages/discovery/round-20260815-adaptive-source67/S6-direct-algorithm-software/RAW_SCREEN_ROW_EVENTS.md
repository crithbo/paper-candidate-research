# Raw screen row events

| Row | Signature | Event | Disposition |
|---|---|---|---|
| 1 | `RUSTC_INCREMENTAL_QUERY_RED_GREEN_VALIDATION__FIXED_WORKSPACE_EDIT_TRACE__SAME_COMPILATION_SEMANTICS__INCREMENTAL_FULL_COST` | `SEED -> RQ -> SELECTED_LOCATOR -> EXCLUDED_BEFORE_RAW` | `STRUCTURAL_DROP__GENERIC_INCREMENTAL_COMPUTATION_KERNEL` |

Reason: current rustc uses a query DAG/red-green/try-mark-green construction; the remaining proposed action is generic dependency-graph change propagation. Counts: `seeds=8; selected_RQ=1; locators=1; raw=0; C0=0; D1=0; deep=0; clean_brief=0`.
