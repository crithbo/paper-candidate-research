# Unique opportunity family

## F1 — same-opclass GiST global split/layout constructor

**Same-object contract.** Fix the PostgreSQL table, GiST index definition, opclass, indexed keys, query results, and update semantics. A replacement must remain readable by stock PostgreSQL, retain the same `consistent`/`same`/`union` correctness contract, preserve transactional/WAL requirements, and use stock index scans. Changing opclass, key semantics, row order, query interface, or installing an external index is excluded.

**Putative whole action.** Jointly plan initial page assignment and tree layout, then choose native-legal page splits/parent propagation under future inserts while regenerating all pages and WAL records. A valid N2 needs a formal quality/approximation/recourse guarantee that is distinct from opclass-local `picksplit`/`penalty`, sorted build, and buffered build.

**Minimal native-legal two-index witness.** For three entries admitted by a fixed spatial opclass, two legal page partitions can place a different pair together and compute the corresponding parent union keys with the same opclass callbacks. Both indexes support identical query/update semantics and are stock-reader-valid. The witness proves legal split freedom only; it does not prove that a global action is outside PostgreSQL’s build plus callback union.

**Why not admitted.** PostgreSQL explicitly exposes local split, penalty, union, sorted build, buffered build, and opclass-specific options. The complete current source union across GiST core, representative built-in opclasses, build/rebuild, WAL, vacuum and defaults is not commit-pinned. R-tree/GiST bulk-loading and split literature collision is likewise unclosed. Therefore the witness cannot yet distinguish a nontrivial same-object global constructor from a custom `picksplit`, sortsupport, build mode, or generic clustering.

**Natural route.** Public OpenStreetMap-derived geospatial tables or official PostgreSQL regression-like data can provide a versioned natural carrier. A later fidelity gate would use stock queries plus a suitable GiST consistency/oracle route and capture build/update/query/WAL/size/RSS costs; no data or run occurred here.
