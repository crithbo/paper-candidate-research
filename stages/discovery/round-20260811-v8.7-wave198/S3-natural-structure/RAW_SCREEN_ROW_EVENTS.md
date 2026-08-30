# RAW_SCREEN_ROW_EVENTS — Wave198

Assignment: `DISCOVERY-S3-20260811-V8.7-WAVE198-VERSIONED-ARTIFACT-CHURN-STRUCTURE-BREADTH`. Cutoff: 2026-08-11. Authority: v8.7 + R5-P0; `DISCOVERY_QUALITY_MODE=OFF`.

| ID | public versioned artifact carrier and hash route | layout-independent churn/reuse schema | candidate same-semantics constructor / oracle | result |
|---|---|---|---|---|
| RAW-198-01 | OCI image manifests/layers; freeze manifest digest and descriptor blob digests | Consecutive manifest content-addressed layer-set intersection, stratified by platform/config/base; invariant to registry layout/layer order storage | Canonical multi-version manifest/layer construction; OCI descriptor digest verification | `DEEP_DIVE_REQUIRED` |
| RAW-198-02 | signed RPM repository artifact series; freeze repository metadata checksum, RPM signature and package digest | Header/payload file-hash reuse across adjacent NEVRA versions, stratified by source package/architecture/payload compression | Semantics-preserving RPM payload/header constructor; RPM library/signature verification | `DEEP_DIVE_REQUIRED` |
| RAW-198-03 | PyPI wheel file versions; freeze file URL/version plus index digest/`RECORD` hashes | Installed-file hash reuse across adjacent compatible wheels, stratified by tag/project/build | Wheel builder that preserves all install files, metadata and `RECORD`; wheel installer/`RECORD` oracle | `EXCLUDED`: only archive layout/repacking action named; no union-external whole constructor |
| RAW-198-04 | Maven/JAR version series; freeze artifact coordinate/version checksum and signature where supplied | Manifest-entry digest reuse across adjacent JAR releases, stratified by signed/unsigned and target | Signed-JAR-preserving constructor; `jarsigner -verify`/manifest digest oracle | `EXCLUDED`: modifying/repacking signed JAR conflicts with signature semantics or reduces to stock jar creation |
| RAW-198-05 | Go module proxy version `.zip`/`.mod`; freeze `(module,version)` plus `go.sum`/sumdb hash | File-content reuse across module versions computed from canonical module file names/content, invariant to zip order/compression/alignment | Canonical content-equivalent module-zip constructor; `go mod verify`/sum hash oracle | `DEEP_DIVE_REQUIRED` |
| RAW-198-06 | NuGet `.nupkg` version series; freeze catalog leaf/version plus package SHA-512 | Content-entry reuse across package versions, stratified by TFM/signing/dependency metadata | Exact `.nupkg` constructor/validator; `dotnet nuget verify` and package validation oracle | `DEEP_DIVE_REQUIRED` |

Excluded throughout: external delta layers/sidecars, cache/controller, reader-only precomputation, generic ZIP recompression/order choice, and any artifact whose reader, signature, hash, install or builder semantics change.

