# Evidence and escalation guide

## Evidence ladder

Use the highest level actually completed:

| Level | Evidence | Permitted wording |
|---|---|---|
| E0 | Hypothesis or design sketch | proposed, expected, unverified |
| E1 | Analytical model or proof | analytically derived under stated assumptions |
| E2 | Unit tests or functional software prototype | functionally validated on listed cases |
| E3 | Emulator, simulator, or trace-driven evaluation | simulated or trace-evaluated |
| E4 | RTL simulation or formal verification | RTL-simulated or formally checked properties |
| E5 | Logic synthesis | synthesized area/timing/resource estimates |
| E6 | P&R or FPGA evaluation | post-layout estimate or FPGA measurement |
| E7 | Physical device or silicon measurement | measured on the named device or silicon |

Never promote a claim above its evidence level. State the tool, target, workload, and assumptions with the claim.

## Escalation test

Escalate when at least one answer is yes:

1. Does the action need access, credentials, material, money, hardware, licenses, or authority the task does not have?
2. Could the choice materially alter the research claim, ownership, comparison fairness, or resource commitment?
3. Would it write outside the assigned directory or alter a read-only source?
4. Is the required storage, runtime, or compute meaningfully above the task's current contract?
5. Are two topic tasks depending on mutually inconsistent versions of a shared artifact?
6. Would the action create, modify or retire a mainline-registered shared asset under `projects/_assets/<asset_id>/`? Legacy `stages/stageB/_shared/` material is read-only and usable only when the frozen assignment names its exact ID/hash.
7. Is the topic-specific `stageb_user_approval_id`, mainline assignment ID, or exact Stage B write boundary absent or mismatched? If yes, refuse initialization/execution rather than treating it as a scientific blocker.

Do not escalate routine implementation details when a scientifically valid reversible choice exists. Record the choice and continue.

## Request outcomes

- **APPROVED:** record the approval source and proceed within its exact scope.
- **APPROVED_WITH_LIMITS:** update the contract and obey the stated limits.
- **ALTERNATIVE_SELECTED:** use the selected fallback and record its evidence impact.
- **DECLINED:** continue with a valid lower-cost route or mark the affected claim unsupported.
- **PENDING:** continue independent work; do not assume approval.

## Phase decisions

Reassess after each bounded phase:

- **KEEP:** evidence justifies the next planned cost.
- **CONDITIONAL:** name the exact gate, owner, and closure test.
- **MERGE:** identify the target direction, transferable artifact or claim, and ownership handoff.
- **STOP:** preserve reproducibility and negative evidence, then stop direction-specific spending.
- **BLOCKED:** state the missing decision or input and what useful work can continue.

Stage B entry never overrides a later kill or merge signal. The task recommends; the mainline and user decide the portfolio change.
