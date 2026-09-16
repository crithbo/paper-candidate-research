# Discovery log — Source18 fresh problem-evidence rotation

## Result

Source18 is canonical v8.7 with V9 OFF. It rotated from backend-first search to
external problem/artifact evidence: GPU/NPU direct algorithms, architecture
data movement/placement, systems algorithms outside mature compiler backends,
and checker-backed constructors. Network security, vulnerabilities,
attack/defense, exploits, protocol security and malicious traffic were excluded
before collection.

**Result: `COMPLETE_ZERO_PROPOSALS`.** Six locator cards and four fresh raw
families were within the frozen ceiling. No card met the pre-outcome D1 gate:
a complete same-object action pair plus a target-specific, non-generic residual
after current-union and independent-subtractor subtraction. No depth or
outcome-aware backfill occurred.

## Funnel

| Stage | Count | Outcome |
|---|---:|---|
| Locator cards | 6 | Within ceiling 8 |
| Fresh raw families | 4 | Within ceiling 6 |
| Pre-outcome D1 | 0 | No bounded depth |
| Candidate-grade deep reviews | 0 | Gate not satisfied |
| PROPOSE_STAGE0 | 0 | No quota applied |

## Cards

| ID | External problem/artifact anchor | Current native union / independent subtractor | Natural carrier and stock oracle | Disposition |
|---|---|---|---|---|
| R1 | NVIDIA GDS documents a direct GPU-memory/storage DMA path, avoidance of CPU bounce buffers and explicit file-offset/size/GPU-address transfers [S1,S2]. | cuFile/cuObject API, pinned buffers, topology/driver path and storage-DMA capabilities; GDS design itself is the direct strong subtractor. | Versioned public file/image/model payload and byte equality; file/GPU I/O semantics. | `STRUCTURAL_DROP__GENERIC_DATA_PLACEMENT_OR_DRIVER_CONTROLLER`. |
| R2 | Transformer Engine documents FP8 blockwise scales and a concrete numerical-overflow/stability problem under natural training tensors [S3,S4]. | CurrentScaling, DelayedScaling, block scaling, MXFP8/NVFP4 recipes, supported format/device constraints and scale-state updates. | Public model checkpoints/tensor traces; numerical equality/tolerance and loss semantics. | `STRUCTURAL_DROP__CURRENT_RECIPE_UNION_OR_CHANGED_NUMERICAL_GUARANTEE`. |
| R3 | oneDNN Graph Compiler is a public artifact for graph fusion, layout, buffer reuse and low-precision compilation [S5]. | Current graph partition/compiler kernel union and anchor-paper constructor. | Public operator graphs; output equality. | `STRUCTURAL_DROP__PAPER_OWN_COMPLETE_CONSTRUCTOR_OR_GENERIC_LAYOUT`. |
| R4 | jemalloc documents split-capable extents and application-supplied extent hooks [S6]. | Arena/extent hooks, allocation/deallocation, splitting/merging and decay controls. | Public allocator workloads; allocation correctness oracle. | `STRUCTURAL_DROP__GENERIC_ALLOCATOR_PLACEMENT_CONTROLLER`. |
| R5 | CUTLASS async data movement/pipeline. | Same Source17 current pipeline family. | CUTLASS tests; GEMM oracle. | `EXCLUDED_REPEATED__SOURCE17_CUTLASS_PIPELINE`. |
| R6 | Verilator bounded semantic recourse constructor. | Active Source17 clean brief / Stage0 identity. | Verilog corpus; simulation/equivalence oracle. | `EXCLUDED_ACTIVE_CANDIDATE__VERILATOR_SEMANTIC_BOUNDED_RECOURSE_MTASK`. |

## Evidence honesty

All non-proposals were rejected for current-union absorption, generic placement/
controller form, paper-owned construction, or identity filtering—not for missing
implementation, results, hardware, resources or AI readiness. No absence claim
relies on an issue/future-work statement.

## Sources

* [S1] NVIDIA, *GPUDirect Storage Design Guide*:
  https://docs.nvidia.com/gpudirect-storage/design-guide/index.html
* [S2] NVIDIA, *GPUDirect Storage Overview Guide*:
  https://docs.nvidia.com/gpudirect-storage/overview-guide/
* [S3] NVIDIA Transformer Engine, *FP8 Blockwise Scaling*:
  https://nvidia.github.io/TransformerEngine/features/low_precision_training/fp8_blockwise_scaling/fp8_blockwise_scaling.html
* [S4] NVIDIA Transformer Engine, *Using FP8*:
  https://docs.nvidia.com/deeplearning/transformer-engine-releases/release-2.0/user-guide/examples/fp8_primer.html
* [S5] oneDNN Graph Compiler anchor paper/artifact:
  https://arxiv.org/abs/2301.01333
* [S6] jemalloc official manual: https://jemalloc.net/jemalloc.3.html
