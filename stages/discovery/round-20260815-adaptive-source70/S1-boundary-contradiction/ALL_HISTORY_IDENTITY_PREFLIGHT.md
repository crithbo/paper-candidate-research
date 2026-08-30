# All-history five-field identity preflight

Bounded lookup: current `registry.yaml` and `plan.md`, queried for `asyncdrop`, `async drop`, `async_drop`, and async-destructor variants on 2026-08-15.

| Candidate | Exact object | Action / estimand | Endpoint | Guarantee | Full cost | Relation / outcome |
|---|---|---|---|---|---|---|
| S70-01 Rust nightly AsyncDrop | experimental Rust `AsyncDrop` type graph | async drop-glue construction | cleanup cost / codegen cost | implicit call; deallocation only after drop completion | compiler CPU/RSS, bytes, state/suspension, runtime cleanup | `NO_MATCH_ON_BOUNDED_LOOKUP_SURFACE`; not novelty or absence evidence |

No historical exact identity or terminal containment was found on this bounded surface. No held/terminal identity was accessed. The disposition below follows the frozen object/guarantee and current rustc mechanism, not an identity exclusion.
