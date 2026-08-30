# Evidence Audit

## Contract timing and immutable object

The contract status is `FROZEN_BEFORE_FIRST_CLAIM_BEARING_OBSERVATION`. Its current SHA-256 equals the hash embedded in both stable runs, so the observed result was generated against these contract bytes. The command log places the stopped, artifact-free implementation attempt before the first successful primary. The successful primary and replay are claim-bearing; therefore `scientific_revision_consumed=true` is correct.

The natural trace, three 30,000-row evaluation epochs, twelve selected objects per epoch, parent selection/layout fields, 4 KiB page size, trace GET/SET/DELETE rows, prior-information boundary and exact candidate action are unchanged. No resource blocker exists.

## Executed strengths

- Candidate and comparator layout/search code actually runs; stable primary/replay files are byte-identical.
- AGE policy state, 20 logical-scan aging, demotion, promotion and per-window 5% check are executed; OPP is not used.
- Separate original/candidate/comparator Guide maps and semantic event arrays are created. Method-specific relocation hashes differ, and GET/SET/DELETE replays produce matching logical digests.
- Candidate and comparator byte/event fields remain typed; there is no cross-unit scalar sum.

These improvements close important defects from the initial package, but they do not close the scientific killer gate.

## Pointer and capacity legality failure

`relocate()` retains the original slot of every object that stays on its page, but allocates moved objects at a running `destUsed` offset that does not reserve stationary slots encountered later. The validator checks only aggregate `target_page_used_bytes <= 4096`; semantic replay dereferences a key-to-Guide map and never detects two live objects occupying overlapping byte intervals.

Read-only reconstruction of the code's final `(page, slot, bytes)` states finds:

| Epoch | Method | Overlapping final slot pairs |
|---:|---|---:|
| 1 | Candidate | 1 |
| 1 | Composition | 1 |
| 2 | Candidate | 0 |
| 2 | Composition | 0 |
| 3 | Candidate | 3 |
| 3 | Composition | 1 |

Examples include candidate epoch 1 page 1 intervals `[0,208)` and `[0,112)`, and composition epoch 3 page 1 intervals `[0,2048)` and `[320,2360)`. Consequently `pointer_and_capacity_legal=true` is not supported by the executed state. A mathematically capacity-feasible page assignment exists, but the claimed relocation execution did not realize it.

This is claim-bearing construct invalidity, not a constant/digest-only complaint and not a resource failure.

## Benefit metric and full-cost decision failure

The owner reports raw average reclaimed-byte residuals `+4096/-4232/+2595 B`. That subtraction is not same-denominator when the OBASE composition changes the number of allocated pages. In epoch 2 the candidate uses 2 pages while the composition uses 4 pages. Counting only pages reclaimed from each method's own expanded layout makes `4232 B` look like a composition benefit even though its average remaining fast-tier footprint is larger.

Using the reported layout page count and reported average reclaimed bytes, without introducing any new experiment:

| Epoch | Candidate pages / avg reclaimed / avg fast footprint | Composition pages / avg reclaimed / avg fast footprint | Candidate lower-fast-footprint advantage |
|---:|---|---|---:|
| 1 | `3 / 4096 / 8192 B` | `3 / 1092 / 11196 B` | `3004 B` (composition is also SLO-illegal) |
| 2 | `2 / 0 / 8192 B` | `4 / 4232 / 12152 B` | `3960 B` |
| 3 | `3 / 4096 / 8192 B` | `3 / 1501 / 10787 B` | `2595 B` |

The registered ledger includes `peak_layout_page_footprint_bytes`, but places it in a cost vector rather than normalizing the benefit object. This does not support the claim that the composition wins epoch 2 in reclaimed capacity.

The implementation then defines “non-dominated” as candidate cost `<=` comparator cost on every non-common field. That is a candidate-dominates-comparator test, not a Pareto non-dominance test. No dimensional budget is registered for solver states, transitions, subset evaluations, probes or hashes. Therefore the candidate's higher exact-planning counts do not make a legal benefit point illegal; they make it a benefit/cost trade-off. Pre-registration prevents post-hoc promotion of such a point to a positive owner claim, but it does not turn the absence of all-field dominance into strong-baseline absorption or a scientific `STOP`.

## Evidence conclusion

- Owner `STOP`: `NOT_CONFIRMED`
- Faithful same-object absorption: `NOT_ESTABLISHED`
- Any legal preliminary-support epoch: `NOT_ESTABLISHED`, because relocation slot legality and comparator fidelity remain open
- Resource blocker: `false`
- Evidence ceiling: `REPRODUCIBLE_TRACE_PROGRAM_WITH_CONSTRUCT_INVALIDITY__NO_STOP_OR_PRELIMINARY_SUPPORT`

