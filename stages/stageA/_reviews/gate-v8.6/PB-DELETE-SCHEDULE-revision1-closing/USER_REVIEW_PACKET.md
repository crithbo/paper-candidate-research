# PB-DELETE-SCHEDULE User Review Packet

- Stage: `Stage A revision-1 independent closing gate`
- Lane id: `STAGEA-GATE-REVIEW-LANE-2`
- Assignment id: `STAGEA-G2-20260809-PB-DELETE-SCHEDULE-REVISION1-CLOSING`
- Decision: `CONFIRM_STOP`
- Quality tier: `BELOW_Q2_STOP`
- Evidence ceiling: `FINITE_30_TRACE_COMPLETE_ACTION_NEGATIVE__EXPLICIT_KERNEL_REFERENCE_FRONTIER_ONLY`
- Claim-bearing observation obtained: `yes`
- Scientific revision consumed: `yes`
- Pending user Stage B review: `no`
- Stage B authorized: `false`
- Stage B user approval id: `null`

## What is established

Revision 1 genuinely closes the pre-claim fidelity gate. It replaces the initial adjacent-swap proxy with a complete ordered-partition action across 183,758 existing checked deletions on 30 frozen public benchmark traces. Original, stable, greedy, and candidate use the same action interface, information, proof format, native VeriPB/CakePB contract, two-replay denominator, and full-cost ledger. The small witness passes `8/8`, with zero construction-time checker oracle calls and zero fallback.

The claim run contains 240 rows. All 240 preserve the deletion multiset, non-deletion boundaries, frozen output hash, and objective. Original passes `60/60`. The three non-original methods fail native VeriPB on the same four traces in both replays, producing 24 deterministic failure rows and zero nonvolatile replay mismatches. This is a real counterexample to the frozen explicit-reference dependency frontier.

The candidate is also slower than original: 723.357 vs 545.591 ms at p50 and 2,417.088 vs 1,622.074 ms at p90. It has no seven-dimensional p50 or p90 Pareto residual against original, stable, or greedy.

## What is not established

The evidence does not show that every possible semantic dependency model, every deletion scheduler, or every new proof-rule/checker mechanism must fail. It does not provide a production-workload generalization beyond the finite frozen corpus. Failed legality rows cannot be used as positive speed, memory, I/O, proof-size, kernel-size, or certificate-size evidence.

## Exact object and narrow claim boundary

The stopped object is the complete live ready-frontier ordered-partition mechanism whose prerequisites are derived only from explicit target references in native VeriPB v3 `delc` rederivations, with fixed output/objective and unchanged checked-deletion set. The stop does not extend to richer semantic liveness/dependency analyses.

## Decisive evidence or preclaim boundary

- Manifest: `2476/2476`, SHA-256 `617C59E3EC578FFBE6AB73D0DE86686543309549E9BE282FE8D8C56A0A048A11`.
- Package: 2,477 files, 534,000,351 B.
- Rows/groups: `240/120`; two replays per group.
- Structural/output/objective checks: `240/240`.
- Original native passes: `60/60`.
- Native passes/failures: `216/24`.
- Failure pattern: 4 traces x 3 non-original methods x 2 replays.
- Replay mismatch: `0`.
- Scientific revision: consumed; no second revision is available.

The same emitter/checker route accepts every original row, while each failed non-original construction is structurally complete and reaches a deterministic forced checked-deletion error. A richer dependency model would change the frozen core mechanism. The result therefore supports `CONFIRM_STOP`, not `INCONCLUSIVE_POLICY_HOLD`.

## Fair baseline and full-cost status

All methods share the trace, deletion set, action interface, causal inputs, native format/checkers, output/objective contract, and cost denominator. The ledger includes preprocessing, extraction, planning/exploration, construction/serialization, verifier time, peak RSS, logical and observed process I/O, proof/kernel/certificate bytes, fallback, and failure.

Candidate planning/exploration alone is 136.498/1,767.744 ms at p50/p90 versus original 83.707/777.625 ms. Candidate saves some RSS/I/O/artifact bytes, but worse time and p90 failure prevent Pareto residual. Failed rows are fully charged and excluded from any positive performance interpretation.

## Reproducibility and integrity

The frozen package hash, specified report/results/handoff hashes, all 2,476 manifest entries, the 240-row accounting, the failure pattern, and the p50/p90 Pareto results were independently recomputed read-only. No candidate execution, new scientific experiment, Stage B activity, or candidate modification occurred. The review used a single model family and makes no cross-model synthesis claim.

## User action requested, if any

- Why user action is needed: no unblock action is needed; the mainline only needs to register the closing decision.
- Minimum action: register `STOP` for the frozen explicit-kernel-reference frontier mechanism.
- Acceptable alternatives: none within the consumed revision; a richer semantic model must be proposed as a genuinely new object/research question if pursued.
- Resume directory and frozen contract: not applicable.

## Recommended next state

- `STOP`

This packet is a review aid. It does not authorize Stage B or a formal paper project.
