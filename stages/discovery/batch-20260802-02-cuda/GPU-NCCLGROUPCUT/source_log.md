# Source log — GPU-NCCLGROUPCUT

| Source | Type | What it supports | Collision reading |
|---|---|---|---|
| https://docs.nvidia.com/deeplearning/nccl/archives/nccl_2307/user-guide/docs/usage/streams.html | NCCL documentation | A multi-stream group introduces cross-stream synchronization | exact semantic constraint |
| https://docs.nvidia.com/deeplearning/nccl/user-guide/docs/api/group.html | NCCL documentation | Group aggregation and enqueue semantics | baseline/API contract |
| https://arxiv.org/abs/2201.11840 | GC3 primary paper | collective-algorithm compiler | methodological adjacent, not group-boundary optimization |
| https://www.usenix.org/system/files/nsdi25-xu-guanbin.pdf | AutoCCL primary paper | collective tuning | methodological adjacent; audit in Stage 0 |
| https://arxiv.org/abs/2606.09200 | recent preprint | resource-aware compute/communication overlap | deployment baseline, not the same decision |

Search-bounded on 2026-08-02; all performance statements in the brief are proposed/model-level only.
