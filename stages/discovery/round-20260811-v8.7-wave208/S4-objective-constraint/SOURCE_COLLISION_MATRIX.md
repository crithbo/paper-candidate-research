# Source / collision / action-space matrix

| family | direct current collision | reader semantics preserved? | union outside action found? | result |
|---|---|---:|---:|---|
| Core Wasm | Core binary grammar and native emitter represent valid whole module emission | only for standard-conforming module | no closed witness | `STRUCTURAL_DROP` |
| .NET R2R | official individual/composite R2R plus exclusions and runtime tiering | yes | no; composite is current action | `STRUCTURAL_DROP` |
| Erlang BEAM | compiler options + VM loader chunk contract | a new candidate is not frozen | no | `STRUCTURAL_DROP` |
| V8 snapshot | source identified but complete current flag/contract union not frozen | unclosed | unclosed | `NOT_ADMITTED_UNFROZEN` |
| gettext MO | `msgfmt` hash-table/no-hash constructor and MO reader | yes | no | `STRUCTURAL_DROP` |
| TZif zoneinfo | zic/TZif route and history semantics | unclosed for a new encoding | unclosed | `NOT_ADMITTED_UNFROZEN` |

The matrix is an action-space conclusion, not a claim that a prospective implementation would fail to improve a metric. It reports why no fair same-object, union-external whole constructor is presently admissible.

