# RQ-S71-01

- Exact public anchor: Gradle Artifact Transforms, current user guide, accessed 2026-08-15.
- Tentative object: one Gradle-declared artifact transform and its stock output/variant resolution semantics.
- Immutable guarantee: the same transform output accepted by the same stock dependency-resolution consumer.
- Primary RQ: Does current Gradle expose a native, bounded-recourse constructor for an exact transform output after a small input-archive edit, rather than cache reuse or a user-supplied transform action?
- Non-generic discriminator: the action must be inside the current Gradle native transform mechanism; a plugin-provided delta algorithm is not a target-native residual.
- Counterfactual: a native exact constructor could lower rebuild/write/RSS cost without changing dependency resolution.
- Minimum falsifier: the only legal implementation site is a custom TransformAction or ordinary caching.
- Precommitted source roles: current official artifact-transform guide for anchor/current/contrary; current source only if a native action survives.
- Ordinary closure result: CLOSED_TO_EARLY_GENERIC_EXCLUSION.

The guide makes transform actions user-defined and describes build-cache reuse for known results. That is sufficient to rule out promotion of a generic or paper-owned delta transformer; it is not an absence claim about every possible Gradle optimization.
