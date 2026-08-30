# Raw screen row events

| Event | Signature | Disposition | Basis |
|---|---|---|---|
| LOCATOR_TO_RQ | `JNI_PRIMITIVE_ARRAY_CRITICAL__ACQUIRE_RELEASE_GC_PERMISSION_WINDOW__FIXED_JAVA_NATIVE_RESULT_AND_JNI_LEGALITY__HOTSPOT_JNI_FULL_COST` | RQ_FORMED | exact public JNI object and fixed endpoint were frozen before directed evidence |
| RQ_TO_RAW | same | `EXCLUDED_BEFORE_RAW__FIXED_CRITICAL_REGION_CONTRACT_OR_GENERIC_LIFETIME_SCHEDULING` | current contract/source make the permission window observable; altered timing changes legality/data availability/VM progress, unchanged timing is generic lifetime scheduling |

No raw was admitted; no replacement was attempted to improve proposal yield.
