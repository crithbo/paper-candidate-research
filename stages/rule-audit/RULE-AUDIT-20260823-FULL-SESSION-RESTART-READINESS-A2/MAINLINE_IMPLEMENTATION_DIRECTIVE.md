# Mainline implementation directive

## Objective

Make every long-lived project conversation restartable without old-chat memory while preserving single-writer control and all scientific gates.

## P0 — implement before reopening tasks

1. In `AGENTS.md`, replace the prose-only role mapping with a compact table containing:
   - role/lane names;
   - authoritative role file;
   - mandatory skill;
   - conditional protocol/reference;
   - canonical output/template;
   - state-writing authority.
2. Add a short restart protocol:
   - restart Mainline first;
   - Mainline reconciles `plan + registry` and freezes a current restart set;
   - issue one `ASSIGNMENT_CONTEXT.yaml` per lane to be reopened;
   - start new tasks with lane identity and context path/hash;
   - require `BOOTSTRAP_ACK.yaml` or equivalent handoff before scientific work;
   - accept the new task, then archive the old task; never reverse this order.
3. Add a current lane dashboard to the top of `plan.md`:
   - `lane_id`, `role`, `assignment_id`, `topic_id`, `state`, `context/assignment path`, `write_directory`, `next_action`, `user_action_required`.
   - show every reusable lane as `ACTIVE / BLOCKED / PENDING_USER / IDLE_REUSABLE / COLD_ARCHIVED`.
4. Add `templates/ASSIGNMENT_CONTEXT.yaml` with at least:
   - schema/revision/generated_at;
   - full `AGENTS/plan/registry/role` hashes;
   - lane/role/assignment/topic/stage/current state;
   - exact source assignment path/hash and unique write directory;
   - mandatory/conditional reads and upstream artifact hashes;
   - skill name/revision/hash;
   - allowed/prohibited actions and forbidden inputs;
   - current next action and completion boundary;
   - scientific revision/pivot state;
   - terminal identity/current collision digest and STOP non-revival assertion;
   - user approval/resource/blocker state;
   - mainline task/contact and fail-closed fallback.
5. Add `templates/BOOTSTRAP_ACK.yaml` with:
   - all identity/hash fields repeated;
   - declared next action, write boundary, prohibited actions, conditional skill status;
   - `old_chat_memory_required=false`;
   - contamination/independence declaration;
   - `READY / REFUSE_MISSING_OR_CONFLICTING_CONTEXT`.

## P0 — Stage B alignment

1. In `AGENTS.md` and `ROLE_CANDIDATE_OWNER.md`, require:
   - `$academic-research-suite` experiment/repro workflow for Stage A/B execution planning;
   - `$hardware-stageb-runner` for hardware/GPU/NPU/PIM/RTL/FPGA/EDA/PPA/accelerator Stage B.
2. Create missing canonical templates:
   - `STAGEB_WORK_BREAKDOWN.yaml`;
   - `ENVIRONMENT_LOCK.yaml`;
   - `AUTONOMOUS_RECOVERY_LEDGER.yaml`;
   - `RUN_INDEX.yaml`.
3. Patch hardware initializer:
   - accept exact `--write-directory` frozen by Mainline;
   - validate it resolves under `stages/stageB/<topic>/<assignment-or-resume>`;
   - do not infer/create the topic root as the assignment boundary;
   - require matching assignment/topic/approval;
   - initialize the six canonical Stage B artifacts, `RESOURCE_INVENTORY.yaml`, and `resources/{downloads,archives,src,build,env,cache,tmp,logs}`;
   - retain `PROGRESS/SOURCE_MANIFEST/RESULT_SUMMARY` only as auxiliary artifacts;
   - stop creating a competing `TASK_CONTRACT.yaml`, or label it legacy/non-authoritative.
4. Replace the stale authoritative `stages/stageB/_shared/` reference in the skill reference with `projects/_assets/<asset_id>/`; retain exact old frozen assets read-only only.

## P0 — formal paper routing

1. Add reusable conditional lanes to Mainline:
   - `FORMAL-PROJECT-EXECUTION-LANE-1..N`;
   - `MANUSCRIPT-INDEPENDENT-REVIEW-LANE-1..N`.
2. Add the explicit post-Stage-B chain:
   - independent Stage B accept → `PENDING_USER_DECISION`;
   - topic-specific `formal_project_approval_id` → `FORMAL_PROJECT_ACTIVE`;
   - evidence/draft/integrity/review/revision → `SUBMISSION_PACKAGE_READY`;
   - authorship/venue/external submission remain user-only.
3. Keep `FORMAL_CANDIDATE` only as a compatibility alias if historical records use it; do not make it an ambiguous second current state.
4. In `ROLE_PAPER_PROJECT.md`, require assignment `mode=FORMAL_PROJECT_OWNER | INDEPENDENT_MANUSCRIPT_REVIEW`, list exact templates, and pin the relevant `$academic-research-suite` workflow.

## P1 — cold-start shadow before registry-slice cutover

Run at least the following bootstrap cases without old conversation history:

- Mainline current-state reconciliation;
- one Discovery active and one zero-brief/idle lane;
- Stage 0 PRIMARY and SENTRY;
- Stage A owner and independent gate;
- Stage B owner with valid approval and a missing-approval negative control;
- Stage B independent reviewer with owner-conflict negative control;
- Rule Audit proposal-only boundary;
- formal project owner and independent manuscript reviewer;
- blocked resource resume;
- terminal STOP non-revival;
- revision-consumed hold.

Accept only if every case reproduces the same role, state, permission, next action and refusal behavior as the full authoritative read. Until then, branch roles continue full-registry fallback.

## Rollback

- Never delete existing assignments, evidence, templates or task histories during rollout.
- P0 text/table/template changes can revert by file hash.
- If any context omission or decision drift occurs, disable slice-only startup, require full registry, repair the context generator/schema and rerun cold-start tests.
- If the Stage B initializer writes outside its frozen assignment directory or creates noncanonical authority, disable it before any scientific run.

