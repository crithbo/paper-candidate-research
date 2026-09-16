# S95-S1-RQ01 — asyncio TaskGroup cancellation/exception endpoint

- Anchor: Python 3.14.7 `asyncio.TaskGroup`, <https://docs.python.org/3/library/asyncio-task.html#task-groups>, accessed 2026-08-15.
- Object/guarantee: one TaskGroup execution with its task set, exception propagation, cancellation count and context-manager exit semantics fixed.
- Contribution hypothesis: `SYSTEM_ARCHITECTURE`, N2.

## Primary RQ

For a fixed Python TaskGroup execution, can a target-specific complete group-exit construction reduce full cancellation/exit cost while preserving task completion, exception-group output, and internal/external cancellation-count semantics, rather than merely rescheduling cancellation?

- Null: altered cancellation sequence changes exceptions/counts/observable cleanup; fixed semantics leave generic event-loop/state-machine scheduling.
- FINER-lite: feasible CONDITIONAL; interesting CONDITIONAL; novelty threat HIGH; scope PASS; relevant CONDITIONAL.
- Primary/fallback source route: official Python TaskGroup page / its official source link (transport-only).
- Pre-RQ closure: ordinary; no selective packet.
