# Source107 S3 Research Question Cards

All locators closed before raw; no Stage 0 candidate is created.

## `S3-107-QC01` — routing-transition placement

- Object: public MoE routing sequence and target expert residency/prefetch action.
- Current locus: [Cacheable by Design?](https://arxiv.org/abs/2608.18261).
- Finding: the public study records Qwen3 routing telemetry, measures adjacent-token reuse and expert popularity, and directly evaluates locality-oriented residency/prediction.
- Disposition: `EXCLUDED_BEFORE_RAW`.

## `S3-107-QC02` — expert-batch grouped tile action

- Object: current grouped-MoE execution.
- Current locus: [SGLang expert-parallelism architecture](https://github.com/sgl-project/sglang/blob/main/docs/advanced_features/expert_parallelism.md).
- Finding: FusedMoE already composes top-k routing, dispatch, pre/post-permute, grouped GEMM, quantization and multiple runner cores.
- Disposition: `EXCLUDED_BEFORE_RAW`.

## `S3-107-QC03` — routing sequence benchmark validity

- Object: route-sensitive single-GPU MoE runtime comparison.
- Current loci: [MoE-Gen](https://arxiv.org/abs/2503.09716) and [MoE-CAP](https://proceedings.neurips.cc/paper_files/paper/2025/file/74bd547997917a20331d6df5e6049d6a-Paper-Datasets_and_Benchmarks_Track.pdf).
- Finding: existing systems/benchmarks already use module batching and route-dependent memory/cost accounting; the seed lacked a distinct omitted panel or decision endpoint.
- Disposition: `EXCLUDED_BEFORE_RAW`.
