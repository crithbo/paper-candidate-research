# PackRoute RQ candidate

## Primary RQ

For the exact public checkpoint and the frozen vLLM–FlashInfer versions, do two
native, same-object W4A16 MoE backends have a common legal path whose prepared
representations create a non-dominated global materialization decision?

## Fixed contract

- Public locator: `kyaky/Qwen3.6-35B-A3B-NVFP4@5a7eae35485cfafadf088012cf9687474a64f40b`.
- Stack: vLLM `0.25.1@c71a583aa9f81400528e67e3d818f66b804e8340` and
  FlashInfer `0.6.13`.
- Candidate actions, if a later topic is justified: shape-class backend choice
  plus preparation order under a peak-memory boundary.
- Excluded: external tensor manager, generic cache, source freeing alone,
  planning implementation, or any execution claim.

## RQ result

`UNRESOLVED_BACKLOG`. The anchor and model family are public, but the frozen
version pair has not yielded a source-supported common B12x/Marlin legality
route. The current B12x API found is from FlashInfer main, while the inspected
v0.6.13 core exposes a CUTLASS fused-MoE path and not the declared B12x symbols.
No object, RQ, or topic may be broadened to bridge that version mismatch.

