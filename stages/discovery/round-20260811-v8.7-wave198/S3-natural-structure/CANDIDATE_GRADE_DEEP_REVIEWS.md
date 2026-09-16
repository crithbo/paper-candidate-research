# CANDIDATE_GRADE_DEEP_REVIEWS — Wave198

## DEEP-198-01 — OCI cross-version canonical constructor: `NOT_ADMITTED_UNFROZEN`

- **Exact object/oracle.** A frozen OCI manifest and its descriptor-referenced config/layer blobs. The exact reader/verifier oracle is descriptor digest equality plus successful OCI image layout/manifest consumption under the frozen platform and media types.
- **Law and confounds.** Measure layer-set Jaccard/reuse only by manifest and blob digest, never registry placement/order. Control base image, platform, config change, image family and time interval; falsify on a held-out repository/platform.
- **Whole action/witness.** Proposed constructor would choose a canonical independent manifest and reuse only identical digest-addressed blobs, preserving config, diff IDs, layer order and manifest descriptor semantics. Witness: two versions share one layer but differ in config and one layer; rebuilt manifests must retain the distinct digests and exact reader result.
- **Current union / gap.** Content-addressed descriptor reuse is intrinsic to the OCI model. The current official spec is frozen, but no current builder source commit, all build flags, registry behavior or full builder action union was captured; an implementation-absence claim is prohibited. No union-external action can yet be named without falling into an external delta/wrapper or changing image semantics.
- **Full cost / 72h killer.** Freeze 20–50 manifest digest pairs and their declared blobs; include manifest/config/layer bytes, construction/update CPU/RSS, reader verification and storage. Reject if reuse does not remain under the preregistered held-out strata, any digest/reader mismatch occurs, or full independent-image cost does not improve. Not run.

## DEEP-198-02 — RPM payload/header reuse constructor: `NOT_ADMITTED_UNFROZEN`

- **Exact object/oracle.** A signed RPM binary package with its lead, signature, header and payload. Oracle is RPM library parsing and signature/package verification under a frozen RPM implementation/configuration.
- **Law and confounds.** Compare per-file payload hashes and header records over adjacent signed releases, controlling source package, architecture, build flags, compression and signing key. The statistic is independent of repository mirror/layout.
- **Whole action/witness.** A candidate must reconstruct a standalone RPM with identical declared payload file semantics, header records and valid signature behavior; a two-version witness changes one payload file while retaining another. It cannot point to a shared external blob or a delta package.
- **Current union / gap.** RPM's specified package sections and RPM-library access are known, but no current `rpmbuild`/RPM source tag, macros, signing policy or strongest builder union was frozen. A constructor outside that union is not presently named; a byte/order optimization risks changing signatures, while an external share is a forbidden wrapper.
- **Full cost / 72h killer.** Freeze a small official repository family by repository metadata checksum and package signature/digest; compare header/payload/signature behavior plus build/update/read/storage/RSS. Any verifier failure or metadata difference kills fidelity; a held-out reuse reversal kills N3. Not run.

## DEEP-198-03 — Go module canonical zip reuse constructor: `NOT_ADMITTED_UNFROZEN`

- **Exact object/oracle.** A `(module, version)` `.zip` and `.mod` served under the module proxy protocol. Go defines deterministic content hashing over module zip file names/contents: file order, compression, alignment and metadata do not affect the module hash. `go mod verify` checks downloaded zip/extracted content against recorded hashes.
- **Law and confounds.** Measure content-file reuse across adjacent versions using the canonical file-name/content relation, stratified by module path, major version, pseudo/release version and excluded nested/vendor files. This is layout-independent.
- **Whole action/witness.** A legitimate action would construct an individually valid canonical module zip with exactly the same module content/hash, then exploit a structurally proven reuse relation without a shared external store. Witness: two versions share files but differ in one file; both zips must independently pass the native hash/reader contract.
- **Current union / gap.** The stock `go` command creates/downloads/extracts zips and authenticates them. Its standard semantics already intentionally erase archive-layout degrees of freedom. No additional complete same-artifact action/guarantee beyond existing canonical zip handling was frozen; deduplicated storage is external caching and excluded.
- **Full cost / 72h killer.** Freeze version URL, `.info`, `.mod`, `.zip`, `go.sum`/sumdb hash and a 20–50 pair sample; include acquisition, zip bytes, construction, verification, read CPU/RSS and storage. Reject on any hash/reader mismatch or held-out stability failure. Not run.

## DEEP-198-04 — NuGet versioned package constructor: `NOT_ADMITTED_UNFROZEN`

- **Exact object/oracle.** A catalog-versioned `.nupkg`, whose package hash and size appear in NuGet catalog data, and its package validation/signature behavior through `dotnet nuget verify` or NuGet validation under frozen tool/config.
- **Law and confounds.** Define entry-content reuse across adjacent versions, stratified by target framework, dependency metadata, signing and symbol package separation; ignore ZIP entry order/compression and catalog indexing time.
- **Whole action/witness.** A complete action must emit a self-contained `.nupkg` with the same package conventions, identifier/version/dependency metadata and verifier outcome; witness changes one TFM asset but preserves another. It may not substitute a sidecar, cache or delta.
- **Current union / gap.** NuGet’s standard pack/validation/indexing pipeline and package verification are documented, but no current NuGet source commit, pack flags, signing policy or full action union was frozen. No residual whole constructor is currently nameable without a generic ZIP repack or semantics change.
- **Full cost / 72h killer.** Freeze catalog leaf/version, SHA-512, package size and 20–50 pairs; compare pack/update/read/storage/RSS and `dotnet nuget verify`/package validation. Any mismatch or controlled held-out law failure rejects. Not run.

All four are `NOT_ADMITTED_UNFROZEN`, not scientific STOP from missing implementation, results, hardware, resources or AI readiness.

