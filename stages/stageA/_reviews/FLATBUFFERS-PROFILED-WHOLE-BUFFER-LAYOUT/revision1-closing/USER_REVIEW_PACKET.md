# User Review Packet

## Recommended disposition

`CONFIRM_STOP` with confidence `0.97` and quality label `BELOW_Q2_STOP` for the frozen FB-RCFDP mechanism.

This is a scientific narrow STOP, not a resource failure. The sole Stage A scientific revision has been consumed. No Stage B work is authorized.

## Why the gate closes negatively

The revision repaired the preclaim signature/fidelity boundary before observing any natural-corpus result. It then ran the same exact object through eight executable arms on 24 official TFLite Micro models, with 11 training and 13 held-out families. All 192 arm rows pass native reader, verifier, equality, identifier, and alignment checks.

The mechanism fails both preregistered non-vacuity/benefit tests:

- Useful actions are `0/383` on training, `0/763` on held-out, and `0/1146` overall, below the required 10%.
- Against the executable union on held-out models, candidate-minus-union p50/p90 residuals are worse for raw bytes (`+1.3761%/+1.9366%`), warm access (`+0.7959%/+4.0250%`), and cold access (`+0.9253%/+1.9129%`).

The candidate is sometimes full-cost Pareto-nondominated, but the frozen rule does not permit nondominance on secondary dimensions to replace a primary bytes/access improvement. That prevents a cost-tradeoff from being relabeled as mechanism support.

## What was independently checked

- Revision manifest: `94/94 PASS`, 5,557,846 bytes.
- Preclaim gate passed with zero claim-bearing rows.
- The scientific revision was consumed only after the first natural model produced eight eligible rows.
- The trace uses exactly the 11 training model identifiers and none of the 13 held-out identifiers.
- Raw table shape is 24 models × 8 arms = 192 rows, all legal and equivalent.
- Useful-action numerators/denominators, held-out percentiles, and aggregate Pareto membership were recomputed independently.
- The comparison is same-object and executable; no synthetic best-of full vector or reversed residual direction was found.

## Claim ceiling

The STOP applies only to:

- the frozen FB-RCFDP mechanism and signature-aware revision;
- the 24 official TFLite Micro models with the 11/13 split;
- the frozen 704-request, 23,936-event, 34-endpoint uniform trace;
- the pinned source/toolchain, beam 8, cap 20,000, and eight-arm executable union.

It does not claim that FlatBuffers layout optimization is impossible, nor that another mechanism, trace distribution, schema corpus, search budget, or implementation must fail.

## User-facing action

No Stage B approval decision is requested because the Stage A mechanism is rejected. Mainline may register the narrow scientific STOP after its normal mechanical acceptance. Any future work must be a genuinely new research object or mechanism under a new candidate identity, not an unauthorized second revision of this assignment.

## Permission boundary

- `StageB=false`
- `stageb_user_approval_id=null`
- no project creation
- no shared-control modification
- lane terminal state: `IDLE_REUSABLE_AWAITING_MAINLINE`
