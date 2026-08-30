# Primary research-question candidate

`RQ-S70-01`: For a fixed nightly Rust `AsyncDrop` type graph and async scope, can a compiler construct async destructor glue with lower code size, compiler work, suspension/state cost, or runtime cleanup cost while preserving implicit invocation, destructor ordering/ownership, and deallocation-after-completion semantics?

- Tentative contribution: N2 / `COMPILER_TOOL`.
- Counterfactual consequence: rustc would select a distinct whole-type constructor, not merely an executor scheduling/configuration policy.
- Non-generic discriminator sought: a legal alternative to existing async drop glue which preserves the exact destructor/deallocation endpoint.
- FINER-lite: the current trait/source route can answer whether such an atomic action exists; it is worth pursuing only if not reducible to generic drop-glue optimization; scope is fixed to nightly `async_drop`; current codegen is the strongest immediate contrary route.

The RQ was frozen before reading current codegen material. It was excluded before raw because the frozen semantic contract leaves no target-specific alternative action skeleton: changing order/liveness changes the guarantee, while preserving it leaves current glue plus generic pruning/scheduling.
