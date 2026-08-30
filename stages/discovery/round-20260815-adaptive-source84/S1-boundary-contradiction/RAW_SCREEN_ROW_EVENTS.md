# Raw screen row events

| Event | Signature | Result | Reason |
|---|---|---|---|
| LOCATOR_TO_RQ | `POSIX_PTHREAD_ATFORK__PREPARE_PARENT_CHILD_CALLBACK_ORDER__FIXED_POSTFORK_LOCK_STATE_ENDPOINT__GLIBC_FORK_FULL_COST` | RQ_FORMED | exact standard object and same-state endpoint frozen |
| RQ_TO_RAW | same | `EXCLUDED_BEFORE_RAW__CALLBACK_ORDER_IS_OBSERVABLE_OR_GENERIC_LOCK_LIFETIME_CONTROL` | changed trace changes parent/child lock side effects; same trace is generic callback/lifetime administration |

No raw was admitted and no outcome-driven replacement was attempted.
