# R4 Two-Cycle Scheduling Pilot Report

## Outcome

The two-cycle shadow pilot passed. It changed no scientific admission decision, created no task, raised no per-stage maximum, and preserved a single shared-file writer. The safe authoritative delta is therefore limited to queue-triggered scheduling and telemetry.

## Frozen authority

- Proposal: `ADAPTIVE-WIP-FAST-HANDOFF-BURST-R4`
- User directive SHA-256: `9ACEC6454E7F3DF88BC5E1FDA5C557F587D01D191853A8424569BCF314635ABB`
- Audit handoff SHA-256: `ECE887376B0C1EE8835BDCCFBA4CDFE06AA25CEAD070DDD85EFB7456DFE19CB9`
- Audit manifest SHA-256: `FE28C608CFD7DA4678521A3E9E82F2195D4DEACC3C6E66B057DC51CA929268C8`

## Cycle 1: ready scientific handoff

`AIGER-DELTA-SCHEDULE` had a mechanically valid independent `CONFIRM_STAGE0_PASS` package while R3 maintenance and the v8.8 PACKER were active. The existing candidate lane1 was idle; input hashes, execution rule revision and `stages/stageA/AIGER-DELTA-SCHEDULE/initial/` were frozen.

Mainline accepted the handoff in the next control cycle, increased the Stage0 independent PASS count from 13 to 14 and dispatched the existing lane. This dispatch was already authorized by the standing user goal; R4 did not create Stage A authority. Actual active work stayed below the base four seats, so the burst was eligible but no fifth physical seat was needed.

Telemetry: ready queue 1; active lanes 2→3; wait cycles 1; duplicate work 0; shared-write conflict 0; rule drift 0; handoff rework 0; user attention 0; one existing-lane model dispatch; decisive Stage A observations 0 because Stage A is still active.

## Cycle 2: empty ready queue

On the next scheduling control cycle the ready authorized scientific queue was empty. AIGER was already active and no second independently confirmed, resource-ready Stage A package existed. The pilot therefore refused candidate/gate lane2, refused additional Discovery expansion and deactivated burst eligibility.

Telemetry: ready queue 0; active lanes 3→3; wait cycles 0; duplicate work 0; shared-write conflict 0; rule drift 0; user attention 0; no dispatch.

## Negative controls

- `BLOCKED_USER_ACTION_REQUIRED` topics did not activate the burst.
- Unapproved Stage B or formal work did not activate it.
- PACKER, EXECUTOR and AUDITOR for one packet remained serial.
- No-ready-queue state did not keep an idle burst alive.
- No independent reviewer was merged with an owner.

## Acceptance and cost boundary

All R4 acceptance metrics passed. The pilot serviced one existing confirmed Stage0 package with zero additional user action and one dispatch to an existing lane. It created no new clean brief and no decisive Stage A observation, so cost per new brief/decisive observation is honestly `NOT_YET_MEASURABLE`, not zero.

## Authoritative cutover and rollback

The approved cutover may now add only:

1. `BASE_ACTIVE_SEATS=4` and conditional `MAINTENANCE_COEXISTENCE_BURST=1`;
2. next-control-cycle service for completed scientific handoffs before a new noncritical refactor block;
3. ready-queue telemetry and two rotating hot Discovery slots;
4. candidate/gate lane2 only with at least two independent, resource-ready Stage A assignments.

Rollback sets burst to zero and restores the base-four scheduling examples. No topic or assignment rollback is required.
