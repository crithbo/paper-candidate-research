# PB-DELETE-SCHEDULE Stage A Independent Gate Review

- Review lane id: `STAGEA-GATE-REVIEW-LANE-2`
- Assignment id: `STAGEA-G2-20260809-PB-DELETE-SCHEDULE-INITIAL-CLOSING`
- Input freeze SHA-256: owner manifest `B1256B2B631BCE9DBEE27E310F56A9A9F19FFB9C69BAC8A0194293A33757AF11`
- Reviewer non-participation and cross-assignment contamination declaration: reviewer did not implement or modify the candidate, did not run Stage B, and used only the assigned PB frozen packages. Prior-candidate working context was not used as evidence.
- Decision: `REVISE_ONCE`
- Quality tier: `TIER_B_Q2_VIABLE` (structural and conditional; Stage A empirical support is not yet valid)
- Confidence: `HIGH`
- Evidence ceiling: `CONTROL_ONLY__SINGLE_ADJACENT_SWAP_PROXY_NEGATIVE__NO_PASS_OR_STOP_INFERENCE`
- Pre-claim contract fidelity gate disposition: `FAIL_CLOSED`
- Candidate action completeness / proxy check: `FAIL` — frozen action is a complete legal ordered partition/batching order; the run emits either the original proof or one adjacent swap selected from at most four trials.
- Native codec/solver/reader/format parity: `PASS_FOR_EXECUTED_CONTROL_ONLY` — the proxy uses the frozen WCNF/output, augmented proof format, forced-checked VeriPB, and CakePB.
- Metric denominator and full-cost dimension completeness: `FAIL` — 24 sampled legal alternates are a valid lower bound on trace-level existence, but the required 30-natural-trace denominator is not closed and the sample does not represent complete-action scheduling; Pareto aggregation omits RSS and I/O; candidate exploration is not fully charged.
- Candidate Q1 venue family: SAT / CP / IJCAR / formal certification
- Stage B authorized: `false`
- Stage B user approval id: `null`

## Executive finding

The owner package is mechanically intact and the executed adjacent-swap control is a reproducible negative. It is not, however, a claim-bearing test of the frozen N2 mechanism. The updated `PRE_CLAIM_CONTRACT_FIDELITY_GATE` requires the full ordered-partition action, contract-faithful comparators, the same information denominator, and all preregistered costs before a run can support either PASS or STOP. Those conditions were not met. Because the scientific revision is unconsumed and the defects form one atomic contract-fidelity gap, the only valid closing decision is `REVISE_ONCE`.

## Claim and novelty-route consistency

The frozen decision variable is `legal_ordered_partition_batching_order_of_existing_checked_core_deletions`. The implementation instead:

1. constructs only adjacent pairs within contiguous checked-deletion blocks;
2. selects the first match under four selectors, so a trace receives at most four trials;
3. swaps exactly one adjacent pair; and
4. chooses `candidate_frontier` from the already verifier-accepted trial list using command-byte difference.

Read-only proof comparison confirms the consequence: all 30 original records are identical; stable has 11 one-swap and 19 identical records; greedy has 13 one-swap and 17 identical records; candidate has 24 one-swap and 6 identical records. No method constructs a complete ordered partition or batch schedule. This is precisely the emitter-wrapper/proxy failure warned about by the Stage 0 confirmation. The observed negative therefore falsifies only this one-swap heuristic, not the frozen dependency-scheduled N2.

## Baseline fairness audit

- `ORIGINAL_TRACE_ORDER` is real and correctly represented.
- The named stable and greedy comparators are not their frozen semantics. They are predicate-filtered choices over the same small sampled adjacent-swap trial set, with fallback to original.
- `candidate_frontier` is allowed to choose from every accepted sampled trial, while stable and greedy use narrower predicate subsets. This is not a common complete action space.
- All non-original choices are selected after VeriPB/CakePB acceptance is known. If this verifier oracle is retained as part of construction, all exploration and checker calls required to discover the selected schedule must be charged. The package charges only one selected or designated trial.
- The executed methods do share the same frozen input/output and native checkers, so their results remain useful as controls.

Disposition: `FAIL_PRE_CLAIM_COMPARATOR_FIDELITY`.

## Decisive evidence audit

Independent read-only recomputation found:

| Check | Independent result |
|---|---:|
| Corpus entries | 30 |
| Checked deletions per trace | 153 to 22,789 |
| Declared frontier pairs | 31,181 |
| Actually tested alternate trials | 57 |
| Accepted alternate trials | 55 |
| Traces hit by at least one tested legal alternate | 24/30 |
| Full-cost rows | 240 |
| Trace/method groups with two replays | 120/120 |
| Forced-checked VeriPB acceptance | 240/240 |
| CakePB equioptimal acceptance | 240/240 |
| Frozen output hash equality | 240/240 |
| Proof/kernel dual-replay hash mismatches | 0 |

The reported `0.80` sampled hit rate is reproducible. Because every accepted adjacent swap is itself a legal non-original order, 24 hits are a valid lower bound on trace-level existence and comfortably clear the 20% occurrence threshold for this mixed corpus. They do not measure choice density, complete-action reachability, or the headroom of a multi-swap/full-partition scheduler: only 57 of 31,181 declared frontier pairs were tried, and the search cannot express those schedules. The contractual 30-natural-trace denominator also remains unclosed.

The checker results do establish that the 24 selected one-swap controls preserve the frozen object. That is a valid control observation, not a test of the complete candidate action.

## Workload and orthogonal-validation sufficiency

Provenance identity and byte closure are strong: the Discovery, Stage 0 primary, Stage 0 confirmation, and owner manifests independently verify at 4/4, 4/4, 2/2, and 38,525/38,525 respectively.

Natural-workload eligibility is not closed. The contract says that no synthetic trace may enter the 30-trace corpus, but the accepted corpus includes `zenodo__ConsistentQueryAnswering-synthetic-15`. Removing this plainly contradictory member leaves at most 29 currently eligible traces, below the frozen minimum. Several generated-family names also need an explicit provenance classification or replacement; this review makes no stronger inference from names alone.

The forced-checked VeriPB plus CakePB pair is a useful orthogonal validation path. `objective_equality` is stored as a literal true in the runner rather than recomputed, but CakePB acceptance and fixed output hash provide the actual equivalence evidence for the control.

## Cost, ablation and failure-mode audit

The owner's two reported percentiles reproduce exactly when each trace is represented by its two-replay median:

| Method | p50 full time | p90 full time | p50 certificate | p90 certificate |
|---|---:|---:|---:|---:|
| Original | 138.997 ms | 422.363 ms | 666,381 B | 2,593,017.3 B |
| Stable proxy | 210.345 ms | 449.634 ms | 666,381 B | 2,593,017.3 B |
| Greedy proxy | 215.443 ms | 480.587 ms | 666,381 B | 2,593,017.3 B |
| Candidate proxy | 260.117 ms | 813.385 ms | 666,406 B | 2,593,017.3 B |

Against original, the candidate proxy is 87.139% slower at p50 and 92.580% slower at p90; it is slower on every one of the 30 traces. This is a strong negative for the executed proxy even though the accounting favors it by charging only one selected legality trial.

It is not a contract-complete Pareto test. Rows record disk I/O and peak RSS, but percentile aggregation and Pareto logic use only full time and certificate bytes. Exploration/planning is also incomplete because selection scans accepted trials while charging only the selected/designated trial. The revised run must freeze the aggregation and dominance rule over every preregistered dimension before observing results.

## Latest collision audit

The frozen upstream collision audit reports no `DIRECT_FATAL` collision for the exact constructor/scheduling claim. This gate review did not reopen the literature search because the assignment restricted reads to frozen PB inputs. The proxy failure is an experimental-fidelity issue, not a newly discovered collision.

## Independent Q1/Q2 recalibration

- Candidate comparator audit: upstream anchors remain appropriate for a narrow certified MaxSAT scheduling paper, but the present comparator implementations are proxies.
- Venue/status verification: accepted only at the frozen upstream evidence ceiling; no new web verification was authorized in this closing review.
- Independently added or replaced paper: none.
- Editor/venue-fit view: a narrow SAT/CP/formal-certification paper remains recognizable if the complete cost-aware constructor shows a reproducible residual under the end-to-end certificate contract.
- Methodology view: the full action and cost denominator are missing before the first valid claim-bearing observation.
- Domain-contribution view: checked deletion itself is known; the paper depends entirely on a nontrivial, generalizable constructor/scheduler rather than a line permutation.
- Devil's-advocate view: the complete scheduler may still be absorbed by construction and checking costs, but this has not yet been tested.
- Status: `PARITY_NOT_PLAUSIBLE` on current evidence; `TIER_B_Q2_VIABLE` remains a bounded structural hypothesis pending the one revision.
- Bounded gap audit: one atomic pre-claim fidelity gate, detailed below.

The review used the same configured model family as the surrounding workflow. This creates correlated-error and over-optimization risk; the hash/recomputation checks reduce mechanical risk but do not substitute for a later independent formal review.

## Q1/Q2 sufficiency judgment

- Clear problem: yes.
- Non-trivial contribution: plausible only for a complete live dependency scheduler; absent from the current implementation.
- Credible current evidence: yes for a negative adjacent-swap control; no for Stage A support or scientific rejection of the frozen mechanism.
- Executable formal-experiment gap: yes, finite CPU route under the existing object and checker contract.
- Reviewer-recognizable paper narrative: conditional Tier B narrative remains; Q1 parity is not currently plausible.

## Non-relaxable quality audit

- Same-object: pass for the executed control; untested for the full candidate action.
- Latest collision: no frozen `DIRECT_FATAL`; review did not expand search.
- Strong fair baselines: fail before claim; named baselines are one-swap proxies.
- Natural input/evidence: fail before claim; at least one explicitly synthetic accepted trace violates the frozen corpus rule.
- Full-cost: fail before claim; Pareto omits RSS/I/O and exploration is undercharged.
- Reproducibility: pass mechanically for the delivered control package.
- Evidence/claim honesty: owner reports its measurements accurately, but the proposed STOP exceeds the valid evidence ceiling.

## Reproducibility and claim ceiling

Owner root hashes match the assignment exactly:

- `STAGEA_REPORT.md`: `B075C29061DD87E8179E12D1173EDDB72FB367ACFAB107FA62A6CC1D2B4B78D2`
- `USER_REVIEW_PACKET.md`: `436DBA114AE8087532218294FB2FFB0152F6FDD14555BEC1591109976DC0C903`
- `handoff.yaml`: `D5FAB2ECDDE10AC2668D753E49469BFE2F800D3847647E4CE33BE0343365EB0C`
- `HASH_MANIFEST.sha256`: `B1256B2B631BCE9DBEE27E310F56A9A9F19FFB9C69BAC8A0194293A33757AF11`

The valid claim is limited to: “On this frozen package, a heuristic that either preserves the original proof or performs one verifier-screened adjacent swap has no p50/p90 time-and-certificate residual against original/stable/greedy proxy controls.” It cannot be generalized to the complete ordered-partition scheduler or used to stop the frozen N2.

## Required revision, reserve reason or stop kernel

Decision: `REVISE_ONCE` for one atomic gate:

`PRE_CLAIM_CONTRACT_FIDELITY_GATE__FULL_ORDERED_PARTITION_NATIVE_COMPARATORS_AND_COMPLETE_COST`

The owner must close all facets of this single fidelity gate before any new claim-bearing observation:

1. Freeze at least 30 demonstrably eligible natural traces; replace the explicit synthetic member and document provenance classification.
2. Implement the complete legal ordered-partition/batching action over the existing checked deletion set, using the live dependency/rederivation state and preserving sequential semantics. A single adjacent swap may remain only as a control.
3. Implement original, stable-legal, greedy-earliest-ready, and candidate methods over the same action interface, causally available information, native proof format, and checker contract.
4. Validate at least one small witness's action legality and end-to-end equivalence before the corpus run.
5. Remove verifier acceptance from construction, or charge every exploration/planning/checker call used to discover the selected schedule for every method.
6. Freeze one common denominator and report preprocessing, extraction/indexing, planning/exploration, construction, proof/kernel bytes, both checker times, peak RSS, disk I/O, fallback/failure, output hash, and objective/equioptimality. Pareto must include every preregistered cost dimension or use a preregistered scalar rule that accounts for all of them.
7. Preserve the honest existence lower bound for the occurrence gate, but distinguish it from choice density/action completeness; any stronger scheduling-headroom metric must use a preregistered denominator over the full action interface.

The scientific revision remains unconsumed at review issuance; it is consumed only when the corrected atomic construct is actually implemented and executed. A contract-faithful negative after that run may support STOP. A positive result remains capped at `PRELIMINARY_SUPPORT` and would only permit a recommendation for `PENDING_USER_STAGEB_REVIEW`.

## User-action blocker audit, if applicable

- Did failure precede every claim-bearing observation? Not a resource failure; the executed results are controls because fidelity failed.
- Is the blocker packet exact, finite and user-actionable? Not applicable.
- Evidence ceiling: not `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.
- Scientific revision remains unconsumed: `true` at issuance.
