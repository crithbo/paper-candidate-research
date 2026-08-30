# Depth reviews

## OCaml pattern-match decision trees

Fixed object: typed clauses, guards and observable match result/exception semantics under the stock OCaml compiler/runtime. Official source is https://github.com/ocaml/ocaml. A candidate two-tree witness changes test order/sharing while preserving semantics, but this is exactly the established decision-tree/matrix-compilation action family. Without a new object-specific state parameter and guarantee outside that family, bounded-state DP is generic construction optimization. Natural route would be compiler tests/OPAM packages; ledger would include compilation CPU/RSS/temp, code size and runtime branch cost; killer would beat current compilation family on fixed semantics. `STRUCTURAL_DROP` for this generic decision-tree residual, not for OCaml research generally.

## GCC IRA/reload-spill states

Fixed object: RTL, target ABI/options, generated machine behavior and runtime semantics. Official source is https://gcc.gnu.org/git/gcc.git. IRA allocation, reload/spill and target-specific constraints interact, but this review did not pin complete current defaults/non-default passes or demonstrate two stock-legal outputs differing in a named union-external native action. A claimed recurrence would currently be ordinary register allocation/solver wrapping. Natural route: GCC tests/public C/C++ packages; ledger: compile CPU/RSS/temp/object bytes/runtime; killer: fixed target and ABI versus complete IRA/reload union. `NOT_ADMITTED_UNFROZEN`; no absence inference.
