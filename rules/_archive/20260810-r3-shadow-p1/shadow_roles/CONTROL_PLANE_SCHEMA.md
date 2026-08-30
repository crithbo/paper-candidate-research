# Normalized Control Plane — Shadow v9

Status: `SHADOW_ONLY__REGISTRY_YAML_REMAINS_AUTHORITATIVE`

## Purpose

This schema separates scientific topic state, execution, assignment, lane/UI, authorization and artifacts. It does not migrate or mutate any current topic. Old reports remain immutable; ambiguous legacy labels are quarantined for mainline adjudication.

## Topic state axes

```yaml
topic_id: EXAMPLE
topic_stage: STAGEA
scientific_disposition: ACTIVE
quality_tier: TIER_B_Q2_VIABLE
execution_state: BLOCKED
assignment_state: NONE
revision:
  scientific_used: 0
  mechanism_pivot_used: 0
  preclaim_corrections: 1
authorization:
  stageb_user_approval_id: null
  formal_project_approval_id: null
blocker:
  kind: TOOLCHAIN
  evidence_ceiling: RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE
lane:
  lane_id: null
  state: COLD_IDLE
```

Legal `topic_stage`: `DISCOVERY`, `STAGE0`, `STAGEA`, `PENDING_USER_STAGEB_REVIEW`, `STAGEB`, `INDEPENDENT_REVIEW`, `PENDING_USER_DECISION`, `FORMAL_CANDIDATE`, `PROJECT`.

Legal `scientific_disposition`: `ACTIVE`, `PASS_RECOMMENDED`, `REVISE`, `HOLD`, `STOP`, `HUMAN_RESERVE`, `ACCEPTED`.

Legal `execution_state`: `QUEUED`, `ACTIVE`, `PAUSED`, `BLOCKED`, `AWAITING_REVIEW`, `COMPLETE`.

Legal `assignment_state`: `NONE`, `FROZEN`, `ACTIVE`, `HANDOFF_READY`, `ACCEPTED`.

Legal `lane.state`: `HOT_IDLE`, `COLD_IDLE`, `ACTIVE`.

## Scheduling view

Scheduling is a separate operational view and cannot change scientific state:

```yaml
scheduling:
  policy_id: ADAPTIVE-WIP-FAST-HANDOFF-BURST-R4
  base_active_seats: 4
  maintenance_coexistence_burst: 1
  per_stage_maximum: 4
  production_discovery_expansion_before_v8_8_pass: false
  hot_discovery_slots: 2
  discovery_rotation_pool: [S1, S2, S3, S4, S5, S6]
  measurement_lane: M1_CADENCE_OR_TRIGGER
  candidate_gate_lane2_minimum_ready_stagea_assignments: 2
  ready_queue_count: 0
  active_lane_count: 0
  completed_handoff_wait_cycles: 0
  handoff_rework: 0
  duplicate_work: 0
  shared_write_conflict: 0
  rule_revision_drift: 0
  decisive_stagea_observation: 0
  user_cost: NOT_YET_MEASURABLE
  model_cost: NOT_YET_MEASURABLE
```

`maintenance_coexistence_burst=1` is eligible only when maintenance/backtest is active, authorized resource-ready science is queued, an existing long-lived lane is idle, and the assignment has frozen hashes/revision and a unique directory. It returns to zero when the queue empties, maintenance ends or any duplicate/shared-write/rule-drift event appears. It never raises a per-stage maximum above four, creates a task, merges independent review or makes blocked/unapproved work ready.

A completed scientific gate handoff must be accepted, explicitly rejected or converted to a precise blocker in the next mainline control cycle before a new noncritical refactor block. This is service priority, not a scientific-gate bypass.

## Compatibility mapping rules

1. Terminal legacy `STOP` maps to the last real topic stage plus `scientific_disposition=STOP`, never to a new active topic.
2. `BLOCKED_USER_ACTION_REQUIRED` maps to the preserved topic stage, unchanged scientific disposition and `execution_state=BLOCKED` with blocker details.
3. `HUMAN_RESEARCH_RESERVE` maps to preserved stage plus `scientific_disposition=HUMAN_RESERVE`; it is not a STOP.
4. `INCONCLUSIVE_POLICY_HOLD` maps to preserved stage, `scientific_disposition=HOLD`, `execution_state=PAUSED` and unchanged revision counters.
5. `*_ACTIVE` topic labels map lifecycle to `topic_stage`, scientific active to `scientific_disposition`, and current work to `execution_state=ACTIVE`; lane status is separate.
6. `*_PASS_RECOMMENDED` maps stage plus `scientific_disposition=PASS_RECOMMENDED`; independent acceptance is a separate artifact/review field.
7. `COMPLETE_ACCEPTED_*` on task/artifact records maps to `assignment_state=ACCEPTED` or artifact acceptance, not topic science.
8. `ARCHIVED_UI_*` maps only `lane.state=COLD_IDLE`; topic fields are unchanged.
9. Any composite string that cannot be mapped without inference is added to `quarantine[]` with its original path/value and no state mutation.

## Shadow validation

Before cutover:

- record a frozen SHA-256 of current `registry.yaml`;
- map every topic/task/status path deterministically or quarantine it;
- reconcile topic count, Stage 0 PASS, Stage A PASS/STOP, blocked, paused, hold, reserve, terminal and formal-candidate counts;
- verify revision counters, approval IDs and artifact pointers/hashes;
- represent at least two later mainline updates in both schemas;
- rollback by deleting shadow-derived views and retaining the old authoritative registry.
- validate two scheduling cycles with one ready-handoff positive control and one empty-queue negative control before authoritative scheduling cutover;
- require `duplicate_work=0`, `shared_write_conflict=0`, `rule_revision_drift=0`, preserved independent review and no idle burst.

No compatibility renderer may change scientific state or treat UI archive/artifact acceptance as scientific disposition.
