# Rule Change Proposal

## Proposal identity

- `proposal_id`: `R37_TYPED_PORTFOLIO_PLUS_SELECTIVE_DEPTH_SAFE_BOUNDARY_V1`
- `decision_label`: `MAINLINE_IMPLEMENTATION_AUTHORIZED__ONE_CYCLE_ASSIGNMENT_LOCAL`
- `user_policy_approval_required`: `false`
- `backtest_required`: `false`
- `shared_rule_patch_required`: `false`

## Exact implementation delta

At the first full six-lane assignment whose CONTROL is not yet frozen:

1. Keep `gpt-5.6-terra/high` for all six breadth lanes; do not add lanes or increase any seed, locator, raw, deep, retrieval or resource budget.
2. Preserve the R37 typed fields needed for packet selection: exact object/type, atomic action, non-generic consequence, estimand and finite source-closure route. These fields schedule work and do not prove admission.
3. Reserve exactly two global slots, `SELECTIVE_DEPTH_01` and `SELECTIVE_DEPTH_02`, for `gpt-5.6-sol/high`. Unused slots expire at cycle end and are not transferable or backfillable.
4. A packet is eligible only after the same-object RQ and exact public identity are frozen, before decisive evidence is read, with no known direct fatal/terminal containment, and with a finite public-source route for one of:
   - exact carrier;
   - atomic action;
   - estimand;
   - strongest obvious generic-solver/current-union counter;
   - finite oracle, witness or falsifier.
5. More than one unresolved member of the `carrier/action/estimand` triplet makes the packet ineligible for this bounded depth route; it remains ordinary RQ backlog/source closure.
6. Allocate slots to the first two mechanically eligible packet commitments in append-only chronological order. Freeze packet hash, lane, RQ hash, exact missing field, allowed sources, budget and output ceiling before sol/high receives it. Do not choose after seeing outcomes.
7. The sol/high role may only:
   - freeze or reject the exact carrier, atomic action and estimand;
   - locate the most obvious generic solver/current-union counterargument;
   - determine whether a finite oracle, witness or falsifier route exists.
8. The sol/high role may not rewrite the research question, change object/guarantee/contribution type, add a replacement packet after observing evidence, claim novelty/Q2, decide `CLEAN_STAGE0_BRIEF`, issue scientific PASS/STOP, or replace independent Stage 0.
9. If a concrete public-material gap remains after RQ freeze, it must enter `SOURCE_CLOSURE_QUEUE`; an incomplete Question Card is not a reason to stop retrieval when the missing material and finite route are already named.
10. All active scientific and resource controls remain unchanged: v8.7, RQ Production, V9 OFF, network-security exclusion, same-object, direct/current collision, fair strong baseline, natural-or-canonical carrier, full-cost, reproducibility, evidence honesty, Q2, no quota, no outcome-aware backfill and resource localization.

## Acceptance metrics

- No pre-RQ exclusion cites a field that exists only after raw admission.
- 100% of RQ-frozen, concrete public-material gaps enter the closure queue with one named missing item and finite route.
- Every sol/high packet has a pre-evidence immutable commitment and a single terminal closure disposition.
- Across the two packets, at least one materially closes a required field or prevents one clearly weak raw before Stage 0; otherwise record no information gain.
- Any clean brief is judged only by independent Stage 0; improvement is assessed using actual Stage 0 feedback, never a proposal quota.

## Stop and rollback

- If both packets merely restate the input, introduce object drift, or close none of the allowed fields, stop the selective-depth upgrade after this cycle and do not expand it to six lanes.
- Any commitment-after-evidence, replacement/backfill, budget expansion, or sol claim beyond its ceiling fails closed for that packet.
- Rollback is prospective: next cycle returns to the canonical six-lane baseline/then-current approved profile. Preserve all immutable artifacts; do not delete, reopen STOP, or rewrite completed assignments.

## Mainline changes

- Create/freeze only the next safe cycle's `control/CONTROL.yaml` and six assignment files.
- Record the user approval and resulting assignment hashes in `plan.md`/`registry.yaml` through the mainline single writer.
- Do not modify Source48 or Source49, and do not treat existing Source49 results as packet-selection evidence.
