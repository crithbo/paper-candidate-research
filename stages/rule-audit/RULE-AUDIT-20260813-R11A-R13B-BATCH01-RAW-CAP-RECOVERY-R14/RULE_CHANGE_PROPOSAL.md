# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260813-R11A-R13B-BATCH01-RAW-CAP-RECOVERY-R14`
- `proposal_id`: `R11A-R13B-BATCH01-RAW-CAP-RECOVERY-PROPOSAL-20260813-R14`
- `decision_label`: `USER_POLICY_DECISION_REQUIRED`
- `user_policy_approval_required`: `true`
- `backtest_required`: `false`

## Problem statement

R13B Batch01 issued two public locator preflight requests of 20 raw attempts each before candidate commitment. The total 40 exceeded the frozen Batch01 raw cap 24. The PACKER stopped correctly, but R13B forbids counter reset, cap transfer and replacement batches and contains no exception that can legally charge an invalid batch and continue. The failed response rows/order were not persisted, so a retrospective first-24 subset cannot be proven.

## Current rule

- File/heading: `R13B_ROLLING_COMMITMENT_CONTROL.yaml` — `batches`, `mandatory_order`, `handling`, `no_unused_cap_transfer`, `fifth_replacement_or_post_executor_batch`.
- Current behavior: Batch01 may consume no more than 24 raw attempts; invalid/precommit rejects consume raw; unused cap cannot transfer; no replacement/fifth batch; each batch requires a mainline gate.
- Why clarification is insufficient: the actual batch already breached the cap. Existing user approval does not authorize mainline to choose a subset, reset counters, invalidate and continue, or alter cumulative accounting.

## Proposed minimum delta

This is an additive assignment-local amendment, not a shared scientific-rule change.

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| New `control/minimum-viable-calibration-r13b/R14_BATCH01_RAW_CAP_RECOVERY_AMENDMENT.yaml` | `disposition` | Breached Batch01 is blocked with no recovery disposition. | Record option B: Batch01 invalid; all 40 charged; no commitments; resume only at original Batch02. |
| New `control/minimum-viable-calibration-r13b/R14_BATCH01_QUARANTINE_LEDGER.yaml` | aggregate transaction ledger | Failed response not persisted. | Freeze two transaction counts `20/20`, aggregate valid-return counts `10/10`, zero commitments, whole-transaction quarantine, and blocker hash; store no identities or response content. |
| New `control/minimum-viable-calibration-r13b/R14_PHASE1_RESUME_GATE.yaml` | counters and pre-request gate | R13B state blocked. | Freeze raw `44 used/44 remaining`, unique `4 used/68 remaining`; require append-only request reservation and `min(per-batch cap, global remaining)` check before each future request. |
| Mainline-owned `registry.yaml` / `plan.md` | assignment state | Awaiting user disposition. | After approval and artifact validation only, mark R14A authorized and same Phase1 assignment resumable at R13B-02. |

No existing file is overwritten. Checkpoint 011, the breach blocker, R13B controls, prior evidence and private artifacts remain immutable.

## Safety invariants

- Q2 minimum preserved: yes; this is method-backtest accounting only.
- Q1 priority preserved: yes.
- Same-object preserved: yes.
- Latest collision preserved: yes.
- Fair current strong baseline preserved: yes.
- Natural input/evidence preserved: yes.
- Full-cost preserved: yes; all 40 attempts and resource consumption remain charged.
- Reproducibility preserved: yes; recovery requires immutable hashes, append-only chronology and deterministic counter reconciliation.
- Claim ceiling preserved: yes; scientific inference remains none.
- STOP non-revival preserved: yes.
- User StageB approval preserved: yes; Stage B remains prohibited.

## Assignment-local normative requirements

### Invalidated Batch01

- State: `INVALID_RAW_CAP_BREACH__NO_COMMITMENT__NO_SCIENTIFIC_INFERENCE`.
- Raw charge: `40`; overage is never forgotten.
- New unique commitments: `0`.
- The two failed transactions and all returned metadata are unusable. No replay, reconstruction, row selection, identity commitment, private intersection or source qualification is allowed.
- The quarantine ledger is transaction-level because row identities/order do not exist. It must not invent an identity denylist or claim semantic de-duplication that cannot be proven.

### Remaining counters

- Existing R13B raw `4` + invalidated attempts `40` = `44 used`; `44 remaining` out of `88`.
- Existing unique remains `4`; `68 remaining` out of `72`.
- Existing eligible pool remains `2`; no observation in the failed preflight changes eligibility.

### Remaining batches

- Resume target is original `R13B-02`; Batch01 is never replaced.
- Original raw caps remain `R13B-02=24`, `R13B-03=24`, `R13B-04=12`; original unique caps remain `20/20/8`.
- For each future batch, `effective_raw_cap = min(original_batch_raw_cap, global_raw_remaining_at_reservation)`.
- Unused capacity in one batch cannot raise a later batch above its original cap. Total raw may never exceed 88; total unique may never exceed 72. No fifth batch is allowed.
- Illustrative maximum-use path: if Batch02 consumes 24, global raw remaining becomes 20; Batch03 can consume at most 20 and Batch04 receives zero. If earlier batches consume less, a later existing batch may consume only its own original cap and the then-global remainder.

### Chronology and anti-postselection gate

- Before every public preflight call, an append-only request reservation freezes batch id, request ordinal, requested raw count, pre-call global remaining count, public seed/profile versions and request-plan hash. It contains no outcome or later answer.
- Mainline rejects the call if its requested count exceeds the effective raw cap.
- Provider-return order is captured append-only before filtering. Deterministic normalization and cross-batch dedup precede opaque commitment. The model may not choose a subset using returned content to repair a cap error.
- The failed Batch01 response cannot be replayed or deliberately recalled into a later batch. If quarantine compliance or future chronology is not mechanically auditable, fail closed rather than infer or guess.

## State and compatibility migration

- Existing states affected: only the R11A Phase1 method-backtest blocker.
- Existing assignments affected: the same frozen Phase1 assignment only.
- Template compatibility: no template change.
- Old filename compatibility: all old bytes/hashes preserved; new filenames additive.
- One-time migration required: mainline freezes three R14 artifacts, manifest and registry/plan bookkeeping after user approval.
- Rollback path: revoke/withhold the R14 resume gate and remain at the blocker. Any later consumed work remains charged and immutable; rollback cannot reset a counter or recover raw capacity.

## Validation plan

- Historical/time-slice cases: not required; no scientific selection or threshold changes.
- Negative controls: altered blocker hash; raw arithmetic not equal to 44/44; unique count changed before commitment; missing user approval; any identity/response field in quarantine ledger; any replacement/fifth batch; request above effective cap; response captured only after semantic filtering; checkpoint overwrite; any downstream dispatch.
- Expected behavior changes: one blocked assignment may resume at Batch02 after a fully mechanical mainline gate.
- Forbidden regressions: forgetting 16 overage; treating nonpersisted responses as free; answer/content-aware recovery subset; increased ceilings/budgets; leaked private material; altered 24→30→36 or scientific/statistical gates; production activation.
- Acceptance threshold: all hashes and YAML parse; all negative controls fail closed; arithmetic and preserved invariants pass exactly; user approval id matches the exact text below.

## Decision request

The user must approve the exact text in `EXACT_USER_APPROVAL_WORDING.md`. R13B approval alone is not sufficient for this exception. Until approval and mainline mechanical installation, Phase1 remains blocked and no PACKER or downstream activity is authorized.
