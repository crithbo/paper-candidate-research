# Candidate-grade deep review

## F1 — PostgreSQL GiST global split/layout planner

**Disposition:** `NOT_ADMITTED_UNFROZEN`; no brief.

| Gate | Frozen record |
|---|---|
| Exact object / oracle | Same table/index/opclass/keys and stock query/update behavior; index integrity and physical structure need stock PostgreSQL validation tooling plus query equivalence. |
| Native action catalog | Local page partition, union recomputation, penalty-guided descent, parent propagation, sorted/buffered initial build, page assignment, WAL emission, vacuum/rebuild actions under fixed opclass callbacks. |
| Strongest current union | GiST core; all fixed-opclass `same`/`consistent`/`union`/`penalty`/`picksplit`/options/sortsupport callbacks; sorted and buffered build; WAL/vacuum/rebuild; current defaults and flags. Full source union unclosed. |
| Legal witness | Two three-entry page partitions with regenerated union keys can be query-equivalent under the same opclass. Not an action-gap certificate. |
| Putative N2 | A global initial-plus-incremental layout/split algorithm with a recourse, query-quality, size, or WAL-aware approximation guarantee. No such residual is frozen. |
| Natural carrier | Versioned public spatial/text data and query/update trace. |
| Full cost | Build/update/query CPU+wall+RSS; index size; WAL bytes; buffer/I/O; vacuum/rebuild costs; latency and correctness under the same database configuration. |
| 72h killer | Pin PostgreSQL core/opclass revisions; enumerate build, buffering, fillfactor, split, WAL and vacuum paths; construct two valid fixed-opclass indexes; reject if current union can express the action, callback/semantics change is required, only build settings remain, or full costs remove advantage. |
| Fidelity closure | Finite but incomplete: full source/options and direct collision closure are prerequisites. |

### Residual audit

- A new planner must use the same information and callback semantics, not alter the opclass.
- Local split freedom is insufficient when the opclass already owns `picksplit` and the core has sorted/buffered builds.
- Generic clustering/ILP, row reorder, controller logic, and changed opclasses are no-gain or changed-object paths.
- The withheld decision follows unclosed union/collision, not missing implementation, results, resources, or AI readiness.
