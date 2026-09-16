# CANDIDATE_GRADE_DEEP_REVIEWS — Wave207

## DEEP-207-01 — Same-complete-OCI-object layer constructor: `DROP`

### Exact object and native oracle

The object is a complete OCI image, not merely a final merged root filesystem. OCI config defines an ordered `rootfs.diff_ids` array and an ordered `history` array; config digest therefore depends on filesystem-layer identity. The manifest has a config descriptor and an indexed ordered layer-descriptor list. The OCI Distribution Specification defines blobs as digest-addressed, requires pull responses to match requested digest, and requires a registry to store a pushed manifest in the *exact byte representation* supplied by the client.

The stock oracle is (1) immutable-digest manifest/config/blob verification, and (2) stock containerd pull plus unpack: content is fetched into the content store and unpacked into a snapshotter. The oracle checks manifest bytes/digest, config rootfs/history, ordered descriptors, blob digests and successful unpacked rootfs/execution configuration—not only final file bytes.

### Controlled N3 law and intended action

The only admissible law would count descriptor/diff-ID reuse between adjacent releases with controls for platform, base image, config/history changes, release interval and image family. It is invariant to registry placement, file layout, blob-fetch order and cache state. The intended N3 utilization is a whole-layer constructor that replaces a layer boundary while leaving the entire object guarantee unchanged. The witness uses two versions with one shared base layer and one changed application layer/config.

### Current source/action/config union

Current OCI image/distribution specifications are frozen at their upstream main documentation pages; BuildKit's current upstream documentation explicitly exposes cache exporters, OCI media type selection and layer compression/level/force-compression controls. Those are all adverse evidence: cache, rebase-like reuse and compression are existing or excluded actions, not new N3 mechanisms. containerd current upstream documentation defines the pull-to-content-store plus unpack-to-snapshotter path. No claim that BuildKit/containerd lack a feature is made; source commits and deployment configuration are not used to manufacture such a claim.

### Structural contradiction and six-dimensional audit

- **Decision / quality:** changing layer boundary, compressed blob or descriptor changes at least a layer digest; changing ordered `diff_ids` or history changes config; changing manifest bytes/descriptors changes manifest digest. Therefore the proposed constructor cannot preserve the frozen complete-object oracle.
- **Information:** all candidate variants start from the same manifest/config/layer content; there is no extra natural information that resolves this contradiction.
- **Complexity/resources/full cost:** an alternative layer arrangement has build, push, pull, unpack, storage and RSS costs, but it is a different artifact. If it does not change layers, descriptor-level reuse is already the native content-addressed union.
- **Generalization/no-gain:** a stable reuse measurement, even if later established, would only describe existing digest-level reuse unless it changes the object. Compression/cache/index/delta alternatives are explicitly outside scope.

The smallest witness cannot be passed: the changed layer boundary necessarily changes the ordered descriptors and digest. A constructor that emits the original bytes is identity, not a nontrivial N1/N2/N3 action.

### Natural route and finite killer (not run)

For 20–50 immutable manifests from one public official image series, freeze descriptor hashes as described in `UNIQUE_OPPORTUNITY_FAMILIES.md`; pre-register the law and hold out release intervals/platforms. Measure descriptor reuse and independently verify each manifest/blob with stock pull/unpack. The killer is immediate: any re-layered output that preserves the final rootfs but changes manifest/config/layer bytes fails the complete-object oracle; any byte-identical output has no action gap. Full cost would include manifest/config/layer bytes, build/update/push/pull/unpack CPU/RSS, content-store bytes, registry transfer and verification. None was run.

### Decision

`DROP` / `BELOW_Q2_STOP` for the stated same-complete-OCI-object formulation. The direct contradiction is semantic, not a finding about missing implementation, results, resources, hardware or AI readiness. No Stage0 brief is recommended.

