# Case t3c6

Cutoff: 2026-08-03. Concurrent interactive and inference workloads contend at a
shared memory arbitration point. The fixed contract retains the same request
stream, application-frame definition, model output quality, model weights, and
thermal/power envelope. Existing baselines include command-level yielding,
accelerator-wide priority, and aggregate bandwidth controls.

Candidate action: propagate a bounded per-request criticality/deadline class to
the first shared arbiter and schedule it under DRAM timing, starvation, and
bandwidth constraints. A finite closure path is a small trace-driven queue/DRAM
model calibrated from public measurements: first test for class-separable
contention, then compare equal-quality baselines while counting metadata,
queue state, arbitration delay, fairness, timing, and energy proxy. No vendor
interface, implementation, or result is supplied at this stage.
