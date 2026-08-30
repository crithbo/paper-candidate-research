# Discovery selection-method v8.1 独立审计（澄清修订）

角色：`DISCOVERY-BACKTEST-AUDITOR`。本审计不改变候选状态、规则、模板、主控记录或任何终态 STOP；历史回测与本报告均不是候选证据。

## 审计结论

**结论：`PATCH_WITH_BACKTEST`。** 应以最小方法补丁显式分离“研究若成功是否有可信论文潜力”与“当前能否以可接受风险取得核心证据”。先前版本建议把“已观察自然 headroom/定理 witness”作为 Pre-Stage0 硬门，现**明确撤回**：这会错误地将 Stage 0 的潜力筛选与后续证据验证混层。

## Observed facts（观察事实）

1. v2 的六个 lens 均经独立 PACKER→EXECUTOR→AUDITOR 历史切片回测为 `CALIBRATED`。该结果校准发现方法，既不构成候选证据，也不证明某一生产 brief 的核心证据已取得。
2. `round-20260803-v8` 漏斗为 30 raw opportunities → 6 grounded briefs → 6 个 Stage 0 `REVISE_ONCE`。S3 的 5 raw 均被止损为 0 brief，其余 lens 产生 1、1、1、1、2 个 brief。
3. PRIMARY 的六个 gate 针对同对象边界、自然输入/witness、强基线不吸收或理论等价等未闭合核心；没有任何 PASS。五个 gate 被 SENTRY 认定为可证伪的原子 gate，S1 的现有 gate 被判为把三个独立命题捆绑，因而非原子。
4. SENTRY 记录六题自然 headroom 尚未证明，且 revision 1/1 未执行；同时明确没有因缺商业硬件、专有栈或尚未运行实验而 STOP。
5. v8.1 已把三题标为 `TIER_A_Q1_POTENTIAL`、两题标为 `TIER_B_Q2_VIABLE`、一题标为 `BELOW_Q2_STOP`，并明确 Tier 是研究形状标签，不是 Stage 0 PASS；hard gates 不因 Tier 降低而放松。
6. 压缩历史保留的终态失败核包括：成功后仍被 finite same-object baseline/selector 吸收、无非平凡 N1/N2/N3、对象或公平比较无法定义、普通调参/包装、自然输入缺失且无可信获取路线、或成本遗漏。终态 ID 不得重命名复活。

## Inference（审计推断）

现行材料显示**潜力筛选与证据验证存在局部混层风险，但并非发现 lens 失效**：

- Stage 0 的正确问题是反事实问题：*若完成可行、有限、可证伪的证据路线，该研究是否可形成可信论文？* 它不要求已经有实验结果、自然 corpus、完整证明或商品硬件。
- 在 Stage 0 把“证据尚未取得”当作学术 STOP，会错误杀死具有明确 N1/N2/N3、可定义对象和公平比较、且有具体证据获取路线的研究。
- 反过来，把“Tier A/B potential”解释为阶段已通过，也会错误；它只回答结构性论文潜力，不回答证据取得的风险、claim ceiling 或下一步的优先级。
- 因而 `REVISE_ONCE` 可以是合理的 conditional potential disposition：它应区分“结构性核心是否仍可能成立”与“最短证据路线是否高风险/尚待取得”，而不把两者合并为一个 PASS/STOP 词。

结构性失败才应触发学术 STOP：即在成功假设下仍被强基线吸收；没有 N1/N2/N3；对象、语义或公平比较不可定义；只是普通调参/包装；或无法形成可信论文。缺实现、实验、自然 corpus、证明或商品硬件本身不是 STOP 理由，只影响证据风险、资源路由、claim ceiling，或在适用时进入 `HUMAN_RESEARCH_RESERVE`。

## Recommendation（建议）

### 修正后的最小规则/模板 delta

1. **两轴字段，替代“已取得证据”硬门。**
   - `STRUCTURAL_PAPER_POTENTIAL`: `TIER_A_Q1_POTENTIAL | TIER_B_Q2_VIABLE | BELOW_Q2_STOP`。这是学术录取主轴，判断成功后是否仍有可信论文结构。
   - `EVIDENCE_ACQUISITION_RISK_READINESS`: 至少记录 `LOW | MEDIUM | HIGH | HUMAN_DEPENDENT`、具体缺口、可接受 claim ceiling 和证据路线；它用于排序、路由和风险沟通，不单独决定学术 STOP。
   - `CORE_GATE_STATE`: `ATOMIC | NONATOMIC | OPEN | CLOSED_PASS | CLOSED_FAIL`，仅描述最短证伪/证实 gate 的逻辑状态，不授予阶段升级。
2. **Pre-Stage0 readiness gate 改为计划充分性，而非证据已得。** 对 `PROPOSE_STAGE0`/conditional pass 仅要求：
   - 官方或可复现同语义对象、版本和评价边界可冻结；
   - 自然目标 workload/理论对象可定义，或明确其尚未可得的理由与资源路线；
   - 强同对象基线、完整成本和复现路线可预注册；
   - 一个原子 killer gate，以及有限、可证伪的最短 probe/证明/获取计划。
   不要求 natural headroom、定理 witness、实现、实验或硬件已经取得。
3. **Residual-first，但以结构残差为准。** 先说明成功后仍独有的 decision/state/guarantee/complexity residual 及其不被强基线吸收的条件，再命名机制。此步骤判断 potential；证据计划只说明如何证伪或支持它。
4. **STOP 核作为 hard negatives，保留语义边界。** 对 union/selector absorption、无 N1/N2/N3、对象漂移、弱基线、成本遗漏和 wrapper-only 做结构性 lint；“未取得自然输入/证明”只能在没有可信有限获取路线或连对象都不可定义时成为结构性失败。
5. **两级 collision、claim ceiling/resource routing、atomic lint。** brief 前进行对象/版本/有限强基线 screen；Stage 0 进行全文有限碰撞。资源稀缺降低证据上限或路由至 reserve，不得伪装为学术 STOP。atomic lint 拒绝捆绑多个独立失败命题。
6. **分层指标。** 按 lens/失败核记录 structural pass yield、Stage0 revise rate、后续 core-gate closure rate、false-opportunity rate、time-to-accepted、zero-proposal calibration，以及 evidence-risk 分布；不得把它们变成数量配额或放宽 hard gate 的理由。

### 风险与反例

- 两轴可能被滥用为“潜力很高所以可无限等待证据”。缓解：每个 conditional potential 都必须有有限、原子的 killer gate 和明确的下一获取路线；无路线时应降为 `HUMAN_RESEARCH_RESERVE` 或停止。
- “可定义自然 workload”不能被合成 toy workload 替代。缓解：记录自然对象来源/协议；若未来无法取得，收窄 claim ceiling，而不是捏造正证据。
- 理论工作可能没有 corpus。缓解：接受明确 theorem object、lemma/counterexample/证明计划作为路线，不要求预先完成定理。
- STOP negatives 不得成为关键词黑名单。缓解：以 exact object、状态、动作、保证、复杂度与成本边界比较，不按名称匹配；终态 ID 不复活。

## Material-change and required backtest

显式引入两轴状态、conditional potential 和计划充分性 admission，改变了生产发现的判定输出与信息组织；因此按保守标准属于**材料性方法变更**，须在生产前做新的独立 sealed historical backtest。

最低回测设计：

- 覆盖六个 lens，每 lens 3 个成功正例与至少 1 个负对照，且仅给 EXECUTOR 目标论文发表前材料。
- PACKER 对 AUDITOR key 标注目标真实的 `STRUCTURAL_PAPER_POTENTIAL`、当时证据缺口、可用有限获取路线、强基线/对象边界和原子 gate；这些标签不向 EXECUTOR 泄漏。
- 正例中必须有一部分在 cutoff 时**尚未具备**完整自然 corpus、实现、实验、证明或硬件证据，但从前置信息已存在可信论文结构和有限证据路线；它们检验新方法不会因“未取得”而错误 STOP。
- 负例要覆盖：成功后 baseline/selector 吸收、无 N1/N2/N3、对象或公平比较不可定义、ordinary tuning/wrapper、以及没有可信有限证据路线的伪机会。终态 STOP 仅以去标识失败模式进入控制集。
- EXECUTOR 输出两轴、residual-first 判断、预注册的证据路线、claim ceiling、atomicity 与 abstain；不得识别目标、搜索目标或读取 key。
- AUDITOR 揭示目标后核验：至少 2/3 正例合理恢复结构性 paper potential；证据尚未取得的正例没有被误判学术 STOP；所有结构性 hard negatives 被拒绝；负对照未强行包装；任何决定性泄漏为 `CONTAMINATION_UNKNOWN`。

该回测通过前，维持现行 v2 生产规则。此报告不直接修订 `rules/` 或 templates，也不授予 Stage A/B 或实验授权。

## 审计边界与来源

事实仅来自项目控制文件、v2 回测封存记录、round-20260803-v8 Discovery handoff、Stage 0 PRIMARY/SENTRY/tier-recalibration 记录和 `history.md` 压缩经验。建议为审计推断；未运行实验、搜索新题或复活终态对象。
