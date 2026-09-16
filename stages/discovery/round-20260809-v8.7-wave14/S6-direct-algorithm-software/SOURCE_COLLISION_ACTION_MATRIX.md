# S6 Wave 14 — current upstream reality/collision matrix

Frozen source cutoff: 2026-08-09. Sources are official SQLite documentation and primary literature only.

| Seed | Exact object / natural oracle | Current same-object deployable union | Action-gap result | Decision |
|---|---|---|---|---|
| FTS5 segment-merge constructor | Fixed FTS5 natural text corpus → same indexed documents/tokens/query results; FTS5 `integrity-check` and query equivalence are possible native oracles | Official [FTS5](https://www.sqlite.org/fts5.html): `automerge`, `crisismerge`, `usermerge`, signed page-budget `merge`, full `optimize`, `pgsz`, and documented merge continuation via `sqlite3_total_changes()` | `CURRENT_UNION_ABSORPTION`: trigger threshold, eligible count, immediate vs incremental execution, page budget, continuation and full compaction are existing actions. | `DROP_CURRENT_UNION_ABSORPTION` |
| Adaptive merge threshold / background scheduler | Same FTS5 index | Same commands/options | Policy that picks existing controls; it is controller/tuning rather than an internal full constructor. | `DROP_CONTROLLER_ROUTINE_TUNING` |
| Retokenize/reorder documents then merge | Different token stream/index/query statistics | Current FTS5 writer/query semantics | Changes input/index object, or is external preprocessing glue. | `DROP_CHANGED_OBJECT_WRAPPER` |

## Reality-check record

The official documentation—not an issue—states that FTS5 maintains a series of b-trees, merges same-level trees, and provides each listed action/configuration with defaults and bounds. Since the union explicitly contains the action space, no fidelity plan can make a speculative scheduling residual admissible. The closest general LSM merge literature is an adjacent methodological subtractor only and cannot reopen the same current FTS5 object.
