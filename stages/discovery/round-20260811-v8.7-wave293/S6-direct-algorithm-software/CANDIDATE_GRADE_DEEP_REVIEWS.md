# Candidate-grade deep review

## D1 — libarchive ZIP whole-writer layout: `NOT_ADMITTED_UNFROZEN`

**Same-object contract.** Input fixes the archive tree, payload bytes, metadata and selected ZIP compatibility subset. Output must preserve stock listing/extraction semantics, including the frozen seekable/streaming, descriptor and Zip64 boundary.

**Minimal legal witness.** Two archives can differ only if their complete local-header, central-directory, offset and descriptor references are regenerated and both stock readers expose the same tree/bytes/metadata. The witness is not frozen because it must distinguish seekable from streaming and Zip64/data-descriptor variants without changing the contract.

**Current strongest union.** Required closure includes libarchive ZIP writer/reader, bsdtar, Info-ZIP where compatible, streaming/seekable paths, Zip64, central/local headers, descriptors, compression/encryption/alignment, order/metadata and all defaults/options. First-party libarchive material supports the native API and tests/options entry, not full current union closure.

**Collision/residual.** Latest primary work on ZIP whole-writer layout, random access, version/delta and archive construction is not closed. No target-specific exact/FPT/Pareto/approximation/formal residual or action absence is asserted.

**Finite fidelity/killer.** Within 72 hours: pin releases/commits/options; produce two stock-reader-accepted outputs for one versioned release-tree corpus; require exact listing/extraction/metadata equality; reject if the proposed difference is generic packing, a flag selection, external recompression, changes streaming/Zip64 semantics, or is already expressed by the complete executable union. Ledger: writer/read CPU-RSS-temp, bytes, read/list/extract latency.

**Decision.** `NOT_ADMITTED_UNFROZEN`, not STOP. Lack of implementation, result, resources or AI readiness is not used negatively.
