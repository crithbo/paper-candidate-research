# Rule Change Proposal

## Proposal identity

- `proposal_id`: `R11A-R13B-BATCH02-PARTIAL-PREFLIGHT-RECOVERY-PROPOSAL-20260813-R15`
- `decision_label`: `USER_POLICY_DECISION_REQUIRED`
- `user_policy_approval_required`: `true`
- `backtest_required`: `false`
- `shared_files_modified`: `false`

## Minimum assignment-local delta

After exact R15A user approval, mainline alone may add four immutable controls beneath the existing R13B control root:

1. `R15A_BATCH02_PARTIAL_PREFLIGHT_RECOVERY_AMENDMENT.yaml`
2. `R15A_BATCH02_REQUEST1_AGGREGATE_QUARANTINE_LEDGER.yaml`
3. `R15A_BATCH02_CLOSURE_AND_BATCH03_PENDING_GATE.yaml`
4. `R15A_HASH_MANIFEST.sha256`

The amendment must:

- permanently charge Request1's 12 slots and quarantine the whole unpersisted response transaction without identities/content;
- invalidate Request2's unissued 12-slot reservation with zero additional raw charge and forbid its later issue, replay, substitution or reuse;
- close original Batch02 without commitment or scientific inference;
- freeze raw `56 used/32 remaining`, unique `4 used/68 remaining`, eligible `2`;
- point only to original Batch03, never a replacement/fifth batch;
- leave Batch03 non-dispatchable until the structured-transport gate in the report is mechanically proven;
- preserve all old checkpoint, blocker, control and evidence bytes.

Mainline may update its owned `plan.md` and `registry.yaml` only after approval and hash validation. No shared scientific rule or template patch is proposed.

## Prohibited interpretations

- The missing provider order may not be inferred from prose position.
- Single-query calls are not deemed structured merely because their query boundary is obvious.
- The failed Request1 may not be replayed, reconstructed, referenced or substituted.
- Request2's unissued slots may not be used inside Batch02 after closure and may not enlarge Batch03/04.
- Crossref, OpenAlex, arXiv or any other endpoint is not automatically authorized by name.
- No capability probe, schema test or live endpoint check is free: any actual retrieval must have prior authorization/reservation and consumes its frozen slots.
- No total/per-batch cap, budget, 24→30→36 contract, scientific/statistical gate, source qualification, blind isolation, downstream authority or OFF mode changes.

## Acceptance and rollback

Acceptance requires exact input hashes, JSON/YAML parse, arithmetic `44+12=56` and `88-56=32`, unique `4+0=4`, zero Request2 consumption, append-only paths, an identity/content-free quarantine ledger, and no Batch03 dispatch flag.

Rollback never removes the blocker or restores raw. Before future retrieval, remain blocked. After future retrieval, preserve newly consumed slots and return to mainline/user if any required field is unavailable.

The exact user decision text is in `EXACT_USER_APPROVAL_WORDING.md`.
