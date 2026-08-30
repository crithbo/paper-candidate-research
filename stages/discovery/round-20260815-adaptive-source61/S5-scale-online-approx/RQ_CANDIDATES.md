# Source61 S5 RQ candidate

## S61-RQ-01

- Seed: S61-01.
- Exact public anchor: Kotlin documentation, “Compilation and caches in the Kotlin Gradle plugin,” current page accessed 2026-08-15.
- Tentative object: Kotlin/JVM incremental compilation's project classpath snapshots and output cache, with ordinary Kotlin/JVM compilation output unchanged.
- Primary RQ: Can a target-native bounded-recourse constructor jointly evolve Kotlin/JVM fine- and coarse-grained classpath snapshots over versioned dependency updates while preserving which sources must be recompiled?
- Immutable boundary: same Kotlin source/classpath semantics and output; excludes changing Gradle cache semantics, a trigger/parameter policy, external cache wrapping, or a generic dynamic graph solver.
- Minimum falsifier: current Kotlin plugin already implements the asserted joint precision/state action, or only a generic snapshot/rebuild schedule remains.
- Primary route: Kotlin official compilation-and-caches documentation. Fallback for transport failure only: official Build Tools API documentation.
- FINER-lite: feasible CONDITIONAL; novelty threat HIGH; scope PASS; relevance CONDITIONAL.
- Ordinary closure only; no alternate RQ was needed.
