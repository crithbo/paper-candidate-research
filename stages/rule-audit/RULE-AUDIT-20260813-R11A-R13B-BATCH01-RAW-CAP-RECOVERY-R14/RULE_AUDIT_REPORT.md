# Rule Audit Report

## Identity

- `audit_id`: `RULE-AUDIT-20260813-R11A-R13B-BATCH01-RAW-CAP-RECOVERY-R14`
- `trigger`: R13B Batch01 exceeded its frozen pre-commit raw cap: 40 attempts against cap 24.
- `requested_by`: user through mainline delegation
- `date`: `2026-08-13`
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260813-R11A-R13B-BATCH01-RAW-CAP-RECOVERY-R14/`
- `shared_files_modified: false`

## Question and scope

- User/process question: whether A, B or C is the least-privilege recovery that can resume the already-approved R13B without raising caps, budgets, scientific gates or production authority.
- Rules inspected: `AGENTS.md`; `rules/ROLE_RULE_AUDIT.md`; current `plan.md` and the directly registered R11A/R13B state; public R13B policy, rolling-commitment and resume controls.
- Candidate examples inspected: none.
- Out of scope: candidate identities; failed response contents; private denylist; target names; outcomes/answers; case semantics; class/stratum/method labels; PACKER contact; any run, download, Stage, shadow, automation, production or shared-file modification.

## Current authoritative behavior

`R13B_ROLLING_COMMITMENT_CONTROL.yaml` freezes existing raw/unique counts `4/4`, total ceilings `88/72`, new batch raw caps `24/24/24/12`, new unique caps `20/20/20/8`, no unused-cap transfer, no fifth/replacement batch, and a mainline gate after every batch. Duplicate, unhashable or ambiguous leads consume raw even when rejected before commitment.

The Batch01 blocker is therefore correct: issuing 40 raw preflight requests against cap 24 is an execution violation. The PACKER correctly failed closed before commitment and made no scientific inference. Existing R13B authorization does not define a legal way to invalidate this batch while permanently charging its attempts; a new assignment-local user policy disposition is required.

## Evidence of a problem or of correct behavior

| Observation | Source/artifact | Repeated? | Classification |
|---|---|---:|---|
| Batch01 consumed 40 raw attempts against cap 24. | Frozen blocker `01C22B29...A6EB5` | One incident, two sequential requests | Execution defect |
| The fail-closed response occurred before commitment, intersection, qualification or scientific inference. | Same blocker | Yes across all affected gates | Correct behavior |
| No response rows/order or candidate hashes were persisted. | Same blocker | N/A | Evidence limitation |
| R13B forbids self-reset, cap transfer and replacement batches. | Rolling control `2861E3D4...176` | Authoritative | Correct policy; recovery gap for this exception |

## A/B/C independent assessment

| Option | Safety | Reachability | Decision |
|---|---|---|---|
| A — charge 40, commit a chronological first 24, quarantine overflow 16 | Unsafe. No immutable row-level chronology or identity roster exists; only 20 valid persistent locators were returned in aggregate. A first-24 identity set cannot be mechanically proved. | Not evaluated because the selection proof fails. | Reject; do not replay or guess. |
| B — invalidate Batch01, charge and quarantine all 40, continue at original Batch02 | Safe with a narrowly authorized transaction-level quarantine, counter amendment, pre-request reservation and mainline gates. It selects none of the failed outputs. | Raw remaining `44`; eligible upper bound `46`, so 24/30/36 remain arithmetically possible. | Recommend. |
| C — terminate R13B | Scientifically and procedurally safe. | Ends calibration. | Available fail-closed fallback, but disproportionate while B remains bounded and reachable. |

## Why A cannot be repaired from current evidence

The evidence proves only `request_1_count=20`, `request_2_count=20`, and aggregate valid-return counts `10/10`. It does not prove which locator occupied any response position. The phrase “first 24” would have to mean either request positions, response rows, or valid locators; none has a frozen row-level mapping, and only 20 valid locators existed. Reissuing the request could change return order and would consume new raw/network budget. Asking the model to remember or reconstruct the subset would be content-aware postselection. Therefore A must fail closed.

## Risk analysis

- False-negative risk: B reduces the remaining search buffer because all 40 attempts count. This is intentional and preferable to hiding cost; it may cause a below-24 close.
- False-positive/weak-paper risk: none added. Blind sample contracts and all scientific gates remain unchanged.
- Scientific-integrity risk: A would create unverifiable postselection. B avoids it by using none of the failed response content and requiring append-only chronological capture for future requests.
- Resource/time risk: B does not increase the original network, storage, CPU or wall envelope. It may spend the remaining 44 raw attempts without reaching 24; that is an accepted fail-closed outcome.
- State-migration risk: limited to the same Phase1 assignment. Checkpoint 011 and the breach blocker remain immutable; only additive control artifacts are allowed.
- Terminal-revival risk: none. No candidate state or terminal STOP is touched.

## Recommendation

- Decision: `USER_POLICY_DECISION_REQUIRED`
- Minimum effective change: approve option B as a one-time R13B assignment-local recovery amendment. Permanently charge all 40 raw attempts, mark Batch01 invalid, quarantine both failed transactions and all their unpersisted outputs, keep unique count at 4, and resume at the original Batch02 with global raw remaining 44.
- Why a smaller operational fix is insufficient: R13B expressly forbids a reset or replacement; mainline cannot reinterpret the breach without new user authority. A simple instruction to “continue” would leave counters and batch legality ambiguous.
- Non-relaxable gates preserved: 24→30→36 blind design; six-stratum balance; contribution diversity; independent PACKER→EXECUTOR→AUDITOR; R12A private intersection; source qualification; scientific/statistical gates; budgets; OFF/production boundary; Q2/same-object/current collision/strong baseline/natural/full-cost/reproducibility/claim ceiling; STOP non-revival.

## Recovery mechanics

1. Mainline verifies the frozen blocker and R13B control/manifest hashes.
2. After exact user approval, mainline writes only additive assignment-local control artifacts and an aggregate quarantine ledger. The ledger contains no locator, candidate name, query result, outcome or semantic label.
3. Counters are frozen as `raw_used=44`, `raw_remaining=44`, `unique_used=4`, `unique_remaining=68`; Batch01 is `INVALID_RAW_CAP_BREACH__NO_COMMITMENT__NO_SCIENTIFIC_INFERENCE`.
4. Both failed transactions are quarantined as whole transactions. Their response contents may not be replayed, reconstructed, cited, committed, intersected, source-qualified or used to choose future leads. Because no row identities exist, no identity-level quarantine list may be invented.
5. Resume begins at the existing `R13B-02`, not a replacement or fifth batch. Before each later external preflight, PACKER must append a request reservation stating batch id, requested count and global raw remaining; mainline checks `requested_count <= min(original_batch_raw_cap, global_raw_remaining)`.
6. Future returned raw rows must be captured append-only in provider order before semantic filtering; deterministic normalization/dedup then precedes immutable opaque commitment. No future batch may exceed its original raw/unique cap, and total raw/unique may never exceed 88/72.
7. After every batch, mainline reconciles request reservations, raw consumption, unique commitments, rejects, private nonmatch result, qualification counts, resources and manifest before another batch.
8. If the future pre-request chronology cannot be mechanically verified, any failed-response content reappears by deliberate recall/replay, or counters disagree, fail closed to the same blocker lineage. Do not infer scientific failure.

## Validation and rollback

- Historical cases/backtest required: no. This amendment does not alter sample labels, admission criteria, thresholds or scientific behavior; it is an assignment-local accounting and chronology repair.
- Shadow-run plan: none authorized.
- Success criteria: exact hash verification; user approval id present; additive quarantine/counter/resume artifacts parse; `44+44=88`; unique remains 4 before future commitments; Batch01 cannot be selected from; no future request exceeds its per-batch or global remaining cap; all original R13B gates remain byte-anchored.
- Failure criteria: missing/ambiguous chronology or counts; replay/reconstruction of failed output; answer/content-aware retrospective subset; reset; replacement/fifth batch; cap/budget expansion; private leakage; overwritten checkpoint/blocker; any unapproved downstream dispatch.
- Rollback condition: before resume, revoke the R14 resume gate and remain blocked. After any R14-authorized raw activity, preserve all append-only bytes and consumed counters, mark the attempted continuation non-dispatchable, and return for a new user decision; rollback never restores consumed capacity.

## Mainline handoff

- User approval already present: R13B is approved, but this exception is **not**. Exact R14A approval is required.
- Files proposed for change: additive R14 control/quarantine/resume files under the existing R13B control root, plus mainline-owned `plan.md`/`registry.yaml` state after approval. No shared scientific rule/template change is proposed.
- Registry migrations proposed: one assignment-local blocker→authorized-recovery transition; no candidate/scientific state change.
- Existing active/blocked/hold/terminal topics affected: only the blocked R11A Phase1 PACKER assignment; no topic status changes.
- Shared files modified: `false`
