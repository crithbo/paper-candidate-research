# Raw screen row events

| Event | Input | Disposition | Evidence-bound reason |
|---|---|---|---|
| S97-E01 | F97-01 / QC97-01 | `EXCLUDED_BEFORE_RAW__FIXED_ENDPOINT_LEAVES_ONLY_GENERIC_LIFECYCLE_POLICY` | Java SE 25 distinguishes orderly `shutdown`, best-effort `shutdownNow`, `awaitTermination`, and blocking `close`; retaining exactly their observable effects leaves no named non-generic atomic or joint construction. |

Evidence-qualified raw count: **0**.

