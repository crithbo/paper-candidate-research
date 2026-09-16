# Source log — GPU-L2LEASE

| Source | Type | What it supports | Collision reading |
|---|---|---|---|
| https://docs.nvidia.com/cuda/cuda-programming-guide/04-special-topics/l2-cache-control.html | NVIDIA programming guide | Persisting-L2 set-aside, stream/graph access-policy windows, random fractional `hitRatio`, concurrent-window thrashing and reset semantics | API/baseline, not a compiler allocator |
| https://scispace.com/papers/l2-cache-access-pattern-analysis-using-static-profiling-of-416iwwcimm | secondary discovery record | A reported static profiler that estimates an access-policy window | possible single-kernel direct subtraction; verify primary paper in Stage 0 |

Search-bounded on 2026-08-02. No hardware result was taken from either source.
