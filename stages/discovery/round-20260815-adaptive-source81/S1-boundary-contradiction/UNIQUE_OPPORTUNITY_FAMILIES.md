# Unique opportunity families

## F01 — FFM Arena scope closure and MemorySegment temporal accessibility

- Signature: `JAVA_FFM_ARENA__SCOPE_CLOSE_TEMPORAL_ACCESSIBILITY__FIXED_MEMORYSEGMENT_FOREIGNCALL_ENDPOINT__JAVA_FFM_FULL_COST`
- History relationship: `NO_MATCH__NOT_NOVELTY_PROOF` within the allowed preflight surface.
- Current strongest union: documented global/automatic/confined/shared arena options, mandatory close invalidation/reclamation, and current foreign-memory session implementation locus.
- Natural carrier/oracle: Java FFM allocation/downcall use; `Arena.close`, `scope().isAlive()`, and access failure semantics.
- Disposition: `EXCLUDED_BEFORE_RAW__CHANGED_TEMPORAL_THREAD_GUARANTEE_OR_GENERIC_REGION_LIFETIME_ANALYSIS`.

This exclusion does not claim that Arena implementation, data, resources, or measured performance are inadequate.
