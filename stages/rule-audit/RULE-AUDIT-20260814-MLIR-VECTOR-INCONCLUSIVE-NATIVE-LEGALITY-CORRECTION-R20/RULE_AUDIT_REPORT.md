# Rule Audit Report — MLIR Vector exceptional native-legality correction

## 中文摘要

- `audit_id`: `RULE-AUDIT-20260814-MLIR-VECTOR-INCONCLUSIVE-NATIVE-LEGALITY-CORRECTION-R20`
- 结论：`USER_POLICY_DECISION_REQUIRED__RECOMMEND_ONE_BOUNDED_EXCEPTIONAL_STATIC_NATIVE_LEGALITY_CORRECTION`
- 推荐批准一次题目级例外静态修正。现有材料允许在不换 target、pipeline、外部函数签名、机制和动作集合的前提下，构造一个封闭的原生合法 `N/M/F` witness：三条路径只使用原合同已有的 `vector.shape_cast` 与 `vector.interleave`，且每个 interleave 都只把 trailing dimension 加倍。
- 这不是无行为变化的排版勘误。新路径改变了 witness 内部的 typed action sequence、cast obligations 与成本账本，因此必须重建 legality、value-order、action/path、frontier/cost 和 claim delta，并接受新的独立 closing。
- 若机械核验发现必须改变外部签名、target/pipeline、操作族、动作集合、cost model 或 `AVX2-Representation-Frontier-DP` 机制，R20A 必须 fail closed；此时建议用户选择可逆人工研究储备或撤回，而不是伪造第三轮修订。
- 共享文件修改：`false`。

## Identity and scope

- 对象：`MLIR-VECTOR-REPRESENTATION-REGISTER-PRESSURE-PARETO-DP`
- 当前状态：`INCONCLUSIVE_POLICY_HOLD__INTERLEAVE_WITNESS_NOT_NATIVE_LEGAL`
- 普通 revision：`1/1 consumed`
- 现有 atomic gate：`PINNED_MLIR_REPRESENTATION_ACTIONS__VPLAN_SEPARATED_BOUNDED_FRONTIER_CERTIFICATE`
- 审计证据 ceiling：`STATIC_EXISTING_ARTIFACT_REVIEW_ONLY__NO_NEW_SCIENTIFIC_EXECUTION`
- 已读最小证据：PRIMARY、独立 confirmation、revision1、独立 closing 及四份 assignment/handoff/manifest。
- 范围外：候选修订执行、源码获取、编译、verifier run、实验、Stage A/B、状态修改、共享文件修改、联系任何候选或 Stage lane。

## 现行规则是否正确工作

`AGENTS.md` 与 `rules/ROLE_STAGE0_REVIEW.md` 要求：普通 `REVISE_ONCE` 耗尽后，若独立 closing 发现 gate-bearing 构造无效、又没有科学 STOP 证据，必须进入 `INCONCLUSIVE_POLICY_HOLD`；只有用户批准题目、原子门、次数、证据 ceiling 和唯一写目录均冻结的 exceptional assignment 后才能继续，且修正后必须交由未参与构造的 reviewer 独立 closing。

本题 closing 正确执行了该规则。非法 witness 不能支持 PASS；与此同时，没有证据证明一个合法 mixed-cut planner 已被 current union 吸收或结构上不可能，所以也不能科学 STOP。这里不需要全局规则 patch，只需要用户决定是否给予一次严格限域的题目级例外。

## 已冻结失败与仍存的结构机会

| 观察 | 来源 | 审计含义 |
|---|---|---|
| revision1 写成 `vector<2x1x4xf32> -> vector<2x2x4xf32>` 的 interleave | revision1 report | 违反 native `vector.interleave` trailing-dimension doubling 规则 |
| 给定输入的直接 native result 应为 `vector<2x1x8xf32>` | independent closing | 旧 `P_N/P_M/P_F` 不共享一个合法 same-function base |
| `VectorLinearize` 已吸收 whole-graph full flattening `F` | revision1/closing | `F` 是强 subtractor，不是候选创新 |
| 没有发现 whole-graph partial-`M` selector | closing | 合法 `M` residual 尚未被 direct absorption 否定；仍为 `SEARCH_BOUNDED_OPEN` |
| VPlan 负责下游 VF/UF/register budget，不负责此 loopless pre-conversion representation cut | PRIMARY/confirmation/closing | 机制分界仍存在，但不能替代 native-legality 证书 |
| DP 状态与 bijection 依赖 catalog 中每个 typed action 合法 | closing | witness 修正必须传播到 `O/Q/H/C` 与 action/path certificate，不能只改一行类型 |

## 最小同对象合法 witness

### 保持不变的外部对象

```text
target/pipeline: llvm-project ba5bccfe...; x86_64-unknown-linux-gnu +avx2; SysV;
                 unchanged Vector-to-LLVM then LLVM pipeline
function signature:
  (%a: vector<2x1x4xf32>, %b: vector<2x1x4xf32>)
    -> vector<2x2x4xf32>
observable contract:
  two ordered 8xf32 inputs -> one ordered 16xf32 result;
  no mask, memory effect, fast-math relaxation, ABI or value change
```

直接把 result 改为 `2x1x8` 会改变外部 result type；直接把两个 inputs 改为 `2x2x2` 会改变外部 input types。两者都不是最小 same-object 修正。更安全的方式是保持外部签名不变，只在三条 plan 内使用原 action catalog 已包含的 equal-product `vector.shape_cast`。

### 封闭 typed plan table

| Plan | Operand representation | Native interleave | Boundary result | 已有动作 |
|---|---|---|---|---|
| `P_N` | each `2x1x4 -> 2x2x2` | `2x2x2 + 2x2x2 -> 2x2x4` | return `2x2x4` | shape-cast + interleave |
| `P_M` | each `2x1x4 -> 2x4` | `2x4 + 2x4 -> 2x8` | `2x8 -> 2x2x4` | shape-cast + interleave |
| `P_F` | each `2x1x4 -> 8` | `8 + 8 -> 16` | `16 -> 2x2x4` | shape-cast + interleave |

每条 interleave 都只将末维分别从 `2→4`、`4→8`、`8→16`。所有 shape casts 都保持 element product、fixed/non-scalable `f32`、row-major linear order 和外部签名。三条计划必须用相同的逐元素 index oracle 证明输出顺序完全一致；旧非法操作没有语义，修正包不得宣称“继承了非法操作的语义”，只能证明三条新 native plans 实现同一个冻结的显式 value-order contract。

该 table 是 R20A 允许测试的唯一 witness family。若它需要未列出的 operation、custom emitter/reader、target-specific escape hatch 或 semantic precondition，就不再是最小修正。

## 为什么值得批准一次例外

1. 外部 exact object 可以保持：target、pipeline、function signature、element type/product、ABI 和 observable ordered-value contract 都不变。
2. 原动作集合已经包含 `vector.shape_cast`、`vector.interleave`、nested/mixed/flat representation；新 table 没有引入新 operation family。
3. 机制仍是同一个 `AVX2-Representation-Frontier-DP`，仍只选择 representation/cast boundaries，不碰 VF/UF、pass order、physical RA 或新 cost weights。
4. 问题完全是静态、有限、可机械攻击的 typed legality 与证书传播；AI 可承担主要核验工作，不符合“必须由人完成”的默认 reserve 条件。
5. 当前没有 direct absorption 或科学不可能证据。直接撤回会有假阴性机会成本。

但批准只意味着允许构造和复核，不预判它能 PASS。尤其是加入显式 input casts 后，`M` 可能在原 declared cost vector 上被 `N/F` 支配，或者 stock option union 可能已经构造/认证同一 action。任一结果都必须如实进入 independent closing。

## A/B/C/D 决策矩阵

| 方案 | 同对象/诚信 | 信息增益与成本 | 建议 |
|---|---|---|---|
| A. 上述封闭 N/M/F table 的一次 exceptional static correction + independent closing | 可保持；旧证据不覆写 | 高信息、低成本、纯静态 | **推荐** |
| B. 直接把 output 改 `2x1x8` 或 inputs 改 `2x2x2` | 改外部 type/ABI object | 虽简单但破坏 frozen same-object | 禁止作为 R20A |
| C. 改 operation、target、pipeline、动作集合或 cost model 找另一个 witness | 形成新机制/对象或新的 scientific revision | 范围不可控 | 禁止；若有价值应新 ID/新审查 |
| D. 可逆 reserve / 用户撤回 | 不产生伪科学结论 | 保留未来人工重构或停止投入 | A 不获批或 fail closed 后的用户选项；不得自动执行 |

## Exceptional correction 的最小权限

### 构造 lane 仅可做

1. 在全新目录中冻结上述 external signature、value-order oracle 和三条 typed plans。
2. 逐 action 从已冻结 commit 的 native op/type contract 与 stock lowerer 静态证明：shape cast product/scalability/order 合法，interleave trailing dimension 合法，所有计划有 stock-builder/lowering path。
3. 用 index-level bijection 证明 `P_N/P_M/P_F` 输出逐元素一致，不使用 custom emitter 或代理语义。
4. 重建受影响的 typed action catalog、`O/Q/H/C`、action-to-path/path-to-action、cast/IR/target-width cost ledger、frontier membership 和 claim matrix；cost dimensions/weights 不得新增或调参。
5. 给出 revision1→exceptional 的逐项 delta；revision1 与 closing 原件、哈希和失败结论保持不变。

### 构造 lane 不得做

- 改 commit、target、features、ABI、external signature、source value-order contract、pipeline、operation family、action set、cost model 或 solver mechanism。
- 添加 mask/memory/dynamic/scalable/fast-math/reduction/contraction、VF/UF、pass ordering、physical RA/spill claim、generic ILP/Pareto wrapper 或新 witness family。
- 实现、build、verifier run、benchmark、实验、下载、联网检索、Stage A/B。
- 将缺 compile/output 当失败，或将 static correction 当性能证据。

## 独立 closing 要求

- closing owner 必须是未参与 R20A 构造的长期 Stage 0 reviewer。
- 必须从 native contracts 独立重建每条 type equation，不接受 owner 自报：
  - `2x2x2 -> 2x2x4`
  - `2x4 -> 2x8`
  - `8 -> 16`
- 必须逐项复核 equal-product shape casts、fixed-vector lowerability、row-order/index oracle、外部 signature/ABI 不变。
- 必须确认 `P_F` 仍被 VectorLinearize 吸收，`P_M` 是否仍为 union-external selector action，以及完整 configuration/VPlan union 是否复制或支配它。
- 必须复核新 casts 已完整进入 `Q/H/C`、frontier 与 full-cost bridge；不能沿用旧 action/path 或成本结论。
- `CONFIRM_STAGE0_PASS` 只有在整个原 atomic gate 闭合、且 `M` 在未调参的 declared frontier 上仍有真实 residual 时才允许。
- 若要闭合必须改变外部对象、动作集合、机制或 cost model，closing 必须输出 `EXCEPTIONAL_SCOPE_VIOLATION__NO_PASS`，回到 policy hold；不得设计另一个 witness。
- 若合法重建产生 direct absorption、所有合法 `M` 被公平 union 支配、或形式 bijection 失败，可据真实科学负证据作 STOP；否则未闭合只回 hold。

## 证据上限、验收与停止条件

- 修正 evidence ceiling：`STATIC_NATIVE_LEGALITY_VALUE_ORDER_AND_REBUILT_FRONTIER_CERTIFICATE__NO_BUILD_NO_PERFORMANCE_CLAIM`
- 验收要求：两个新目录各自 strict manifest 通过；旧 revision/closing hashes 不变；三条 typed plans 和 value oracle 逐项闭合；无范围漂移；独立 closer 未参与构造。
- 一次失败后的停止条件：R20A `1/1` 一旦构造或 closing 不通过，不得自动再给 exceptional correction。保持 `INCONCLUSIVE_POLICY_HOLD__EXCEPTIONAL_NATIVE_LEGALITY_CORRECTION_UNCLOSED`，由用户选择 reserve、撤回或以新对象/新 ID 重新研究。
- rollback：封存新 assignment-local artifacts，恢复/保持当前 hold；不删除、不覆写旧证据。

## 输入 provenance 的机械前置问题

当前 closing manifest `CCA293B1...48FAFA` 绑定的 on-disk `handoff.yaml` SHA-256 是：

`175F9ACE249F4C166EEF598D6641BA144AD0EB0D02F92911A0E5DCDEA3A5D362`

但本次读取的 `registry.yaml` 记录为：

`175F9ACEFD0060058A6647680337103739B4406CCF32AA4A941A7F3DB0F4D362`

两者不一致。manifest 与实际文件相互一致，科学内容不因此改变，但主线在建立 R20A assignment 前必须 fail closed 地核对并登记正确 provenance，或在 assignment 中显式记录 mismatch 与所采用的 manifest-bound bytes；本审计不修改 registry。该机械修复不等于批准 scientific exception。

## 精确用户授权措辞

> 批准 `MLIR-VECTOR-EXCEPTIONAL-STATIC-NATIVE-LEGALITY-CORRECTION-20260814-R20A`。在主线先机械核对并冻结 revision1-closing manifest 所绑定的实际 handoff 哈希、解决 registry 中 closing-handoff 哈希不一致后，仅允许为题目 `MLIR-VECTOR-REPRESENTATION-REGISTER-PRESSURE-PARETO-DP` 建立一次且仅一次 `EXCEPTIONAL_STATIC_NATIVE_LEGALITY_CORRECTION 1/1`。构造 lane 只能写入 `<LEGACY_LOCAL_PROJECT_ROOT>\stages\stage0\_revisions\MLIR-VECTOR-REPRESENTATION-REGISTER-PRESSURE-PARETO-DP\exceptional-static-native-legality-r20a\`，并必须保持 llvm-project commit `ba5bccfe01368f76e74d6ff4c35f1330e155b4ba`、`x86_64-unknown-linux-gnu +avx2`、SysV、既有 Vector-to-LLVM/LLVM pipeline、外部函数签名 `vector<2x1x4xf32>, vector<2x1x4xf32> -> vector<2x2x4xf32>`、ordered-16-f32 observable contract、`AVX2-Representation-Frontier-DP` 机制、既有 action set、cost dimensions/weights、current union 与所有科学硬门不变。唯一允许的 witness 是：`P_N` 将两个 operands 各以既有 `vector.shape_cast` 从 `2x1x4` 变为 `2x2x2` 后执行 native `vector.interleave 2x2x2 -> 2x2x4`；`P_M` 将 operands 各变为 `2x4` 后执行 `2x4 -> 2x8` 并 shape-cast result 为 `2x2x4`；`P_F` 将 operands 各变为 `8` 后执行 `8 -> 16` 并 shape-cast result 为 `2x2x4`。修正包必须从 pinned native contracts 重建三条路径的 type legality、逐元素 value-order equivalence、stock lowerability、typed action catalog、`O/Q/H/C`、action/path bijection、未调参的 cost/frontier certificate 与完整 old→new claim delta；不得覆写 revision1 或原 closing。完成后必须由未参与构造的独立 Stage 0 closing lane 仅写入 `<LEGACY_LOCAL_PROJECT_ROOT>\stages\stage0\_reviews\round-20260814-mlir-vector-exceptional-native-legality-r20a-closing\MLIR-VECTOR-REPRESENTATION-REGISTER-PRESSURE-PARETO-DP\`，独立复核 native trailing-dimension rule、所有 shape-cast 与 value-order、stock/current union、VPlan separation、frontier membership 和整个原子 gate。证据上限固定为 `STATIC_NATIVE_LEGALITY_VALUE_ORDER_AND_REBUILT_FRONTIER_CERTIFICATE__NO_BUILD_NO_PERFORMANCE_CLAIM`。本授权不允许改变 target/pipeline/external signature/observable contract、增加 operation/action/cost model、换机制或 witness family，也不允许实现、build、verifier run、实验、下载、联网、Stage A/B 或第二次 exceptional correction。若任何闭合需要上述范围变化，必须 fail closed 为 `INCONCLUSIVE_POLICY_HOLD__EXCEPTIONAL_NATIVE_LEGALITY_CORRECTION_UNCLOSED`；不得自动 reserve、撤回或 STOP。只有独立 closing 获得真实 direct absorption、非法性、全 union 支配或形式反证时才可科学 STOP；否则由用户另行选择 `HUMAN_RESEARCH_RESERVE__USER_DIRECTED_POLICY_HOLD__NO_SCIENTIFIC_STOP` 或可逆撤回。主线仅可按 single-writer 登记本 assignment 与独立 closing 的实际结果。

## Mainline handoff

- 用户对 R20A 的精确授权：`NOT_YET_PRESENT`
- 建议标签：`USER_POLICY_DECISION_REQUIRED`
- 全局规则 patch：`NO`
- 回测/影子运行：`NO`；这是题目级静态例外，不是方法规则变更。
- 共享状态：授权与独立 closing 前保持当前 hold。
- shared files modified：`false`

