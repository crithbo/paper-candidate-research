# All-history five-field identity preflight

Candidate signature:

`JNI_PRIMITIVE_ARRAY_CRITICAL__ACQUIRE_RELEASE_GC_PERMISSION_WINDOW__FIXED_JAVA_NATIVE_RESULT_AND_JNI_LEGALITY__HOTSPOT_JNI_FULL_COST`

| Field | Frozen candidate value |
|---|---|
| Object | Java primitive array accessed by JNI critical-array API |
| Action/estimand | placement of critical acquire/use/release window |
| Endpoint | fixed Java/native values and JNI-critical legality/VM progress contract |
| Guarantee | same API mode, native dataflow, and restrictions on calls/blocking |
| Full cost | pin/GC-lock duration, copy/bytes, native CPU, ref/entry overhead, VM progress, end-to-end native call cost |

A bounded local preflight over `registry.yaml` and `plan.md` found no exact five-field identity for this JNI critical-array family. This is `NO_MATCH__NOT_NOVELTY_PROOF`. Broad runtime/ABI or Java mentions are RELATED_ONLY and were not used to exclude. Frozen terminal and held identities were not opened.
