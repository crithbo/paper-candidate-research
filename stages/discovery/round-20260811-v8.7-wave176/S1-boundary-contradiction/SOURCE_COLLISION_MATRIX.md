# SOURCE_COLLISION_MATRIX

| Requirement | First-party source | Frozen result |
|---|---|---|
| Current compiler/runtime | [OPA pinned source](https://github.com/open-policy-agent/opa) | `main` `fcda76c331a73869356fae58d0b2b40f303429dc`; repository contains compile, rego, runtime and wasm surfaces. |
| Entry points and optimization | [CLI build docs](https://www.openpolicyagent.org/docs/cli) | Wasm bundle/module for each specified entrypoint; `-e`; semantic-preserving `-O` rewriting/inlining/pruning and related configuration. |
| Evaluator/ABI | [Wasm docs](https://www.openpolicyagent.org/docs/wasm) | Fixed module ABI, imports, built-ins, shared memory, contexts, input/data/result and heap protocol. |
| Direct subtractor | Existing entrypoint-specific constructor plus OPA optimizer | Absorbs generic pass/layout claims. |

No current first-party source in the bounded check establishes a shared-entrypoint constructor that remains stock-evaluator compatible; this bounded fact is not promoted into an absence claim.
