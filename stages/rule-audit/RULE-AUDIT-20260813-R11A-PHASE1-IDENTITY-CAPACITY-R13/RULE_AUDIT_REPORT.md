# Rule Audit Report

## Identity

- `audit_id`: `RULE-AUDIT-20260813-R11A-PHASE1-IDENTITY-CAPACITY-R13`
- `trigger`: R11A Phase-1 identity-capacity blocker 012 after accepted checkpoint 011
- `requested_by`: `MAINLINE`
- `date`: `2026-08-13`
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260813-R11A-PHASE1-IDENTITY-CAPACITY-R13`
- `shared_files_modified: false`

## Question and scope

- User/process question: what finite expanded opaque commitment and mainline-private intersection design makes the Phase-1 minimum of 60 arithmetically reachable without contaminating the Packer or weakening any R11A gate?
- Rules inspected: `AGENTS.md`; `plan.md`; relevant `registry.yaml` entries; `rules/ROLE_RULE_AUDIT.md`; `rules/ROLE_DISCOVERY_BACKTEST.md`; R11A master/Phase-1 contracts; R12 proposal and approved R12A public control surfaces.
- Instances inspected: checkpoint 011, blocker 012, the four-entry Packer commitment and its public manifest.
- Out of scope: private denylist; historical identity plaintext; protected target/outcome/answer/case semantics; shared-file edits; Packer contact; Phase 2/Executor/Auditor/shadow/Discovery/Stage0/A/B/E2; experiments, downloads, automation or external services.

## Current authoritative behavior

R11A requires 60–80 eligible families, targets 72, requires at least eight per each of six strata, at least five contribution types and no more than 30% from one type. Each eligible family needs a stable identity hash, R12A prior-identity exclusion proof and the full public-source qualification record. R12A authorized intersection only for the four identities committed before its result.

Checkpoint 011 records two eligible and two pending committed families. Blocker 012 correctly concludes that continuing source qualification over the frozen four identities cannot raise the maximum eligible count above four. It therefore requests bounded new opaque commitments and a new private intersection rather than treating new uncommitted identities as excluded.

## Evidence of a problem or of correct behavior

| Observation | Source/artifact | Repeated? | Classification |
|---|---|---:|---|
| Current commitment count is 4 while the acceptance minimum is 60 | blocker 012, SHA `87F5CC...129B` | deterministic | assignment-local capacity incompatibility |
| R12A intersection checked exactly 4 and exposed no protected semantics | checkpoint 011 and R12A public surfaces | one complete batch | correct contamination-safe execution |
| Two of four committed families are currently eligible and two pending | checkpoint 011, SHA `BC280D...A43B` | current | too small for a yield forecast; enough to reject a brittle 96-total plan |
| The original public retrieval/resource envelope remains open | blocker 012/checkpoint 011 | current | not a resource-exhaustion or scientific blocker |
| Phase 2 and downstream roles remain undispatched; mode remains OFF | R11A contracts/registry | structural | correct boundary preservation |

The defect is neither a V9 scientific failure nor a Packer deviation. R12 solved compatibility for a fixed four-identity roster, but its authorization did not include bounded future commitment batches. The smallest sound fix is an assignment-local capacity amendment, not a shared scientific-rule patch.

## Capacity recommendation

Recommend total `128` unique commitments inclusive of the existing four, a separate total raw-lead ceiling of `160`, and four new batches of `32 / 32 / 32 / 28` unique commitments. This provides 68 slots of aggregate attrition while keeping the minimum-eligible fraction at 46.875%. It is finite and leaves the eligible-index maximum at 80.

A 96-total plan requires 62.5% eventual eligibility, which is not supported by the current two-eligible observation. A 160-unique plan lowers the needed rate but unnecessarily expands identity exposure and qualification cost. The recommended 160 number is instead used only as a raw-lead cap so duplicate, unhashable and ambiguous precommit rows cannot create an unlimited replacement loop.

## Risk analysis

- False-negative risk: a cap that is too small can end a valid backtest for administrative reasons. The 128/160 design buffers this without making expansion open-ended.
- False-positive/weak-paper risk: unchanged; nonmatch is only an exclusion proof and full source qualification remains mandatory.
- Scientific-integrity risk: adaptive commitment after seeing private matches could leak or game prior identities. Immutable precommit before intersection plus per-batch gates blocks that path.
- Resource/time risk: committing all 124 new identities at once could front-load waste. Four bounded batches and nonmatch-before-full-qualification limit unnecessary work.
- State-migration risk: low if all R13 files are additive and checkpoint 011/blocker 012 remain immutable.
- Terminal-revival risk: none; this backtest controls no candidate lifecycle state.
- Residual capacity risk: 128 makes 60 possible, not certain. Exhausting the cap below the full acceptance gate must remain a fail-closed no-scientific-inference result.

## Recommendation

- Decision: `USER_POLICY_DECISION_REQUIRED__ASSIGNMENT_LOCAL_CAPACITY_AMENDMENT_RECOMMENDED`
- Minimum effective change: approve the exact R13A finite commitment/intersection design in `R13_CAPACITY_CONTROL_SPEC.md` and let mainline implement it as an additive assignment amendment.
- Why a smaller operational fix is insufficient: no further search on only four frozen identities can produce 60 independent families, and R12A does not authorize new roster comparison.
- Why no shared-rule patch or new backtest is required: eligibility, scientific thresholds, source rules, blindness and statistical endpoints do not change. This is capacity plumbing inside the active backtest.
- Non-relaxable gates preserved: 60–80, target 72, six strata, contribution diversity/cap, source qualification, identity/cutoff separation, blind isolation, paired endpoints, Q2/same-object/current collision/strong baseline/natural/full-cost/reproducibility/claim-ceiling and terminal STOP non-revival.

## Validation and rollback

- Historical cases/backtest required: no new historical or scientific replay; per-batch deterministic mechanical validation is mandatory.
- Shadow-run plan: none; the existing two prospective shadows remain later and conditional on calibrated Auditor PASS.
- Success criteria: all batch caps and chronology pass; no duplicate/collision/leak; byte-identical private recomputation; full source qualification remains separate; cumulative acceptance gate reaches 60–80 with every coverage rule satisfied.
- Failure criteria: any private leak, history/commitment mutation, unmatched set inconsistency, cap/budget breach, unclosed control result, or exhaustion below acceptance fails closed.
- Rollback condition: any defect in R13 authority, normalization, commitment chronology, intersection, manifest or leak validation. Revoke only R13 inputs and restore blocker 012/checkpoint 011; retain R12A and existing evidence.

## Mainline handoff

- User approval already present: `no`; R12A does not cover future expanded rosters.
- Files proposed for change: no shared rules/templates. After user approval, mainline may create only the assignment-local control artifacts in the exact control-spec paths and perform its normal shared state registration as sole writer.
- Registry migrations proposed: approval ID, amendment/result/gate hashes, per-batch/cumulative counts, budget ledger and resume point.
- Existing states affected: only the blocked R11A Phase-1 assignment may resume after batch-01 mechanical PASS; no candidate or downstream state changes.
- Per-batch mainline gate: `required`; per-batch fresh user approval: `not required within R13A caps`.
- Shared files modified: `false`

## Explicit recommendation to mainline

Request the exact R13A authorization in the proposal. After approval, mainline should freeze the additive amendment, then permit one batch at a time. Never give the Packer the private denylist or historical identities, and never open a later batch before accepting the previous commitment/intersection/checkpoint chain. Do not dispatch Phase 2 or any downstream lane under this approval.

