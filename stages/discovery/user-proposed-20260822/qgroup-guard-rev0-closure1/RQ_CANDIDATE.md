# Primary RQ — QGROUP-GUARD-REV0

For the fixed `vllm-project/vllm` `v0.26.0` W4A16 grouped-GEMV path, after all
current legality checks and the `BLOCK_K` group clamp, does a source-supported
native action remain that verifies or repairs cross-group quantization metadata
mapping across tiling/tails/fusion, with a target-specific finite guarantee not
already supplied by the current path?

## Exact object

One fixed packed GPTQ/compressed-tensors W4A16 weight matrix, `group_size=128`,
the corresponding scale/zero metadata, and the stock vLLM Triton W4A16
linear-kernel output contract.  The review is source-only and makes no claim
about a model, a checkpoint, GPU measurement, or a runtime regression.

## Competing outcomes registered before source inspection

1. `DIRECT_ABSORPTION`: the native path makes each K tile belong to one scale
   group and validates the relevant dimensions.  Then a guard/repair is not a
   distinct action.
2. `FINITE_RESIDUAL`: legal native schedules can still cross groups while
   retaining only one metadata row, and at least two native repair choices plus
   a target-specific guarantee remain.
3. `UNFROZEN`: the exact current producer/selection route cannot be pinned
   within the bounded official-source budget.

The result below is outcome 1.  This is based on source behavior, not on a
missing bug report or a missing benchmark result.
