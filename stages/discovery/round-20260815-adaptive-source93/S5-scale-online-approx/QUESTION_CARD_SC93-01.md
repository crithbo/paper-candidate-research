# Discovery Question Card: SC93-01

- Exact identity: Kotlin Gradle Plugin compilation/caches documentation, current official page, accessed 2026-08-15; carrier IMPLEMENTATION_CARRIER_ONLY; security exclusion PASS.
- Five-field preflight: no exact/terminal match; related-only compiler-cache overlap. NO_MATCH is not novelty evidence.
- Fixed semantics: same Kotlin/JVM source/classpath, same compile outputs, same ABI/dependency invalidation and same Gradle task outcome.
- Full cost: snapshot bytes/creation, hash work, recomplied classes, build-cache I/O, daemon CPU/RSS, and exact output equivalence.

## Current union

- Kotlin incremental compilation is default for JVM/JS. Kotlin/JVM classpath snapshots are fine-grained for member changes and coarse-grained ABI hashes for cached jar files; they decide the dependent classes to recompile.
- Current docs also cover Gradle build cache, compilation avoidance, configuration cache and switches disabling incremental compilation/caching.
- Checked action/config union: fine/coarse snapshot representation, affected-class recompilation, kotlin.incremental and caching controls, Kotlin/Gradle cache support.
- Known direct fatal: FOUND. The concrete action reachable from the seed is selection of the documented snapshot/cache strategy or generic cache policy, not a new target-native action/guarantee.

## Disposition

- RQ_COMPLETE; RAW_REQUIRED INCOMPLETE; no non-generic atomic action.
- EXCLUDED_BEFORE_RAW. 当前 documents 已表达同对象 snapshot/invalidation/recompile decisions；不能把粒度选择或配置包装为 N2。
- No source queue/debt; eligible for C0: NO.
