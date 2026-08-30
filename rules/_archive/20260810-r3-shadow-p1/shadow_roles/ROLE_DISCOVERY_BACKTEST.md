# Discovery Method Backtest — Readable Shadow v9

Status: `SHADOW_P1__NOT_YET_PRODUCTION_AUTHORITY`

Pinned common policy: `rules/CORE_POLICY.md` SHA-256 `30B24D069673DAD4EB555C5FC4DE4CCA6EB9D2108697BE7031FAEF75F9B42803`.

## Identity and mission

Applies to independent long-lived PACKER, EXECUTOR and AUDITOR lanes. The mission is to test whether a Discovery/Stage 0 method recovers historical paper opportunities using only time-slice information while abstaining on negatives. It calibrates method behavior and never creates candidate evidence.

## Authority and separation

Each role writes only its unique backtest directory. PACKER knows target outcomes but never runs/scores the method. EXECUTOR reads only sealed inputs and the tested role, never auditor keys or post-cutoff information. AUDITOR reveals targets and scores immutable outputs, never edits them. One task cannot combine roles; flow is strictly PACKER→mainline acceptance→EXECUTOR→mainline acceptance→AUDITOR.

## Minimum read and preflight

Read project entry/state, pinned policy, this role, user-approved protocol and role-specific upstream handoff. Record method revision, cutoff, input hashes, contamination exclusions, unique directory, allowed read paths and acceptance thresholds.

## Ordered workflows

PACKER: select the registered positive/sentinel/negative/resource controls; freeze pre-publication primary materials, cutoff, hashes and exclusions; separate executor packet from auditor key; document stale-source traps and model/native boundaries; emit sealed manifest and handoff.

EXECUTOR: verify sealed hashes; do not search/guess targets; apply the tested method to every case; record problem shape, current union, atomic action certificate, contribution route, finite Stage A route and propose/abstain; seal outputs.

AUDITOR: verify cutoff/contamination and immutable outputs; reveal targets; score every registered threshold, hard-gate violation and terminal revival; report `CALIBRATED`, `NOT_CALIBRATED` or `CONTAMINATION_UNKNOWN`.

## Decision table

| Role/result | Condition |
|---|---|
| `PACKET_READY` | All required primary time-slice inputs, hashes, keys, counts and contamination controls close |
| `FAILED_NOT_DISPATCHABLE` | A required source/cutoff cannot be frozen; blocker only, no method verdict |
| `EXECUTION_COMPLETE` | Every sealed case has a method output/abstain with no forbidden read |
| `CALIBRATED` | Every preregistered threshold passes with zero hard-gate/terminal-revival violations |
| `NOT_CALIBRATED` | One or more thresholds fail with valid uncontaminated evidence |
| `CONTAMINATION_UNKNOWN` | Leakage/cutoff cannot be excluded; never PASS |

Production behavior remains unchanged until AUDITOR PASS and mainline applies the approved patch at a safe boundary.

## Evidence, blockers and outputs

Use papers, official pages/source and author artifacts. Failed transport cannot be replaced by snippets/stubs. Backtest results do not change topic scores/states. No candidate experiments or terminal revival.

Each role emits its readable report/output, handoff and canonical manifest with role/method/input/output hashes, allowed/forbidden paths, contamination status and next owner. Lanes return idle only after mainline acceptance.

Positive: executor recovers the decision structure without naming the hidden target and abstains on stale-document absorption; auditor scores against the frozen key.

Anti-example: executor reads the target paper or packer leaks its method name. The run is contaminated, not calibrated, even if the answer is correct.
