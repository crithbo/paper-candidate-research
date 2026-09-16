# Source98 RQs

| RQ | Same-object question | Anchor route | Falsifier |
|---|---|---|---|
| S98-RQ01 | For fixed TIFF pixels/tags and decoded results, is there a libtiff-specific joint strip/tile-offset constructor with a non-generic bytes/read-write guarantee? | official libtiff docs/current source | generic layout/packing or changed reader-access contract |
| S98-RQ02 | For fixed commits/tree and libgit2 diff/rename output, does a target-native candidate constructor beat generic similarity/matching without changing result semantics? | libgit2 official docs/current source | generic matching/indexing or changed similarity threshold |
| S98-RQ03 | For fixed GEMM semantics/layout, is an OpenBLAS-specific joint packing/blocking/kernel constructor more than generic GEMM tiling/dispatch? | OpenBLAS official docs/current source | generic matrix multiplication optimization/controller |
| S98-RQ04 | For fixed regex/input/match semantics, is a PCRE2 JIT construction a target-specific algorithm rather than generic regex automata compilation? | PCRE2 official docs/current source | generic compiler/automata construction |

All RQs are frozen before evidence. FINER-lite: scope PASS, novelty threat HIGH, feasibility/relevance CONDITIONAL; selective depth OFF.
