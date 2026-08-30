# Versioned native-route matrix

## Frozen identity

| Component | Frozen identity | Result |
|---|---|---|
| Runtime | vLLM `v0.25.1`, commit `c71a583aa9f81400528e67e3d818f66b804e8340` | No merged native implementation evidence for the required CT W4A16 → B12x plumbing. |
| Backend | FlashInfer `v0.6.13` | Its tagged fused-MoE source exposes CUTLASS/TRT-LLM-style paths; a B12x W4A16 wrapper/configuration surface was not established in this tag. |
| Public object | `kyaky/Qwen3.6-35B-A3B-NVFP4@5a7eae35485cfafadf088012cf9687474a64f40b` | Fixed as compressed-tensors `NVFP4/W4A16` MoE; no weights were downloaded. |

## Required checks

| Required check | Source-bound result | Disposition |
|---|---|---|
| `VLLM_QUANT_CONFIG_TO_B12X_QUANT_MODE_AND_SOURCE_FORMAT_PROPAGATION` | vLLM PR [#43341](https://github.com/vllm-project/vllm/pull/43341) explicitly describes adding `source_format`, `activation_precision`, W4A16 acceptance, and forwarding into `B12xMoEWrapper`; GitHub marks it **Closed**, not merged. | FAIL for frozen native route. |
| `FLASHINFER_V0_6_13_DEFAULT_AND_EXPLICIT_W4A16_SOURCE_FORMAT_BEHAVIOR` | Tagged [FlashInfer source](https://raw.githubusercontent.com/flashinfer-ai/flashinfer/v0.6.13/flashinfer/fused_moe/core.py) has no B12x wrapper configuration surface in the frozen `fused_moe` module; its visible routes are CUTLASS/TRT-LLM style. No v0.6.13 native evidence establishes the required `quant_mode=w4a16, source_format=compressed_tensors` route. | FAIL for frozen native route. |
| `RUN_REQUIRES_SOURCE_TENSORS_AND_PREPARED_CACHE_OWNERSHIP` | Not evaluable as a same-object property because the required native preparation entry point does not exist in the frozen pair. No ownership or retention claim is made. | NOT_REACHED_AFTER_FATAL. |
| `PUBLIC_CHECKPOINT_NATIVE_ROUTE` | The public checkpoint is fixed, but PR #43341 identifies the necessary compressed-tensors W4A16 route as its proposed plumbing, not a merged route in the frozen runtime. | FAIL. |
| `SAME_OBJECT_SECOND_LEGAL_BACKEND_EXISTS` | A legal B12x first backend is absent; therefore a two-backend same-object choice set cannot exist for the stated object. | FAIL_BY_PRIMARY_OBJECT_ABSENCE. |
| `PR_43341_AND_PR_43929_CLASSIFICATION_AS_MERGED_OR_UNMERGED_CURRENT_EVIDENCE` | [#43341](https://github.com/vllm-project/vllm/pull/43341) is Closed; [#43929](https://github.com/vllm-project/vllm/pull/43929) is a Closed draft with merge-conflict evidence. Both are unmerged proposals, not code in the frozen commit. | UNMERGED__CANNOT_BE_BORROWED. |

## Evidence limits

The conclusion uses only GitHub PR/status and tagged-source surfaces. It does not use a failed runtime, GPU availability, benchmark result, or unmeasured memory footprint as negative evidence. FlashInfer `main` APIs and fork/PR code are excluded by the frozen-version contract.
