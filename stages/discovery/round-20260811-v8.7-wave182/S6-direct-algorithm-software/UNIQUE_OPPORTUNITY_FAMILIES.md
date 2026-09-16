# Unique opportunity families

## MUMPS, SuperLU_DIST, PaStiX and STRUMPACK

For every direct-solver family, the frozen object is `(A,b, arithmetic/precision, numerical tolerance, permitted pivot policy) -> factorization/solution`, with residual/backward-error and solve outcome as oracle. A same-object method may change legal ordering, elimination tree/front allocation, partition and allowed pivot/low-rank decisions only while retaining the declared numerical guarantee.

The minimal witness would be a sparse matrix with two elimination orders that both satisfy the solver's pivot/accuracy contract yet yield distinct fronts/communication. That establishes a nonempty legal decision space, not a union-external action. Each current solver already combines native ordering/symbolic/numeric choices; an unqualified "global reordering," partition sweep, pivot threshold or compression tolerance is absorbed or excluded as tuning.

## PETSc and Trilinos

These were screened as integration interfaces. Swapping/factoring through a selected backend is a controller/wrapper action, not a new direct numerical constructor over one native solver object. They are structural drops, independent of readiness.

