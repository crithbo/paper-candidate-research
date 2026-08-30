# Source109 S3 Offline Seed Pool

All entries are non-evidence sketches created before lookup. Each records the mandatory denylist precheck.

## Metadata

- Assignment: `DISCOVERY-S3-20260824-SOURCE109-EXPLICIT-DENYLIST-ALTERNATE-RUNTIME-V1`
- Denylist: `PREDECESSOR_IDENTITY_DENYLIST.yaml`, SHA256 `1AC56E95A1859818EFB3E4DB853B1B4DF13D081F3AB7C780E381CA553A0FFB01`
- Seed count: `4/12`; generation before external lookup: `YES`.

### `S3-109-01`

- Denylist check before lookup: `RELATED_ONLY` to `POWERINFER2_KVPR_CURRENT_HETEROGENEOUS_MEMORY_ACTION`; distinct object=`llama.cpp layer-cut execution`, action=`topology-constrained contiguous layer-cut construction`, endpoint=`same-model CPU/GPU boundary full-cost decision`.
- Sketch: A versioned public model's ordered layer topology may determine a constrained contiguous CPU/GPU layer cut whose transfer and residency cost cannot be represented by generic expert/KV residency. A viable contribution requires a nontrivial construction beyond sweeping `-ngl` and a public model/trace carrier.
- Falsifier: current llama.cpp already searches or realizes the same topology-aware cut, or action reduces to layer-count tuning.

### `S3-109-02`

- Denylist check before lookup: `RELATED_ONLY` to `LLAMA_CPP_GGML_CUDA_FA_ALL_QUANTS_BUILD_OPTION_WARNING`; distinct object=`per-layer offload topology`, action=`exact inter-layer transfer accounting`, endpoint=`break-even layer-cut threshold`.
- Sketch: The transition between CPU-resident and GPU-resident adjacent layers may have an exact tensor/copy boundary whose full cost changes a deployment decision. It is admissible only if source-level semantics and a public carrier identify more than a generic CPU/GPU benchmark.
- Falsifier: source already accounts for the boundary or no decision-changing denominator can be frozen.

### `S3-109-03`

- Denylist check before lookup: `EXACT_OR_CONTAINS` for `VLLM_SGLANG_KV_PREFIX_SESSION_AND_STARTUP`.
- Sketch: Generic session/KV placement idea. Not a valid selected locator and will not be replaced in this assignment.

### `S3-109-04`

- Denylist check before lookup: `RELATED_ONLY` to `GENERIC_FIRST_VS_STEADY_OR_MLPERF_SCENARIO_REPLICATION_WITHOUT_EXACT_ARTIFACT`; distinct object=`llama.cpp offload layer-cut benchmark`, action=`topology-conditioned cost model`, endpoint=`fixed offload ranking`.
- Sketch: A public llama.cpp benchmark may omit a model topology panel that reverses a named layer-cut conclusion. This is only a benchmark route if the exact artifact, metric and held-out counter-carrier can be frozen.
- Falsifier: benchmark already includes full topology or ranking is invariant.

## Convergence

`S3-109-01` and `S3-109-02` are valid selected RQ candidates because their denylist checks are `RELATED_ONLY` with explicit discriminators. `S3-109-03` is a protocol exact repeat and is not selected. `S3-109-04` remains pre-RQ pending an exact artifact.
