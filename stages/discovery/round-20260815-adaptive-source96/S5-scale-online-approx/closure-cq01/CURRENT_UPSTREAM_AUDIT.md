# Current upstream audit — Erlang/OTP `OTP-29.0.1`

| Call | Official route / deterministic selection | Result |
|---:|---|---|
| 1 | `commits/OTP-29.0.1` | 200; immutable commit `f26c7e590c5d1b3afa0dee38093442df117822e3`. |
| 2 | recursive tree at that commit | 200; selected required ERTS source/test paths. |
| 3 | `erts/emulator/beam/erl_bif_persistent.c` | 200; put/erase, table-copy, update-permission, scheduled deletion and traps. |
| 4 | `erts/emulator/beam/erl_global_literals.c` | 200; literal allocation, registration and global literal lock. |
| 5 | `erts/emulator/test/persistent_term_SUITE.erl` | 200; visibility/purging and two-process retained-pointer carrier. |
| 6 | official `persistent_term` documentation | 200; current page labels itself OTP 29.0.5; version drift logged. |

## Visible controls and boundary

Current source establishes serialized update, copy/re-hash paths, scheduled deleter behavior and literal-area ownership. The official page describes constant-time lock-free lookup, global process scans/fullsweeps for complex-term replacement/deletion, and `+MIscs` as a literal virtual-reservation option. The latter must not be reclassified as a reclamation algorithm.

No external paper, project, branch, issue tracker or general search was used. `SEARCH_BOUNDED_OPEN` applies to direct collision outside the retained current union. Since no candidate-specific union-external action or finite guarantee is frozen, neither direct fatal nor clean candidate-grade input is asserted.
