# Rule Audit Report

## 中文摘要

- 发现的问题：Source34/35 的 85 个 seed 只形成 19 个 RQ，且 raw 前全部归零。最明显的可修复原因不是二区门太高，而是部分 lane 把 Question Card/current-source/full-cost 等要求提前到了 RQ 形成之前；同时六路实际题源长期集中于成熟 API、配置、selector、allocation 和通用 lowering，测量/刻画、benchmark、形式与独立算法入口失衡。
- 对推进速度或研究质量的影响：这会在真正的 same-object/current-union/Q2 审查之前压掉可回答的问题表达，并把“同平台/同谱系”误当“同 exact identity”。另一方面，已形成的若干 RQ 确实被当前 union 或 generic product 健康淘汰，不能靠放宽硬门挽救。
- 建议修改：Source36 不动；Source37 只运行一轮 `SOURCE37_STAGE_SEPARATED_IDENTITY_AND_TYPE_ROUTING_V1`。它严格区分 seed→RQ→raw 的信息要求，用可审计 identity/STOP-containment certificate 代替宽泛冷却，按贡献类型选择 Question Card 路线，并让六路题源各自覆盖不同入口。Source35 的 non-product shadow 到此关闭。
- 是否需要用户批准：不需要新的政策批准。该方案是现有生产规则和用户持续 Discovery 授权下的 assignment-local 执行澄清；仍只能由主线在 Source37 安全边界写入 assignment，规则审计不自行生效。

## Identity

- `audit_id`: `RULE-AUDIT-20260815-SOURCE34-35-CONSECUTIVE-ZERO-BRIEF-R33`
- `trigger`: Source34 与 Source35 连续两个完整六路周期均为零 clean brief
- `requested_by`: `MAINLINE / USER_CONTINUOUS_ADAPTIVE_DISCOVERY_AUTHORITY`
- `date`: `2026-08-15`
- `write_directory`: `D:\project\writing\reserch\stages\rule-audit\RULE-AUDIT-20260815-SOURCE34-35-CONSECUTIVE-ZERO-BRIEF-R33\`
- `shared_files_modified: false`

## Question and scope

- User/process question: raw 前归零究竟来自冷却过宽、identity/family 混淆、RQ/Question Card 入口过重还是题源角色失衡；Source37 以后应采取哪一个安全方案。
- Rules inspected: `AGENTS.md`、`ROLE_RULE_AUDIT.md`、`ROLE_DISCOVERY.md`、Discovery RQ/Question Card 模板及资源本地化协议。
- Candidate examples inspected: Source34 六路 handoff；Source35 六路 canonical base、shadow 与 handoff；R32；NVPTX tcgen05 bounded-unresolved note。
- Out of scope: Source36 的运行、任何共享规则写入、候选状态转换、Discovery/Stage/实验/下载/V9 执行。

## Current authoritative behavior

`rules/ROLE_DISCOVERY.md` 已规定：

1. seed 层只允许基于 exact identity、终态身份、字面重复、定义性换对象/降保证或 generic shell 作前置排除；未知 evidence/current union 不是 seed 排除理由；
2. 被选 seed 在定向证据检索前先形成 2–3 个同对象 RQ 版本；FINER-lite 只作可回答性、重要性和调度；
3. raw 层才冻结 exact identity、same-object estimand、endpoint、反事实后果、非通用判别、一个 current-source locus、最低 falsifier、有限闭合路线和 full-cost 初界；
4. 完整 current union、最强 subtractor、完整小 witness、实现接口、主结果和最终 Q1/Q2 判断均可作为 bounded closure debt；
5. 测量/benchmark、理论/formal 与算法/系统/编译器有不同的合法论文结构入口。

书面规则并没有要求在 RQ 形成前关闭上述证据字段，也没有把共享 carrier、tool、ISA 或论文谱系自动等同于 exact identity。

## Evidence of a problem or of correct behavior

| Observation | Source/artifact | Repeated? | Classification |
|---|---|---:|---|
| 两轮共 85 seed、19 RQ、0 raw、0 brief | Source34/35 handoffs | Yes | Funnel fact; zero brief itself is legal |
| S4 两轮各 12 seed 但 0 RQ，并显式要求 raw-card 字段同时闭合 | S4 handoffs/base decisions | Yes | Execution/sequence defect |
| S3 两轮 7 seed 但 0 RQ，Source35 把“无新 evidence delta”当作无法形成 RQ | S3 handoffs/base decision | Yes | Cooldown/identity ambiguity |
| S1/S2/S5/S6 反复落入 API 配置、selector、allocation、generic lowering | Four lane handoffs | Yes | Source-role imbalance plus healthy mature-union abstention |
| Source35 shadow 六路均 N/A，未改变 base | Six shadow artifacts | Yes, all lanes | Diagnostic is not causal and currently uninformative |
| NVPTX tcgen05 有真实联合状态疑问但 source/witness 未闭合 | Source33 S6 note | One bounded hold | Closure debt, not STOP and not automatic backfill |

## Why the raw gate should not be weakened

已有 19 个 RQ 中，多项被 current API/source union、配置自由度、runtime/controller 或 generic product 吸收。这部分是健康克制。取消 same-object、direct fatal、current union、full-cost、falsifier 或 Q2 约束只会把弱题送往 Stage0，不能增加真实论文产出。正确的修复位置是：让不同问题先被准确表述，再由现有 raw 门和独立 Stage0 淘汰。

## Recommendation

- Decision: `CLARIFY`
- Minimum effective change: 仅 Source37 一轮使用 `SOURCE37_STAGE_SEPARATED_IDENTITY_AND_TYPE_ROUTING_V1`；细则见 `RULE_CHANGE_PROPOSAL.md`。
- Why a smaller operational fix is insufficient: 单纯换关键词或继续 non-product shadow 不会修复 RQ 前证据门泄漏与 identity/family 混淆；单纯增加检索量也会继续命中相同成熟表面。
- Non-relaxable gates preserved: Q2、same-object、direct fatal、current union/current source、公平强基线、自然或 canonical 载体、full-cost、最低 falsifier、可复现性、claim ceiling 全部不变；V9 保持 OFF；网络安全继续排除；无配额、无 outcome-aware backfill。

### 唯一的 Source37 六路策略

同一个 assignment-local 协议包含以下不可拆分的四部分：

1. **阶段分离。** seed 层只作允许的身份/定义性排除；每个“被选择的 seed”必须先形成 2–3 个 RQ 版本。RQ 阶段不得要求 current-source locus、完整 falsifier、full-cost、witness、union 或结果。进入 raw 时仍完整执行现行 `RAW_REQUIRED`，没有任何字段豁免。
2. **精确冷却证书。** exact identity 至少按“exact object/semantics + RQ/claim endpoint + atomic action or estimator + mechanism/information condition + comparator/guarantee”比较。共享论文、工具、ISA、source tree 或 broad opportunity family 只标 related，不自动排除。引用旧 STOP 作 containment 时必须记录单调包含证书：新 identity 的决定性字段为旧题的子集/等价，且旧负 witness 可直接迁移；否则只能作为真实不同的新 ID 走正常门，绝不改名复活旧 STOP。
3. **类型先行。** RQ 形成时先声明一个论文结构假设，再使用相应 raw 路线：测量/benchmark 冻结 estimator、validity threat、canonical/natural carrier、阈值和 held-out falsifier，不强求 constructor；theory/formal 冻结模型、保证、canonical instance 与 checker 路线；算法/系统/编译器冻结 action skeleton 与非通用判别，但不要求完整 action catalogue 已实现。
4. **六路入口重平衡。** S1 寻找近期 limitation/current-source 的边界或语义矛盾；S2 只保留能冻结下游非乘积后果的瓶颈迁移，避免 API allocation/config 拼接；S3 主攻自然或 canonical 工作负载上的测量/刻画规律；S4 主攻 canonical benchmark、estimator/validity 或 theory/formal；S5 主攻规模/在线算法、数据结构或形式界，避开成熟编译器配置；S6 主攻近期明确限制与当前源码可核验的直接算法残差，避开 RA/selector/通用 constructor 主题。

`NON_PRODUCT_COUPLING_SURVIVAL` 在 Source37 设为 `OFF`。NVPTX tcgen05 维持 bounded unresolved，不自动选入、补位、升级或停止。

## Risk analysis

- False-negative risk: 预计下降，主要来自不再用 broad family/cooldown 阻止 distinct RQ；仍可能因来源本身饱和而保持零产出。
- False-positive/weak-paper risk: 可能增加 locator/raw 工作量，但 raw 门和独立 Stage0 不变；identity certificate 反而降低旧题伪装成新题的风险。
- Scientific-integrity risk: 低；严禁以“不同措辞”绕过 STOP，必须证明 identity 实质不同。
- Resource/time risk: 容量、六 lane 和预算不增；关闭无适用对象的 shadow 可减少机械开销。
- State-migration risk: 无；不改现有候选、HOLD、STOP 或 PASS。
- Terminal-revival risk: 由 containment certificate 与新 ID 要求显式防护。

## Validation and rollback

- Historical cases/backtest required: `false`。这是对当前生产规则的 assignment-local 执行澄清，不是新 admission method；不据此改 v8.7/V9 或历史状态。
- Shadow-run plan: 不另设 shadow；Source37 本身是一个有界 prospective pilot，之后只用其真实漏斗和独立 Stage0 反馈评估。
- Success criteria: 六路均能机械区分 seed 排除、RQ 形成和 raw 门；每个 cooldown/STOP containment 有证书；每个 selected seed 先有 2–3 RQ；各贡献类型使用正确入口；无硬门下降、无旧 STOP 复活、无结果感知回填。**不要求非零 raw 或 brief。**
- Diagnostic interpretation: 若合规后仍 raw=0，优先解释为题源饱和/来源不足，而不是继续削弱门；若出现 raw，则由现行 deep 与独立 Stage0 判断 precision。
- Rollback condition: 任一 lane 以 shared carrier 当 distinct identity、用不同措辞复活 STOP、跳过 raw-required 字段，或把 measurement/type 路线当作免除 current-union/full-cost/Q2 的借口，立即停止该 pilot 的新 admission，回到 base RQ 规则并保留已产生记录供审计。

## Mainline handoff

- User approval already present: `true`，由持续 Discovery 授权与 AGENTS 连续两轮零产出自适应条款覆盖；无需新的 generic approval。
- Files proposed for change: 仅由主线生成 Source37 assignment-local contract；不建议本次直接改共享规则。
- Registry migrations proposed: `none`
- Existing active/blocked/hold/terminal topics affected: `none`
- Source36 affected: `false`
- Shared files modified: `false`
