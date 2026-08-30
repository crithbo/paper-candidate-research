# Discovery log — S2 metadata-amplification bottleneck-transfer breadth

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE202-METADATA-AMPLIFICATION-BOTTLENECK-TRANSFER-BREADTH`  
**Cutoff:** 2026-08-11  
**Result:** `COMPLETE_ZERO_PROPOSALS`

Method frozen at dispatch: `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`; `DISCOVERY_QUALITY_MODE=OFF`. Supplied control hashes matched disk: plan `17FB33BEC9564ACF995C0E6A90E30A67F11758402743A2754E09C1262BCB8BF8`, registry `F44FFB7A20546CA853A25AC15737A2CECD6A27134D4F94FC3785C48C37328208`, ROLE `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.

## Breadth funnel

| Family / exact object | Current first-party evidence and stock oracle | Bottleneck-transfer acquisition plan | Result |
|---|---|---|---|
| OCI image manifest/index and descriptor graph for fixed config+layers | [OCI Image Manifest](https://specs.opencontainers.org/image-spec/manifest/); stock OCI resolver checks descriptor digests and media types | A versioned registry mutation history would be required to compare pre/post layer-transfer full cost (blob transfer, manifest/referrer lookup, digest validation, CPU/RSS/bytes/temp/read latency). No such official finite trace was frozen. | `NOT_ADMITTED_UNFROZEN` |
| APT Release/InRelease → Packages → `.deb` authentication chain | [apt-secure](https://manpages.debian.org/unstable/apt/apt-secure.8.en.html); stock APT signature/checksum chain is oracle | A signed Debian-suite update history could split package payload acquisition from Release/Packages parsing and verification, but a same-object union-external constructor was not named. | `NOT_ADMITTED_UNFROZEN` |
| Signed JAR archive with fixed entry bytes and signature contract | [JAR specification](https://docs.oracle.com/en/java/javase/16/docs/specs/jar/jar.html); stock `JarFile`/`jarsigner` semantics | A Maven Central version history could provide successive archive revisions; charge entry write, central-directory/manifest/signature build, verify, bytes/RSS/temp/read. | `STRUCTURAL_DROP` |
| Cargo sparse registry index entry and crate checksum contract | [Cargo registry index](https://doc.rust-lang.org/cargo/reference/registry-index.html); stock Cargo index parser/checksum resolution | Registry version history could split sparse metadata fetch from crate payload, with request count/bytes/cache/CPU/RSS/lock resolution. | `NOT_ADMITTED_UNFROZEN` |
| RPM `repomd.xml` repository metadata and package checksum chain | [RPM repository metadata specification](https://rpm-software-management.github.io/rpm/manual/format.html) plus current DNF/librepo metadata reader must be pinned before any claim | A Fedora compose history would be needed for update/read/verify costs and a stock DNF oracle. Source union was not closed. | `NOT_ADMITTED_UNFROZEN` |
| Python wheel `RECORD` install metadata for fixed wheel payload | [Python binary distribution spec](https://packaging.python.org/en/latest/specifications/binary-distribution-format/); stock installer behavior | PyPI release history could be a natural carrier, but an installer-equivalent verifier and complete current writer/action union were not frozen. | `NOT_ADMITTED_UNFROZEN` |

Rows are six distinct opportunity families. Excluded existing lines include Zarr, HDF5, Arrow, Parquet, ELF GNU hash, PDB/DWARF and PostgreSQL B-tree, as required.

## Candidate-grade deep reviews

### D1 — OCI descriptor/index construction

**Exact same object:** immutable logical OCI image with fixed config blob, ordered layer bytes, descriptor digests/media types, manifest/index semantics and stock resolver observations. The spec requires descriptors for config/layers and supports index/referrer discovery. The current action/config union includes manifest and index construction, descriptors, digest/size/media-type fields, annotations, subject/referrers and content-store blob upload/verification; no absence is inferred from a missing convenience API.

The proposed “joint constructor” would have to choose and publish a different descriptor/index graph over unchanged layer/config bytes while preserving stock resolver behavior and required digest/size/atomic publication semantics. The minimal divergence witness cannot be stated: changing ordering/selection is a resolver policy, adding referrers changes observable graph, and generic repack/copy is an external wrapper. A natural mutation trace and source-level registry writer union are also not frozen. Therefore `NOT_ADMITTED_UNFROZEN`, not a claim that OCI has no performance opportunity.

### D2 — APT authenticated repository metadata

**Exact same object:** one Debian repository suite, its package set and package bytes, Release/InRelease chain, Packages metadata, archive signing key and stock APT update/install semantics. `apt-secure` states that APT validates the signed Release information and package checksums; this is the native verifier and guarantee boundary. Current exposed alternatives include Release/InRelease signing, Packages/Sources generation and compression, and client source/key configuration.

An admissible N2 would need a repository-side constructor jointly changing Packages/Release/index representation while retaining the exact client authentication, freshness, package-selection and package-byte contract. The currently named alternatives either select an existing compression/configuration, change mirror/client policy, or require a custom repository/client wrapper. No union-external whole action, current source pin, or finite trace-to-fidelity route was frozen. `NOT_ADMITTED_UNFROZEN`.

### D3 — signed JAR manifest/signature/central-directory construction

**Exact same object:** a fixed set of JAR entry names and bytes plus manifest, signature and stock JVM/JAR verification behavior. The JAR specification says a signed JAR updates the manifest and adds signature files/block files; per-entry digests are part of the signed contract. Native construction already consists of writing ZIP entries and central directory plus manifest and signature material.

Any purported residual is either (a) choosing compression/layout, (b) an external post-processing/repack pipeline, or (c) changes covered bytes/signature contract. It does not yield a union-external protocol-preserving whole constructor. This is `STRUCTURAL_DROP` by current native union/contract absorption, not by lack of an implementation or results.

### D4 — Cargo sparse index materialization

**Exact same object:** registry package/version/dependency metadata, checksum, yanked state, download endpoint and Cargo resolution/lockfile semantics. The Cargo Book documents both git and sparse index protocols, per-crate metadata fetch/caching validators, and the index checksum field. The current action union includes protocol choice, index entry construction, HTTP cache validators, download endpoint and registry configuration.

Sparse protocol already changes payload-to-metadata transfer behavior. A new “metadata amplification constructor” must be more than protocol/config selection and must preserve solver, lockfile, checksum and update semantics. No legal complete atomic action outside that union was frozen, nor a versioned official registry mutation trace with sufficient construction provenance. `NOT_ADMITTED_UNFROZEN`.

## Fidelity, full-cost and 72-hour falsifier

No topic reaches a brief. For any rescreen, the finite preclaim closure is: pin upstream commit/release and all defaults/non-defaults; obtain a public versioned mutation trace for the exact object; construct two stock-reader-equivalent outputs differing in a named atomic whole action; replay a small trace; measure build/update, read/verify, CPU, RSS, bytes/request count, temporary storage and tail latency; and fail immediately on contract change, current-union expression, wrapper dependence, absent natural trace or no residual under the full denominator. This is a plan only; no code, download, benchmark or experiment was run.

## Outcome

`PROPOSE_STAGE0: []`. The single structural drop is D3; all other rows remain unfrozen rather than being rejected for implementation absence, missing results, resource availability or AI readiness. No Stage0/A/B, shared-control change, automated download, experiment or benchmark occurred. State: `IDLE_REUSABLE_AWAITING_MAINLINE`.
