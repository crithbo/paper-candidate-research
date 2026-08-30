# Deep review — queue-aware HiCache prefetch termination

## Carrier audit

The official serving benchmark fixes request rate/concurrency and reports TTFT/TPOT/ITL, but does not expose the per-request queue, L3 I/O completion and scheduler-ready timestamps needed by the RQ. The detailed #32724 carrier contains those fields but comes from 4P1D/4P2D disaggregated Mooncake deployments, not the frozen one-GPU local-file object.

## Current-upstream and collision audit

- Current policies are `best_effort`, `wait_complete`, and a token-linear bounded timeout.
- Issue #32724 identifies FCFS-coupled finalization; PR #32725 implements proactive ready-prefetch finalization at a scheduler safe point.
- Strata schedules around cache-loading latency/delay hits and overlaps complementary work.
- Bidaw separates requests by storage layer and reorders by KV size to reduce blocking.

Thus the proposed queue-aware `wait/recompute` action either lacks a same-object observable carrier or collapses into already-covered loading-aware scheduling. It cannot enter raw without changing object or presenting a generic controller.

