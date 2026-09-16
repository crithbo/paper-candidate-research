# Cross-lane deduplication

Excluded: KLL, Theta, CPC, Frequent Items, DuckDB approximate aggregates, and all registry terminal/active S4 exact objects. The following CPU/native constructors are distinct objects.

| id | exact object boundary |
|---|---|
| R01 | Zstd small-message dictionary construction with lossless decode contract |
| R02 | Zstd bounded-memory streaming compression context with lossless decode contract |
| R03 | Brotli lossless stream encoder under fixed decoder/bitstream semantics |
| R04 | RE2 regular-expression compilation/match with fixed RE2 syntax and match semantics |
| R05 | DRAT proof trimming/checking for a fixed DIMACS CNF and DRAT proof certificate |
| R06 | LRAT-style checked proof certificate construction for fixed CNF UNSAT semantics |
