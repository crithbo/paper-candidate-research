# O4-DYNCACHE-PGM Stage A Report

- Decision: `PASS_RECOMMENDED`
- Quality tier: `TIER_A_Q1_POTENTIAL`
- Evidence ceiling: deterministic leaf-local microkernel; no full-index theorem, performance, Pareto, or baseline-win claim
- Novelty route: `N1 + N2`
- Stage semantics: real pilot research on the highest-risk premise; PASS is not completion of the paper main claim.

## Frozen contract

`EXPERIMENT_CONTRACT.yaml` was frozen before execution at SHA-256 `e1df8bfa3401cce3a9a33ec47d65d243a0900c7dda2c9566aab1b7bfa622c953`. It fixes exact strict predecessor and closed output-sensitive range semantics, `ε=1`, four-key pages, a four-touch leaf-local update cap, two auxiliary page images, five rebuild key slots, the complete 8-key state space, and OSM replication sequence `7,235,045`.

The object is unchanged: fixed-width lexicographic `(Hilbert-cell, type-qualified OSM-element-id)` keys in a single-machine in-memory exact ordered index. The probe deliberately models only the leaf-local transition plus one logical routing-page charge.

## Headroom or theoretical gap

[ESA 2025](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ESA.2025.64) gives the closest dynamic ε-cover/indexing theorem and official artifacts, while its conclusion reports that contiguous logarithmic PGM is generally faster except in adversarial deletion/range settings and identifies memory-access-efficient fully dynamic conversion as open. PDEC's residual is therefore not fully dynamic indexing itself; it is the joint page-local certificate, charged per-update page work, and bounded dual-version space condition.

Stage A did not measure headroom. It tested whether a non-vacuous local transition can satisfy the paired invariants without weakening exact semantics.

## Minimal mechanism and strongest baselines

The minimal mechanism stores an endpoint affine rank certificate per leaf page, checked using exact rational arithmetic. An update copy-on-write replaces one old page with at most two contiguous feasible pages; queries continue to see the complete old image until atomic publication. Route, old read, new writes, certificate work, rebuilt slots, and auxiliary pages are charged.

The mandatory finite baseline set remains ESA 2025, PGM-index, ALEX, and TLX B+tree. Official sources and immutable revisions are locked in `BASELINE_LOCK.md`. Stage A performed an authoritative source/artifact lock, not a runtime baseline reproduction or comparison. HIRE 2026 is retained as the latest paper-level subtractor.

## Natural workload and mechanism-specific prediction

The natural witness is the official OSM minute replication diff `007/235/045`, replayed in canonical document order after mapping nodes to Hilbert-cell/id keys. The mechanism-specific prediction was zero exactness failures, at most four charged page touches, and at most two auxiliary page images on each effective leaf update.

The replay parsed 651 node events and applied 639 effective observed-window updates with zero failures. Maximum charged touches and auxiliary pages reached the frozen caps of 4 and 2. Because no initial snapshot was loaded, the ten delete records were absent-state no-ops; this is insert/upsert evidence only.

## Highest-risk probe result

- Risk-bearing premise: one coherent page-local transition can jointly preserve exact predecessor/output-sensitive range semantics, a fixed per-update leaf-page touch cap, and a fixed dual-version peak-space cap.
- Probe/counterexample-search scope: complete reachability closure over keys `0..7` plus every predecessor/range query at every reachable representation; one locked natural OSM feed-order replay.
- Negative-result meaning: any mismatch or cap violation would have been `NEGATIVE_KILL` under the frozen contract.
- Positive-result ceiling: `PRELIMINARY_SUPPORT`; never `MAIN_CLAIM_ESTABLISHED`.

Observed: 1,740 states, 27,840 transitions, 17,400 predecessor checks, 62,640 range checks, and zero failures. Deterministic rerun outputs were byte-identical.

## Directional increment

- Performance/quality/Pareto/complexity effect: no performance effect was measured. The directional increment is representational coherence: the local certificate and dual-version publication can coexist under exact semantics and frozen finite caps.
- Why it is not ordinary tuning or a weak-baseline artifact: the checker changes admissible state and transition structure rather than page-size tuning. However, the current local transition may still be absorbed as a copy-on-write B+tree leaf with an affine hint unless the scalable ε-cover and deferred/global maintenance residual is demonstrated later.

## Performance evidence chain, if applicable

- Algorithm/data-structure change: page-local exact-rational certificate plus copy-on-write old/new page transition.
- Intermediate mechanism metric: page feasibility, page touches, rebuild key slots, auxiliary pages/bytes.
- End-to-end effect: not measured.
- Full-cost result: not available; only the declared leaf-local cost ledger is closed.
- Generality region: complete frozen 8-key state space and one OSM insert/upsert feed window.
- No-gain or regression region: unmeasured; append-only and cache-resident regimes remain expected PGM/B+tree strengths.

## Current critical-cost analysis

The probe includes route charge, old leaf read, all new leaf writes, certificate recomputation, copied key slots, no-ops, committed pages, and peak auxiliary pages/bytes. It excludes multi-level directory maintenance, fence propagation, allocator/reclamation, synchronization, cache/TLB counters, baseline conversion/build/tuning, and actual latency/throughput. The fixed-page eager copy closes a page-count bound but not the proposed long-lived deferred credit guarantee.

## AI execution ledger

- AI executability class: `AI_CORE_CONDITIONAL`
- Measured ai_core_fraction: `0.65` along the eventual main-claim path; the AI executed the contract, model, exhaustive checker, public-input replay, validation, and audit artifacts, while the global proof and fair full-system evidence remain decisive and unfinished.
- Reproducible commands/artifacts: `COMMAND_LOG.md`, `pdec_probe.py`, `validate_results.py`, locked raw input, JSON results, and SHA-256 manifest.
- Human-only items: formal theorem audit and judgment that the global certificate is nontrivial/non-absorbed; no human action was used as experimental evidence here.

## Mechanism pivot, if used

No Stage A `MECHANISM_PIVOT` was used. The eager copy-on-write leaf transition is a deliberately narrow equivalent microkernel of the frozen page-local/dual-version mechanism, not a change of object or claim.

## Literature collision update

- ESA 2025 officially exposes both `DynamicLearnedIndex` and `LearnedIndexBench`; obsolete code-unavailable claims remain corrected.
- HIRE is now an official PACMMOD 2026 paper and directly subtracts hybrid-leaf, log-update, nonblocking-recalibration, throughput, and tail-stability claims.
- No bounded primary-source search hit supplied the complete PDEC page-certificate/page-touch/dual-version-space combination.
- Collision status remains `SEARCH_BOUNDED_OPEN_WITH_DIRECT_SUBTRACT`, not a first-ever claim.

## Stage B minimal prototype

This is a plan only and is not authorized.

- Primary workload: an OSM snapshot plus chronological diffs containing effective deletes/reinserts, under the exact Hilbert-cell/id mapping.
- Required orthogonal validation: a second independent public chronological ordered-key stream or a scale/theory case, plus exhaustive adversarial alternating updates on the scalable directory transition.
- Candidate Q1 venue family: VLDB Journal / ACM TODS / IEEE TKDE, with SIGMOD/PVLDB/PACMMOD contribution-shape calibration.
- Minimum implementation: multi-level page directory and fence maintenance, deferred credit/delta transition, atomic visibility/reclamation, exact oracle driver, ESA/PGM/ALEX/TLX adapters, and a full cache/update/space ledger.

## Q1/Q2 evidence-gap review

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Updated reference set: PGM-index (PVLDB 2020), ALEX (SIGMOD 2020), ESA dynamic geometric index (ESA 2025), HIRE (PACMMOD/SIGMOD 2026), Benchmarking Learned Indexes (PVLDB 2020).
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Evidence already comparable: exact object definition, deterministic artifact, finite counterexample search, natural public-input route, explicit failure/claim boundary.
- Executable Stage B gaps: global directory/deferred credit, effective natural deletions, second stream, strong baseline reproduction, full-cost performance, ablations, scale and failure frontier.
- Human/resource-dependent gaps: formal global proof audit. No private data or exclusive hardware is currently required.

## Non-relaxable quality audit

- Same-object: PASS for the frozen leaf-local microkernel; the global index remains unimplemented.
- Latest collision: bounded current primary-source audit with ESA/HIRE direct subtraction; still open by policy until Stage B.
- Strong fair baselines: finite set and immutable revisions locked; not executed in Stage A.
- Natural input/evidence: one public OSM feed witness; insert/upsert dominated and not independent cross-validation.
- Full-cost: PASS only for the declared local ledger; end-to-end full cost is open.
- Reproducibility: PASS; byte-exact deterministic rerun.
- Evidence/claim honesty: PASS; no theorem, performance win, Pareto win, or main-claim completion is asserted.

## Supported and unsupported claims

Supported: the contract-frozen leaf-local transition is executable, exact on the complete finite state space, respects the frozen local cost/space caps, replays one public OSM feed window without failure, and reproduces byte-for-byte.

Unsupported: scalable fully dynamic PDEC correctness; non-amortized global update bound; deferred-credit bound; cache/TLB or latency improvement; Pareto superiority; natural deletion robustness; baseline wins; global novelty; Q1 paper completion.

## Mandatory user gate before Stage B

- Independent Stage A gate decision: pending
- User-facing evidence packet: `USER_REVIEW_PACKET.md`
- `PENDING_USER_STAGEB_REVIEW`: no; independent gate has not yet passed
- Stage B user approval id/time: null
- Stage B authorized: false

Recommendation: submit this package to an independent `STAGEA-GATE-REVIEW`. Do not register Stage B or run any Stage B experiment from this owner session.

## Human research reserve, if applicable

Not recommended. The next evidence gaps are executable with public sources and ordinary CPU resources, subject to the mandatory independent/user gates.
