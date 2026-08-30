# ARM MVE multi-block tail-predicated loop construction — independent confirmation

## 裁决

`CONFIRM_REVISE_ONCE`；维持条件性 `TIER_B_Q2_VIABLE`，Stage A/B 不授权。

LLVM 当前把 tail-predicated low-overhead loop 的完整后端实现限制在 single basic block；这是一个明确的实现 eligibility 条件，而不是 ARM ISA 对多块 loop 的全局不可能性证明。current union 已吸收 VCTP 转换/等价检查、VPT/VPST conversion 与 mask recomputation、DLSTP/WLSTP/LETP 选择、range/live-out validation 以及 ordinary/revert fallback。故只有同函数、两块、两个完整 native-legal plan 与 MVE 专属 future-preserving frontier 能保留 N2；PRIMARY 所列唯一 revision gate 是原子且有限的。

## 独立攻击

### 单块限制和 current union

官方 LLVM source 在 `IsTailPredicationLegal()` 中直接说明“for now”仅支持 single block；同一实现还断言 single-block/single-exit，并对 exit live-ins、VPR、Q register live-outs、VPT state、VCTP reaching definitions、指令和 branch range 进行合法性处理。[ARM low-overhead-loop source](https://llvm.org/docs/doxygen/ARMLowOverheadLoops_8cpp_source.html)

这同时给出两条结论：

1. 不得把 `ML.getNumBlocks()==1` 扩展为“无多块原生计划”的 absence 推论；它只支持当前 LLVM path 尚未构造该计划。
2. 候选不能仅移除该条件。它必须重新闭合 current code 已经承担的 VPT/VPR、VCTP reaching equivalence、false-lane/live-out、branch/range、exception 和 fallback obligations；否则改变对象/保证，或只是 emitter patch。

`MVETailPredication` 默认 enabled，并暴露 disabled、enabled-no-reductions、enabled、force-enabled-no-reductions、force-enabled 五种模式；它将 active-lane masks 转为 VCTP，最终仍由 ARM low-overhead-loop path 实现 tail-predicated LOB。[MVE tail-predication source](https://llvm.org/doxygen/MVETailPredication_8cpp.html) 因而 B0 current composition、B1 完整 flag envelope 和 B2 native VCTP/VPT/ordinary-or-revert fallback 必须同信息、同 full-cost 地组成 union。调 flag、仅使用 force mode、VPT repair 或 fallback 均不构成 residual。

### atomic gate

确认唯一 gate：

`NATIVE_TWO_BLOCK_MVE_PLAN_DIVERGENCE__FUTURE_PRESERVING_VPT_VCTP_FRONTIER_CERTIFICATE`

其一次静态 closure 必须包括：

1. 一个 pin 的公开二基本块 MVE+LOB IR/MIR 与固定 Armv8.1-M target，且两计划保留 vector result、active lanes、branches、可观察 exceptions、ABI、VPT/VCTP、loop range、live-outs 与 object semantics。
2. 两个**完整** stock-native-legal plans：一个可为 current B0/B2 fallback，另一个必须逐动作列明 VCTP identity/reaching definition、VPST/VPT masks、DLSTP/WLSTP/LETP 或合法 fallback、layout/range 和 exit/live-out处理。局部 block schedule 不算完整计划。
3. 一个 union-external Pareto point，以及同时保存所有 future native actions、legality 与 declared full cost 的状态等价。状态至少区分 VCTP reaching class、VPT mask/entry、LOB start/end form、block/edge layout-range、VPR/Q live-out、exception/branch obligations、fallback 与累计成本。
4. MVE-specific exact、FPT 或 certified-Pareto recurrence，含 parameter、cap、退化和 no-gain 边界。候选-id 的 CFG scheduling、loop restructuring、generic ILP 或 Pareto 包装全部失败；若独立 block choice 后再拼接即可获得答案，也没有 N2 残差。
5. 有限 Stage-A preclaim fidelity killer：同-MIR tiny exhaustive native oracle、verifier/assembler/object equivalence、B0/B2/flag-envelope parity 和完整 compile/RSS/code-size/pressure/LOB/fallback/runtime ledger。此要求不等同于已运行结果。

### 碰撞与结论

PRIMARY canonical manifest 的 source payload（包括四份 archived current-source blobs）已复算 8/8；current union 充分强到吸收所有 component-level claim，却没有在可读一手源码中给出 multi-block exact/FPT/certified frontier。外部直接碰撞维持 `SEARCH_BOUNDED_OPEN`，没有因检索范围或网络传输做 absence 推断。

因此没有科学 STOP 依据，亦未达 PASS：唯一允许 PRIMARY 执行该 static revision。若无法形成同对象二计划、future-preserving MVE state 或 non-generic recurrence，或者整个 frontier 已由 B0/B2 触达，则预登记 `BELOW_Q2_STOP__SINGLE_BLOCK_BOUNDARY_WITHOUT_NATIVE_TWO_PLAN_OR_TARGET_SPECIFIC_FRONTIER` 适用。不得自动第二 revision。

## 完整性与权限

- 合同 SHA-256 `4B5BD8057858AB3D3B019C4692C49F59577CBA6CA293A49899E0BB9AA7141876` 已一致。
- PRIMARY canonical manifest 8/8 PASS。
- 未执行 revision、实现、build、实验、benchmark、Stage A/B；未写共享控制或 E 盘。
- Evidence ceiling：`E1_STATIC_STAGE0_ONLY__NO_IMPLEMENTATION_NO_RESULT_CLAIM`。
