# Raw screen row events

| Event | Signature | Result | Reason |
|---|---|---|---|
| LOCATOR_TO_RQ | `WEBGPU_GPUBUFFER__MAP_UNMAP_CPU_GPU_OWNERSHIP_WINDOW__FIXED_QUEUE_VISIBLE_BYTES_ENDPOINT__WEBGPU_FULL_COST` | RQ_FORMED | exact buffer state endpoint frozen before evidence |
| RQ_TO_RAW | same | `EXCLUDED_BEFORE_RAW__MAPPING_OWNERSHIP_TRANSITION_IS_OBSERVABLE_OR_GENERIC_LIFETIME_ACTION` | moving map/unmap changes view or queue availability; unchanged action is generic ownership lifetime |

No raw or outcome-aware replacement occurred.
