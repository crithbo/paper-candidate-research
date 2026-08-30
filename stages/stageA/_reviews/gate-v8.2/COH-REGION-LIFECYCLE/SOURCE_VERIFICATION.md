# Source Verification — 2026-08-09

## Hardware/object sources

| Claim | Primary/authoritative source | Verification |
|---|---|---|
| ATS makes system `malloc` memory GPU-addressable through effectively shared page tables | [NVIDIA nvidia-smi documentation](https://docs.nvidia.com/deploy/nvidia-smi/index.html#addressing-mode) | verified |
| CUDA 12.4 full unified-memory attributes include pageable access, host page-table use, direct host access and host-native atomics on hardware-coherent systems | [CUDA 12.4 Programming Guide](https://docs.nvidia.com/cuda/archive/12.4.0/cuda-c-programming-guide/index.html#heterogeneous-memory-management) | verified |
| Access-counter migration became enabled by default for Grace Hopper in CUDA 12.4 | [CUDA 12.4 Release Notes](https://docs.nvidia.com/cuda/archive/12.4.0/cuda-toolkit-release-notes/index.html) | verified |
| GH200 has coherent NVLink-C2C, distinct system/managed/device semantics, and workload-dependent first-touch/page/migration behavior | [Schieffer et al., ICPP 2024 author preprint](https://arxiv.org/abs/2407.07850) | verified; DOI `10.1145/3673038.3673110` |

The sources support the frozen hardware boundary and the plausibility of lifecycle heterogeneity. They do not supply the candidate's normalized coefficient ranges, nor do they justify applying a universal four-pass access-counter delay to Pathfinder and BFS.

## Comparator verification

| Reference | Status/role | Verification |
|---|---|---|
| TPP | ASPLOS 2023 CXL tiered-memory placement comparator | exists; official proceedings identify the paper and role |
| SuperInfer | MLSys 2026 GH200 LLM serving/memory-management neighbor | exists in official MLSys proceedings; narrower workload/object |
| ARIADNE | HPCA 2026 adaptive UVM oversubscription neighbor | exists in IEEE metadata; different oversubscription object |
| DirectKV | OSDI 2026 GH200/GB200 zero-copy KV system | exists on official USENIX page; narrower KV object |

No checked source is a `DIRECT_FATAL` collision with the full frozen lifecycle-optimizer claim. The search remains bounded-open and cannot substitute for Stage B collision closure.

## Citation defect

`Q1_COMPARATOR_MATRIX.md` links TPP to `10.1145/3575693.3575755`. The verified TPP DOI is [`10.1145/3582016.3582063`](https://doi.org/10.1145/3582016.3582063). This is a source-integrity correction required in revision, but it is not the substantive gate blocker.

