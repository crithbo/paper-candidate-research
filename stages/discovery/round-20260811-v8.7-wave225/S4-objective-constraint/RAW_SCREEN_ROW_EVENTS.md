# Raw screen event

| ID | exact object / reader guarantee | candidate whole action | disposition |
|---|---|---|---|
| V01 | Pinned V8 startup/read-only/shared snapshot blob; same builtins, roots, object contents, observable JS semantics, and stock matching deserializer | deterministic constrained scheduling of eligible non-root heap-object serialization, jointly controlling reference-token locality, allocation/page locality, and compressed image bytes | `DEEP_DIVE_REQUIRED` |

Excluded at raw stage: compression-level tuning/external compression; `reorder_builtins` profile sorting; code-cache controls; changing heap contents, root set, build flags, runtime, or a profile/runtime controller.

