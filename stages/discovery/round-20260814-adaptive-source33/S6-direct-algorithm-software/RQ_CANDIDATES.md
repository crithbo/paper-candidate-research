# Source33 RQ candidates

## RQ-1 — bounded tensor-memory protocol construction

For a fixed Hopper-class NVPTX kernel, fixed tensor-memory operations and
fixed observable kernel result, can an algorithm jointly select legal
tensor-memory allocation columns/collective mode and the matching asynchronous
copy/barrier protocol with a target-specific finite-state guarantee?

Variants considered: (a) bytes-only allocation, (b) allocation plus copy
protocol, and (c) allocation plus copy plus launch-wide synchronization. Only
(b) remains a same-object question. It is an evidence-qualified raw question,
not a proposed claim.

## RQ-2 — shared-symbol address folding control

For fixed NVPTX shared-memory accesses, is cross-block materialization/folding
anything more than ordinary address CSE? Current source describes the shared
case as deliberately retained for CSE and reports rematerialization
regressions. This is a negative control, not a retained opportunity.

