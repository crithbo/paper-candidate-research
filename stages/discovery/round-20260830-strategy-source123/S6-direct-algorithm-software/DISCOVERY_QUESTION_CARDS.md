# Source123 S6 Question Cards

## S04 PyTorch unbacked-symbol incremental constraints
- Exact carrier/current locus: `test/inductor/test_unbacked_symints.py`; `torch/fx/experimental/symbolic_shapes.py`.
- Current union includes ShapeEnv event replay/state equality, value ranges, pending-symbol handling, rebinding/resolution, guard APIs, optimization hints and consistency checks.
- Frozen incremental-maintenance action is already native; no different target-specific data structure survives.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_NATIVE_UNION_ABSORPTION`.

## S06 MLIR NVGPU→NVVM certificate
- Exact carrier/current locus: `mlir/test/Conversion/NVGPUToNVVM/nvgpu-to-nvvm.mlir`; `mlir/lib/Conversion/NVGPUToNVVM/NVGPUToNVVM.cpp`.
- Carrier establishes conversion patterns, but no source-supported additional lowering choice/certificate or decision-changing uncovered case was frozen.
- Disposition: `LOCATOR_ONLY__NO_NON_GENERIC_ATOMIC_DELTA`.

## S08 Triton layout-conversion graph
- Exact carrier/current locus: `test/Conversion/tritongpu_to_llvm.mlir`; `RemoveLayoutConversions.cpp`, `ConvertLayoutOpToLLVM.cpp`, `LinearLayout`.
- Current pass already finds anchors, propagates layouts, resolves conflicts, inserts necessary conversions, rewrites in dominance order and performs rematerialization/hoisting.
- Frozen redundant-conversion elimination action is directly represented; no residual without inventing a stronger post-result RQ.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_NATIVE_UNION_ABSORPTION`.

## Funnel
- seed/RQ frozen before source: 8
- exact carriers: 3
- primary RQ evaluated: 3
- excluded before raw: 2
- locator only: 1
- evidence-qualified raw/deep/brief: 0/0/0
