# Assignment-local change proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260814-GLOBALISEL-INCONCLUSIVE-COST-CORRECTION-R19`
- `proposal_id`: `GLOBALISEL-EXCEPTIONAL-STATIC-COST-CORRECTION-20260814-R19A`
- `decision_label`: `USER_POLICY_DECISION_REQUIRED`
- `user_policy_approval_required`: `true`
- `global_rule_patch_required`: `false`
- `backtest_required`: `false`

## Problem statement

The sole ordinary Stage 0 revision claimed an exact native declared-cost certificate with `P_local=9` and `P_joint=4`. Independent closing established that the repair call is `copyCost(Desired=FPR, Current=GPR)=4`, not the reverse-direction cost 5. The corrected totals are `P_local=8`, `P_joint=4`. The exact certificate is gate-bearing, so the closer correctly refused to silently amend it. At the same time, the frozen action difference, strict tie behavior and absence of discovered direct absorption remain; scientific STOP is not established.

## Current rule and observed behavior

- Rule: ordinary `REVISE_ONCE` is exhausted; a second scientific repair requires exact topic/gate/count/evidence/write-boundary user authorization and independent re-closing.
- Observed behavior: topic is held at `INCONCLUSIVE_POLICY_HOLD__WITNESS_DECLARED_COST_NOT_NATIVE_ACTION_COST` with Stage A/B false.
- Audit result: the rule worked as intended. No shared rule text should change.

## Proposed minimum delta

| Surface | Current frozen semantics | Proposed assignment-local semantics |
|---|---|---|
| Revision history | revision1 remains consumed and rejected at closing | preserve immutable; add one exceptional amendment directory |
| Repair direction/cost | submitted as cost 5 | freeze `copyCost(FPR,GPR)=4` |
| Witness totals | `P_local=9`, `P_joint=4` | `P_local=8`, `P_joint=4` |
| Dependent certificate | exact declared-cost frontier not closed | rederive only affected ledger/frontier/claim text from the corrected native cost |
| Scientific object | pinned AArch64 same-GMIR contract | no change permitted |
| Review | prior closing remains authoritative for revision1 | new independent closing for the exceptional amendment only |

### Exact write boundaries if approved

- Mainline assignment contract: `stages\stage0\_assignments\20260814\GLOBALISEL-REG_BANK-ISEL-REPAIR-JOINT-PLAN\EXCEPTIONAL_STATIC_COST_CORRECTION_R19A_ASSIGNMENT.yaml`
- Correction output: `stages\stage0\_revisions\GLOBALISEL-REG_BANK-ISEL-REPAIR-JOINT-PLAN\exceptional-static-cost-correction-r19a\`
- Mainline closing contract: `stages\stage0\_assignments\20260814\GLOBALISEL-REG_BANK-ISEL-REPAIR-JOINT-PLAN\EXCEPTIONAL_STATIC_COST_CORRECTION_R19A_CLOSING_ASSIGNMENT.yaml`
- Independent closing output: `stages\stage0\_reviews\round-20260814-globalisel-exceptional-cost-r19a-closing\GLOBALISEL-REG_BANK-ISEL-REPAIR-JOINT-PLAN\`

### Required correction outputs

- `EXCEPTIONAL_COST_CORRECTION_REPORT.md`
- `NATIVE_DIRECTIONAL_COST_CERTIFICATE.md`
- `CLAIM_DELTA.md`
- `handoff.yaml`
- `HASH_MANIFEST.sha256`

The amendment must explicitly enumerate every primitive mapping/repair cost and every old statement affected by `9→8`; a blind numeric substitution is insufficient.

## Safety invariants

- Q2 minimum preserved: yes; Stage 0 PASS remains conditional on the entire gate.
- Q1 priority preserved: yes; no tier promotion is proposed.
- Same-object preserved: yes; target, ABI, GMIR and pipeline frozen.
- Latest collision preserved: yes; `SEARCH_BOUNDED_OPEN` remains.
- Fair current strong baseline preserved: yes; Fast, Greedy and complete `RepairingPlacement` union remain.
- Natural input/evidence preserved: yes; no Stage A evidence is claimed.
- Full-cost preserved: yes; corrected static cost does not substitute for downstream full-cost validation.
- Reproducibility preserved: yes; additive directories, immutable hashes and explicit delta.
- Claim ceiling preserved: `STATIC_NATIVE_ACTION_AND_COST_CERTIFICATE_ONLY__NO_BUILD_NO_PERFORMANCE_CLAIM`.
- STOP non-revival preserved: yes; no STOP currently exists and no false STOP is proposed.
- User Stage B approval preserved: yes; Stage A/B remain prohibited.

## Decision boundary

- `PASS`: only an independent closer may confirm the fully corrected static atomic gate.
- `SCIENTIFIC_STOP`: only if the corrected native evidence proves direct absorption, witness illegality, loss of strict residual, or another genuine structural negative.
- `UNCLOSED`: any missing/ambiguous cost, incomplete propagation, hash mismatch, scope drift or additional correctable defect returns the topic to `INCONCLUSIVE_POLICY_HOLD__EXCEPTIONAL_STATIC_CORRECTION_UNCLOSED`; no further revision is implied.
- `NO APPROVAL`: preserve the current hold. Reserve or withdrawal requires a separate explicit user choice.

## Validation and rollback

- Validate original four packet manifests before dispatch and again at closing.
- Require independent recomputation of `4 mapping + 4 repair = 8` and `4 mapping + 0 repair = 4`.
- Require a mechanical list of all changed claims and proof that no frozen semantic field changed.
- Rollback by sealing the new assignment-local artifacts and retaining the current hold; never rewrite revision1 or its closing.

## Exact decision request

Use verbatim the authorization block in `RULE_AUDIT_REPORT.md` under “精确用户授权文本”. Until that approval exists, no correction, closing, state transition or lane contact is authorized.

