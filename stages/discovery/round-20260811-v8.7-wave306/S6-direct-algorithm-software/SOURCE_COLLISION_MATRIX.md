# Source / collision matrix

| row | first-party source anchor | current-union status | primary direct-collision status | decision |
|---|---|---|---|---|
| Soufflé | [official upstream](https://github.com/souffle-lang/souffle) | partial: compilation, relation/index and profile features visible; exhaustive source union open | upstream papers identified; same-object subtraction open | UNFROZEN |
| PaPILO | [official upstream](https://github.com/scipopt/papilo) | partial: default presolvers, timings, parameter surface and postsolve visible | upstream cites primary presolve papers; collision closure open | UNFROZEN |
| OR-Tools CP-SAT | [official upstream](https://github.com/google/or-tools) | partial: component/source map visible; all encoding/presolve paths open | current direct CP-SAT construction subtraction open | UNFROZEN |
| Redis probabilistic set | [official upstream](https://github.com/redis/redis) | partial: objects visible; exact native constructor union open | direct target-specific collision open | UNFROZEN |
| GCC points-to | [official upstream](https://github.com/gcc-mirror/gcc) | not elevated | not opened | raw |
| Rust region inference | [official upstream](https://github.com/rust-lang/rust) | not elevated | not opened | raw |
| CGAL arrangement | [official upstream](https://github.com/CGAL/cgal) | not elevated | not opened | raw |
| OpenBLAS | [official upstream](https://github.com/OpenMathLib/OpenBLAS) | not elevated | not opened | raw |

Only official/primary upstream materials are used. “Open” means not admitted, never an asserted implementation absence.

