# S68-RQ01

- Seed `S68-SEED01`; hypothesis `SYSTEM_ARCHITECTURE / N2`.
- Primary RQ: **For a fixed Linux `futex_waitv` vector and fixed wake-index/timeout/signal semantics, can a target-specific whole-vector registration construction improve cost with a non-generic guarantee beyond the current multiwait union?**
- Null: reordering vector entries changes returned-index semantics; preserving it leaves current all-entry setup/unqueue/retry plus generic sleep/wake scheduling.
- FINER-lite: feasible CLEAR; interesting CONDITIONAL; novelty threat HIGH; scope PASS; relevance CONDITIONAL.
- Ordinary closure result: `EARLY_FATAL__CURRENT_MULTIWAIT_UNION_OR_CHANGED_ENDPOINT`.
