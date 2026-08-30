# Wave193 source-level legality closure

Assignment: `DISCOVERY-S5-20260811-V8.7-WAVE193-POSTGRES-BTREE-REDISTRIBUTION-WAL-LEGALITY-CLOSURE`. Frozen control hashes matched the assignment: plan `513D9C3587B50DF6527ABE7FC40C00E0CA54D3526B2A51E2D4803F0B5DC38EAB`, registry `4DD0993FCA66D517E3A758476362AD40629D732279E77DE7CBEC5CAFEAB890E5`, and ROLE_DISCOVERY `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`. No experiment, download, downstream stage, or shared edit occurred.

## Current-source reality

The inspected official current sources are the PostgreSQL 18 documentation, [B-tree internals](https://www.postgresql.org/docs/current/btree.html), [locking](https://www.postgresql.org/docs/18/locking-indexes.html), [pageinspect](https://www.postgresql.org/docs/18/pageinspect.html), [amcheck](https://www.postgresql.org/docs/18/amcheck.html), [WAL/recovery](https://www.postgresql.org/docs/18/runtime-config-wal.html), and the official [nbtpage source cross-reference](https://doxygen.postgresql.org/nbtpage_8c.html). The intended upstream ref is `postgres/postgres:REL_18_STABLE` as checked 2026-08-11. Attempted immutable-ref resolution via `git ls-remote` failed before remote access with Windows Schannel `SEC_E_NO_CREDENTIALS`; therefore no fabricated SHA is recorded and closure remains source-pin incomplete.

The documented union covers `_bt_split`-style split semantics (including parent/root cascade), leaf-page high keys and sibling links, bottom-up/simple deletion, lazy deduplication, VACUUM/page reuse, REINDEX, short-term page share/exclusive locks, WAL-backed pages/recovery and structural/heap-index checking. Doxygen exposes `_bt_unlink_halfdead_page` in `nbtpage.c`, confirming page deletion is a special multi-page state transition rather than a free redistribution primitive.

## Minimal conditional before/after witness

This is a *legality specification*, not a claim that current PostgreSQL implements it.

Before: adjacent non-rightmost leaf pages `L -> R`, with `L.highkey = s`, `R.highkey = t`, `max(L) < s <= min(R) <= max(R) < t`; sibling links agree; parent has downlinks/partition pivots selecting `L` then `R`; every leaf item is an unchanged `(key,TID/posting-list)` logical entry and retains MVCC visibility through heap/TID rules.

Proposed bounded action: choose a contiguous suffix `M` of live, order-preserving tuples from `L`, move it to the front of `R`, set `L.highkey = first(M)` and update the parent pivot/downlink boundary for `R`; retain `R.highkey=t`, sibling links, all TIDs/posting-list contents and every nonmoved tuple. Bound recourse by `k=2` leaf pages plus their parent page(s), `|M|` tuple copies and the corresponding WAL records. This is not a split, VACUUM, REINDEX or reader change.

Required, unproven source facts: a deadlock-safe buffer-lock order compatible with concurrent scans/inserts; correct parent pivot update while traversal can observe an in-progress transition; exact WAL record layout/redo order so a crash after each durable substep leaves a searchable tree; interactions with incomplete splits, half-dead deletion, dedup posting lists and bottom-up deletion. Existing docs prove page-level locking and invariants, but not this new multi-page transition. The witness is therefore `UNFROZEN`.

## Comparator / oracle / finite closure

Comparator union: current insert + deletion/dedup + split + VACUUM/page deletion + REINDEX/REINDEX CONCURRENTLY, with all relevant settings including `deduplicate_items` and WAL/recovery controls. A policy choosing when to run any of them is excluded.

Same-object oracle: `bt_index_parent_check`/`rootdescend`, `heapallindexed`, fixed-snapshot SQL equality/range results, pageinspect high-key/sibling inspection, and crash recovery to the same WAL endpoint. Full cost: index bytes, page/tuple/posting-list copies, buffer locks, WAL bytes/fsync, dirty I/O, temp/RSS, update/query/vacuum latency and recovery time.

Natural route: before any admission, pin a public versioned PostgreSQL update trace/database and the exact branch commit. A <=72h killer rejects if any oracle/replay differs, `k` is exceeded, a native union action expresses the alleged transition, or no full-cost/conditional-recourse advantage remains.

Decision: `COMPLETE_ZERO_PROPOSALS__UNFROZEN_SOURCE_PIN_AND_LEGALITY_GAP`; no scientific STOP and no implementation-absence claim.
