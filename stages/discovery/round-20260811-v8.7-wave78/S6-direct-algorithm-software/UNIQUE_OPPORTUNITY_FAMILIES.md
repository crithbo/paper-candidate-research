# Wave78 unique families

| family | same object/native reader | current cost/action union | witness status |
|---|---|---|---|
| OCAML-BC | fixed bytecode program/VM result | compiler bytecode emitter, code/constant layout | NOT_ADMITTED_UNFROZEN |
| LUA-BC | fixed chunk/VM result | lua compiler/dumper union | STRUCTURAL_ABSORPTION |
| GHC-HI | fixed module/interface reader semantics | GHC interface builder/layout union | NOT_ADMITTED_UNFROZEN |
| GO-PCLNTAB | fixed binary/runtime stack metadata | Go linker pclntab constructor | STRUCTURAL_ABSORPTION |
