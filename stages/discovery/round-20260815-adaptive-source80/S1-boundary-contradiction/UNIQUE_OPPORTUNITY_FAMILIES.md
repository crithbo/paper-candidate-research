# Unique opportunity families

## F01 — JNI critical-array acquire/release versus VM GC progress

- Signature: `JNI_PRIMITIVE_ARRAY_CRITICAL__ACQUIRE_RELEASE_GC_PERMISSION_WINDOW__FIXED_JAVA_NATIVE_RESULT_AND_JNI_LEGALITY__HOTSPOT_JNI_FULL_COST`
- History relation: `NO_MATCH__NOT_NOVELTY_PROOF` in the bounded preflight; no newness conclusion follows.
- Current strongest same-object union: Java SE critical API contract, OpenJDK pin/GCLocker acquire/release paths, and specified noncritical copy/region alternatives.
- Natural carrier and oracle: JNI primitive-array numerical/bulk native method; official JNI legality and HotSpot acquire/release semantics.
- Disposition: `EXCLUDED_BEFORE_RAW__FIXED_CRITICAL_REGION_CONTRACT_OR_GENERIC_LIFETIME_SCHEDULING`.

No item qualified as a retained opportunity family because it fails the non-generic same-object action requirement before raw.
