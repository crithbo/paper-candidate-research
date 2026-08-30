# Raw screen row events

| Row | Family signature | Origin | Pre-screen result | Reason |
|---|---|---|---|---|
| S92-S1-R01 | `POSIX_FORK__ATFORK_HANDLER_RECOVERY_ORDER__FIXED_MULTITHREADED_CHILD_ASYNC_SAFE_ENDPOINT__HANDLER_CPU_RSS_LATENCY` | S92-S1-01 / O1+O6 | `EXCLUDED_BEFORE_RAW__STRUCTURAL_GENERIC_OR_CHANGED_GUARANTEE` | Under the fixed POSIX child-operation boundary, the proposed ordering has no source-supported target-specific decision. Moving recovery work changes the guarantee; retaining it leaves generic synchronization. |

Counts: seed 6 (non-evidence); RQ 1; selected locator 1; evidence-qualified raw 0; C0 0; deep 0; clean brief 0.
