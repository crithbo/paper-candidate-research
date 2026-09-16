# Discovery log — S2 end-to-end bottleneck-transfer deep review

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE97-ENDTOEND-BOTTLENECK-TRANSFER-DEEP`  
**Cutoff:** 2026-08-11 · **result:** `COMPLETE_ZERO_PROPOSALS`

## Frozen method

Method: accepted `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`; revision `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__discovery-six-lanes-direct-20260811__p1-shadow-not-authoritative`; `DISCOVERY_QUALITY_MODE=OFF`. Every one of the six rows below received candidate-grade deep review; no rapid-only screen is counted as completion.

For every object the full-cost contract includes the formerly optimized compute portion plus the transferred stage, all movement/materialization or persistence, and the final user-visible semantic result. The hypothetical 72-hour killer below is a finite falsifier *if* an action gap were admitted; it is not an experiment that was run.

## Six complete deep reviews

### 1. DuckDB vectorized execution → chunk compaction/materialization — `DROP`

**Cost shift:** after vectorized filter/join execution, chunk compaction and collection materialization can dominate. **Exact object:** same SQL result, ordering/NULL semantics and query errors; **information:** query plan and input relations; **full cost:** scan/compute + selection/compaction + collection/result materialization. Current DuckDB releases record CTE materialization defaults and `VectorType` work; the first-party project is the executable baseline. Crucially, the primary SIGMOD’25 chunk-compaction artifact records that logical compaction was merged into DuckDB. The candidate atomic action—logical compaction of vectorized chunks—has direct current same-object absorption.

**Natural carrier:** DuckDB benchmark query sets with selection-heavy joins. **Hypothetical 72h killer:** reproduce one natural selection-heavy plan and show the frozen action is identical to current logical compaction or cannot change compaction/materialization cost at equal results. This is already structurally precluded by direct absorption; no brief.

### 2. Apache Spark compute → shuffle serialization/merge/index — `DROP`

**Cost shift:** when task compute is reduced, shuffle serialization, buffering, merge/index building, transfer and fetch become dominant. **Exact object:** same RDD/DataFrame/shuffle output and fault/retry semantics; **information:** records, partitioning and cluster topology; **full cost:** map compute + serialize/compress + spill/merge/index + transfer/fetch + reduce. Current official configuration documents the Java/Kryo serializer, compression, direct buffers, shuffle index caches, merge manager, push-based shuffle defaults and thresholds. It is not rejected merely because these APIs exist. The actually named action was choosing serializer/buffer/push/merge arrangements from that union, which is a controller/configuration formulation; no separate full construction/quality guarantee was frozen.

**Natural carrier:** Spark TPC-DS-like shuffle-heavy query trace. **Hypothetical 72h killer:** build a tiny natural shuffle trace and verify that the proposed action is expressible solely by existing `spark.serializer`, shuffle/push and buffer settings, or fails to preserve retry/output semantics. No brief.

### 3. Ray task compute → object-store serialization/materialization — `DROP`

**Cost shift:** after accelerated task execution, object serialization, plasma/object-store placement, reference tracking and materialization can dominate. **Exact object:** same Ray task/actor return object and fault/ownership semantics; **information:** task graph and object values; **full cost:** task compute + serialize + object-store put/get + reference/lifetime handling + consumer materialization. Current Ray upstream exposes the object-store/runtime path and serialization interfaces. The screened action was placement/cache/serialization-path selection, rather than a distinct value-preserving object construction. A changed object representation or ownership rule changes the consumer/runtime contract; a same-object construction and bounded guarantee were not frozen.

**Natural carrier:** Ray’s upstream object-store and actor/task test programs. **Hypothetical 72h killer:** one producer–consumer task graph; fail if the candidate either maps to current serialization/object-store controls or changes reference/fault semantics. No brief.

### 4. FFmpeg decode → frame copy/pixel conversion/materialization — `DROP`

**Cost shift:** after hardware/software decode improvement, frame reference management, copy and colorspace/pixel-format conversion can dominate. **Exact object:** decoded/filtered media with the same timestamps, pixel format and codec/filter output; **information:** encoded stream and filter graph; **full cost:** decode + frame allocation/ref/copy + conversion/filter + mux/output. Current FFmpeg headers expose frame data offsets and output-format changes; official CLI documentation exposes stream mapping and codec-copy/transcode paths. The candidate action was zero-copy/frame-reference or conversion-path selection. Direct access only retains same object when pixel format/layout is unchanged; conversion alters the output representation. No distinct full, same-format copy/materialization construction was frozen.

**Natural carrier:** official FFmpeg sample/media regression corpus. **Hypothetical 72h killer:** compare a one-stream no-format-change transcode and a required-colorspace conversion; fail if zero-copy cannot apply in the latter without format change or is an existing reference-path choice in the former. No brief.

### 5. Redis command compute → dictionary/allocator/object metadata — `DROP`

**Cost shift:** when command compute/networking is streamlined, dictionary metadata, object encoding, allocator retention and expiry bookkeeping can dominate. **Exact object:** same Redis command replies, persistence/expiry and replication semantics; **information:** command stream, key/value state and time; **full cost:** command execution + encoding/dictionary metadata + allocation/lifetime + expiry/persistence/replication. Current Redis upstream exposes the current server/data-structure/runtime configuration surface. The screening action was eviction/encoding/allocator/expiry policy selection; that is controller/tuning. A changed object encoding or metadata structure must retain persistence/replication/client semantics, but no such whole construction was fixed.

**Natural carrier:** Redis upstream unit/integration command traces. **Hypothetical 72h killer:** replay a bounded natural command trace; fail if the candidate is expressible as existing policy/configuration or cannot preserve RDB/AOF/replica semantics. No brief.

### 6. Clang compilation → PCM/module-cache materialization — `DROP`

**Cost shift:** after front-end computation reuse, module/PCM validation, cache lookup, deserialization and AST materialization can dominate. **Exact object:** compiled binary and diagnostics for a fixed source/configuration; **information:** source, headers, module map and compiler flags; **full cost:** parse/semantic work + PCM build/validate/load + AST materialization + codegen + diagnostics. Current Clang modules documentation and LLVM source define modules, module-cache validation and precompiled module paths. The considered action was cache-key/validation/materialization scheduling—native cache policy. A different PCM representation changes module/diagnostic compatibility unless a complete reader/producer proof is provided; none was frozen.

**Natural carrier:** Clang’s module test suite and public C++ projects using module maps. **Hypothetical 72h killer:** build a small upstream module test twice with a modified header/config; fail if the action reduces to cache policy or misses a required diagnostic/invalidation. No brief.

## Evidence and outcome

All six rows use official project source/documentation and current configuration/source facets. They are deliberately not rejected for missing implementation, measurements, downloads, hardware, resources or AI readiness. They fail before admission because they are directly absorbed, controllers/path choices, carrier changes, or lack a frozen whole action with same-object guarantee. No experiment, benchmark, data download, automation, Stage0/A/B or shared-control mutation occurred.

`PROPOSE_STAGE0: []`; state after handoff: `IDLE_REUSABLE_AWAITING_MAINLINE`.
