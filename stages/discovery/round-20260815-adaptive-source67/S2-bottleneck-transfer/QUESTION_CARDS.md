# Question cards — Source67

## S67-01 — Clang PCH AST construction

- Same-object contract: fixed headers/target/translation-unit semantics and object output, accepted by the same Clang AST reader.
- Current union: serialized AST blocks, compact on-disk representation, lazy entity loading, metadata validation, chained PCH, and module DAG handling.
- Full-cost boundary: PCH creation CPU/RSS/temp/bytes, metadata validation, lazy load/deserialization bytes/latency, and total compile time.
- Contrary explanation: a proposed layout/index change is generic serialization/packing already centered in the current reader design.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_LAZY_AST_READER_UNION_OR_GENERIC_SERIALIZATION`.

## S67-02 — HotSpot CDS archive construction

- Same-object contract: fixed class set/JDK options, same CDS loader behavior and program output.
- Current union: static shared archive plus dynamic CDS archive construction under the existing VM format/loader.
- Full-cost boundary: archive generation/relocation/validation CPU-RSS-bytes, startup time, memory footprint, and application runtime.
- Contrary explanation: archive selection/layout/relocation policy with no frozen target-specific action or guarantee.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_STATIC_DYNAMIC_ARCHIVE_UNION_OR_GENERIC_PACKING`.

## S67-03 — containerd OCI unpack/snapshot construction

- Same-object contract: fixed manifest/layer bytes and filesystem tree; same content-store/snapshotter container filesystem endpoint.
- Current union: content ingestion, per-layer ordered active-snapshot create/diff apply/commit, parent reuse, final active snapshot, selectable snapshotter.
- Full-cost boundary: content bytes, apply/unpack CPU/RSS/temp/disk, snapshot metadata/mount, start latency, and end-to-end image-to-container wall time.
- Contrary explanation: snapshotter/differ choice or pull/unpack orchestration; a generic migration wrapper would change the reader/snapshotter contract.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_SNAPSHOTTER_DIFFER_UNION_OR_WRAPPER`.
