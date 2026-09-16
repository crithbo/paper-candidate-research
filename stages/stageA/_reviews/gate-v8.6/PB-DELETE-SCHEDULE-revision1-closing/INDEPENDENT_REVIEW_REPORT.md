# PB-DELETE-SCHEDULE Stage A Revision-1 Independent Closing Review

- Review lane id: `STAGEA-GATE-REVIEW-LANE-2`
- Assignment id: `STAGEA-G2-20260809-PB-DELETE-SCHEDULE-REVISION1-CLOSING`
- Input freeze SHA-256: `617C59E3EC578FFBE6AB73D0DE86686543309549E9BE282FE8D8C56A0A048A11`
- Reviewer non-participation and cross-assignment contamination declaration: I performed the initial PB gate but did not implement revision 1. I used that gate only as a frozen input, did not use evidence from another topic, did not modify the candidate, and did not run a new scientific experiment.
- Decision: `CONFIRM_STOP` (formal Stage A disposition: `STOP`)
- Quality tier: `BELOW_Q2_STOP`
- Confidence: `HIGH (0.96)`
- Evidence ceiling: `FINITE_30_TRACE_COMPLETE_ACTION_NEGATIVE__EXPLICIT_KERNEL_REFERENCE_FRONTIER_ONLY`
- Pre-claim contract fidelity gate disposition: `PASS`
- Candidate action completeness / proxy check: `PASS`; the revision constructs a complete ordered partition over every live ready frontier for all 183,758 checked-deletion records, rather than the initial adjacent-swap proxy.
- Native codec/solver/reader/format parity: `PASS`; all four methods emit the same augmented-proof format and use frozen native VeriPB `--force-checked-deletion`, followed by CakePB when VeriPB accepts.
- Metric denominator and full-cost dimension completeness: `PASS`; one 30-trace, two-replay denominator charges preprocessing, extraction, planning/exploration, construction/serialization, native checking, RSS, logical and observed process I/O, artifacts, fallback, and failure.
- Candidate Q1 venue family: `SAT / CP / IJCAR formal certification`

## Claim and novelty-route consistency

The frozen N2 object is a scheduler for existing checked-core deletion records in fixed MaxPre-style traces. It may reorder only within maximal contiguous deletion blocks, must preserve every deletion and every non-deletion line, and must preserve the frozen output WCNF and objective. The candidate uses the ready frontier derived from explicit references in the native VeriPB v3 `delc` rederivations, batches up to 16 ready records, and ranks choices by support overlap and unlock cost.

Revision 1 is materially different from the initial one-adjacent-swap control: it constructs the whole action for every record and moves substantial fractions of affected proofs. The N2 route is therefore tested on its intended action, not a proxy. The result is negative: the explicit-reference frontier is not a sound legality model on four frozen traces and the candidate has no preregistered full-cost residual.

## Baseline fairness audit

`original`, `stable_legal`, `greedy_earliest_ready`, and `candidate` share the frozen trace, deletion set, action interface, input proof/kernel information, emitter, output/objective contract, native formats, checkers, replay count, and cost ledger. Original uses singleton batches in the source order; stable uses deterministic target/ordinal tie-breaking; greedy uses deterministic minimum rederivation-slice size; candidate uses the same ready set with its frozen batching/ranking policy.

No checker response is available to construction (`0` oracle calls), there is no legality fallback (`0` fallbacks), and failed non-original rows remain in the denominator. Original passing through the same construction and checking route in `60/60` rows is an important control against a generic parser/emitter/format failure.

## Decisive evidence audit

Read-only recomputation from `FULL_COST_ROWS.jsonl` established:

- 30 unique frozen public benchmark traces, 183,758 checked deletions, range 882--44,043;
- 240 rows = 30 traces x 4 methods x 2 replays, and 120 complete replay pairs;
- construction, complete-action static validation, block-boundary preservation, deletion-multiset preservation, output hash, and objective equality all pass in `240/240` rows;
- original passes the native contract in `60/60` rows;
- `216/240` rows pass VeriPB and CakePB; the other 24 rows are the three non-original methods on four traces in both replays;
- every failed row reaches native VeriPB after successful construction and fails specifically at forced checked deletion; CakePB is consequently not reached;
- the four stable proofgoal failures are ID `801`, `541`, `25`, and `522` for the BCP, routing, dalculus-A, and dalculus-B traces respectively;
- all recorded nonvolatile replay fields have `0` mismatches.

This is credible scientific negative evidence for the frozen explicit-kernel-reference mechanism, not an invalid experiment requiring `INCONCLUSIVE_POLICY_HOLD`. The shared non-original failure indicates that explicit `delc` target-reference reachability under-approximates the live semantic prerequisites required by native checked deletion. That under-approximation is the frozen mechanism's central assumption. A richer semantic dependency model would be a different mechanism after the sole scientific revision, not a correction that can be silently substituted here.

The conclusion is deliberately narrower than “all semantic dependency scheduling is impossible.” It falsifies only `COMPLETE_READY_FRONTIER_ORDERED_PARTITION_FROM_NATIVE_DELC_REDERIVATION_REFERENCES` on the frozen object.

## Workload and orthogonal-validation sufficiency

The explicit `ConsistentQueryAnswering-synthetic-15` member was removed before the claim run and replaced by the first lexicographic eligible unused official MSE 2023 member. The denominator contains 30 complete, unmodified public benchmark inputs and their naturally emitted MaxPre traces. This closes the revision contract's operational natural-trace definition. It does not establish production-workload representativeness, so the claim ceiling remains the finite frozen corpus.

The smallest-proof witness covers four methods and two replays (`8/8`) and passes complete-action validation and both native checkers before the claim-bearing run. Orthogonal checking is VeriPB forced checked-deletion plus CakePB output/equioptimal validation on the 216 rows that reach CakePB; deterministic duplicate construction provides the second replay axis. On the 24 failed rows, the failure stage is VeriPB, not CakePB disagreement.

## Cost, ablation and failure-mode audit

Percentiles use each trace's median of two replays, followed by linear p50/p90 over the 30 traces.

| Method | p50 full time | p90 full time | p50 peak RSS | p90 peak RSS | p50 logical I/O | p90 logical I/O | p50 failure | p90 failure |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| original | 545.591 ms | 1,622.074 ms | 153,638,912 B | 542,107,648 B | 3,166,313 B | 11,729,099.95 B | 0 | 0 |
| stable | 586.032 ms | 1,873.184 ms | 131,225,600 B | 542,101,913.6 B | 2,657,341.5 B | 11,729,155.8 B | 0 | 1 |
| greedy | 583.896 ms | 1,866.420 ms | 135,034,880 B | 542,101,913.6 B | 2,657,824.5 B | 11,748,002.8 B | 0 | 1 |
| candidate | 723.357 ms | 2,417.088 ms | 135,021,568 B | 542,098,432 B | 2,579,959 B | 11,700,306.7 B | 0 | 1 |

Candidate full time is 32.58% above original at p50 and 49.01% above original at p90. Candidate planning/frontier exploration is 136.498/1,767.744 ms at p50/p90 versus original 83.707/777.625 ms. Candidate observed process I/O is 5,013,330.75/18,831,773.85 B versus original 5,816,735.5/18,892,436.0 B. Thus lower I/O and some lower artifact/RSS coordinates do not compensate for worse end-to-end time and the p90 failure coordinate.

Across the preregistered seven Pareto dimensions (full time, peak RSS, logical I/O, augmented proof, kernel, certificate, failure), candidate is not no-worse against original, stable, or greedy at either p50 or p90: all six residual checks are false. Observed process I/O is recorded in the ledger, while planning/exploration is folded into full end-to-end time; adding either as an extra dominance coordinate cannot rescue the candidate because both are already unfavorable or non-rescuing.

Failed rows charge construction, planning/exploration, VeriPB time, RSS, I/O, artifacts, and failure. They may support the negative legality claim but may not support a positive speed, memory, I/O, kernel-size, or certificate-size claim. The report respects that ceiling.

## Latest collision audit

The closing assignment froze the upstream collision record and prohibited expansion beyond the PB materials. The frozen comparator matrix remains `SEARCH_BOUNDED_OPEN` with no direct fatal collision. I did not add or replace a paper and did not perform a live search. Novelty is not the stop reason; the executed mechanism negative is.

## Independent Q1/Q2 recalibration

- Candidate comparator audit: `PARITY_NOT_PLAUSIBLE`; the candidate is natively illegal on four traces and fully absorbed on the frozen full-cost Pareto test.
- Venue/status verification: frozen upstream venue/status record only; no live re-verification was authorized for this closing gate.
- Independently added or replaced paper: none.
- Editor/venue-fit view: a paper centered on this exact explicit-reference frontier lacks a viable positive N2 contribution after the decisive Stage A negative.
- Methodology view: the full-action experiment is reproducible and suitable for a narrow negative decision; invalid rows are not usable as positive performance observations.
- Domain-contribution view: the failures expose a real boundary—explicit native rederivation references are not a complete semantic liveness model—but that boundary does not preserve the frozen candidate's Q2 paper shape.
- Devil's-advocate view: a richer semantic dependency analysis might succeed, but it changes the frozen mechanism and cannot be treated as an unconsumed revision.
- Status: `PARITY_NOT_PLAUSIBLE`
- Bounded gap audit: the missing semantic-dependency mechanism is the core algorithmic increment, not a bounded Stage B scale/statistics gap.

## Q1/Q2 sufficiency judgment

- Clear problem: yes.
- Non-trivial contribution: the intended full-action scheduler is non-trivial, but its frozen soundness premise is falsified.
- Credible current evidence: yes, as a finite negative; no, as preliminary positive support.
- Executable formal-experiment gap: a different richer model is executable in principle, but it is outside this consumed revision and frozen mechanism.
- Reviewer-recognizable paper narrative: not at Tier B for this candidate; only a narrow negative boundary remains.

## Non-relaxable quality audit

- Same-object: `PASS`; output hash and objective match in `240/240` rows, with unchanged deletion multiset and non-deletion structure.
- Latest collision: `SEARCH_BOUNDED_OPEN`; no direct fatal collision in frozen upstream material, not used as the stop basis.
- Strong fair baselines: `PASS` for common construction/comparison interface; actual native failures are retained rather than relabeled legal.
- Natural input/evidence: `PASS_WITH_FINITE_CORPUS_CEILING`; 30 public, complete, unmodified benchmark-carried traces and no explicit synthetic member.
- Full-cost: `PASS`; complete ledger, failed-row charging, and no seven-dimensional residual.
- Reproducibility: `PASS`; 2476/2476 manifest entries, 240-row closure, two replays, and zero nonvolatile mismatch.
- Evidence/claim honesty: `PASS`; legality failures support only the narrow mechanism STOP and invalid rows support no positive performance claim.

## Reproducibility and claim ceiling

The revision package contains 2,477 files including its manifest and totals 534,000,351 bytes. The manifest verifies `2476/2476` and hashes to `617C59E3EC578FFBE6AB73D0DE86686543309549E9BE282FE8D8C56A0A048A11`. The assignment-specified report, results JSON, and handoff hashes all match. Independent row aggregation exactly reproduces the owner p50/p90 and all six Pareto outcomes.

This review used one model family only; cross-family synthesis was unavailable and no separate cross-model authority was claimed.

## Required revision, reserve reason or stop kernel

`CONFIRM_STOP`. The sole scientific revision has been consumed. The stop kernel is:

> On the frozen 30-trace object, the complete ready-frontier ordered-partition mechanism derived only from explicit native `delc` rederivation references is unsound on four traces under forced checked deletion and has no p50/p90 full-cost Pareto residual against any of the three common-interface baselines.

This does not stop all future work on semantic dependency models, all deletion scheduling, or new proof-system mechanisms. Such work requires a new object/research question under project policy, not a second revision of this candidate.

## User-action blocker audit, if applicable

- Did failure precede every claim-bearing observation? no; claim-bearing observations completed.
- Is the blocker packet exact, finite and user-actionable? not applicable; there is no resource blocker.
- Evidence ceiling: not `RESOURCE_FAILURE_ONLY`; scientific negative evidence exists.
- Scientific revision remains unconsumed: no.

Stage B is not authorized: `stageb=false`, `approval=null`.
