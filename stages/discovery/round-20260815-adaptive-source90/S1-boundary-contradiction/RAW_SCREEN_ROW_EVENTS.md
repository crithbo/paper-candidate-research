# Raw screen row events

| row | signature | disposition | reason |
|---|---|---|---|
| R01 | `IO_URING_MULTISHOT_RECV__PROVIDED_BUFFER_INCREMENTAL_OWNERSHIP_CQE_ENDPOINT__FIXED_LIBURING_SEMANTICS__CPU_RSS_LATENCY` | `EXCLUDED_BEFORE_RAW__CURRENT_NATIVE_INCREMENTAL_BUFFER_UNION_OR_GENERIC_ALLOCATOR` | Current primitives already encode partial buffer ownership/return; residual scheduling is generic allocation, while early reuse breaks CQE ownership. |

Evidence-qualified raw: 0.
