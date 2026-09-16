# Source32–33 连续零 clean brief 审计

## 结论

连续两轮零 brief 是两类瓶颈叠加，不是科学门本身过高：

1. **首要瓶颈是 source entry/locator→raw。** 12 个 lane-cycle 中 9 个 raw=0；成熟工具表面、通用 wrapper/solver、当前 union 组合和公开资料未闭合仍占主要损失。
2. **次要但已经可见的瓶颈是 non-product 检查的阻塞方式。** Source32–33 保留的 3 个 joint raw 全部没有变成 brief；SystemZ 后续证明暂缓有价值，但 RVV 与 NVPTX 都停在 bounded unresolved，尚无正向 survivor，因此继续把 `UNRESOLVED_BOUNDED` 当作 canonical veto 会形成长期运营性假阴性风险。

这不支持删除 non-product 分析，也不支持放宽 same-object、direct fatal、current union、full-cost 或 Q2。唯一建议是：**Source34 保持现行 base-RQ，不受本审计影响；从 Source35 开始只做一轮 `NON_PRODUCT_COUPLING_SHADOW_AFTER_CANONICAL_COMMIT_V1`，停止它作为 Discovery 的额外阻塞门。**

## 为什么不能原样继续

R31 允许 Source33 再跑一轮，是为了获得第二个前瞻样本。现在样本已经到达：

- SystemZ：检查指向了正确的结构性问题，独立闭合确认其为固定输入与 current-union/generic product；这是精度收益。
- RVV：存在真实的 RA→vsetvli action skeleton，但两计划与 union 外残差未冻结；仍是可恢复债务。
- NVPTX tcgen05：allocation handle 与 copy/barrier state 有合理依赖，但 native producer union、合法两计划和 target-specific guarantee 未闭合；仍是可恢复债务。
- NVPTX shared-symbol control：擦除 target spelling 后退化为 generic CSE/address folding，健康结构淘汰。

也就是说，该检查已有两个负向/控制信号，却没有一个正向 survivor。继续原样阻塞会重复生成“raw debt 仓库”，而不是回答它是否误挡本应由 Stage0 终裁的候选。

## 为什么不能直接撤销

SystemZ 与 shared-symbol control 证明 factorization/state-erasure 对“target state × generic allocation/placement”假联合确实有效。完全撤销会丢失这个廉价诊断，也会让最近已经观察到的 S6 假联合重新进入完整 Stage0。

## 为什么应进入 shadow

Shadow 可以在不改变 base v8.7/RQ 录取路径的前提下获得缺失的反事实：若不让 non-product note 阻塞，哪些候选本来会形成 brief，它们进入独立 Stage0 后究竟是结构吸收还是保留 Q2 形状。

现行 RQ Production 已允许完整 current union、完整小 witness 和工程细节作为有界 closure debt，但仍要求 exact object、一个 current-source locus、最小 falsifier、full-cost 初界和有限闭合路线。将 non-product note 变为 shadow 是恢复这个阶段分工，不是放松科学硬门。

## Source35 唯一建议

运行一个完整六路周期的 `BASE_RQ_CANONICAL_PLUS_NON_PRODUCT_SHADOW_AFTER_COMMIT_V1`：

1. lane 先按 v8.7 + RQ Production 完成 canonical base 决策，并把 family identity、raw/brief disposition、决定性硬门与 closure debt 写入不可变 `CANONICAL_BASE_DECISION.yaml`。
2. base 决策提交并哈希后，才对适用的 joint/composed raw 生成原样 non-product note；结果写入 `SHADOW_NON_PRODUCT_NOTE.md`，不得反向改变 base 决策、题源选择或分母。
3. 若 base 已形成 clean brief，且没有 direct fatal/current-union absorption，`UNRESOLVED_BOUNDED` 只作为 Stage0 的显式原子问题随 brief 交接，不能 veto。
4. 若 source 已证明 factor independence、generic product 或 current-union absorption，则仍由原有 canonical 硬门结构性淘汰；shadow 不救回它。
5. 不设 brief/raw 配额，不补位，不重筛旧身份，不根据 shadow 或 Stage0 结果更换 source。

该轮只回答一个问题：non-product 检查作为额外 veto 是否改善 Stage0 精度，还是提前损失召回。它不试图同时解决 S1–S5 的 source-entry 低产出。

## 判定指标

不设置最低 brief 数。必须报告：

- base raw 与 clean brief 数；
- shadow 适用数、would-pass、would-hold、would-drop；
- base 与 shadow 的逐 family discordance；
- 后续 Stage0 对 shadow-flagged brief 的独立结论（若产生）；
- unresolved debt 是否保持非终态、是否有明确恢复入口。

解释规则：

- base brief 被 shadow 标为 hold，但 Stage0 保留条件性 Q2/PASS：出现 active-check 假阴性风险；
- base brief 被 shadow 标为 hold/drop，Stage0 因 generic product/current union STOP：出现精度收益；
- base 仍为零 brief：首要瓶颈确认在 source entry，non-product active gate 不应恢复，下一审计应转向题源/locator closure；
- 一轮无可识别 discordance：停止继续叠加该检查，不得自动永久化。

## Source34 与现有题目

Source34 是已经准备中的 base-RQ 周期。本审计不暂停、不修改也不联系它；它自然提供不带 active non-product veto 的基线。SystemZ 维持结构 DROP，RVV 与 NVPTX tcgen05 维持 bounded unresolved；不得作为 Source35 fresh raw 回填。当前 Stage0 无 brief 积压，所以没有必要为本策略增加审查并行数。

## 风险与控制

- 风险：把 shadow 误写成“放宽门”。控制：direct fatal、same-object、current union、强基线、自然/canonical、full-cost、falsifier、可复现性和 Q2 全部仍由 base canonical 决策执行。
- 风险：同一 lane 在看到 shadow 后修改 base。控制：base 文件先提交、哈希，再生成 shadow；任何回写 fail closed 为该 family 的 shadow 无效，但不重跑或补位。
- 风险：Stage0 被低质量题淹没。控制：只有 base 规则独立形成 clean brief 才送审；shadow 不新增候选。当前 Stage0 有剩余容量。
- 风险：对一个正/负样本过拟合。控制：仅一轮 prospective shadow，不写共享规则，不据此宣称统计校准。

## 授权判断

`USER_POLICY_APPROVAL_REQUIRED=false`。Source35 的一轮 assignment-local shadow 不改变共享规则、科学硬门、容量或生产方法，属于 `USER_ADAPTIVE_DISCOVERY_CONTINUE_UNTIL_FIVE_STAGEA_PASS_20260814` 覆盖的自适应流程诊断。主线可在 Source34 完成后的安全 assignment 边界实施。

本包不授权：修改共享文件、当前 Source34 改道、运行 NVPTX closure、启动任何 Stage/实验、V9、增加 lane/容量，或把 shadow 永久化。永久 shared patch 仍需新的独立证据与用户审查。
