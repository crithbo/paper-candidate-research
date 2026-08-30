# Discovery 历史回测会话规则

## 适用会话

同一文件供以下独立角色读取：

- `DISCOVERY-BACKTEST-PACKER-LANE`
- `DISCOVERY-BACKTEST-EXECUTOR-LANE`
- `DISCOVERY-BACKTEST-AUDITOR-LANE`
- 迁移期兼容原无 `-LANE` 名称

三种角色是长期复用会话，不按方法版本或 packet 新建。每个 assignment 必须在合同中声明 role、assignment_id、方法版本、输入哈希和唯一写目录。三种角色不得由同一会话兼任；同一回测仍严格 `PACKER → EXECUTOR → AUDITOR` 串行，只有主线验收上游冻结包后才投递下游。

每个 lane 一次只处理一个 assignment，完成后回到 `IDLE_REUSABLE`。没有获批回测时，主线将三种空闲任务窗口登记为 `ARCHIVED_UI_POOL_COMPACTION` 并保持冷归档；新回测获批后反归档原 PACKER/EXECUTOR/AUDITOR，不能临时新建逐方法任务。PACKER 可以跨版本复用，但不得执行方法；EXECUTOR 永远不得接收 auditor key、揭盲结论或目标身份；AUDITOR 不得改写 PACKER/EXECUTOR 输出。若实际积压需要并行，可建立总计 2–4 个回测/审查 lane 组，但不得用同一会话兼任角色或让同一 packet 并行进入多个角色。

当待测方法为 `DISCOVERY-CLAIM-PACK-V9-R0` 时，三角色还读取 `rules/DISCOVERY_CLAIM_PACK.md`，但 EXECUTOR 仍不得读取 auditor key、目标身份、揭盲标签、预计 relation 或通过阈值答案。

当待测方法为 `RQ_REFINEMENT_STAGED_EVIDENCE_V1` 时，三角色还读取 `templates/DISCOVERY_DIVERGENCE_SEED_POOL.md`、`templates/DISCOVERY_RQ_CANDIDATE.md`、`templates/DISCOVERY_QUESTION_CARD.md` 与 `templates/TOPIC_BRIEF.md`。EXECUTOR 只能看到 cutoff 前材料，不得看到目标论文身份、后见 current union、后见实验结果、auditor key 或预期 disposition。

每次冷启动先读取 `AGENTS.md`、`plan.md`、主线冻结的 `ASSIGNMENT_CONTEXT.yaml`、本文件和该角色允许的最小 packet，并生成 `BOOTSTRAP_ACK.yaml`。主线接受 ack 前不得接触 packet；PACKER/EXECUTOR/AUDITOR 的 forbidden input 必须逐项写入 context，不能靠旧会话记忆维持盲隔离。主线和回测控制面仍保留完整 registry 读取。

## 目标

回测验证某个 Discovery mode 能否仅凭目标论文发表前可获得的信息，合理恢复成功论文的问题形状，同时对没有可信机会的输入 abstain。它不评价新候选，也不产生候选证据。

回测正例可覆盖 `TIER_A_Q1_POTENTIAL` 与 `TIER_B_Q2_VIABLE`，但不得把 `BELOW_Q2_STOP` 包装为正例。二区正例只降低目标贡献广度，不降低 same-object、来源真实性、自然输入、公平基线、full-cost、可复现性或负对照 abstain 标准。

## 目录与交付

统一目录：

`stages/discovery/_method-backtests/<OPPORTUNITY_LENS>/<METHOD_REVISION>/`

必需文件：

- `sealed_input_manifest.yaml`
- `method_output.md`
- `backtest_review.md`
- `handoff.yaml`

只有 review 与 handoff 齐全、关键输入/输出身份可定位并由主线验收，才算完成。PACKER→EXECUTOR→AUDITOR 的盲隔离、cutoff、揭盲与结果文件属于高风险边界，须针对性核验；辅助日志不要求递归全树复算。已接受且无漂移的上游包复用既有验收记录，不在每个角色重复验证全部哈希。

## PACKER

使用与项目范围相符的真实一区或二区论文；正例包需标记其最终质量档，且不得因纳入二区正例而降低机会恢复、负对照 abstain、时间切片和污染审计要求：

1. 选择 3 个正例；
2. 选择至少 1 个没有可信新机会的负对照；
3. 每个正例只提供目标论文发表前可获得的 3–8 篇前置论文、公开 artifact 与当时环境；
4. 隐藏目标论文题名、摘要、方法、结论和发表后材料；
5. 冻结 cutoff date、材料哈希、来源、纳入理由和排除列表；
6. 生成 sealed packet，不向 executor 泄漏答案。

PACKER 不运行待测方法，也不评分。

## EXECUTOR

1. 只读取 sealed packet 与待测 Discovery role；
2. 不搜索或猜测目标论文；
3. 对每个 packet 输出恢复的问题、基线限制、决策结构、贡献路线、证据入口和 abstain 判断；
4. 不得用后见信息修补答案；
5. 完成后封存 `method_output.md`。

若被测方法含“current implementation absence”入口，负对照至少覆盖一例“旧文档称缺失、但时间切片内 current source 或非默认 flag 已实现”的 stale-document trap；正确行为是直接扣除旧 gap，且不得把 future-work/issue 当作当前源码事实。

EXECUTOR 不读取 auditor key，不自评是否通过。

## AUDITOR

1. 先核验 packet cutoff、污染、完整性与 executor 日志；
2. 揭示目标论文；
3. 比较 executor 是否合理恢复主要机会、限制、决策结构、贡献路线和证据入口；
4. 核验负对照是否 abstain；
5. 记录误报、遗漏、过度包装和可能污染；
6. 输出 `CALIBRATED / NOT_CALIBRATED / CONTAMINATION_UNKNOWN`。

最低通过条件：

- 3 个正例中至少 2 个的问题形状被合理恢复；
- 负对照未被强行包装；
- 没有决定性信息泄漏；
- 方法输出不是只复述输入的 limitation。

`CONTAMINATION_UNKNOWN` 不得记为通过。

以上 3 正例 + 1 负例只适用于 legacy lens 的初始小回测。claim-pack V9 属于行为改变型方法，不能凭该小样本宣告 calibrated。

## RQ refinement + staged evidence 独立校准

`RQ_REFINEMENT_STAGED_EVIDENCE_V1` 会改变 locator 之前的问题收敛和 raw 录取位置，必须在 `PRODUCTION` 前完成一次新的盲时间切片回测。不能复用创意发散前端旧回测的案例身份、auditor key 或目标锚点；旧回测只能说明 seed 发散层曾通过，不能证明本方法的开放题源召回。

PACKER 冻结 3 个正例与至少 1 个直接负对照：

- 正例覆盖至少两种贡献类型；
- 至少 1 个正例在 cutoff 时完整 current union、最强 subtractor 或完整小 witness 尚未闭合，但存在可由公开一手材料完成的有限路线；
- 至少 1 个正例具有多个可混淆问题版本，只有其中一个保持同对象与目标保证；
- 负对照包含 direct absorption、换对象/降保证、generic wrapper/solver 或无有限闭合路线中的至少一种；
- 所有目标论文、发表后实现、后见结果和答案标签对 EXECUTOR 隐藏。

EXECUTOR 对每个案例依次输出 seed pool、2–3 个同对象 RQ candidate、证据查证计划、Question Card disposition 与是否形成 clean brief。它必须明确区分：

- `RQ_READY_FOR_EVIDENCE_LOOKUP` 与非科学性的 RQ backlog；
- `EVIDENCE_QUALIFIED_RAW` 与 `SOURCE_CLOSURE_QUEUE`；
- raw 后的有界 closure debt 与已知 direct fatal；
- Discovery 能冻结的可攻击命题，与必须交给独立 Stage 0 重建的完整 union、碰撞谱系和 Q1/Q2 判断。

AUDITOR 除通用最低条件外还检查：

- 3 个正例中至少 2 个主要问题形状被恢复，且至少 1 个“有限 closure debt 正例”没有在 raw 前被错误拒绝；
- 负对照没有进入 clean brief，已知 direct fatal 没有借 closure debt 越过硬门；
- RQ 改写没有换对象、降保证或根据证据结果回填；
- closure debt 有明确 owner、最多 3 个决定性问题、有限来源路线和失败后果，不是无限期占位；
- EXECUTOR 没有把完整 current union、最新碰撞或 Q1/Q2 终裁伪装成 Discovery 已完成事实；
- 没有标签泄漏、结果泄漏或目标论文反向识别。

输出仍为 `CALIBRATED / NOT_CALIBRATED / CONTAMINATION_UNKNOWN`。只有独立 AUDITOR 给出 `CALIBRATED` 且主线登记 cutover 后，assignment 才可使用 `DISCOVERY_RQ_FRONTEND_MODE=PRODUCTION`；否则只能 `SHADOW`，缺控制字段时 fail closed 为 `OFF`。回测不设置 brief 配额，也不得以通过为由降低 same-object、direct fatal、公平强基线、自然/canonical 路线、full-cost 或独立 Stage 0 门。

## Claim-pack V9 独立校准

PACKER 为 legacy 与 V9 冻结相同 snapshot、source universe、cutoff、工具/模型、budget 与 neutral input。样本须覆盖至少三种贡献类型，并包含 later-success positives、direct structural negatives、partial-coverage/narrowing cases、unfinished-but-nonstructural cases、stale-document/current-feature traps 和 style-attractive weak packages。开发回归集与新 blind holdout 不得重用身份或 auditor key。

EXECUTOR 以 paired randomized/cross-over 顺序运行 legacy 与 V9，保存每个 query、source、claim、关系、状态变化、成本和原始输出。对 neutral rendering、标题/长度/同义改写、证据顺序、非关键噪声与可信相反证据做预登记扰动；不得反向猜目标论文或硬编码案例答案。

AUDITOR 先验收污染、snapshot、预算与配对完整性，再独立评价 critical-source recall、direct-coverage 识别、false structural DROP、unfinished 正确保留、claim–source 匹配、contradiction disclosure、decision-ready completeness、审计成本、决策稳定性、贡献类型/对象/机制多样性和 Stage 0 repair 预期。关键分歧由未参与 PACKER/EXECUTOR 的 adjudicator 处理；LLM 自评不能单独决定 PASS。

协议必须预登记 paired noninferiority margin、初始 blind 样本、区间估计、以固定增量扩样的触发器、最大样本和一次失败后的停止条件。样本不足或区间不决时输出 `PILOT_NOT_CALIBRATED / INCONCLUSIVE`, 不能 PASS。blind 通过后还需两波同预算、非 canonical prospective shadow；lane count 3 vs 6 另做 scheduling experiment，不得与方法效果合并。

## 证据与独立性

- 所有当前事实优先使用论文原文、官方页面、官方源码与作者 artifact；
- 目标论文发表后材料不得进入 sealed input；
- 不能把回测结果写成新候选 headroom、novelty 或 feasibility；
- 回测不为候选增加学术分或 AI 分；
- 同一方法只有在首次使用或物质性变化后重新回测，不每波重复。

默认使用 Terra；污染争议、复杂谱系或结论分歧可由主线升级 Sol。普通状态只写目录，完成或发生污染/文件冲突时通知主线。

对用户或主线的自然语言摘要先说明方法是否获得支持、为什么、证据还缺什么以及下一步；不要把内部长状态码、不可观测字段占位符或整页 SHA 当成正文。精确机器码与哈希保留在 handoff/manifest，只有污染、漂移、授权或复现争议时突出展示。无法观测的成本写“运行环境没有提供精确统计，未作估算”，不得填零。

## 获取阻塞

PACKER 无法实际冻结一手来源时必须 `FAILED_NOT_DISPATCHABLE` 并提交精确 blocker；不得用失效页、反爬页、搜索片段或 stub 代替。该状态只说明回测包未就绪，不产生候选的学术负结论，也不触发人工储备或课题归档。若需要用户提供来源、权限或网络入口，应建议主线登记 `BLOCKED_USER_ACTION_REQUIRED`；解阻后继续同一冻结方法，不把获取失败计作科学 revision。
## 资源本地化引用

任何 PACKER/EXECUTOR/AUDITOR assignment 产生下载、复制、解压、环境、构建、可配置缓存或临时文件前，必须遵守 `rules/RESOURCE_LOCALIZATION.md`、进程局部重定向和 canonical `RESOURCE_INVENTORY.yaml`。盲包隔离规则不因共享 asset 或本地 cache 而放松。
