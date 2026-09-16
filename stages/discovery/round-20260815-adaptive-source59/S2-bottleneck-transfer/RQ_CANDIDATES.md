# RQ candidates — Source59 S2

| ID | Primary same-object research question | Hypothesized route | Minimum falsifier | Status before lookup |
|---|---|---|---|---|
| RQ-S59-01 | For a fixed ELF link, is a target-specific reachability plus unwind/index constructor outside GNU ld's complete output actions while preserving stock unwind behavior? | `COMPILER_TOOL` N2 | Native ld controls GC roots/relocations and EH-frame-header/generated-unwind outputs. | ORDINARY_CLOSURE |
| RQ-S59-02 | For a fixed Go link output, can a target-specific joint `pclntab`/module-data constructor improve build-plus-runtime lookup full cost while preserving stock runtime behavior? | `COMPILER_TOOL` N2 | A candidate cannot name more than generic table packing/order. | ORDINARY_CLOSURE |
| RQ-S59-03 | For a fixed LLD ELF output, does a whole section-GC plus EH-frame aggregation action survive current native composition? | `COMPILER_TOOL` N2 | Current LLD already merges EH frames and emits the runtime header. | ORDINARY_CLOSURE |

No alternative RQ was needed. These are scope-convergence artifacts, not raw entries or contribution claims.
