# QREFINE-TRITON-W4A16 — independent Stage0 confirmation

- Assignment: `STAGE0-C1-20260821-USER-QREFINE-PATCHYIELD-CONFIRMATION`
- Lane: `STAGE0-CONFIRMATION-SENTRY-D`
- Decision: `CONFIRM`
- Confirmed PRIMARY decision: `PASS_RECOMMENDED`
- Confirmed quality tier: `TIER_B_Q2_VIABLE`
- Evidence ceiling: `E1_STATIC_PREFLIGHT__NO_PROOF_NO_BUG_NO_PERFORMANCE_RESULT`
- StageA/B authorized: `false / false`

## 决定性复核

### 1. Exact object 与同对象可复现性

冻结对象足够窄且没有跨层偷换：`w4a16_decode_gemv_m1_g128_uint4b8_fp16`、Triton
`f797708c...`、sm89/gfx1100、每个 target 独立验证、输入为 `make_llir` pass 后且
`llvm.to_module` 前的 LLVM-dialect MLIR。冻结 NVIDIA/AMD source 分别在
`pm.run(..., 'make_llir')` 后调用 `llvm.to_module`；current main 仍保留该相邻边界。

这证明了 object locus，不等于已经证明 observer fidelity。Stage A 首门仍须证明只读
capture/serialization 不改变 module、pipeline option、target attributes 或随后 conversion，
并以 round-trip/operation inventory 拒绝 scope inflation。该缺口有限，且不是 Stage0
same-object failure。

### 2. Current strongest union 与直接碰撞

独立核验补入三个 PRIMARY 未充分展开的强 subtractor：

1. current Triton `FpSan` 支持 mixed integer/float structural checking，但官方明确说它不是
   IEEE simulator，不保留 rounding、NaN、subnormal 或 fused-rounding；在 AMD 上列明的
   supported architectures 也不含 gfx1100。因此它是 native baseline，不覆盖冻结 exact
   mixed BV/IEEE relation。
2. *Verified Lifting of Deep Learning Operators* 对真实 Triton operators 做 symbolic
   execution、SyGuS 和 SMT verified lifting；其 endpoint 是从 low-level implementation
   恢复/验证高层公式，不是对两个 target 的 pre-`llvm.to_module` lowering instance 做
   exact relation validation。
3. 2026 Triton pointer-safety verifier RFC 仅覆盖 pointer/OOB safety，不能吸收 packing、
   group-scale、reduction tree 与 IEEE trace。

Wang et al. 2022 的 MLIR translation validation 仍是最强方法学 comparator；其 FP
abstract encoding与 target-independent dialect boundary不等同于冻结 exact target-local
trace。未发现满足八谓词的 direct fatal；结论保持 `SEARCH_BOUNDED_OPEN`，不作全领域
absence 推论。

### 3. 非 generic residual 与质量档

残差不是“给任意 MLIR 调 SMT solver”，而是固定 packed W4A16 trace 上联合建模 nibble
选择、地址/mask/group-scale、target-local lowering、固定 reduction tree 与 IEEE
conversion/FMA/rounding policy，并对两个独立 target 各自给局部 counterexample。若 Stage A
仅剩 generic symbolic execution、pointer checker、FpSan payload equality 或 scalar-only
grammar，PRIMARY 的 killer 会机械停止该机制。

单一 operator family 与 E1 ceiling 不支持 Q1；但若 12-mutant、composition、native
comparison 和 full-cost gate 成立，形成窄而完整的 compiler-validation Q2 论文形状是可信的。
因此确认 `TIER_B_Q2_VIABLE`，不抬升至 Tier A。

### 4. AI 路线与有限 killer

capture、operation inventory、semantics encoding、SMT obligation、mutant localization、
proof/cost ledger 均是有限且可审计的 AI-core 路线。首个 Stage A preclaim gate应同时纳入
native verifier/tests、FpSan、Wang-style MLIR-TV 与 verified-lifting comparator。少于 10/12
mutants 被拒、任一核心 packing/index mutant不能定位、semantic-critical op不能建模/拒绝、
组合无界或仅余 scalar schedule，均维持为有效 killer。

## Provenance judgment

PRIMARY 首次 source call 的 pre-call ledger 漏记是机械缺陷，但 frozen/current source
具有 content hash、commit 与独立 official-source corroboration，且只用于正向 boundary
事实；没有支持 absence claim。因此不是 `PROVENANCE_FAIL`。

## Confirmation conclusion

`CONFIRM`。确认 PRIMARY 的 `PASS_RECOMMENDED / TIER_B_Q2_VIABLE`；只允许主线决定后续
状态，当前不授权 Stage A/B。
