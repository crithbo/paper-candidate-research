# Zarr v3 shard-index transition — source and collision matrix

| Facet | Current first-party evidence | Consequence |
|---|---|---|
| object semantics | [glossary](https://zarr.readthedocs.io/en/stable/user-guide/glossary/) | metadata defines shape/dtype/grid/codecs; shard is the write/storage unit, inner chunk independently readable. |
| codec/action union | [codecs](https://zarr.readthedocs.io/en/latest/api/zarr/codecs/), [config](https://zarr.readthedocs.io/en/latest/api/zarr/config/) | ShardingCodec/index codecs, codec pipeline and coalescing defaults/non-defaults already cover physical encode/read actions. |
| layout option | [release notes 3.3](https://zarr.readthedocs.io/en/latest/release-notes/) | `subchunk_write_order` is current and affects layout, but is non-persistent runtime codec state—not a new durable constructor. |
| store union | [storage guide](https://zarr.readthedocs.io/en/latest/user-guide/storage/) | Local/Zip/remote/Memory stores have different write/atomicity properties; no uniform crash-safe migration action is inferred. |
| natural carrier | [storage guide](https://zarr.readthedocs.io/en/latest/user-guide/storage/) | public NOAA Zarr store is a natural carrier but not a verified same-array versioned mutation trace. |

**Decision:** `NOT_ADMITTED_UNFROZEN`. Existing layout/pipeline knobs are absorbed; durable representation migration needs source-level atomic publication/recovery and natural mutation closure not frozen here. No documentation silence or specification latitude is used as an absence claim.
