# HDF5 chunk-index migration — current source and collision matrix

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE184-HDF5-CHUNK-INDEX-MIGRATION-CURRENT-SOURCE-DEPTH`  
**Cutoff:** 2026-08-11. Sources are first-party HDF Group or NASA materials.

| Required facet | Frozen first-party evidence | Consequence |
|---|---|---|
| current release | [HDF5 2.1.1 release](https://github.com/HDFGroup/hdf5/releases) | latest released source/version anchor is 2.1.1 (2026-03-23); no source download was performed. |
| current develop source/docs | [official upstream](https://github.com/HDFGroup/hdf5), [develop docs](https://hdfgroup.github.io/hdf5/develop/index.html) | official current branch/documentation anchor; no exact revision/call-graph evidence for in-place index conversion was available. |
| index representations | [FMT4 Appendix C](https://portal.hdfgroup.org/documentation/hdf5/latest/_f_m_t4.html) | single, implicit, fixed-array, extensible-array and v2-B-tree are legal current representations; older v1 B-tree is a compatibility form. |
| chunk/filter/read semantics | [chunking guide](https://portal.hdfgroup.org/documentation/hdf5/latest/hdf5_chunking.html), [layout guide](https://portal.hdfgroup.org/documentation/hdf5/latest/_l_b_dset_layout.html) | chunks are independently stored and atomic for filter/checksum work; same public read/write API and stock-reader fidelity constrain migration. |
| metadata cost lead | [chunking issues](https://portal.hdfgroup.org/documentation/hdf5/latest/hdf5_chunk_issues.html) | metadata/index growth and rewrite holes motivate the question, but do not establish a migration action or current absence. |
| natural carrier | [NASA LAADS VIIRS guide](https://ladsweb.modaps.eosdis.nasa.gov/learn/) | version/acquisition/processing IDs and HDF5 products are public; they do not prove one-dataset append/backfill history. |

## Path-by-path closure status

| Path | Current evidence status |
|---|---|
| index selection at create / normal extend | current union frozen: multiple representations and property/layout choices exist |
| ordinary backfill write / filters / allocation timing | union vocabulary frozen; data/filter/chunk semantics must remain identical |
| single/fixed/EA/BT2 in-place conversion and metadata rewrite | `UNFROZEN`: no exact current source call graph/pin demonstrating either a supported conversion or its absence |
| free-space, temporary rewrite and recovery closure | `UNFROZEN`: cannot infer equivalence from format documentation alone |
| stock reader/checksum compatibility | oracle frozen, but conversion witness not frozen |

## Decision

`NOT_ADMITTED_UNFROZEN`. Current HDF5 already absorbs a creation-time “choose a better append index” story, but this pass does not assert that all dynamic migration is absorbed or impossible. A proposal would require the missing source-path and natural append/backfill closure; no claim is made from documentation silence, old future work, source accessibility, implementation, results, resources, or AI readiness.
