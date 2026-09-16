# 规则变更提案：下一安全边界的多样问题证据优先试点

## 提案状态

- 提案 ID：`PROBLEM_EVIDENCE_FIRST_DIVERSE_SOURCE_V1`
- 决策：`PATCH_RECOMMENDED__ASSIGNMENT_LOCAL_NEXT_BOUNDARY`
- 生效范围：仅一个新的完整六路 Discovery assignment
- 实施权限：`MAINLINE_IMPLEMENTATION_AUTHORIZED_BY_EXISTING_CONTINUOUS_USER_AUTHORITY`
- 新 generic 用户批准：不需要
- 永久共享规则变更：需要另行用户批准
- 当前行为：proposal-only；不修改共享文件，不联系或暂停正在运行的 Discovery

## 最小 delta

### P0：raw 前机械去重与休眠

每个 locator 在计入 raw 前，以 `exact object + research question + invariant guarantee + missing/residual facet` 检查：历史 repeat/contained、活动候选、policy hold、终态 STOP、已耗 source-only closure 和三周期 dormancy。

命中者不计入 raw，也不能用别名重新进入。只有预先记录的外部 delta 可解除 dormancy；所有旧 attempt 继续累计。

### P1：把问题证据与当前工具文档拆开

卡片必须分别冻结：

- `problem_bearing_opportunity_anchor`
- `current_native_union`
- `strongest_independent_subtractor`
- `versioned_natural_carrier`
- `stock_correctness_or_semantic_oracle`

第一方功能文档默认只承担 current union 或 subtractor。测试、checker、verifier 默认只承担 oracle。若要承担 opportunity anchor 或 natural carrier，必须有独立、可版本化、可复核的问题/测量/自然对象证据。

### P2：校正 same-object 门的位置

- raw：同对象义务 + 问题证据 + 分离张力；
- D1：same-object witness skeleton + plausible residual + finite closure；
- clean brief：完整原子动作、类型适配的公平强 comparator、有界 current union/genealogy、自然 carrier、full-cost、最小 falsifier 和 fidelity plan；
- Stage 0：独立审查论文潜力、最新碰撞和 repairability。

禁止在 D1 前一律要求两套完整 native plans、完整输出或已实现机制；也禁止把不完整对象、降保证或无有限路线包装成 same-object。

### P3：单周期容量与六路题源

固定容量：每路 locator≤8、fresh raw≤6；全局 raw≤36、deep≤12；深审上限 `S1=1/S2=2/S3=2/S4=3/S5=2/S6=2`。每条 deep 必须事先为 D1；未使用容量作废，不跨路、按结果或为补数回填。

六路 primary-origin 配置：

- S1：GPU/NPU 跨层语义契约、LLVM 单一生态外的跨版本语义、ABI/conformance 和复制失败；
- S2：数据移动/互连/host-device full-cost、编译器—运行时—架构瓶颈、带公开模型的 NDP/PIM/加速器协同；
- S3：先选自然语料/trace/release history，再找机制；包含 GPU/NPU workload/operator/shape/phase 和跨平台演化；
- S4：由已有 empirical evidence/benchmark log 锚定的测量有效性、覆盖、排名稳定、复制负面和 GPU/NPU full-cost 刻画；保留独立 measurement/benchmark 入口；
- S5：target-specific 理论/形式问题、架构协同/近似、非编译器 online/recourse；排除 generic formal wrappers 和 paper-owned complete constructors；
- S6：公开 artifact 锚定的 GPU/NPU 直接算法、架构数据移动/放置、编译器后端外的算法/数据结构/系统原则、带 checker 的理论构造；排除 generic scheduling/layout/packing/solver wrappers 和 paper-owned complete constructors。

本试点中，成熟 LLVM/MLIR/OpenXLA/TensorRT/OpenVINO/CUTLASS/current profiler 表面主要用于减法与比较。S1/S2/S5/S6 每路 primary-origin 最多 1 个；S3/S4 必须 carrier/problem-first。新外部 delta 仍可进入。

### P4：一次 carry-forward 与三周期 dormancy

首次 unfrozen 允许一次预登记 source-only closure；同 facet 再次缺失后休眠三个完整六路周期。提前重入只接受：新官方动作变化、新独立论文/artifact、新公开 carrier/oracle/checker，或明确题目级授权。终态 STOP 不得重入。

## 不变项

以下均不改变：Q2 最低线、same-object、current collision、强公平基线、自然证据、full-cost、复现性、证据诚实与 claim ceiling；Stage 0 独立审查；零 brief 合法；不设提案配额；六个长期 lane 和并行上限不变；`DISCOVERY_CLAIM_PACK_MODE=OFF`；不运行 Stage、实验、下载或自动化。

## 单周期验收

1. 已知 repeat/active/hold/STOP/dormant raw 接纳数为 0；
2. 100% deep 行在结果前已记录 D1；
3. raw、unique、D1、deep、brief 和 disposition 全部对账；
4. 五类证据字段没有用同一文本机械复写，carrier 与 oracle 分离；
5. mature-tool primary-origin 上限满足；
6. 没有 outcome-aware backfill；
7. 记录 brief 数及 Stage 0 独立 repair vector，但不以正产出作为强制通过条件。

Source16 的 7/12 late structural drop、5/12 unfrozen 和至少 10/36 repeat/contained 只作方向性基线，不能转化为降低硬门或必须改善的录取 KPI。

## 停止与回滚

试点只运行一个完整六路周期。出现 raw 严重枯竭、外部证据闭合成本超出普通 Discovery、成熟工具新变化被明显误抑制、账目不可对齐，或后续 Stage 0 repairability 没有改善时，主线在下一安全边界移除该 assignment-local profile；保留所有报告、dormancy ledger 和原科学状态。

再次零 brief 时不自动复制本策略、不扩大容量、不启用 V9，改由主线选择下一次有界诊断。回滚不会复活 STOP、重置 closure 次数或删除负证据。

## 风险与预期收益

预期收益是提高进入深审对象的独立问题证据、自然 carrier 与 source-closure 完整度，减少在成熟 current union 内反复寻找浅变体。风险是 raw 数量下降、问题证据检索较慢和短期错过某些成熟工具的新变化；所有风险均由单周期、固定容量、外部 delta 重入和可逆回滚限制。

