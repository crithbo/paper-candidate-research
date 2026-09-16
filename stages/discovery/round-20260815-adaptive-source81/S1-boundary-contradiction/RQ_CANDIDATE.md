# Research-question candidate

## RQ01 — FFM arena scope placement under fixed temporal safety

For a fixed Java FFM allocation/downcall program, segment values, spatial and temporal safety, thread-access contract, and explicit-close behavior, can a target-specific non-generic N2 construction place or partition arena scopes to improve full lifecycle cost without changing the endpoint?

### Scope and pre-evidence assessment

- In scope: native segments allocated by manually managed FFM arenas and their associated scope/close behavior.
- Out of scope: automatic/global arena substitution, altered thread confinement, unsafe/restricted reinterpretation, wrapper/controller selection, and a changed deallocation guarantee.
- Counterfactual: a distinct same-contract scope arrangement would lower retained native memory, close work, or call cost while all legal accesses remain identical.
- Primary source route: Java SE 26 `Arena` and FFM package documentation; current OpenJDK memory-session source as implementation route.
- FINER-lite: feasibility is clear for a bounded semantic test; importance is conditional; the novelty threat is high because region/lifetime inference is a generic kernel.
- Pre-RQ closure: `ORDINARY_CLOSURE`; selective depth is frozen OFF.
