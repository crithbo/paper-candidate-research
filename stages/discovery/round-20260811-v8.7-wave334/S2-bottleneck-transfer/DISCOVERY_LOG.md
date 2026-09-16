# Discovery log — Wave334 top Wave327 verified-pipeline closure depth

## Freeze

- Assignment: DISCOVERY-S2-20260811-V8.7-WAVE334-TOP-WAVE327-VERIFIED-PIPELINE-CLOSURE-DEPTH.
- Cutoff 2026-08-11; v8.7+R5-P0; QUALITY_MODE=OFF.
- Frozen controls: AGENTS 66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063; plan 2560CF847C3390A40F218D09CFEA0652BEC7BA31AF220952A0C3B35A3B870363; registry 494E58B07EC49BF29A231B19DB8BE83E2AACD3B5969F89DE0723A1264E257DE6; ROLE FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3.

## Selected Wave327 near-misses

### Android APEX verified mount

Fixed object: exact APEX payload and metadata, complete signing block/signers, package name/version, SDK compatibility and stock apexd verification plus mounted-file result. The immutable whole path is build/package, whole-APEX signing, stock verification and mount. APEX is signed using APK Signature Scheme v3; therefore a payload/ZIP/layout mutation must be re-signed and changes the signed artifact. Current configuration choices surrounding signing/verification are baseline surface, not an action gap.

Required divergence: F0/F1 would need the same APEX logical files and exact stock acceptance, each retaining the same protected representation and signing semantics, while differing through a source-authorized materialization/index constructor with a target-specific guarantee. No such two-file stock-equivalent action is frozen. Splitting, repacking, re-signing, changing verification order or mounting through a wrapper changes representation, guarantee or oracle. No N1/N2 proposition survives.

Natural carrier: version-pinned AOSP APEX fixtures. Oracle: stock package verification and mounted file byte/path scan. Full cost: packaging/signing CPU-RSS-temp-bytes, stored bytes, verification/mount CPU-RSS and cold/warm file access. 72h killer: require F0/F1 stock verification/mount equivalence; fail if any signed bytes/signers, verifier or mount semantics differ, or if remaining action is generic packing/cache/wrapper.

### TCG RIM/event-log replay

Fixed object: versioned RIM/reference data, ordered event log entries, PCR quote and verifier decision. The immutable whole path is measured event production, ordered log serialization, PCR extension, quote, verifier replay and RIM comparison. TCG states that event order is relevant to detecting missing/out-of-order events and that the verifier reconstructs/compares PCR state from logged digests. Thus ordering and digest sequence are attestation semantics, not freely optimizable physical layout.

Required divergence: L0/L1 must have the same measurements, event order, PCR values, quote and verifier decision, but differ by a stock-legal whole construction with a certified target-specific guarantee. No legal action is frozen beyond generic record packing/cache or changed replay/verifier. Batching/reordering, digest substitution, reference-data change or wrapper invalidates same-object/guarantee. No N1/N2 proposition survives.

Natural carrier: version-pinned public TCG RIM/event-log conformance artifacts. Oracle: stock verifier replay, PCR reconstruction and RIM comparison. Full cost: measurement/log construction CPU-RSS-bytes, quote/replay/verification CPU-RSS and cold/warm attestation latency. 72h killer: require L0/L1 identical replay/PCR/RIM result; fail if record order/digest/quote/verifier changes or only generic packing/cache remains.

## Fresh falsification control

A signed JAR header/manifest fast path is a falsification control only, not a candidate: Oracle documents an existing whole-manifest digest optimization and section-only alternative. It demonstrates why an existing verifier optimization/flag cannot be misclassified as a union-external constructor.

## Decision

COMPLETE_ZERO_PROPOSALS; both selected lines are NOT_ADMITTED_UNFROZEN. Current sources establish immutable guarantee boundaries, but complete upstream producer/action enumeration and a legal second representation are not frozen. The outcome is not based on implementation, result, resource or AI-readiness absence.
