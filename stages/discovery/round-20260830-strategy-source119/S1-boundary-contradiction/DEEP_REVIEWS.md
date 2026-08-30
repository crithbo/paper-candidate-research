# Source119 S1 Type-Specific Deep Reviews

## RQ04 — MLIR Quant rounding-to-backend boundary

- Contribution type: `COMPILER_TOOL`
- Surviving fact: quantized types preserve numerical parameters while `quant.qcast` does not prescribe concrete rounding; transform pipelines decide it.
- Strong null: backend lowering already chooses target operations after quant type flattening; adding a rounding selector is ordinary lowering policy.
- Anti-collapse result: `FAIL_NOT_ADMITTED`. No exact backend/kernel pair, fixed rounding/overflow guarantee, canonical model carrier, or non-generic action was frozen.
- Outcome: `LOCATOR_ONLY`, no brief.

## RQ08 — ExecuTorch custom-pool/per-device memory planning

- Contribution type: `COMPILER_TOOL`
- Surviving fact: per-device planning is implemented, while preassigned custom pool IDs can collide with appended device-buffer slots and are rejected.
- Strong null: namespace allocation/remapping is a generic compiler bookkeeping repair.
- Anti-collapse result: `FAIL_Q2_SHAPE`. No target-specific mechanism, natural workload decision threshold, strongest full-cost comparator, or nontrivial algorithmic residual was frozen.
- Outcome: `LOCATOR_ONLY`, no brief.

Neither review makes a novelty or scientific STOP claim.
