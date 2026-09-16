# Source106 S3 Research Question Cards

All locators closed before raw; no card supports a Stage 0 candidate.

## `S3-106-QC01` — ternary accumulator mapping

- Object: BitNet b1.58 public ternary model/operator and official bitnet.cpp inference kernel.
- Current locus: [Microsoft BitNet](https://github.com/microsoft/BitNet) and [1-bit AI Infra](https://arxiv.org/abs/2410.16144).
- Finding: official optimized, lossless ternary CPU/GPU kernels already cover the generic value-aware accumulator family.
- Disposition: `EXCLUDED_BEFORE_RAW`.

## `S3-106-QC02` — block-scale reduction/layout

- Object: block-scaled low-bit operator and current Marlin/MXFP kernel path.
- Current loci: [MXFP block-scaling reference](https://github.com/AMD-AGI/GEAK/blob/main/perf_knowledge/quantization/block_scaling_mxfp.md) and [vLLM Marlin FP8 utilities](https://github.com/vllm-project/vllm/blob/main/vllm/model_executor/layers/quantization/utils/marlin_utils_fp8.py).
- Finding: scale-block semantics and weight repacking are current mechanisms; no target-specific reduction action was frozen.
- Disposition: `EXCLUDED_BEFORE_RAW`.

## `S3-106-QC03` — immutable low-bit weights across modes

- Object: public low-bit prefill/decode operator route.
- Finding: no exact public carrier plus fixed target interface/action was frozen; broad reuse would be generic caching.
- Disposition: `EXCLUDED_BEFORE_RAW`.

## `S3-106-QC04` — low-bit benchmark full cost

- Object: public low-bit kernel comparison and stated conclusion endpoint.
- Current locus: [AWQ](https://arxiv.org/abs/2306.00978).
- Finding: activation statistics, platform-aware packing, and fused kernel evidence are already within the current route; no omitted component with a decision-changing conclusion was identified.
- Disposition: `EXCLUDED_BEFORE_RAW`.
