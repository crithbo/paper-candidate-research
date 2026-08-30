# Candidate-grade deep review

## SQLITE-BTREE-GLOBAL-PAGE-ASSIGNMENT — STRUCTURAL_DROP

### Exact object and fixed semantics

Construct the physical SQLite B-tree state produced by a fixed sequence of SQL writes to a fixed logical database, at fixed page size and journal mode. The stock SQLite reader must return identical SQL results; the transaction must retain its native atomic/commit semantics. The candidate cannot reorder logical records, change schema/index definition, change page size/journal mode, or invoke a different database/codec.

### Current strongest same-information executable union

`src/btree.c` supplies the relevant union, not merely one heuristic: insert/delete cell handling; `balance()`/`balance_nonroot()` and right-edge `balance_quick()`; `allocateBtreePage()` in ANY/EXACT/LE modes; free-list release via `freePage2()`; overflow-page maintenance; autovacuum/incremental-vacuum relocation with pointer-map repair; and B-tree commit phases/journal work. The actual source explicitly states that `balance_nonroot()` redistributes cells between a page and up to two siblings. It also rebuilds a page when in-place editing fails. This is the strongest native baseline because every action has the same reader and transaction semantics.

### Complete atomic action and minimal witness

The only initially plausible complete action was: for an overflowing/underfull leaf and its parent-selected sibling window, choose the ordered split points, allocate/free a required page, place the resulting cells, update divider cells and all affected page references, and commit through the native pager/journal path.

Minimal static witness: three adjacent leaf pages containing variable-size but key-ordered cells, where two legal split points yield two valid two/three-page distributions without changing logical rows. This is a legality witness, not a performance claim. It is nevertheless **not divergent**: it is exactly the region and redistribution class documented in `balance_nonroot()`.

Trying to expand the action across nonlocal pages does not repair the gap. If it moves existing pages into free positions, autovacuum already has a native relocate-and-fix-pointer action. If it rewrites the whole file, it is VACUUM/rebuild and must pay rewrite/journal cost. If it freely assigns records to arbitrary pages, it either violates B-tree separators/order/transaction scope or becomes generic packing with no SQLite-specific N2.

### Algorithm / guarantee / action-gap verdict

No union-external complete action survives. A hypothetical dynamic program for wider cell partitions would be a selector over an action whose semantics and update scope are not frozen; restricted to the native sibling action it is absorbed. Therefore there is no nontrivial same-object N2 or defensible guarantee ceiling. This is a structural absorption/generic-packing failure, not a result/readiness/resource failure.

### Natural carrier and full cost (specified for falsification)

Had a residual remained, Stage A would freeze a public, real SQLite application database plus its released SQL write trace; use fixed page-size and journal-mode variants; verify `PRAGMA integrity_check` and a deterministic query-result digest after every run. The denominator would include database plus journal/WAL bytes, build/write/read CPU time, peak RSS, page writes, and post-build read cost—not database file bytes alone. This carrier is not used to infer a positive claim.

### Finite 72-hour killer and stop predicate

1. Freeze the named current source revision and enumerate every balance/allocation/relocation call reachable for the small three-leaf witness.
2. Encode both legal split distributions as standard B-tree pages and map each to the source action path, including parent/divider, freelist and journal writes.
3. Run `integrity_check` and a fixed query digest only after a future Stage A fidelity gate; no such run was performed in Discovery.

**Killer / stop predicate:** if each witness distribution is expressible by `balance_nonroot` plus allocation/free-list actions, or the alternative requires VACUUM/global rewrite or logical record reordering, the candidate is rejected. Static source review already meets this predicate for the only minimal witness.

### Fidelity closure plan

Finite but negative: the native reader/oracle is SQLite plus `PRAGMA integrity_check`; the candidate action is fully enumerated above; comparator semantics and costs are fixed. The plan closes the question by showing direct absorption, so no Stage 0 brief is warranted.
