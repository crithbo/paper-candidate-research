# Investigation report — PACKROUTE-OBJECT-CLOSURE-REV1

## Conclusion

**Disposition:** `EARLY_FATAL__NATIVE_VERSION_CONSISTENT_OBJECT_DOES_NOT_EXIST`.

The stipulated object requires a native propagation chain from compressed-tensors W4A16 checkpoint metadata through vLLM to a FlashInfer B12x W4A16 preparation API. The only direct source record identifying that chain is vLLM PR [#43341](https://github.com/vllm-project/vllm/pull/43341), which GitHub records as closed rather than merged. Its own description names the absent requirements: W4A16 acceptance, `activation_precision`, `source_format`, and forwarding to `B12xMoEWrapper`. PR [#43929](https://github.com/vllm-project/vllm/pull/43929) is likewise closed/draft and documents a remaining routing/propagation defect even if the preceding acceptance work were applied. Neither can be treated as current source in the frozen vLLM commit.

FlashInfer [v0.6.13 fused-MoE source](https://raw.githubusercontent.com/flashinfer-ai/flashinfer/v0.6.13/flashinfer/fused_moe/core.py) was checked at the frozen tag only. It does not establish the B12x W4A16 configuration surface required by the question. Importing FlashInfer main, a PR branch, an environment override, or a private patch would violate the frozen object.

This closes only the native-object premise. It does not test, estimate, or infer any runtime, memory, latency, source-tensor ownership, prepared-cache retention, or backend dominance result. No Topic, raw opportunity, Stage 0 brief, model execution, build, or experiment was created.

## Provenance and bounded work

- User attachment hash verified: `211ACD9455C1210D78A8A3E458DF6242C98A314C8157FF310A30E79974E62DD0`.
- Allowed upstream handoff hash verified: `355CD97B60C51BBFCD086C8031B3B306C234EA5B4DA9108A86D3E987A70B8742`.
- Network source-request batches used: 2 of 18. No source response, model weight, repository, or artifact was persisted.
- No build/install/container/model/GPU/performance action occurred.
