# SOURCE_COLLISION_MATRIX — Wave207

| facet | first-party upstream source | current fact / adverse evidence | consequence |
|---|---|---|---|
| config/rootfs/history | [OCI config specification](https://github.com/opencontainers/image-spec/blob/main/config.md) | ordered DiffIDs, history, config digest relation; layers are filesystem changesets | re-layer changes a frozen object field |
| layer semantics | [OCI layer specification](https://github.com/opencontainers/image-spec/blob/main/layer.md) | layers are ordered tar-based filesystem changesets | final-rootfs-only comparison is insufficient |
| manifest/blob contract | [OCI Distribution Specification](https://github.com/opencontainers/distribution-spec/blob/main/spec.md) | manifests/config/layers are descriptors; blobs digest-addressed; exact manifest bytes stored; pull/HEAD verification | immutable bytes/digests form oracle |
| stock builder controls | [BuildKit upstream](https://github.com/moby/buildkit) | cache exporters; `oci-mediatypes`, compression, compression-level, force-compression and cache-manifest controls | cache/compression flags not action gap |
| stock reader/unpack | [containerd content flow](https://github.com/containerd/containerd/blob/main/docs/content-flow.md), [pull/unpack](https://github.com/containerd/containerd/blob/main/docs/getting-started.md) | manifest references config/layers; pull loads content store and unpacks snapshotter | rootfs-only proxy insufficient |

`CURRENT_UPSTREAM_REALITY_CHECK`: completed at official spec/docs/source boundary. No implementation absence is asserted. The DROP follows from the explicit object contract itself: a nonidentity whole-layer action alters a frozen observable digest/config/manifest component.

