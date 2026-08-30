# Raw screen row events

| Family | Fixed native object / witness-first result | Source-grounded status | Triage |
|---|---|---|---|
| F1 LLVM BOLT code layout | Same binary semantics; two legal function orders with regenerated references can differ in layout bytes/addresses while preserving exports. | Current BOLT already has function-reordering algorithms and code-layout machinery. | `NOT_ADMITTED_UNFROZEN` |
| F2 SquashFS block/fragment packing | Same tree/file bytes; ordinary fragment versus block placement is reader-legal. | Native format/writer union and action collision not source-pinned in this pass. | `NOT_ADMITTED_UNFROZEN` |
| F3 GNU linker section/relaxation layout | Same ABI exports/relocations; two legal layout orders can differ in padding/relaxation placement. | Linker script/options/current backend union and direct code-layout collision not closed. | `NOT_ADMITTED_UNFROZEN` |
| F4 CPack archive construction | Same installed file set can be emitted into a supported archive. | File ordering/archiver actions are packaging wrapper territory; no nontrivial same-object joint guarantee identified. | `STRUCTURAL_DROP__WRAPPER` |
| F5 BTF split/base relocation | Same decoded type graph can use regenerated IDs/references. | Registry collision with earlier BTF review; not re-opened. | `REPEAT_EXCLUDED` |
| F6 ORC stripe/encoding construction | Same typed rows may vary legal stripe/encoding choices. | Registry/lane collision with earlier ORC screening; not re-opened. | `REPEAT_EXCLUDED` |

F1–F3 were promoted to candidate-grade depth because each has a fixed same-object representation witness and a finite public-carrier route. Their unadmitted state is an evidence-closure state, not an inference from missing implementation or results.
