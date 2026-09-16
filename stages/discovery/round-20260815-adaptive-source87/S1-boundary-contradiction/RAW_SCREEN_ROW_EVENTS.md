# Raw screen row events

| row | signature | outcome | reason |
|---|---|---|---|
| R01 | `GLIBC_ATEXIT__NORMAL_TERMINATION_REVERSE_REGISTRATION_ENDPOINT__FIXED_C_PROCESS_EXIT_STATUS__EXIT_CLEANUP_CPU_RSS_LATENCY` | `EXCLUDED_BEFORE_RAW__ORDERED_NORMAL_TERMINATION_ENDPOINT_OR_GENERIC_EXIT_RUNTIME_OPTIMIZATION` | Changing callback timing/order or using `_Exit` changes the same-object endpoint; retaining callback semantics leaves generic runtime implementation work. |

Evidence-qualified raw: 0.
