# Raw screen row events

| row | signature | disposition | reason |
|---|---|---|---|
| R01 | `GLIBC_C11_TSS__THREAD_EXIT_DESTRUCTOR_ITERATION_LIFETIME_ENDPOINT__FIXED_THREAD_KEY_VALUE_SEMANTICS__CLEANUP_CPU_RSS_LATENCY` | `EXCLUDED_BEFORE_RAW__FIXED_THREAD_LIFETIME_DESTRUCTOR_ENDPOINT_OR_GENERIC_RUNTIME_LOOP` | Repositioning destruction changes the required lifetime; retaining it leaves generic runtime/loop optimization. |

Evidence-qualified raw: 0.
