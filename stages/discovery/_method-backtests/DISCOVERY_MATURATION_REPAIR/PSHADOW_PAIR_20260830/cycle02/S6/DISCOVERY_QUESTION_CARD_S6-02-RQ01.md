# Discovery Research Question Card

## Identity

- Card ID: `S6-02-CARD-01`
- Discovery lane / assignment: `DISCOVERY_S6_DIRECT_ALGORITHM_SOFTWARE` / `DMR-V1-PSHADOW-CYCLE-02-S6`
- Source divergence seed ID/path: `S6-02-SEED-01` / `CANONICAL_SEED_POOL.md`
- RQ candidate ID/path: `S6-02-RQ01` / `RQ_CANDIDATE_S6-02-RQ01.md`
- Exact public identity: `EricLBuehler/mistral.rs` official repository and official paged-attention documentation, current views retrieved 2026-08-30.
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY`
- Network-security exclusion check: `PASS`

## Global canonical identity preflight

- Frozen lookup surface: Cycle02 context and related registry record.
- Prior canonical identity or certificate matched: no exact identity match asserted; Cycle01 did not produce an eligible repair nomination.
- Five-field relation: `UNKNOWN` pending source closure; no novelty/absence inference.
- Frozen direct current collision hit: `UNKNOWN`
- Mechanical identity disposition: `MAINLINE_RECONCILIATION_REQUIRED`

## Research contract

- Exact object and immutable semantics/quality contract: current `mistral.rs` CUDA paged-attention/prefix-cache runtime; cache contents and decoding semantics unchanged.
- Same-object problem or estimand: whether live-block topology can define a page-relocation/compaction action with a fixed full-cost boundary.
- Contribution type: `COMPILER_TOOL`
- Contribution route: `N2`
- Claim endpoint: target-native action
- Counterfactual consequence: scheduler makes a page-relocation decision distinct from admission, eviction, or ordinary pool allocation.
- Initial full-cost boundary: relocation work, block-table/metadata updates, synchronization and decode-path compatibility; no measurements run.

## RAW_REQUIRED evidence minimum

- Opportunity/problem anchor: official documentation states paged attention uses fixed-size blocks from a central pool; each sequence keeps block pointers, allocates a tail block when needed, returns blocks on finish, and shares identical-prefix blocks by reference count.
- One versioned current native/official source or specification locus: `https://docs.mistralrs.dev/guides/perf/paged-attention/` retrieved 2026-08-30, especially its “How it works” section.
- Known direct-fatal check at this locus: `NONE_FOUND_WITHIN_BOUND`; documentation does not itself establish source-level absence of compaction.
- Strongest immediately known skeptic objection: the proposed action may already be expressed in current scheduler/block-pool source, or otherwise collapse to a generic allocator/eviction policy.
- Preliminary residual hypothesis: `UNFROZEN`; not a candidate claim.
- Search and source boundary: exactly six allowed official-source search/open calls consumed; no further call permitted.

## Cheapest decisive test

- Minimum falsifier: a current official source symbol/path that implements equivalent live-block relocation/compaction, or proof that the only available action is generic allocation/eviction.
- Small witness, carrier, oracle or checker: current scheduler and block-pool source, not run.
- Finite closure route: inspect the frozen official source path and a transport-only official fallback under a new authorized packet.
- Stop/narrow condition: confirmed direct action absorption, generic-only action, or no finite same-object carrier.

## Source-closure recovery

- Missing single public artifact or co-defined bounded field bundle: current source-level scheduler/block-pool action and relocation semantics.
- Pre-RQ closure nomination ID: `NONE`; ordinary closure attempted.
- Packet result: `UNRESOLVED_BACKLOG`
- Precommitted primary route: official repository source view.
- Precommitted fallback for transport/resource failure only: official documentation/source view.
- Frozen route count: 2
- Attempt counter: 6 total assignment source actions; direct guessed current source path returned `Internal Error`.
- Per-route status and evidence: source route `BLOCKED` by internal-error response; documentation route `ATTEMPTED` and specifies pool allocation/free/shared-block semantics but not the required source-level action closure.
- Queue disposition: `SOURCE_CLOSURE_QUEUE`
- Queue status: `BLOCKED`
- Exhaustion consistency: `NOT_EXHAUSTED` — an authorized future packet may perform the remaining source closure; this assignment has no remaining call budget.
- Resource inventory reconciliation: `NOT_APPLICABLE`

## Front-end disposition

- RQ audit: `RQ_COMPLETE`
- RAW_REQUIRED audit: `INCOMPLETE`
- Closure debt: `OPEN_BOUNDED`
- Identity relation: `UNKNOWN`
- Disposition: `SOURCE_CLOSURE_QUEUE`
- Reason in plain Chinese: 当前官方文档足以定位 paged pool 的分配、共享与归还语义，但没有完成源码级 relocation/compaction action 的存在或吸收核验；预算已耗尽，不能把“未看到”写成不存在。
- Eligible for C0: `NO`
