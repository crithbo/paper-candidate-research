# S96-S1-RQ01 — Java Cleaner explicit/automatic cleanup boundary

- Anchor: Java SE 25 `java.lang.ref.Cleaner`, <https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/ref/Cleaner.html>, accessed 2026-08-15.
- Fixed object/guarantee: one Cleaner, registered object/actions, explicit-or-phantom-reachable cleanup, action at-most-once guarantee and registration happens-before relation.
- Contribution hypothesis: `SYSTEM_ARCHITECTURE`, N2.

## Primary RQ

For a fixed Java Cleaner workload, can a target-specific complete action-placement construction reduce cleanup full cost while preserving at-most-once cleanup, happens-before, concurrent action compatibility and the same explicit/automatic endpoint, rather than merely scheduling a worker queue?

- Null: moving/grouping actions changes timing/visibility or just applies generic queue scheduling.
- FINER-lite: feasible CONDITIONAL; interesting CONDITIONAL; novelty HIGH; scope PASS; relevant CONDITIONAL.
- Primary/fallback: official JDK 25 Cleaner API / official linked JDK API definitions (transport-only).
- Ordinary closure; no selective packet.
