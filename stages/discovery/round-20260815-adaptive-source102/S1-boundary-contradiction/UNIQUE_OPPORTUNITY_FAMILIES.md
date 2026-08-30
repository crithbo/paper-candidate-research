# Unique opportunity families

| Family | Signature | Status | Reason |
|---|---|---|---|
| F102-01 | `POSIX_ROBUST_MUTEX__EOWNERDEAD_CONSISTENT_NONRECOVERABLE__FIXED_PROTECTED_STATE_RECOVERY_ENDPOINT__CPU_RSS_LATENCY` | `EXCLUDED_BEFORE_RAW__APPLICATION_SCHEMA_UNFROZEN_OR_CHANGED_OBJECT` | POSIX supplies notification and the consistency/nonrecoverable state transition, but expressly leaves recovery of the protected state to the application. No public same-object protected-state schema or non-generic recovery action was frozen; adding one would change the object or reduce to generic cleanup. |

Unique accepted family count: **0**. This is a bounded screen, not a field-wide absence claim.

