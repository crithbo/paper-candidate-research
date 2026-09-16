# Raw screen row events

| row | signature | gate outcome | reason |
|---|---|---|---|
| R01 | `POSIX_PTHREAD_CANCELLATION_CLEANUP__LIFO_SCOPE_UNWIND_ENDPOINT__FIXED_C_THREAD_EXIT_STATUS__CLEANUP_CPU_LATENCY_RSS` | `EXCLUDED_BEFORE_RAW__FIXED_LIFO_CLEANUP_ENDPOINT_OR_GENERIC_RUNTIME_OPTIMIZATION` | The same-object guarantee fixes handler order, scope validity, effects, and thread endpoint. Proposed re-placement breaks this contract; retained legal work is a generic runtime/codegen optimization. |

Evidence-qualified raw: 0.
