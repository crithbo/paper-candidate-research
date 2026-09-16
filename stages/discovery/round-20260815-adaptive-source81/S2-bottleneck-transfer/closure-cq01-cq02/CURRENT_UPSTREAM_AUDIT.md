# Current upstream audit — LLVM LLD RISC-V GP relaxation

## Immutable source pin

The first official request resolved `llvm/llvm-project` `main` to `367b306e9c12e16621b27e606bfbb765166a6b96`.  Every retained LLVM source locus uses that commit.  The required test route returned HTTP 404; it was not substituted.

## Current action union

| Surface | Current action/constraint | Evidence |
|---|---|---|
| GP legality | one process-wide `gp`, static executable only, initialized before user code | LLVM RISC-V usage documentation 1395–1409 |
| GP rewrite | relax eligible address materialization within ±2048 bytes of `__global_pointer$` | LLVM RISC-V usage documentation 1406; `RISCV.cpp` 1011–1028 |
| option control | `--relax-gp` explicit, default disabled | `Driver.cpp` 1556; `Options.td` 425–427 |
| data eligibility/layout | `.sdata/.sbss`, small-data threshold, adjacent output layout | LLVM RISC-V usage documentation 1409–1411 |
| placement control | linker scripts assign input sections to output sections; current driver exposes sorting/section control surfaces | `Driver.cpp` 922–930, 1556–1584, 3555–3564 |

The test witness requested by the assignment could not be retained because its exact frozen path returned 404.  This limits test-level evidence only; it does not support any absence or direct-fatal claim.
