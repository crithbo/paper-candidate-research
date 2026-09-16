# Raw screen row events

| Row | Signature | Result | Reason |
|---|---|---|---|
| S94-S1-R01 | `RUST_THREAD_SCOPE__AUTOMATIC_JOIN_TLS_DESTRUCTOR_COMPLETION_BOUNDARY__FIXED_BORROW_LIFETIME_ENDPOINT__JOIN_CPU_RSS_LATENCY` | `EXCLUDED_BEFORE_RAW__STRUCTURAL_GENERIC_OR_CHANGED_LIFECYCLE` | Extending return to TLS teardown changes the documented boundary; retaining it leaves generic join scheduling. |

Counts: seed 6; RQ 1; locator 1; raw 0; C0/D1/deep 0; clean brief 0.
