# Source collision matrix

| primary/official source | current action / collision |
|---|---|
| [MUMPS 5.8.1 user guide](https://mumps-solver.org/doc/userguide_5.8.1.pdf) | Analysis performs ordering and symbolic factorization; factorization uses multifrontal dense fronts and documented pivoting. Direct native union, not an empty action space. |
| [SuperLU FAQ](https://portal.nersc.gov/project/sparse/superlu/faq.html) | Documents static pivoting, `ReplaceTinyPivot`, parallel symbolic factorization and required parallel ordering. Direct current competing union. |
| [PaStiX user documentation](https://solverstack.gitlabpages.inria.fr/pastix/group__pastix__users.html) | Documents graph used in ordering/symbolic factorization. |
| [PaStiX parameters](https://solverstack.gitlabpages.inria.fr/pastix/group__pastix__api.html) | Documents native ordering and loaded ordering/symbol actions. |
| [STRUMPACK project source](https://github.com/pghysels/STRUMPACK) | States exact-direct and rank-structured sparse-solver modes, making simple approximate factor packaging a direct collision. |
| [SuiteSparse Matrix Collection](https://suitesparse-collection-website.herokuapp.com/about) | Official natural, curated and reproducible sparse-matrix carrier. |

No source supports an absence claim for any solver. The direct collision here is the already-present native composition of ordering, symbolic/numeric factorization and, where applicable, pivot/compression/partition decisions.

