# Source105 S3 Research Question Cards

All four locators stopped before raw. These entries are not scientific STOPs and do not create Stage 0 candidates.

## `S3-105-QC01` — GQA group mapping

- Exact object: current vLLM XPU paged-decode configuration for GQA LLMs.
- Carrier: `IMPLEMENTATION_CARRIER_ONLY`.
- Current locus: [vLLM XPU kernel configuration](https://github.com/vllm-project/vllm-xpu-kernels/blob/main/KERNEL_CONFIGURATION.md).
- Current-union finding: qgroup is derived from `num_attention_heads / num_key_value_heads`; head size and page size jointly specify the tiled decode configuration.
- Minimum falsifier: current source expresses the frozen group/page mapping action; satisfied.
- Disposition: `EXCLUDED_BEFORE_RAW`.

## `S3-105-QC02` — hybrid layer-class mapping

- Exact object: Qwen3.5 hybrid GatedDeltaNet/full-attention layer sequence and public runtime/memory handling.
- Carrier: `NATURAL` public model architecture, but no distinct target action survived.
- Current loci: [Qwen official release](https://qwen.ai/blog?email_hash=23463b99b62a72f26ed677cc556c44e8&id=qwen3.5), [Hugging Face Qwen3.5 docs](https://huggingface.co/docs/transformers/v5.13.0/model_doc/qwen3_5), and [HYPIC](https://arxiv.org/abs/2607.01299).
- Current-union finding: layer types and corresponding recurrent/full-attention runtime paths are already explicit; recent systems address their joint serving-state behavior.
- Disposition: `EXCLUDED_BEFORE_RAW`.

## `S3-105-QC03` — SwiGLU projection coupling

- Exact object: public LLM SwiGLU projection graph plus unspecified target mapping interface.
- Carrier: `IMPLEMENTATION_CARRIER_ONLY`.
- Strongest skeptic: current fused-MoE/SwiGLU kernel paths and ordinary fused MLP implementations.
- Minimum falsifier: no non-product mapping constraint, fixed target interface, or same-function construction remained after subtraction.
- Disposition: `EXCLUDED_BEFORE_RAW`.

## `S3-105-QC04` — model-shape panel validity

- Exact object: open accelerator mapping benchmark and a model-graph shape panel.
- Carrier: `CANONICAL_BENCHMARK_ONLY` was not established as a residual.
- Current loci: [Timeloop/Accelergy](https://timeloop.csail.mit.edu/) and [TransFusion](https://jnamaral.github.io/CDOL/papers/ZhangMICRO25.pdf).
- Current-union finding: mapping inputs already include tensor shapes/access patterns, and graph-level Transformer evaluation already uses Timeloop/Accelergy.
- Minimum falsifier: no omitted model panel with a frozen conclusion endpoint was identified.
- Disposition: `EXCLUDED_BEFORE_RAW`.
