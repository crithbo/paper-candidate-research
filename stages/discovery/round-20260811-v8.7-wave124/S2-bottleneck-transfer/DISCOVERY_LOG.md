# Discovery log — S2 materialization current-constructor depth review

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE124-MATERIALIZATION-BOTTLENECK-CURRENT-CONSTRUCTOR-DEPTH`  
**Cutoff:** 2026-08-11 · **result:** `COMPLETE_ZERO_PROPOSALS`

## Frozen method

Method: `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`; revision `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__discovery-six-lanes-direct-20260811__p1-shadow-not-authoritative`; `DISCOVERY_QUALITY_MODE=OFF`. Wave111 checkpoint sources were not rescreened.

Each of the three new families was deep-reviewed against a source-backed current constructor union. An action sketch was required before deciding whether it could be a same-object N2; it was then attacked for reader/format/checker and error-equivalence. No missing implementation, results, resources, download or AI readiness was used as a decision ground.

## Three deep reviews

### 1. TensorFlow SavedModel signature-demand state construction — `NOT_ADMITTED_UNFROZEN`

**Cost shift:** after model computation and graph caching improve, SavedModel load can be dominated by materializing functions, variables/assets and restoring trackable state before first invocation. **Exact object:** a SavedModel signature invocation with the same tensor result, resource-variable state, side effects and error behavior. **Full cost:** artifact read + graph/function deserialization + trackable/asset/variable construction + validation/restore + first invocation.

**Current complete constructor union:** SavedModel serialization/loading, trackable restoration, function graph revival, variable/assets materialization and signature invocation in current TensorFlow source/API. **Union-external action sketch:** construct a *signature dependency closure* that proves a minimal set of variables/assets/functions needed for a requested signature, materializes only that closure, and carries a validation witness that all omitted state is unreachable for that invocation. This is a complete action sketch, not a cache setting.

**Red-team result:** no exact current semantics was frozen for custom objects, resource initializers, stateful functions, side effects and error timing. The evidence needed to demonstrate the closure equals current full-load behavior is not yet bounded. It is therefore `NOT_ADMITTED_UNFROZEN`, not a negative conclusion due to lack of an implementation.

**Natural carrier:** TensorFlow SavedModel test fixtures and public SavedModels with multiple signatures. **72h killer if promoted:** call two signatures before/after loading; fail on tensor, resource-state, side-effect or error mismatch, or if the only action is existing load configuration.

### 2. OpenEXR verification-carrying tile materialization — `NOT_ADMITTED_UNFROZEN`

**Cost shift:** with efficient compression/decompression and I/O paths, deep/tiled image chunk validation, allocation and pixel materialization can dominate reader time. **Exact object:** an OpenEXR image read with the same channel values, metadata, deep-sample structure and malformed-file error behavior. **Full cost:** chunk I/O + header/offset validation + decompression + deep/tile allocation + pixel materialization + reader error path.

**Current complete constructor union:** current OpenEXR chunk/deep/tile readers, format metadata, compression and error/exception paths. **Union-external action sketch:** a *verification-carrying tile DAG* that first constructs a bounded proof of each requested tile’s chunk/header/offset/deep-sample dependencies, then emits an allocation plan and materializes pixels exactly once. It is not a cache/placement policy.

**Red-team result:** the sketch cannot yet freeze identical behavior for all supported compression modes, deep samples, shared metadata and exception timing. A reader that changes validation order may change accepted-malformed-input diagnostics. Current source confirms a broad, evolving format/reader surface, but not a finite equivalence closure. `NOT_ADMITTED_UNFROZEN`.

**Natural carrier:** OpenEXR upstream test images including tiled/deep images. **72h killer if promoted:** read a finite mixed compression/deep corpus and fail on any channel/sample/metadata/error discrepancy or on an action reducible to tile cache configuration.

### 3. libpng CRC-certified row-transform materialization — `NOT_ADMITTED_UNFROZEN`

**Cost shift:** SIMD decode and faster row processing can expose CRC checking, interlace/transform materialization and output-row construction. **Exact object:** PNG decode with the same output pixels, color/transformation semantics and critical/ancillary chunk error handling. **Full cost:** stream/chunk read + CRC verification + inflate/unfilter + row transform + output allocation/copy + diagnostic/error path.

**Current complete constructor union:** current libpng stream/progressive readers, chunk CRC policy, row transforms, SIMD paths and output-buffer APIs. **Union-external action sketch:** a *CRC-certified transform fusion* that jointly constructs each output row and a certificate linking consumed chunk bytes, row filtering and requested transformation; its reader returns only after both row materialization and required CRC/transform obligations are met. This is not merely a zero-copy flag.

**Red-team result:** the sketch lacks a frozen same-API treatment for interlace passes, caller-owned row stride, simplified vs progressive API, and critical/ancillary CRC action settings. It may change error timing or caller buffer semantics. No full same-format action survives current-union and fidelity attack; `NOT_ADMITTED_UNFROZEN`.

**Natural carrier:** libpng `pngtest`/pngsuite and upstream test PNGs. **72h killer if promoted:** compare decoded pixels, transformed row layout and error categories over a bounded valid/malformed corpus; fail on any difference or if action is expressible by current transform/CRC settings.

## Outcome

All three rows have source-backed exact objects, current constructor unions, a non-controller complete action sketch, natural carriers, full-cost denominators and finite falsifiers. None has yet closed the reader/checker equivalence required to claim a grounded brief. This is a scientific admission gap—not an implementation, result, resource or AI-readiness DROP.

`PROPOSE_STAGE0: []`; state after handoff: `IDLE_REUSABLE_AWAITING_MAINLINE`.
