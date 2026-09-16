# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260810-SCREENING-THROUGHPUT-PARALLELISM-R4`
- `proposal_id`: `ADAPTIVE-WIP-FAST-HANDOFF-BURST-R4`
- `decision_label`: `PATCH_RECOMMENDED`
- `user_policy_approval_required`: `true`
- `backtest_required`: `false`
- `shadow_scheduling_pilot_required`: `true`

## Problem statement

The project is processing raw Discovery material quickly, but candidate yield and control-plane transition latency are low. Waves 29–47 recorded at least 238 heterogeneous screening units and only six proposals. The downstream execution and review lanes are currently idle, while an AIGER Stage 0 independent PASS handoff is complete and the single mainline is occupied with the already approved P0/P1/P2 rule program.

The present fixed four-seat examples do not distinguish scientific work from temporary maintenance/backtest load and do not require the mainline to service a completed scientific handoff before continuing a new noncritical refactor block. This can leave valid work ready but undispatched even though its long-lived lane is idle.

## Current rule

- File/heading: `rules/ROLE_MAINLINE.md`“长期角色会话池”“并发与在制品”“主线验收”“通信”。
- Current behavior: default four-seat examples, per-stage 2–4 lane maximums, fixed WIP targets, one shared writer, no queue-triggered burst or handoff service priority.
- Why clarification is insufficient: the current AIGER/P1/P2 overlap demonstrates a real scheduling conflict. A generic reminder to “be faster” does not specify when an extra seat is safe, which work deserves it, or when to remove it.

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| `rules/ROLE_MAINLINE.md` | “并发与在制品” | Default four seats; fixed examples | Define `BASE_ACTIVE_SEATS=4` and `MAINTENANCE_COEXISTENCE_BURST=1`. Burst requires active maintenance/backtest + ready authorized science + idle existing lane + frozen unique directory. It is temporary and does not raise per-stage max above 4. |
| `rules/ROLE_MAINLINE.md` | “主线验收/通信” | Mechanical acceptance has no service priority | A completed scientific gate handoff must be mechanically accepted, explicitly rejected, or converted to a precise blocker in the next mainline control cycle before another noncritical refactor block begins. |
| `rules/ROLE_MAINLINE.md` | “并发与在制品” | Fixed WIP count targets | Treat WIP numbers as configurable diagnostics. Dispatch from ready queues; do not create work to fill buffers. |
| `rules/ROLE_MAINLINE.md` | Discovery scheduling | Two hot Discovery examples without rotation trigger | Rotate the two hot slots across S1–S6; M1 remains cadence/triggered. A third Discovery burst is allowed only after v8.8 PASS and only in supply-starved state. |
| future P1 control schema / registry scheduling view | telemetry | No consistent queue/service metrics | Record `ready_queue_count`, `active_lane_count`, `completed_handoff_wait_cycles`, `handoff_rework`, `duplicate_work`, `rule_revision_drift`, and `decisive_stagea_observation`. |

No shared file is edited in this audit directory.

## Mechanical scheduling states

### `MAINTENANCE_COEXISTENCE_BURST`

Activate one extra total seat only if:

- `maintenance_or_backtest_active=true`;
- `ready_authorized_scientific_assignments>=1`;
- the required long-lived lane is idle or cold-archived and safe to reactivate;
- the assignment has a frozen rule revision, input hashes and unique write directory;
- no shared-file writer other than mainline is introduced.

Deactivate when the ready queue is empty, maintenance closes, a write conflict appears, or the pilot fails any acceptance metric.

### Stage-specific expansion

- Discovery: keep two rotating hot slots. A third burst is post-v8.8 only and supply-starved only.
- Stage 0: pipeline PRIMARY(N+1) with confirmation(N) only when at least two complete briefs exist. Add no permanent lane today.
- Stage A: reactivate lane2/gate2 only when at least two independent Stage 0 PASS packages are resource-ready.
- Backtest: preserve serial independent roles for each packet.

## Safety invariants

- Q2 minimum preserved: yes.
- Q1 priority preserved: yes.
- Same-object preserved: yes.
- Latest collision preserved: yes; v8.8 remains independently gated.
- Fair current strong baseline preserved: yes.
- Natural input/evidence preserved: yes.
- Full-cost preserved: yes.
- Reproducibility preserved: strengthened through queue and rule-revision telemetry.
- Claim ceiling preserved: yes.
- STOP non-revival preserved: yes.
- User StageB approval preserved: yes.

## State and compatibility migration

- Existing states affected: none.
- Existing assignments affected: none automatically.
- Template compatibility: no candidate template change required.
- Old filename compatibility: unchanged.
- One-time migration required: none; scheduling fields may first live in P1 shadow control plane.
- Rollback path: set burst to zero and retain current default four-seat examples.

## Validation plan

- Historical/time-slice cases: not required because admissions do not change. Use two live scheduling cycles as a shadow/pilot.
- Negative controls: no-ready-queue state; one-lane-only write conflict; unapproved Stage B; blocked resource case; same-packet backtest role overlap. None may activate the burst.
- Expected behavior changes: reduced completed-handoff waiting; scientific progress can coexist with maintenance; no increase in weak briefs.
- Forbidden regressions: duplicate assignment, two shared writers, pre-reading next assignment, bypassing confirmation/gate, applying v8.8 before backtest PASS, or keeping idle burst tasks alive.
- Acceptance threshold:
  1. ready authorized scientific work is serviced in the next mainline control cycle;
  2. `duplicate_work=0`, `shared_write_conflict=0`, `rule_revision_drift=0`;
  3. no independent review is merged or skipped;
  4. burst utilization is tied to real ready work, not raw quotas;
  5. after two cycles, compare user/model cost per clean Stage 0 brief and decisive Stage A observation against the pre-pilot snapshot.

## Decision request

`USER_APPROVAL_REQUIRED` for the one-seat adaptive scheduling pilot and its small mainline/control-schema patch.

Approval would not authorize new per-candidate tasks, permanent per-stage expansion beyond four, Stage B, formal project activation, large downloads, automation, terminal revival, or any weakening of academic gates. If approved, mainline should first implement the rule in P1 shadow form, run two scheduling cycles, report the metrics, and only then make it authoritative.
