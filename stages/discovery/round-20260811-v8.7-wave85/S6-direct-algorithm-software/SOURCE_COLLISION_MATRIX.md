# Source and collision matrix

| Family | Primary/current sources | Current-reality result | Direct subtractor / strongest fair union | Collision result |
|---|---|---|---|---|
| libstdc++ `std::sort` | [C++ sorting specification](https://eel.is/c++draft/alg.sorting); [GCC libstdc++ manual](https://gcc.gnu.org/onlinedocs/libstdc++/) | Standard contract and GCC native implementation route checked; no absence claim is used. | Native comparison-sort actions including partitioning and depth fallback. | Absorbed: pivot/threshold variants are internal actions. |
| libstdc++ `std::stable_sort` | [C++ sorting specification](https://eel.is/c++draft/alg.sorting); [GCC libstdc++ manual](https://gcc.gnu.org/onlinedocs/libstdc++/) | Standard stability contract and GCC native implementation route checked; no absence claim is used. | Native adaptive/in-place merge construction union. | Absorbed: merge scheduling/threshold variants are internal actions. |
| Eigen `SparseLU` | [Eigen SparseLU API](https://libeigen.gitlab.io/eigen/docs-nightly/classEigen_1_1SparseLU.html); [Eigen source repository](https://gitlab.com/libeigen/eigen) | Current API/source route checked; exact action union remains to be frozen before any absence inference. | Native ordering, symbolic analysis, pivot/factor/solve path. | Unfrozen, not a collision claim. |
| CGAL Delaunay | [CGAL Triangulation_2 manual](https://doc.cgal.org/latest/Triangulation_2/); [CGAL repository](https://github.com/CGAL/cgal) | Current predicate and triangulation semantics checked; no absence claim is used. | Native incremental conflict-update/flip/predicate construction union. | Absorbed: insertion/flip ordering remains internal. |

Source use is limited to standards and upstream/project documentation/source. The assignment makes no claim that a current upstream lacks a feature; therefore an implementation-absence inference is deliberately not made.
