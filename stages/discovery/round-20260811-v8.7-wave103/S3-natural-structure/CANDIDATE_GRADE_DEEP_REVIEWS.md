# Candidate-grade deep reviews

## CD-103-01 — coordinate-local CRAM constructor

- Exact object: a fixed set of aligned reads, headers and reference interpretation; decoded alignment semantics must be identical.
- Mechanism: coordinate/read-group skew jointly selects container and slice boundaries, preservation series and codecs.
- Strongest union/direct subtractor: current CRAM v3.x container/slice/codecs plus reference/index paths.
- Natural route/full cost: public alignment corpus; reference-valid decode, bytes, encode/decode time, index and memory.
- 72h killer: on a small frozen corpus, reject on any decode/reference mismatch or if every action is already re-expressible through current encoder construction. Not run.
- Result: `DROP`; no named union-external atomic action.

## CD-103-02 — PCAPNG flow-local block constructor

- Exact object: fixed captured packets, timestamps and interfaces under PCAPNG reader semantics.
- Mechanism: flow/time locality would jointly form section, enhanced-packet and option block layout.
- Natural route/full cost: public PCAPNG capture and parser; byte/packet/timestamp equivalence, read/write time, bytes and memory.
- 72h killer: freeze a concrete current writer commit and all configuration, then identify a legal block action outside its union or reject before performance work. Not run.
- Result: `NOT_ADMITTED_UNFROZEN`; no complete upstream writer union/action certificate, not a readiness DROP.

## CD-103-03 — Zarr spatial-regime shard constructor

- Exact object: fixed Zarr array values and standard Zarr v3 reads.
- Mechanism: stable occupancy/compressibility regimes choose a joint shard and inner-chunk layout.
- Strongest union: native chunk grid, shard grid, inner chunk and codec pipeline.
- 72h killer: frozen public array; standard reader must return same values, while complete object requests/storage/read/decode/memory cost is charged. Reject if constructor is union-expressible. Not run.
- Result: `DROP`; direct native construction absorption.

## CD-103-04 — Android configuration-cohort APK constructor

- Exact object: same app behavior and valid signed APKs for a frozen device configuration.
- Mechanism: repeated ABI/locale/density cohorts form a complete feature/configuration split constructor.
- Strongest union: current AAB module/configuration processing, APK generation, alignment and signing.
- 72h killer: one public AAB/device spec, signature verification and installed-content equivalence; full generation/signing/install bytes/time counted. Any non-native layout changes the signed output. Not run.
- Result: `DROP`; union absorption or same-object failure.

## CD-103-05 — FITS pixel-local tiled constructor

- Exact object: fixed FITS image pixels/header semantics.
- Mechanism: local astronomical pixel regimes jointly select tile shapes and legal per-tile codecs.
- Strongest union: registered tiled-image compression and supported compression algorithms.
- 72h killer: frozen image, FITS reader equality, bytes and full encode/decode/memory accounting. Reject if action is native tiling. Not run.
- Result: `DROP`; direct action absorption.

## CD-103-06 — OpenEXR deep/local tiled constructor

- Exact object: fixed OpenEXR channels, pixels and deep samples.
- Mechanism: spatial/depth locality jointly selects tiled chunks and levels.
- Strongest union: OpenEXR tile geometry, levels, compression and reference library write/read behavior.
- 72h killer: frozen EXR; exact reference-reader reconstruction and bytes/write/read/memory accounting; reject on native replay. Not run.
- Result: `DROP`; direct construction absorption.
