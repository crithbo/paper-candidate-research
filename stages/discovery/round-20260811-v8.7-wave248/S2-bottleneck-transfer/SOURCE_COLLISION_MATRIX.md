# Source and collision matrix — Wave248 OpenVDB closure

| Facet | Current official source | Baseline/contrary evidence | Candidate result |
|---|---|---|---|
| Tree and file contract | [OpenVDB I/O API](https://www.openvdb.org/documentation/doxygen/io_8h.html), pin `2ad18b6aebf69240f8db78c08c6f9bbee896c553` | fixed grid topology/values/transforms/metadata and stock API are non-relaxable | object frozen |
| Compression/configuration | [I/O API](https://www.openvdb.org/documentation/doxygen/io_8h.html), [Compression source](https://www.openvdb.org/documentation/doxygen/Compression_8h_source.html) | none/ZIP/active-mask/Blosc and metadata/statistics are fair union, not candidate action | compression-only actions excluded |
| Delayed/mapped read | [DelayedLoadMetadata](https://www.openvdb.org/documentation/doxygen/classopenvdb_1_1v13__0_1_1io_1_1DelayedLoadMetadata.html), [LeafNode source](https://www.openvdb.org/documentation/doxygen/LeafNode_8h_source.html) | current reader can retain stream positions and defer leaf buffer load when mapped/clipped | does not by itself prove independent physical permutation is legal |
| Proposed whole N2 | `ROILeafBlockLayout(T,W)` | profile is equally supplied; generic graph layout/ILP/custom reader prohibited | legal F1 action not frozen |
| Nearest literature | [VDB](https://ken.museth.org/OpenVDB_files/Museth_TOG13.pdf), [NeuralVDB](https://doi.org/10.1145/3641817) | NeuralVDB changes representation/value/topology; not a direct subtractor | `SEARCH_BOUNDED_OPEN` only |
| Natural/full-cost route | official versioned OpenVDB asset/sequence to be pinned in Stage A | build/open/ROI/read/decompress/cache/full scan plus bytes/RSS/temp required | finite conditional plan, not evidence |

**Disposition:** `NOT_ADMITTED_UNFROZEN`. No source absence is claimed; no generic packing, compression tuning, reader replacement or topology/value change is retained.
