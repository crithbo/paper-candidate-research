# Discovery log — S2 OpenVDB tree-node/block access-layout N2 closure

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE248-OPENVDB-TREE-NODE-BLOCK-ACCESS-LAYOUT-N2-CLOSURE`  
**Cutoff:** 2026-08-11  
**Result:** `COMPLETE_ZERO_PROPOSALS`

Frozen method: `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`; `DISCOVERY_QUALITY_MODE=OFF`. Dispatch control hashes matched disk: registry `49147E2E5B9B3557A39A0F2E18BD8B8BED30D9BD2D8B90EFBDF45EF47C18C221`, plan `708A4F7309DEB312A484427565E69C420EAE79B4AE83F00589CE01FF92A0A314`, ROLE `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.

## Same object, source pin and complete current union

**Exact object:** one OpenVDB grid with fixed tree topology, active/inactive states, voxel/tile values, transform, grid class, metadata, version/format contract and stock OpenVDB file/API observations. Compression choice, delayed-load build feature and stream/file metadata are part of the fair baseline. A changed topology/value/transform, NanoVDB/custom reader, wrapper, lossy representation, or compression-only variation is excluded.

**Source pin:** `AcademySoftwareFoundation/openvdb` `master` = `2ad18b6aebf69240f8db78c08c6f9bbee896c553`, queried 2026-08-11. The [I/O API](https://www.openvdb.org/documentation/doxygen/io_8h.html) exposes file/version, grid metadata, write-statistics and compression metadata; its data-compression union includes `COMPRESS_NONE`, `COMPRESS_ZIP`, `COMPRESS_ACTIVE_MASK` and `COMPRESS_BLOSC`. The [current namespace documentation](https://www.openvdb.org/documentation/doxygen/namespaceopenvdb_1_1v13__0_1_1io.html) exposes read data plus optional delayed-load metadata. [LeafNode source](https://www.openvdb.org/documentation/doxygen/LeafNode_8h_source.html) shows a memory-mapped, clipping-region guarded delayed-load path that stores a leaf-buffer stream position and skips compressed values; the current build option is `OPENVDB_USE_DELAYED_LOADING` ([CMake source](https://github.com/AcademySoftwareFoundation/openvdb/blob/master/CMakeLists.txt)).

The strongest current union is tree/node serialization and stream traversal, file/grid/metadata indexes and offsets, all listed compression modes, delayed/memory-mapped loading, clipping, streaming, metadata/statistics and format/version controls. It is not legitimate to compare against only one compressor or eagerly loaded path.

## Attempted N2 and static action-divergence test

The only nontrivial admissible candidate would be `ROILeafBlockLayout(T,W)`: with fixed tree `T` and a supplied ROI/read profile `W` equally available to every baseline, jointly schedule legal serialized leaf blocks and any already-reader-visible block-offset/index metadata to minimize expected delayed-load seeks/decompressions plus file size, while preserving all stock OpenVDB semantics. A valid claim would require a format-preserving complexity/approximation or recourse guarantee, not generic graph layout or ILP.

Minimal required witness: a grid containing at least two separately delayed-loadable leaf buffers; **F0** is written through the complete stock union. **F1** has the identical grid and metadata values but a different physical leaf-block order/placement; the existing stock reader, with the same compression/delayed-loading settings, must reopen both and return equal grid/ROI/full-scan observations. F1 must differ through a named current-format legal placement action, not a rewritten reader or copied postprocess.

The witness does not close. Source evidence establishes that delayed-load metadata retains compressed-buffer size and stream position, but does not establish a writer-exposed, topology-preserving independent leaf-block permutation/index action with all required reader/stream/recovery semantics. Conversely, it does not establish that none exists. The result is `NOT_ADMITTED_UNFROZEN`, not a negative claim about unimplemented functionality.

## Literature, natural carrier and finite killer

The [original VDB paper](https://ken.museth.org/OpenVDB_files/Museth_TOG13.pdf) anchors the sparse hierarchical topology. [NeuralVDB](https://doi.org/10.1145/3641817) changes lower-node/topology/value representation, and NanoVDB-related work changes the reader/representation; those are methodological neighbors, not same-object subtractors. No direct same-file/stock-reader leaf-block reordering algorithm was identified in the primary/official search, but this is only `SEARCH_BOUNDED_OPEN`.

Finite Stage A route: freeze a versioned official OpenVDB asset/sequence, exact source and build configuration; use one fixed grid and a predeclared ROI trace plus full scan; construct F0/F1 only if the action certificate becomes legal; verify stock API equality; measure writer CPU/RSS/temp, bytes, metadata/open, delayed ROI/read/decompress/cache behavior and full scan. The ≤72-hour killer fails on any source-union absorption, need for custom reader/format change, changed grid semantics, missing official carrier, or no full-cost residual. No asset was downloaded or run in Discovery.

## Outcome

`PROPOSE_STAGE0: []`. There is no brief because the static stock-equivalent two-file action certificate remains unclosed. This is independent of implementation, results, resources or AI readiness. No experiment, benchmark, download, Stage0/A/B, automation or shared-control modification occurred. State: `IDLE_REUSABLE_AWAITING_MAINLINE`.
