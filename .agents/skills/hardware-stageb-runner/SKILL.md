---
name: hardware-stageb-runner
description: Run user-approved, scoped and reproducible Stage B feasibility pilots for hardware and architecture research, including NPU/AI accelerators, GPGPU, PIM/NDP, accelerator compilers, bit-exact quantization, RTL, FPGA, EDA, and PPA studies. Use when Codex needs to preflight or execute a frozen Stage B assignment, maintain reproducible progress, consume mainline-owned shared artifacts, report blockers, reassess keep/merge/stop after each phase, or submit resource, permission, data, hardware, license, shared-file, or scope requests. Refuse initialization and execution when the topic-specific Stage B user approval ID or mainline assignment/write boundary is absent.
---

# Hardware Stage B Runner

Use this skill as the execution layer beneath `academic-research-suite`. Let the academic suite control research questions, novelty, evidence sufficiency, and paper claims; use this skill to organize and run the corresponding pilot.

## Start from project state

1. Resolve the workspace root from the assignment; for this project it must be `D:\project\writing\reserch`. Read `AGENTS.md`, `plan.md`, the frozen `ASSIGNMENT_CONTEXT.yaml`, the topic's registry record (until context-slice production cutover), the assigned topic's Stage A evidence/gate packet, and the user-review/Stage B approval record. Never fall back to `RESEARCH_CONTROL_STATUS.md` or an unregistered `stage-b/` tree.
2. Read the complete `academic-research-suite/SKILL.md`, then load only the hardware or experiment references needed for the assigned topic.
3. Mainline first creates the exact assignment directory and freezes `ASSIGNMENT_CONTEXT.yaml` plus `STAGEB_EXECUTION_CONTRACT.yaml`. Before any runner initialization, dependency acquisition or run, verify all of: a non-empty `stageb_user_approval_id` matching the topic; a mainline `assignment_id`; an exact assignment write boundary strictly below `D:\project\writing\reserch\stages\stageB\<topic-id>\`; a matching contract; and registry/context authorization. Topic root itself is never valid. If any field is missing or mismatched, return `AUTHORIZATION_REFUSAL__NO_VALID_TOPIC_STAGEB_APPROVAL` and perform no runner write or execution.
4. Write/read the task's `BOOTSTRAP_ACK.yaml` and wait until it records mainline acceptance. Then read `PROGRESS.md` when present and state the current stage, topic ID, writable assignment directory, read-only sources, proposed pilot, approval ID, assignment ID and known blockers before changing files or running experiments.
5. Treat the assigned task directory as the only write boundary. Treat shared sources and the original reference project as read-only unless the user explicitly changes that rule.

After the context, contract and accepted ack already exist, complete any missing non-authority skeleton files with:

```powershell
& <python> <skill-dir>\scripts\init_stageb_task.py `
  --workspace-root D:\project\writing\reserch `
  --topic-id <topic-id> `
  --write-directory D:\project\writing\reserch\stages\stageB\<topic-id>\<assignment-id> `
  --title "<short title>" `
  --assignment-id <mainline-assignment-id> `
  --approval-id <stageb-user-approval-id>
```

The initializer never creates `ASSIGNMENT_CONTEXT.yaml`, `STAGEB_EXECUTION_CONTRACT.yaml` or `BOOTSTRAP_ACK.yaml`, never overwrites existing files and never grants authority. It adds the remaining canonical ledgers from workspace `templates/`, auxiliary progress/source/summary files and the localized resource tree. Mainline must freeze the completed skeleton before claim-bearing work. Adapt fields to the experiment; do not preserve empty fields merely for ceremony.

## Coordinate shared artifacts

Only consume reusable shared assets explicitly registered by mainline in `registry.yaml` under `D:\project\writing\reserch\projects\_assets\<asset_id>\`; treat them as read-only. Legacy registered `stages/stageB/_shared/` inputs may be read only when the frozen assignment names their exact ID/hash, but no new shared asset is created there.

- Treat every registered shared asset as read-only for every direction task.
- Let only mainline create, modify, register or retire shared assets and their registry records.
- Draft proposed content or patches inside the requesting task's directory.
- Submit `SHARED_CREATE` or `SHARED_CHANGE` through `requests/`; include the target path, current version or hash, affected topics, compatibility impact, and migration or fallback plan.
- Record every consumed shared asset ID/hash/version in `SOURCE_MANIFEST.yaml` and the assignment `RESOURCE_INVENTORY.yaml`.

Do not maintain private divergent copies when a frozen shared artifact defines comparison fairness. A task may keep an experimental fork in its own directory, but must label it non-authoritative.

## Maintain progress and notify the mainline

Keep a concise `PROGRESS.md` in the task root. Update it:

- when work starts or resumes;
- after a reproducible milestone or evidence-level change;
- when a success, stop, downgrade, or merge signal is crossed;
- when an important blocker or mainline request appears;
- at each phase boundary and before handoff.

Record the current mode, phase goal, strongest evidence, completed work, active work, next checkpoint, open requests, and tentative direction recommendation.

Notify the mainline when progress changes the retain/merge/stop decision, a first reproducible result arrives, evidence level changes, a shared dependency is needed, or a blocker requires authority or resources. Use a permitted task-messaging tool when a mainline task ID is available; otherwise return the exact `PROGRESS.md` or request path. Do not send routine log noise.

## Choose the operating mode

- **Preflight:** close a resource, corpus, baseline, licensing, toolchain, or feasibility gate without claiming an experimental result.
- **Pilot:** run the smallest experiment capable of supporting or killing the mechanism claim.
- **Extension:** add a justified baseline, ablation, workload, or evidence level after the pilot remains viable.
- **Handoff:** summarize evidence, limitations, requests, and the next decision for the mainline.

Default to the cheapest mode that can answer the current decision. Do not start an expensive RTL, EDA, FPGA, device, server, or long-training run solely because it is available.

Treat Stage B admission as permission to test a direction, not a commitment to sustain it. At the end of every phase, recommend one of:

- **KEEP:** continue because the mechanism remains plausible and the next evidence is worth its cost.
- **CONDITIONAL:** continue only after a named, closable gate.
- **MERGE:** preserve useful artifacts and claims, then integrate them into a stronger direction.
- **STOP:** end direction-specific work because evidence crosses a kill threshold or the publishable claim is no longer viable.
- **BLOCKED:** pause because a decision cannot yet be made from available evidence.

The mainline and user own the final change of direction. After a likely `MERGE` or `STOP`, avoid further expensive work beyond a small confirmation needed to make the decision reliable.

## Keep the contract useful, not bureaucratic

Record enough in canonical `STAGEB_EXECUTION_CONTRACT.yaml` to make the run interpretable:

- research question and mechanism claim;
- smallest falsifiable test;
- baselines, metrics, and locked comparison conditions;
- success, stop, and downgrade signals;
- target evidence level and current evidence ceiling;
- estimated time, storage, compute, and licensed-resource needs.

Keep `STAGEB_WORK_BREAKDOWN.yaml`, `ENVIRONMENT_LOCK.yaml`, `AUTONOMOUS_RECOVERY_LEDGER.yaml`, `CLAIM_EVIDENCE_MATRIX.yaml` and `RUN_INDEX.yaml` consistent with that contract. Treat non-authoritative work-package details as working defaults. Ask the mainline to adjudicate changes that alter the paper claim, ownership, resource commitment, comparison fairness, kill-gate order or authorized recovery envelope.

## Audit resources and escalate material needs

Proceed independently with ordinary in-scope implementation choices, small local dependencies, test seeds, file naming, and reversible debugging.

Submit a mainline request when progress materially depends on any of the following:

- user-supplied data, unpublished material, credentials, device access, server access, or licensed EDA tools;
- permission to copy a large dependency or use substantial storage/compute time;
- modification of the original reference project or another task's directory;
- creation or modification of an authoritative shared artifact, a claim-ownership conflict, or an incompatible experiment contract;
- selection among baselines or semantics that would materially change the paper's conclusion;
- scope expansion, paid access, external communication, or any action requiring user authority.

Create `requests/REQ-<date>-<short-name>.md` from `assets/mainline-request.md`. Include:

- the exact item or decision needed;
- why it changes feasibility or evidence strength;
- the smallest acceptable option and one fallback;
- estimated time, storage, cost, and affected claims;
- whether other useful work can continue while waiting;
- a recommended choice without treating it as approval.

Return the request path to the mainline. If a mainline task ID and a permitted task-messaging tool are available, send the same compact request there. Never invent approval. Continue non-blocked work while the request is pending.

## Execute the pilot

1. Update `PROGRESS.md` with the phase goal and current recommendation.
2. Inspect `SOURCE_MANIFEST.yaml`; record the origin, version or commit, license, and whether each input is copied, linked, generated, shared read-only, or otherwise constrained.
3. Create a unique run directory under `runs/`. Save the command, configuration, tool versions, seed when applicable, start/end time, and raw logs.
4. Validate the harness with a tiny known case before trusting a large result.
5. Run the minimum discriminating experiment first.
6. Preserve failures and negative results. Distinguish mechanism failure from tooling failure.
7. Bound retries. Diagnose a failure before rerunning; do not loop merely to obtain a favorable number.
8. Add stronger evidence only when it can change the retain/merge/stop decision or support a specific paper claim.
9. Put every assignment-controlled download, archive, source copy, build tree, environment, configurable cache, temporary file and log under the frozen `<unique_write_directory>\resources\` tree required by `rules/RESOURCE_LOCALIZATION.md`. Consume a mainline-registered `projects/_assets/<asset_id>/` asset read-only; copy required material into local `resources/src` or `resources/build` before mutation. Maintain the durable assignment `RESOURCE_INVENTORY.yaml` and immutable run snapshots.
10. Update `PROGRESS.md` after decision-changing results and at the phase boundary.

Use `references/evidence-and-escalation.md` when assigning evidence levels or deciding whether to request mainline intervention. Use `references/hardware-domain-checks.md` for quantization, NDP/PIM, RTL, synthesis, FPGA, or PPA work.

## Preserve evidence integrity

Apply these as hard boundaries:

- Do not fabricate citations, executions, logs, RTL results, synthesis, P&R, FPGA, device, or silicon measurements.
- Do not label analytical estimates as measurements or synthesis as ASIC PPA.
- Do not modify the original reference project, another task's folder, or shared read-only material without explicit approval.
- Do not modify a registered `projects/_assets/<asset_id>/` asset in place; submit a mainline shared-asset change request instead.
- Do not hide unsuccessful runs, changed thresholds, unsupported workloads, or comparison mismatches.
- Do not execute destructive operations, paid services, restricted hardware, licensed tools, or external communication without the required authority.

Everything else is a judgment rule rather than a mandatory stop. Prefer a transparent approximation or smaller test when it can still answer the current gate.

## Hand off to the mainline

Update `PROGRESS.md` and `RESULT_SUMMARY.md` with:

- decision-ready finding: `supports`, `weakens`, `kills`, or `inconclusive`;
- completed runs and strongest evidence level;
- claim supported at that level and claims still unsupported;
- comparison conditions, negative results, and known threats;
- reproducibility pointers;
- outstanding mainline requests;
- recommendation: `KEEP`, `CONDITIONAL`, `MERGE`, `STOP`, or `BLOCKED`;
- proposed merge target and artifact handoff when recommending `MERGE`;
- next cheapest experiment that could change the decision.

Report paths rather than pasting large logs. Make the final recommendation proportional to evidence, not to effort already spent.
