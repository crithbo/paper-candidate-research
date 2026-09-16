# Source93 S5 RQ

## S5-93-RQ01

- Anchor: Kotlin Compilation and Caches in the Kotlin Gradle plugin, official current documentation.
- Fixed object: Kotlin/JVM classpath snapshot incremental compilation under unchanged Kotlin compilation output and ABI/dependency semantics.
- Primary RQ: does a target-native exact bounded-recourse state constructor exist outside the current fine/coarse snapshot, build-cache, compilation-avoidance, and configuration union?
- Out of scope: choosing snapshot granularity, disable flags, Gradle cache/controller settings, changed bytecode/ABI semantics, or a different compiler.
- Falsifier: current source defines both snapshot representations and their recompilation behavior, so any concrete intervention is only existing state selection/configuration.
- Routes: https://kotlinlang.org/docs/gradle-compilation-and-caches.html; transport-only fallback https://kotlinlang.org/docs/gradle.html.
- Disposition: RQ_READY_FOR_ORDINARY_CLOSURE.
