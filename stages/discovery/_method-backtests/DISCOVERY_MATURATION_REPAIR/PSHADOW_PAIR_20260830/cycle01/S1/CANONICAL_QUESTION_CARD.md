# S1-CARD-01

## Identity

- Exact public identity: `microsoft/T-MAC`, `main`; README and `python/t_mac/ops/qgemm.py`.
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY`.
- Exact object: current T-MAC LUT mixed-precision GEMM code generation.
- Claim endpoint considered: target-native execution action.

## Raw-gate result

- Same-object action/estimand: `INCOMPLETE`.
- Current-source locus: `QGeMMLUTBitsCodegen` exposes LUT group, weight group, activation group, SIMD, aggregation, fast-aggregation, and zero-point controls.
- Non-generic discriminator: `NOT_FROZEN`.
- Minimum falsifier / finite closure route: `NOT_FROZEN` because no action exists beyond the current parameter surface.
- Initial full-cost boundary: `NOT_FROZEN`.
- Disposition: `LOCATOR_ONLY`.
- Plain-Chinese reason: 当前官方实现已经把候选描述中的 LUT 分组、激活分块和多项 tiling/聚合控制暴露为参数；本轮没有冻结这些参数之外、同量化且非调参的原子动作。因此不能进入 raw，也不形成 direct-fatal 或科学 STOP。
- Eligible for C0: `NO`.
