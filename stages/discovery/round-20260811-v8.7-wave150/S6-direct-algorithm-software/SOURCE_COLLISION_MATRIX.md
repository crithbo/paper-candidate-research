# Source / collision matrix

| first-party source | frozen fact | same-object implication |
|---|---|---|
| [HDF5 FMT3 specification](https://support.hdfgroup.org/documentation/hdf5/latest/_f_m_t3.html), checked 2026-08-11 | Latest-format library selects one of five chunk index types according to dimension specification and extension; older format uses v1 B-tree. | Strong creation/extension union; not legitimate to claim “only B-tree exists”. |
| same FMT3, Appendix C | EA is for one unlimited dimension and is fixed-depth/pre-balanced for append, instantiated as needed; v2 B-tree applies for more than one unlimited dimension. | Direct subtractor for append-only candidate. |
| [H5D public API](https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/documentation/doxygen/_h5_dpublic_8h.html) | Enumerates BTREE, SINGLE, NONE/implicit, FARRAY, EARRAY, BT2 and early/late/incremental allocation. | Current public action/type vocabulary. |
| [HDF5 chunking documentation](https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/documentation/doxygen/hdf5_chunking.html) | Chunks follow logical array boundaries and may occur in any file position; chunking enables resize/filters. | Same-object/read-semantics boundary. |
| [official HDF5 repository](https://github.com/HDFGroup/hdf5), `develop`, observed 2026-08-11 | Official development source repository, 24,504 commits; source path requires future exact revision pin for conversion-path audit. | Current-upstream anchor, but not a basis for absence. |
| [NASA LAADS product guide](https://ladsweb.modaps.eosdis.nasa.gov/learn/) | Versioned NASA VIIRS products include HDF5/HDF5-EOS and timestamps/version IDs in file names. | Public versioned natural carrier route. |

Latest-collision conclusion is bounded: current HDF5 directly absorbs a creation-time “choose the right append index” story. It does not assert that no index migration is ever possible; that unanswered implementation question keeps this item `NOT_ADMITTED_UNFROZEN`.
