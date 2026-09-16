# Source collision matrix — Wave68

| family | official/primary source | current direct action |
|---|---|---|
| DLX | [Knuth DLX](https://arxiv.org/abs/cs/0011047) | exact-cover construction/search |
| SCIP | [SCIP documentation](https://www.scipopt.org/doc/html/) | exact MIP solve/certificate |
| FLINT | [FLINT](https://flintlib.org/) | polynomial factorization |
| nauty | [nauty/Traces](https://pallini.di.uniroma1.it/) | canonical certificate |
| LEMON | [LEMON](https://lemon.cs.elte.hu/trac/lemon) | exact min-cost flow |
| GMP | [GMP manual](https://gmplib.org/manual/) | exact integer/rational arithmetic |

No retained residual relies on absence claims, generic ILP/matching, a wrapper, or a local emitter patch.
