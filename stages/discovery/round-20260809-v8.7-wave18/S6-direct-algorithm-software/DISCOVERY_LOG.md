# Discovery log — DISCOVERY-S6-20260809-V8.7-WAVE18

- Frozen cutoff: `2026-08-09`.
- Method: accepted discovery v2/v8.1, calibrated v8.6 fidelity-plan admission, and v8.7 `CURRENT_UPSTREAM_REALITY_CHECK`. The blocked two-axis v8.2r2 was not used.
- Scope respected: only this assignment directory was written. No Stage 0/A/B directory, experiment, benchmark, or main-control update was made.

## StageA-feedback-oriented screening

The screen prioritized a complete native artifact + reader/oracle with a potential global constructor. SQLite core `ANALYZE`/`sqlite_stat4` was examined because the official format permits an arbitrary number of ordered samples per index and the native planner consumes them. The candidate action considered was a budgeted cross-index STAT4 sample constructor under a fixed scan/storage budget.

## Why it is not proposed

This is not a current-source absence drop: the official format leaves the representation action open, while current `ANALYZE` distinguishes full-scan STAT4 from per-index approximate analysis. However, the resulting research question is a known workload-driven statistics-selection/management problem, not yet a SQLite-specific new action interface. The corpus search did not identify a public **natural SQLite database plus reproducible natural query trace** that fixes a same-object, strong comparator and finite full-cost killer. Replacing that with TPC-H/hand-written queries would violate the natural-evidence gate; comparing only estimation metrics would omit the native execution denominator. The route is therefore `NOT_ADMITTED__NO_GROUNDED_BRIEF`, not STOP evidence against a future independently grounded same-object topic.

## Result

`COMPLETE_ZERO_PROPOSALS`. Excluded/active/terminal objects were not revived or renamed.
