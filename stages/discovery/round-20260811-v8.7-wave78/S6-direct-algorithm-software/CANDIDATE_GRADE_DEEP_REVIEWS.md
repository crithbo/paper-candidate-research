# Native-cost/action-divergence witness reviews — Wave78

| Object | native cost/action union | attempted minimal same-object witness | N2/guarantee + natural carrier/full cost/72h killer | result |
|---|---|---|---|---|
| OCaml bytecode | Compiler chooses instruction/constant emission under VM format; cost includes compile CPU, chunk bytes and VM execution. | Two constants/instructions with alternate legal layout; no current-source-supported whole action outside emitter ordering frozen. | A nontrivial N2 cannot be named without changing bytecode semantics or becoming emitter patch. Public OCaml programs; VM equality killer. | NOT_ADMITTED_UNFROZEN. |
| Lua bytecode | `luac` compiler/dumper produces native chunk; same reader/VM cost ledger. | Alternate constant order is expressible by current emission/dump behavior, not global constructor. | No union-external witness; any benefit is local emitter layout. Public Lua scripts; VM equality killer. | STRUCTURAL_ABSORPTION. |
| GHC interface | GHC builds module interface under compiler reader contract; cost includes build, interface bytes/read. | Two declaration layouts lack a frozen current action divergence; current source/action catalog is not sufficient to name one. | No complete N2/guarantee. Public Haskell modules; interface-reader killer. | NOT_ADMITTED_UNFROZEN. |
| Go pclntab | Go linker emits function/PC metadata with runtime stack-trace semantics. | Function-table layout change is native linker emission; no union-external whole action witness. | No N2 beyond emitter patch. Public Go modules; runtime stack/metadata checker killer. | STRUCTURAL_ABSORPTION. |

The two NOT_ADMITTED rows are not failures of implementation, resources, or expected result: no minimal action-divergence witness was frozen. The absorbed rows have a witness only inside the current native action union.
