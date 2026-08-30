# DISCOVERY_QUESTION_CARD — SC98-01

- Exact identity: ERLANG_MNESIA_EXACT_TRANSFORM_TABLE__ONLINE_VERSIONED_RECORD_RECOURSE.
- Project/version/date: official Erlang/OTP Mnesia API, OTP 29.0.3 / Mnesia 4.26.1, accessed 2026-08-15.
- Carrier kind: IMPLEMENTATION_CARRIER_ONLY; a public versioned Mnesia application history is a bounded later carrier debt.
- Same-object boundary: fixed Mnesia logical table, key identity, transaction semantics, reader-visible transformed records, table copy behavior, and recovery semantics.
- Problem: stock `transform_table` applies a function to all records and requires Mnesia stopped on all db_nodes, while stock `move_table_copy` can retain reads/writes during a copy move. A schema transition therefore has an online/scale boundary under the same logical table contract.
- Proposed insight: an epoch-tagged, target-native record transformation may provide a bounded-recourse online transition only if it preserves the exact transformed-record and transaction/recovery contract; it is not a trigger or migration planner.
- Contribution: METHOD_ALGORITHM / N2. Endpoint: target-native action plus stated recourse/complexity guarantee.
- Current official locus: https://www.erlang.org/doc/apps/mnesia/mnesia.html and official Mnesia building guide.
- Current documented union: transform_table; add/del/move table copy; change table copy type; change fragment properties; transactions/checkpoints. `transform_table` changes all records while retaining table keys; `ignore` metadata-only mode is documented as inconsistent/offline; table-copy move permits other reads/writes.
- Strongest skeptic: exact transaction/recovery semantics may make online version mixing impossible, or an available table-copy/fragment operation may absorb the proposed action.
- Initial full-cost: transformed records, old/new version residency, transaction validation/retry/abort work, copies/logs, storage/temporary bytes, peak RSS, read/write latency, recovery/checkpoint work.
- Minimum falsifier: current source exposes an online record-version/dual-schema transition with the same semantics, or a two-version state necessarily changes transaction visibility/recovery equivalence.

## Bounded debt

| Field | Status | Finite route |
|---|---|---|
| Source-level union and flags | OPEN_BOUNDED | One official erlang/otp released tag: Mnesia transform/copy/fragment paths, schema transaction controls, and relevant default/non-default options. |
| Small legality witness | OPEN_BOUNDED | Two transactions straddling one record-schema transition with stock Mnesia read/recovery oracle. |
| Current collision/genealogy | OPEN_BOUNDED | One bounded original-paper/current implementation route. |
| Natural carrier | OPEN_BOUNDED | Public versioned Mnesia project schema-change history; implementation-carrier ceiling until identified. |

- Identity preflight: no exact/terminal match found in the allowed registry surface; no-match is not novelty evidence.
- RAW_REQUIRED audit: COMPLETE. Disposition: EVIDENCE_QUALIFIED_RAW.
- Claim ceiling: raw mechanism hypothesis only; no claim of novelty, online correctness, guarantee, performance, Q2, or Stage 0 eligibility.
