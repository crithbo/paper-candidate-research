# COH-REGION-LIFECYCLE revision1 — user packet

## Recommendation

`STOP_RECOMMENDED` for the frozen mechanism. This is not a hardware-access failure and not a Stage B request.

## Decisive result

The implemented candidate and a fair deployable simple selector use the same region fields, the same coefficient tuple, the same B0–B3 equations, the same deterministic tie-break, and the same decision-cost charge. Across 6,912 rows:

- candidate/selector plan mismatches: `0`;
- full-cost mismatches: `0`;
- strictly positive candidate residuals: `0`;
- Pathfinder residual range: `[0, 0]`;
- BFS residual range: `[0, 0]`.

Two replays are byte-identical and 16/16 validator checks pass.

## Why GH200 would not change this decision

The absorption is an algorithmic identity, not an estimate about coefficient values. Hardware measurement can change the shared B0–B3 costs, but while both methods evaluate the same costs and take the same per-region minimum, it cannot create a candidate-only residual. Therefore the correct outcome is STOP, not HUMAN_RESEARCH_RESERVE.

## Coefficient integrity

Only first-party NVIDIA documents and the author GH200 paper are used to state the object and reported transfer observations. Unmeasured allocation, PTE/fault, page amplification, overlap, synchronization, delay, and planner terms remain unidentified. The original arbitrary grid is used only to validate implementation identity, never as probability, calibration, or speedup evidence.

## What was not done

- No GH200, GPU, B0–B3 hardware run, CUDA/Nsight command, device reservation, or large download.
- No object, program, action set, function, or initial/gate artifact was changed.
- No Stage B work or formal large-scale experiment was started.

## Authorization state

- `stageb_authorized=false`
- `pending_user_stageb_review=false`
- `stageb_user_approval_id=null`
- revision consumed: `true`

Mainline remains the only authority that can register the formal terminal state.

