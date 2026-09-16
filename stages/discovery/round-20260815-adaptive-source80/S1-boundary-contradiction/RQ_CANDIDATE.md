# Research-question candidate

## RQ01 — critical-array duration under a fixed JNI endpoint

For a fixed Java primitive-array program, native dataflow, Java-visible result, JNI critical-region legality, and VM GC-safety endpoint, can a non-generic N2 constructor jointly choose critical-array acquire/use/release placement to reduce lifecycle cost without changing the endpoint?

### Scope and FINER-lite

- In scope: direct primitive-array critical access and its corresponding release in the same native call trace.
- Out of scope: replacing the API mode, changing data transfer/copy semantics, arbitrary native scheduling, VM policy controllers, and security properties.
- Counterfactual consequence: an alternate legal placement would have to retain the same native reads/writes and critical-region restrictions while reducing pin/GC-lock duration or related full cost.
- Feasible: clear for a bounded source/protocol assessment; no experiment is needed to identify a direct semantic fatal.
- Interesting: conditional; an automatic, target-specific construction could matter for JNI numerical extensions.
- Novelty threat: high, because the apparent action is ordinary resource/lifetime placement.
- Precommitted primary route: official JNI specification plus current OpenJDK source. Transport-only fallback: official OpenJDK source mirror.
- Pre-RQ closure nomination: `ORDINARY_CLOSURE`; selective depth is frozen OFF.
