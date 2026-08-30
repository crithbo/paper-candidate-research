# Discovery Research Question Card — ROCKSDB-MULTISST-DICT-TRACE-COVERAGE

## Identity

- Card ID: `S6-RD-CARD01`
- Discovery lane / assignment: `DISCOVERY_S6 / DISCOVERY-S6-20260826-ROCKSDB-MULTISST-DICT-TRACE-REDESIGN`
- Seed / RQ: `DIVERGENCE_SEED_POOL.md / S6-RD-RQ01`
- Exact public identity: `facebook/rocksdb v11.1.2` plus current main builder loci inspected 2026-08-26; exact 20 public KVMAN1 manifests pinned by the predecessor resource package for future use only.
- Project / specification: RocksDB standard BlockBasedTable SSTs, Zstd dictionaries via current ZDICT/Zstd semantics.
- Carrier kind: `NATURAL` with an `IMPLEMENTATION_CARRIER_ONLY` current-source preflight.
- Network-security exclusion check: `PASS`

## Global canonical identity preflight

- Frozen lookup surface: registry snapshot `93245F3F...BE1DB`, context `DE75438A...4F85B`, predecessor `ROCKSDB-DICT-COVER` gate packet.
- Prior canonical identity matched: `ROCKSDB-DICT-COVER` only as predecessor boundary.
- Five-field relation — object: `RELATED_ONLY` (old: one production-equivalent SST per manifest; new: exact logical dataset as one legal native multi-SST collection).
- Five-field relation — action/estimand: `RELATED_ONLY` (old: per-SST retained-fragment selector; new: collection-level bounded dictionary portfolio, coreset, per-SST assignment and causal trace).
- Five-field relation — claim endpoint: `RELATED_ONLY` (old invalid 560-run endpoint; new collection-level full-cost portfolio residual and mechanism observability).
- Five-field relation — semantic guarantee: `EXACT` where intentionally preserved (4096-byte block, standard reader, ordered KV/checksum, unchanged ZDICT/Zstd).
- Five-field relation — full-cost boundary: `RELATED_ONLY` (newly includes dictionary duplication per assigned SST and collection-level training/selection construction).
- Frozen direct current collision hit: `NO`
- Mechanical identity disposition: `RELATED_ONLY_DO_NOT_EXCLUDE`
- Reminder: this is not evidence of novelty.

## Research contract

- Exact object: exact 20-manifest logical dataset encoded as one result-independent legal native standard RocksDB multi-SST collection with no record duplication, padding, synthesis, exclusion or backfill.
- Same-object problem: current per-file dictionary training cannot jointly allocate a global sample budget, choose a bounded portfolio and assign dictionaries across heterogeneous SSTs while accounting for repeated per-file dictionary bytes and compaction/read costs.
- Contribution type / route: `METHOD_ALGORITHM / N2`.
- Claim endpoint: a target-native constrained portfolio/coreset solver with a reproducible full-cost Pareto residual and a verified retained-fragment→final-dictionary→compressed-block-match mechanism.
- Counterfactual consequence: RocksDB table-build/compaction policy would select among no-dict/global/per-SST/intermediate-portfolio regimes based on collection structure rather than always train independently per file.
- Non-generic discriminator hypothesis: the solver jointly handles a single global training-sample budget, reader-local dictionary duplication per assigned SST, compaction-order/buffer constraints, per-file dictionary meta-block legality, and exact causal trace; generic k-means/facility-location lacking these costs is a named strong baseline.
- Initial full-cost boundary: acquisition/construction, sample/sketch bytes, ZDICT training, assignment probes, portfolio iterations, compaction CPU/wall/RSS/temp I/O, output SST and dictionary bytes, cold/warm reader/decompression memory/cache effects, and reproduction cost.

## RAW_REQUIRED evidence minimum

- Opportunity anchor: current RocksDB main builder is explicitly per-file; one serialized dictionary is trained from this file and written to this SST.
- One versioned current official locus: `facebook/rocksdb v11.1.2`; main `table/block_based/block_based_table_builder.cc` inspected 2026-08-26.
- Known direct-fatal check at this locus: `NONE_FOUND_WITHIN_BOUND`
- Strongest skeptic objection: DCC’01 already formalizes optimal multiple preset dictionary families/assignment as NP-hard compression segmentation; a RocksDB implementation could be a generic clustering wrapper.
- Preliminary residual: a streaming/bounded target-specific solver for RocksDB’s reader-local meta-block, global sample budget, duplicate-dictionary and compaction constraints, with a causal mechanism trace and baseline-safe objective.
- Search boundary: 17/20 attempts across official RocksDB/Zstd and primary paper routes; no same-object direct paper found; search remains bounded open.

## Cheapest decisive test

- Minimum falsifier: on a small legal collection with at least two heterogeneous SST groups, compare candidate against no-dict, current per-file, one-global, historical-style shared-one, equal-budget per-SST, generic k-medoids/compression-segmentation and a tiny offline oracle. Fail if the candidate action/solution is identical to a generic baseline, any strong baseline dominates after full cost, or exact trace/legality cannot close.
- Small witness: deterministic native collection of 4–8 SSTs, 4096-byte blocks, unchanged reader/checksums, at least two source-grounded repetition regimes, with no copied/padded/excluded records.
- Finite closure route: static API/source design → assignment-local builder/Zstd trace preflight → tiny oracle and strong-baseline consumption → natural 20-manifest Stage A probe only after preclaim fidelity passes.
- Stop/narrow condition: current source or a recent prior expresses the full constrained action; solver reduces to generic segmentation; trace requires format/reader change; or no natural full-cost residual is observable.

## Bounded closure debt

- Complete current default/non-default union: `OPEN_BOUNDED` — Stage 0 must independently inspect current release/main PR/issue/source union and custom CompressionManager expressivity.
- Strongest recent-paper subtractor: `OPEN_BOUNDED` — DCC’01/WSDM’19/cross-entity work closed; recent storage-specific portfolio literature requires independent Stage 0 search.
- Complete genealogy/contrary route: `OPEN_BOUNDED` — historical RocksDB reuse and Zstd primitives closed; patents/industrial systems not exhaustive.
- Small native witness: `OPEN_BOUNDED`, owner `STAGEA_PRECLAIM`.
- Checker/reader/codec/interface: `OPEN_BOUNDED` — source loci exist; dictionary-offset match instrumentation design must be validated.
- Natural corpus: `CLOSED_AS_ROUTE_NOT_RESULT` — 20 public manifests are pinned, but no new-result use is permitted here.
- Full-cost protocol: `OPEN_BOUNDED`, owner `STAGE0/STAGEA_PRECLAIM`.
- Q1/Q2 calibration: `OPEN_BOUNDED`, owner `STAGE0`.
- Maximum decisive questions: `3` — direct constrained-algorithm collision; generic-collapse test; finite trace/strong-baseline witness.
- Claim ceiling while open: `TIER_B_Q2_VIABLE_CONDITIONAL / SEARCH_BOUNDED_OPEN`

## Front-end disposition

- RQ audit: `RQ_COMPLETE`
- RAW_REQUIRED audit: `COMPLETE`
- Closure debt: `OPEN_BOUNDED`
- Identity relation: `FRESH_NEW_ID_WITH_RELATED_PREDECESSOR`
- Disposition: `EVIDENCE_QUALIFIED_RAW`
- Eligible for C0: `YES`
- Plain Chinese reason: 当前源码给出了明确 per-file baseline 与有限 action gap；直接 fatal 未出现，但多字典选择的通用算法历史很强，必须在 deep/Stage 0 证明目标特异 solver 不只是改名。

