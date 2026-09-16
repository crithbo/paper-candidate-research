# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260810-DISCOVERY-YIELD-R1`
- `proposal_id`: `DISCOVERY-BROAD-DEEP-ALGORITHMIC-RESIDUAL-V8.8-PROPOSAL-R1`
- `decision_label`: `BACKTEST_REQUIRED`
- `user_policy_approval_required`: `true`
- `backtest_required`: `true`

## Problem statement

Wave29 与 Wave30 在四个正交 source lens 上筛选 44 条近期贡献谱系且零提案；触发后 Wave31 另有 22 条零提案，Wave33 的 broad-then-deep top-3 也为零。数量覆盖已达到规则目标，但 44 条中至少 15 条显式以 selector/controller/wrapper/configuration/tuning/chooser/policy 作为主要淘汰理由。

现行规则已经允许 N2 新算法、联合优化、在线策略、近似和数据结构，并明确规定“基线能表达同一动作不自动覆盖新算法”。当前执行却常把“native action space/hook/plugin 已存在”写成直接吸收，或者把“本波尚未冻结 fidelity plan”写成结构性 DROP。这样可能误淘汰在同一合法动作空间上具有新复杂度、信息条件、近似保证、数据结构或 full-cost 求解结构的题目。

本提案不主张提高录取配额，也不主张把 chooser/controller 自动送 Stage 0；它只要求用算法级证据区分普通选择器与合格 N2，并把搜索预算不足与科学反证分开。

## Current rule

- File/heading: `rules/ROLE_DISCOVERY.md`“三遍发现法”“Discovery 保真计划与 Stage A 保真执行门”“新颖性与基线”“输出与结论”。
- Current behavior: 文字规则要求两个机制、finite fidelity plan、fair current union 与算法增量测试；但 raw sweep 没有统一中间 disposition，执行日志可在一行 broad screen 后直接写结构性 DROP。
- Why it is insufficient or why clarification is needed: `selector/controller/wrapper` 的旧经验禁语仍在日志中被当作自动判据，掩盖了 v7 以后明确合法的软件/算法 N2 路线；同时 `NOT_ADMITTED_UNFROZEN` 缺少标准表达。

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| `rules/ROLE_DISCOVERY.md` | “三遍发现法” | 宽筛与 candidate-grade 三遍之间无固定桥接 | 每 lane 仍筛 8–12 条；只对 top 3 执行完整三遍、两个机制、facet collision、自然 carrier、fidelity plan 与 72h falsifier；最多 2 briefs，允许零提案。 |
| `rules/ROLE_DISCOVERY.md` | “新颖性与基线” | 已写“动作可表达不自动覆盖算法”，但没有 selector/controller 的机械判据 | 增加 `ALGORITHMIC_RESIDUAL_TEST`：比较 decision rule、信息条件、复杂度/资源、解质量/保证、full-cost、推广/无收益区。只有普通调参/wrapper，或公平同信息基线在完整成本下等价重放核心方法/保证时，才可因 selector/controller DROP。 |
| `rules/ROLE_DISCOVERY.md` | “输出与结论”前的 raw log | 候选级只有 PROPOSE/DROP，raw 行常混用 DROP/NO_BRIEF | raw 日志统一为 `STRUCTURAL_DROP / NOT_ADMITTED_UNFROZEN / RESOURCE_BLOCKED / DEEP_DIVE_REQUIRED / EXCLUDED`；它们不是正式候选状态。候选级仍仅 `PROPOSE_STAGE0 / DROP`。 |
| `rules/ROLE_DISCOVERY.md` | Source mode / M1 cadence | lens 是启发式，但 secondary lens 与零产出触发不明确 | top-3 记录 `primary_lens` 与可选 `secondary_lens`；O1–O5 残余若实为算法问题必须做 O7/N2 测试。连续两个全局零提案 wave 后，优先触发一次 M1，再继续扩大相似 paper sweep。 |
| `templates/TOPIC_BRIEF.md` | Current collision / software admissibility | 有 algorithmic delta，但未强制区分 action-space overlap 与 method absorption | 增加 “native action-space overlap”“same-information equivalent replay”“union-external algorithm/guarantee/cost residual”三字段；没有 residual 不得 PROPOSE。 |
| `templates/STAGE0_REPORT.md` | Evidence path and AI completion | AI score 与 readiness 混合，缺独立执行排序 | 在 Tier A/B 与 SENTRY 确认之后新增 `STAGEA_YIELD_PRIORITY: P1/P2/P3` 及六项依据；只用于 lane 排序，不改变 quality tier、PASS/STOP 或 reserve/blocker。 |
| `rules/ROLE_MAINLINE.md` | 并发与在制品 / 转换规则 | 连续低 yield 要修方法，但没有优先动作顺序 | 固定响应顺序：先 M1/深挖回测，再扩大 raw；Stage0-confirmed 题按 `STAGEA_YIELD_PRIORITY` 排空闲 lane，但学术 Tier 优先且不得饿死 P3。 |
| `rules/ROLE_STAGE0_REVIEW.md` | 双审吞吐 | 双审正确，当前无输入瓶颈 | 本轮不改。只增加 queue-wait 观测；若以后连续两批出现 head-of-line blocking，再单独提 microbatch patch。 |

不得在本提案目录直接编辑上述共享文件。可选 draft patch 也仅供主线在用户批准后参考；本轮未生成 `DRAFT_PATCH.diff`，避免让未回测语义看似已可上线。

## Safety invariants

- Q2 minimum preserved: 是；候选仍必须至少 `TIER_B_Q2_VIABLE`。
- Q1 priority preserved: 是；学术 Tier 始终先于 StageA readiness 排序。
- Same-object preserved: 是；deep-dive 必须冻结 exact object/guarantee。
- Latest collision preserved: 是；current upstream 文档、源码、flags/threshold/config 继续必查。
- Fair current strong baseline preserved: 是；native action union 被提升为更强 baseline，而不是被删除。
- Natural input/evidence preserved: 是；没有自然 carrier/falsifier 不得 PROPOSE。
- Full-cost preserved: 是；算法 residual 测试强制 full-cost。
- Reproducibility preserved: 是；top-3、K、字段、handoff 和 hash 均固定。
- Claim ceiling preserved: 是；Discovery 仍只给结构假设和有限计划。
- STOP non-revival preserved: 是；终态仅作为负对照，零迁移、零重命名。
- User StageB approval preserved: 是；不涉及 Stage B。

## State and compatibility migration

- Existing states affected: 无。
- Existing assignments affected: 不追溯改判 Wave29–33；只用于回测和未来获批 wave。
- Template compatibility: 新字段可选读取、未来写入必填；旧 brief 继续可读。
- Old filename compatibility: 不变；仍使用 `handoff.yaml` 与 `HASH_MANIFEST.sha256`。
- One-time migration required: 无候选迁移。只需主线登记一个冻结 method-backtest assignment。
- Rollback path: 回测失败或任一 hard-gate 回归时，删除未生效 draft、将方法保持 v8.7，并在 history 登记失败核；不触碰候选状态。

## Validation plan

- Historical/time-slice cases:
  - 6 个在冻结时点应能恢复为候选形状的历史 Stage0 PASS 例，至少含 `S6-JS-PREFIXBOUND`；
  - 6 个 same-object/direct-fatal/changed-object 负对照，全部来自已登记失败核；
  - 4 个有限但未实现、资源阻塞或 evidence-readiness 低的非科学失败例。
  - PACKER 冻结截止日期与材料；EXECUTOR 不见标签；AUDITOR 独立开封。
- Negative controls: 必须包含至少两个“普通 selector/wrapper”、两个 direct current-method collision、一个 changed-object、一个终态 STOP non-revival control。
- Expected behavior changes: 更少把 `NOT_ADMITTED_UNFROZEN` 写成结构性 DROP；对同一 action space 上的非平凡算法 residual 进行深挖；不保证提案数量大于零。
- Forbidden regressions: 弱基线、只换名、wrapper、调参、无自然 carrier、缺 full-cost、资源失败推断、终态复活、用 StageA readiness 覆盖学术 Tier。
- Acceptance threshold:
  1. 终态复活 0，6/6 负对照不被包装；
  2. 正例至少 5/6 进入 deep-dive，至少 4/6 恢复为 PROPOSE 或 candidate-grade DEEP_DIVE_REQUIRED；
  3. 非科学失败至少 3/4 不被标为 STRUCTURAL_DROP；
  4. 100% selector/controller 处置完成六项 algorithmic residual test；
  5. 两个 shadow wave 均遵守 top-3、最多 2 briefs、零实验/下载；
  6. retrospective StageA priority 将唯一既有 PASS 排在前半，且不取消任何 Tier A/B 候选；之后至少对 6 个新 Stage0-confirmed 题做前瞻校准再判断排序效用。

## Expected benefits and costs

- Expected benefit: 降低把新算法误写成“现有 action-space selector”的 false negative；把 source effort 从重复 broad sweep 转向少量可证伪深挖；在不改录取线的前提下提高有限 StageA lane 的信息增益与到 PASS 的期望速度。
- Expected cost: 每 lane 多做 3 条 candidate-grade source/facet audit；M1 会占用一个 Discovery 时隙；StageA priority 增加少量模板和主线排序字段。
- Main uncertainty: 44 条零提案可能真实反映当前公开研究空间拥挤；本提案不能保证产生题目，只能提高淘汰理由的分辨率和可审计性。

## Decision request

请用户选择是否批准主线仅创建独立的 sealed historical backtest + 两波 shadow logging。该批准不等于批准生产规则变更。只有回测达到阈值并由用户再次接受，主线才可最小修改 `rules/ROLE_DISCOVERY.md`、`rules/ROLE_MAINLINE.md`、`templates/TOPIC_BRIEF.md` 与 `templates/STAGE0_REPORT.md`。

在用户批准前，仍禁止：修改共享规则、改变任何候选状态、复活 STOP、启动候选/实验/下载/StageB/自动化，或降低任何科学硬门。

