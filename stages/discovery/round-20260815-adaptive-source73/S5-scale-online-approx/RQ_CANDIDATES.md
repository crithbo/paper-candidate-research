# RQ-S73-01

- Exact public anchor: Apache Spark Structured Streaming Programming Guide, RocksDB state-store section, accessed 2026-08-15.
- Tentative object: built-in RocksDB StateStoreProvider checkpoints for one fixed stateful streaming query.
- Immutable contract: same state updates, emitted query output, provider identity and failure-recovery semantics.
- Primary RQ: Can current stock Spark construct an exact checkpoint representation with a non-policy bounded-recourse guarantee across online commits?
- Falsifier: current built-in union already includes the full legal representation transitions, or the only novelty is choosing when to snapshot/compact.
- Natural carrier/oracle: a versioned public stateful query trace plus stock query output/recovery oracle would be required if the action survived.
- Ordinary closure: EARLY_CONTROLLER_OR_CURRENT_UNION_EXCLUSION.

The source says changelog checkpointing is backward-compatible with traditional checkpointing, supports transitions in both directions, and persists periodic snapshots. These are current action facts, not a universal performance claim.
