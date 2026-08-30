# RAW_SCREEN_ROW_EVENTS

| ID | Exact object / action union | Minimal legal witness | Status |
|---|---|---|---|
| R01 | Fixed Rego policies, data and input; `opa build -t wasm` produces a bundle/module for specified `-e` entrypoint(s); stock Wasm ABI evaluator instantiates it with `env.memory`, imports, built-ins, input/data and returns the same defined/undefined `result` set. Union includes compiler IR/wasm codegen, `-e`, `-O`, pruning/rewriting/inlining, capabilities, bundle serialization, module ABI/version, imports/built-ins, memory/heap/data update protocol and evaluator. | Two queried decisions can share source rules/data, while the documented builder constructs a Wasm artifact for each specified entrypoint. | `NOT_ADMITTED_UNFROZEN` |

The witness is not yet a candidate: an alleged cross-entrypoint shared constructor must show a stock-evaluator-compatible, single fixed artifact interface and a non-generic algorithm beyond OPA's existing per-entrypoint compiler/optimizer. No such action was frozen.
