# Raw screen row events

| row | signature | disposition | reason |
|---|---|---|---|
| R01 | `MPI_REQUEST_FREE__ACTIVE_POINT_TO_POINT_HANDLE_RELEASE_COMPLETION_VISIBILITY__FIXED_MPI41_ENDPOINT__REQUEST_CPU_RSS_LATENCY` | `EXCLUDED_BEFORE_RAW__COMPLETION_OBSERVABILITY_CONTRACT_OR_GENERIC_APPLICATION_TRACKER` | Request free intentionally removes Wait/Test/error observability; retaining it needs a generic external tracker, while freeing active receives changes buffer safety. |

Evidence-qualified raw: 0.
