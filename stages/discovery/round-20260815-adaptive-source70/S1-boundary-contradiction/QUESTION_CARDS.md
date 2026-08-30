# Question cards

## QC-S70-01 — Rust nightly AsyncDrop glue

| Required raw field | Frozen value / disposition |
|---|---|
| Exact public identity | `std::future::AsyncDrop`, std 1.97.1 / feature `async_drop` #126482 |
| Carrier kind | `IMPLEMENTATION_CARRIER_ONLY`; a public Rust async crate corpus would be relevant only if a candidate action survived |
| Same-object problem | compiler construction of destructor glue for the fixed type graph and async scope |
| Tentative endpoint | non-worse cleanup/codegen cost under identical destruction/deallocation semantics |
| Counterfactual | rustc emits a different target-specific whole-type glue construction |
| Non-generic discriminator | the construction must not be generic drop-glue elimination, executor scheduling, or a semantic order/liveness change |
| Current source locus | `elaborate_drop.rs` async glue eligibility/elaboration; upstream codegen/optimization record |
| Minimum falsifier | any purported cost reduction either follows existing generic trivial-drop/glue pruning or changes destructor order/liveness/ownership/deallocation endpoint |
| Initial full cost | compiler CPU/RSS, MIR/code bytes, state/suspension count, cleanup runtime/allocations; no measurement run |
| Finite route | completed source-only trait/source/tracking check |

**Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_KERNEL_OR_CHANGED_GUARANTEE`.** The public trait fixes the relevant endpoint: implicit async destruction completes before deallocation. Altering the type-graph ordering, ownership/liveness, or completion boundary changes that contract. Retaining it supplies no named target-specific action beyond current async drop glue and generic `needs_async_drop`/trivial-elision style compiler optimization. The proposal therefore has no source-supported non-generic discriminator and cannot enter evidence-qualified raw.

No closure debt, native corpus, or proposal is transferred.
