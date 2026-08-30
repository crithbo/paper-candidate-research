# Question cards

## QC01 — JNI critical-array GC-permission boundary

### Identity and contract

- Exact public identity: Java SE 26 `GetPrimitiveArrayCritical` / `ReleasePrimitiveArrayCritical`.
- Carrier kind: `NATURAL`; JNI numerical/bulk primitive-array native-method use is the natural carrier class named by the official design rationale.
- Same-object problem: fixed Java array and native read/write dataflow must retain Java-visible values, same direct-access API, and JNI critical-region legality.
- Claim endpoint considered: a target-native N2 lifecycle construction that reduces pin/GC-lock/copy cost without altering the endpoint.
- Network-security exclusion: PASS.

### Evidence-qualified raw gate

- Current official locus: Java SE 26 JNI functions/design plus OpenJDK `jni.cpp` source locus.
- Current union: critical acquire invokes pinning or `GCLocker::lock_critical`; matching release invokes unpinning or `GCLocker::unlock_critical`. The design also exposes noncritical array-elements and region-copy alternatives.
- Default/non-default check: no flag or threshold controls the required critical-region pairing; API-mode choice is a semantic/action boundary and cannot be silently switched.
- Strongest immediate objection: shortening or extending the permission window changes either the native dataflow availability or when the VM may progress; any source-level placement that preserves those conditions is ordinary last-use/lifetime scheduling.
- Minimum falsifier: a native trace with a use after proposed early release, or a mandatory JNI/blocking call while still held. Either violates the fixed endpoint/legality. A trace without either simply reproduces the current release-after-last-use pair.
- Finite route: source-pinned native call trace and JNI legality oracle; no download, build, or experiment is needed for this structural decision.
- Full cost: direct/copy bytes, native CPU, pin/GC-lock duration, JNI entry/release overhead, retained array pressure, and end-to-end native call time.

### Gate disposition

`EXCLUDED_BEFORE_RAW__FIXED_CRITICAL_REGION_CONTRACT_OR_GENERIC_LIFETIME_SCHEDULING`.

The only apparent decision variable is the lifetime boundary that the fixed contract makes observable. Changing it changes the endpoint or violates JNI restrictions. Retaining it is a generic last-use/resource-lifetime choice, not a target-specific N2 algorithm. This is a structural exclusion, not a result/resource/implementation inference.
