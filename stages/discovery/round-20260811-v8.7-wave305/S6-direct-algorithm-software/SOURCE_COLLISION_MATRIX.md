# Source and collision matrix

| object | official/current anchor reviewed | direct subtractor status | contrary / absorption risk | decision |
|---|---|---|---|---|
| Z3 incremental simplification | [Z3 upstream](https://github.com/Z3Prover/z3), [current release notes](https://github.com/Z3Prover/z3/blob/master/RELEASE_NOTES.md) | proof/tactic collision not closed | tactic composition can absorb a schedule-only claim | UNFROZEN |
| GraphBLAS product | [SuiteSparse upstream](https://github.com/DrTimothyAldenDavis/SuiteSparse) | GraphBLAS algorithm papers named by upstream, full same-object collision not closed | native descriptors/JIT/representation paths may absorb constructor | UNFROZEN |
| CGAL Delaunay | [CGAL upstream](https://github.com/CGAL/cgal) | primary Delaunay insertion/order corpus not closed | mature direct algorithm family | UNFROZEN |
| GEOS overlay | [GEOS upstream](https://github.com/libgeos/geos) | robust overlay/noding collision not closed | precision/noding union may absorb a decomposition | UNFROZEN |
| GCC tree-SSA | [GCC upstream](https://github.com/gcc-mirror/gcc) | not elevated | likely analysis scheduling rather than complete constructor | raw |
| CP-SAT presolve | [OR-Tools upstream](https://github.com/google/or-tools) | not elevated | generic presolve scheduling risk | raw |
| rustc incremental graph | [Rust upstream](https://github.com/rust-lang/rust) | not elevated | controller/update-policy boundary unclear | raw |
| OpenBLAS factorization | [OpenBLAS upstream](https://github.com/OpenMathLib/OpenBLAS) | not elevated | generic blocked-kernel risk | raw |

Only official upstream repositories and upstream-linked papers were used as technical anchors. A listed open collision is a reason for `NOT_ADMITTED_UNFROZEN`, not evidence that no contribution exists.

