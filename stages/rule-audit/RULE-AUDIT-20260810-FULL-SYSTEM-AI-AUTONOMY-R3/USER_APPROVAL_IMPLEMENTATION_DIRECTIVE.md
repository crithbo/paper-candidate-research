# User Approval and Implementation Directive

## Approval

- Date: 2026-08-10 (Asia/Shanghai)
- User decision: approve proceeding with the four recommendations in `RULE_AUDIT_REPORT.md` and `RULE_CHANGE_PROPOSAL.md`.
- Additional binding constraint: rule files exist to make the current mainline/branch/lane sessions execute their assigned roles well. Each role must be able to perform its function after reading the standard minimum bundle and its corresponding role rule. Rules must remain human-readable and operational, not be reduced to indirection-only indexes.
- Scientific boundary: no Q2, same-object, current collision, fair strong baseline, natural object/evidence, full-cost, reproducibility, evidence honesty, STOP non-revival, resource-failure or user-approval gate may be weakened.

## Design interpretation

Adopt a two-level rule design, but preserve role-level operational completeness:

1. `AGENTS.md` remains the project entry and role router.
2. A compact common policy may hold stable definitions shared verbatim by all roles.
3. Every role file remains an executable operating manual. It must not require the session to reconstruct its workflow by chasing scattered references.
4. Templates/schemas store data; they do not replace the role's decision procedure.
5. A role rule may repeat a short safety summary when that repetition prevents a dangerous mistake. Deduplication is subordinate to execution clarity.

## Required structure of every role rule

Each role rule must contain, in readable order:

1. role identity and one-sentence mission;
2. authority, write boundary and prohibited actions;
3. standard minimum-read bundle and assignment preflight;
4. ordered workflow/checklist from intake to handoff;
5. role-specific scientific and evidence gates;
6. decision table with legal outputs and when each applies;
7. resource/blocker/revision/escalation handling;
8. required artifacts, canonical filenames and handoff fields;
9. lane reuse, contamination and communication rules;
10. at least one concise positive example and one anti-example for the role's highest-risk ambiguity when useful.

Common definitions may be referenced, but any action-critical condition must be summarized in the role rule at the point of use. A session should not need to read another role's rule.

## Readability and actionability acceptance tests

For every role file, mainline must verify:

- `MISSION_TEST`: a new session can state its objective and non-goals after the first section.
- `AUTHORITY_TEST`: it can identify exactly what it may read/write/start/approve.
- `WORKFLOW_TEST`: it can execute one frozen assignment from preflight to canonical handoff using an ordered checklist.
- `DECISION_TEST`: it can distinguish PASS/REVISE/HOLD/BLOCKED/RESERVE/STOP or its role-specific subset without consulting another role file.
- `EVIDENCE_TEST`: it can distinguish evidence, inference, hypothesis and claim ceiling.
- `FAILURE_TEST`: it handles resource failure and invalid construction without inventing a scientific result.
- `HANDOFF_TEST`: it knows required output paths, fields, hashes and the next owner.
- `READABILITY_TEST`: headings, tables and examples reduce ambiguity; the file is not compressed into dense schema prose.
- `NO_DRIFT_TEST`: summaries do not contradict the common policy; the assignment pins both common-policy and role-rule hashes.

No line-count target is a hard gate. Concision is accepted only when these tests pass.

## Four-stage implementation authorization

### P0 — clarification and compatibility fixes

- Authorized for mainline application at the next safe assignment boundary.
- Existing frozen assignments, including an already active Stage 0/confirmation package, retain their frozen rule revision unless the change is purely mechanical and cannot affect judgment.
- Apply Stage 0 conditional-evidence clarification, Stage A/Stage B full-cost terminology, current hardware Stage B paths and explicit Stage B approval refusal.

### P1 — readable core plus normalized shadow control plane

- Authorized to design and create a shadow/preview implementation.
- Do not replace the authoritative registry or all role files in one bulk cutover.
- First produce the common policy plus three representative readable role rules: Discovery, Candidate Owner and Mainline. Run the acceptance tests above before converting the remaining roles.
- Preserve stage reports as readable decision narratives even when canonical facts move to structured ledgers.
- Cutover only after deterministic state mapping, artifact/hash reconciliation and at least two mainline update cycles in shadow mode.

### P2 — consolidated v8.8 Discovery/Stage 0 backtest

- The previously pending user approval is now explicitly granted.
- Mainline may register and dispatch the existing long-lived PACKER -> EXECUTOR -> AUDITOR lanes at a safe concurrency point.
- The backtest does not authorize production semantics unless its registered thresholds pass.
- Do not create per-backtest one-off sessions, run candidate experiments, revive terminal topics or use historical outputs as candidate evidence.

### P3 — AI-led formal paper project pipeline

- Authorized to scaffold rules/templates and perform a template-only dry run.
- `ROLE_PAPER_PROJECT.md` must itself be an executable operating manual following the same readability tests.
- Reuse academic-research-suite for substantive research-to-paper, integrity and review workflows; project rules define permissions, artifacts, checkpoints and claim ceilings.
- No real topic enters a formal project and no external submission occurs without the existing per-topic user gates.

## User-attention constraint

The design should reduce routine user interactions. User input remains mandatory only for material resource/permission/ownership boundaries, policy exceptions, Stage B approval, formal project activation and final authorship/venue/submission decisions. Non-critical checkpoints may be batched into concise portfolio reports; integrity gates must not be hidden.

## Mainline completion record

For each package, mainline must report:

- exact files added/changed;
- frozen old/new rule hashes;
- representative role actionability results;
- state/artifact count reconciliation;
- backtest or dry-run result;
- remaining prohibited actions;
- rollback point.

This directive is user policy approval and an implementation handoff. Shared-file writes remain mainline-owned under the current single-writer architecture.

