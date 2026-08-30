# Research-question candidate

## RQ01 — detached-task event placement under fixed completion semantics

For a fixed OpenMP detachable task graph, structured-block behavior, async operation, dependencies, task completion order, and output, can a target-specific non-generic N2 construction alter event-fulfillment placement to reduce runtime/full cost without changing the completion endpoint?

### Scope and pre-evidence assessment

- In scope: the same `detach(event)` task and its matching one-time `omp_fulfill_event` completion transition.
- Out of scope: changing task graph/dependences, converting to another async API, runtime controller scheduling, API flag selection, and generic state-space search.
- Counterfactual: an alternate legal transition would retain the same event destruction and task-completion observations while reducing proxy retention, synchronization, or scheduling cost.
- Primary route: official OpenMP task/event specification; current LLVM libomp source locus.
- FINER-lite: bounded semantic feasibility is clear; importance is conditional for async task users; novelty threat is high because event release is a prescribed state transition.
- Pre-RQ closure: `ORDINARY_CLOSURE`; selective depth is OFF.
