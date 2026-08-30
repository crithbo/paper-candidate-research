# Wave244 Collision Matrix

| Object | Strongest union | Same-object finite killer | Outcome |
|---|---|---|---|
| CRAM | containers/slices/compression headers and slice index | stock decode/index equality; charge bytes, CPU/RSS, container/index I/O; reject union-equivalent planner | `UNION_ABSORBED` |
| BAM/CSI | coordinate sorting + BAI/CSI binning/index | exact region retrieval and index build cost | `UNION_ABSORBED` |
| netCDF-4 | unlimited dim + fixed chunk/filter at enddef | exact arrays/metadata; charge copy/rechunk/query/storage | `UNION_ABSORBED` |
| netCDF classic | record append along unlimited dimension | exact arrays and append/index cost | `UNION_ABSORBED` |
| HDF5 | unclosed current/trace package | requires stock oracle + versioned mutation trace | `UNFROZEN` |
| FITS | unclosed current/trace package | requires stock oracle + versioned mutation trace | `UNFROZEN` |
