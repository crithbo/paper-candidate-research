# Raw screen row events

| family | current action signal | screen result |
|---|---|---|
| MUMPS multifrontal LU/LDLT | analysis combines ordering and symbolic factorization; numerical phase includes threshold/2-by-2 pivoting. | candidate-grade deep review |
| SuperLU_DIST distributed LU | separate ordering, symbolic factorization, static pivoting and tiny-pivot replacement; parallel symbolic path requires parallel ordering. | candidate-grade deep review |
| PaStiX sparse direct factorization | graph/order, symbolic factorization and solver phases are independently configurable/native. | candidate-grade deep review |
| STRUMPACK sparse multifrontal solver | reordering and exact/structured-low-rank factor actions are native, with compression choices. | candidate-grade deep review |
| PETSc `MatGetFactor` direct-solver route | selects/configures an external factor package rather than constructing a distinct factorization. | `STRUCTURAL_DROP__WRAPPER_BACKEND_DISPATCH` |
| Trilinos Amesos2 direct-solver route | adapter over backend direct solvers, not a same-object constructor. | `STRUCTURAL_DROP__WRAPPER_BACKEND_DISPATCH` |

