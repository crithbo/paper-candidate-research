# Raw screen row events

| family | pathology seed (not a result) | first-party anchor | screen outcome |
|---|---|---|---|
| Z3 incremental simplification | repeated local rewrites can make proof/model-conversion cost nonlocal | Z3Prover/z3 | deep |
| SuiteSparse:GraphBLAS `mxm` | hypersparse structure can change symbolic/numeric work balance | DrTimothyAldenDavis/SuiteSparse | deep |
| CGAL Delaunay insertion | clustered inserts can create large conflict cavities | CGAL/cgal | deep |
| GEOS overlay/noding | near-coincident segments can create topology-work amplification | libgeos/geos | deep |
| GCC tree-SSA points-to | alias-set growth can enlarge downstream dataflow | gcc-mirror/gcc | raw: union not frozen |
| OR-Tools CP-SAT presolve | propagation closure can dominate small solve instances | google/or-tools | raw: direct subtraction incomplete |
| rustc incremental dependency graph | edit-locality can fail through query invalidation fan-out | rust-lang/rust | raw: controller/constructor boundary unclear |
| OpenBLAS blocked factorization | sparsity/conditioning-dependent panel work needs target-specific semantics | OpenMathLib/OpenBLAS | raw: natural pathology and guarantee unclosed |

No row reports a measured pathology. Each is a literature/source-led seed only.

