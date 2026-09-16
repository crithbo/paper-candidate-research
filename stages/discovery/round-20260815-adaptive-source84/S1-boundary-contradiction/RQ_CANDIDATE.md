# Research-question candidate

## RQ01 — pthread_atfork handler ordering under fixed child/parent state

For a fixed registered-handler set, multithreaded fork trace, parent and child side effects, and post-fork lock-state endpoint, can a target-specific non-generic N2 construction change prepare/parent/child callback ordering or grouping while preserving the endpoint and reducing full cost?

- In scope: the same atfork callback registrations and fork result.
- Out of scope: `_Fork`, a different callback interface, child-safe-point deferral, wrapper coordinators, generic lock ordering, and changed post-fork state.
- Counterfactual: a different callback trace retains every handler’s visible parent/child effects and lock contract while reducing synchronization/handler cost.
- Primary evidence route: POSIX function contract; current glibc manual/source lineage for implementation context.
- FINER-lite: answerability is clear for the semantic kernel; novelty threat is high because registration order is itself the stated interface action.
- Pre-RQ closure: `ORDINARY_CLOSURE`; selective depth OFF.
