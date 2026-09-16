# Source81 S5 RQ candidates

## Primary RQ — S81-01

**Exact anchor.** Current first-party Swift Driver releases enumerate file hashing for incremental builds, incremental dependency scanning, and conditional skipping of emit-module work in incremental module-only builds. The Swift compiler documentation identifies the driver as the compiler's driver implementation.

**Same-object question.** For a fixed Swift package, source-update sequence, driver flags and stock object/module/diagnostic semantics, can a target-native incremental constructor offer a nontrivial bounded-recourse or amortized guarantee outside the current Swift Driver action union?

**Counterfactual consequence.** A valid construction would reduce incremental rebuild work without changing compiler outputs or accepted language semantics.

**Minimum falsifier.** Current Swift Driver sources/configurations express the action, or the action reduces to generic build graph scheduling/hashing rather than a target-native compiler construction.

**Disposition.** RQ_BACKLOG__CURRENT_UNION_ANCHOR_NO_NONGENERIC_ACTION. The current first-party material already names several relevant incremental primitives, but the route does not yet name a union-external target-native action or a versioned natural carrier. No absence claim is made.
