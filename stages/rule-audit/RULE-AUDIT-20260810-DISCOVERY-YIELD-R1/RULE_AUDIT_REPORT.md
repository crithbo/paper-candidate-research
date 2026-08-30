# Rule Audit Report

## Identity

- `audit_id`: `RULE-AUDIT-20260810-DISCOVERY-YIELD-R1`
- `trigger`: Wave29 与 Wave30 共筛选 44 条近期贡献谱系且零提案；用户目标为累计 3 个独立 Stage A PASS，当前为 1、还需 2。
- `requested_by`: 用户经主线冻结 assignment
- `date`: 2026-08-10（Asia/Shanghai）
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260810-DISCOVERY-YIELD-R1/`
- `shared_files_modified: false`

## Question and scope

- User/process question: 在不降低 Q2、same-object、最新碰撞、公平当前强基线、自然输入、full-cost、复现和证据诚实门的前提下，检查 Discovery 发现率、宽筛/深挖比例、source lens 分工、current-union 减法、有限 fidelity plan、Stage A 可执行性排序及 Stage 0 双审吞吐。
- Rules inspected: `AGENTS.md`；`rules/ROLE_MAINLINE.md`；`rules/ROLE_DISCOVERY.md`；`rules/ROLE_STAGE0_REVIEW.md`；`rules/ROLE_CANDIDATE_OWNER.md`；`rules/ROLE_STAGEA_REVIEW.md`；`rules/ROLE_RULE_AUDIT.md`；`templates/TOPIC_BRIEF.md`；`templates/STAGE0_REPORT.md`；`templates/STAGEA_REPORT.md`。
- Candidate examples inspected: Wave29 S2/S6 与 Wave30 S1/S3 的 canonical handoff、Discovery log 和 collision matrix；Wave33 S2 的 broad-then-deep top-3 交付作为触发后佐证，不改变冻结的 44 条触发分母。
- Out of scope: 不重审任何终态 STOP；不创建或恢复候选；不运行实验、下载、Stage B 或自动化；不判断 Wave29/30 任一 raw line 应当成为论文；不修改共享控制文件。
- Evidence snapshot: `registry.yaml` 于读取时登记 `updated_at=2026-08-10T15:40:00+08:00`，SHA-256 为 `C9B0AB858DD7604811264EB9C516C6D77E53BCC43964A00CEDA2FB2073C37B7A`。后续主线写入不改变本报告的冻结证据口径。

## Current authoritative behavior

1. `rules/ROLE_MAINLINE.md`“并发与在制品”规定：Discovery 每波约 18–24 个 raw opportunities，收敛为 6–10 个 grounded briefs；Stage 0 连续两批低于约 20% 时，先修正发现方法、对象冻结和基线定义，不降低学术门。
2. `rules/ROLE_DISCOVERY.md`“三遍发现法”要求问题谱系、至少两个非同义机制、碰撞与有限执行入口；“新颖性与基线”明确规定：基线能表达同一动作不自动覆盖新算法，仍须比较复杂度、在线信息、内存、扩展性、解质量和保证。
3. 同文件“Discovery 保真计划与 Stage A 保真执行门”规定：未实现接口、format/checker、witness 或结果，只要有限 same-object 闭合路线清楚，仍可送 Stage 0；只有闭合必然换对象/降保证、无有限路线或被 current union 直接吸收，才可结构性 DROP。
4. 同文件“AI 与资源”及 `rules/ROLE_MAINLINE.md`“AI、资源与授权”规定：AI 可执行性只用于排序和路由，不覆盖学术判断。
5. `rules/ROLE_STAGE0_REVIEW.md`规定 PRIMARY 与 SENTRY 双审；Stage 0 判断“若假设成立”的论文形状，不要求实现或正结果。双审是质量门，不是可取消的吞吐开关。
6. `registry.yaml` 的 session architecture 规定 M1 默认 `EVERY_TWO_WAVES_OR_TRIGGERED`；M1 用于从自然 trace/profile/benchmark 发现稳定规律和评价缺口。

## Evidence of a problem or of correct behavior

| Observation | Source/artifact | Repeated? | Rule defect, execution defect, resource event, or one-off? |
|---|---|---:|---|
| Wave29 S2/S6 共 22 条、Wave30 S1/S3 共 22 条，四个正交 lens 均零提案。宽度达到每波目标、谱系无明显重复，且使用了当前来源和排除清单。 | 四份 Wave29/30 `handoff.yaml` 与 `DISCOVERY_LOG.md` | 是 | Broad coverage 本身行为正确；零产出触发方法审计，但不证明门过严。 |
| 44 条 raw row 中至少 15 条在最终处置文本里显式使用 selector/controller/wrapper/configuration/tuning/chooser/policy 作为主要淘汰理由。 | 四份 Wave29/30 `DISCOVERY_LOG.md` 的 raw table；机械关键词计数 15/44 | 是 | 规则执行偏差叠加模板缺口。类别词本身不能证明没有 N2。 |
| S3 把 UST、Triton、NCCL 等“已有动作/插件/配置空间”直接写成新规划器被吸收；S2 对 GraCE、Knative 等也把策略选择视为自动不合格。 | Wave30 S3 collision matrix；Wave29 S2 log；Wave33 S2 deep audit | 是 | 与现行“动作可表达不等于算法被覆盖”规则冲突；可能产生 false negative。 |
| 一些行确有结构性负证据：标准固定动作、当前同对象核心方法直接覆盖、对象/格式/保证改变，或与 active/terminal object 重合。 | Wave29 S6 的 CBOR/Lucene/ELF 等；Wave30 S1 的 RISC-V/active exclusions | 是 | 正确的结构性淘汰，不应因提高产出而回撤。 |
| Wave29 S6 对 Zstd/LRAT 使用 `NO_BRIEF`/“not admitted”并声明不是科学 STOP；这正确地区分了未冻结与结构性失败。其他 lane 则常把“未在本波冻结 finite contract”直接写成 DROP。 | Wave29 S6 handoff/log；Wave30 S1/S3 logs | 是 | 现行规则方向正确，但 raw-opportunity 处置词汇不统一，容易把搜索预算不足写成结构性否定。 |
| Wave33 已试行 broad-then-deep top-3，证明小幅增加深挖预算可执行；但 deep audit 仍沿用“controller/selector 不是 N2”的类别判据，因此零提案不能验证新深挖法有效。 | Wave33 S2 handoff/log/collision matrix | 一次佐证 | 操作改进方向正确，判据尚未纠偏；需要回测而非继续扩大 raw 数量。 |
| 六个 source lens 已覆盖 O1/O2/O3/O4/O5/O7，领域没有重新变成 silo；触发后 Wave31 再覆盖 S4/S5 的 22 条并继续零提案。 | registry Wave29–31；各长期 lane 状态 | 是 | Lens 架构无须重做；问题在跨 lens 的算法 residual 测试和 M1 自然载体触发。 |
| 当前 12 个 Stage 0 独立 PASS 的 Stage A 结果为 1 PASS、5 STOP，余下为资源、暂停、hold 或队列状态。 | `plan.md` 15:33；registry 15:40 | 是 | 说明单纯提高 Stage 0 数量不等于达到 PASS 目标；通过学术门后的 Stage A readiness 排序有价值，但不得成为录取门。 |
| 当前没有新 brief 进入 Stage 0，PRIMARY/SENTRY 不是零产出的因果瓶颈。 | Wave29–33 提案数；Stage 0 lane 状态 | 是 | 当前 `NO_CHANGE`。先修 Discovery；待有输入后再测双审排队延迟。 |

## Findings by requested dimension

### 1. Broad coverage

`NO_CHANGE` 于数量门。Wave29/30 的 22+22 已满足 broad coverage；触发后 Wave31 又增加 22 条仍零提案。继续只增加 raw 数量的边际收益低。下一轮应把固定预算从“更多谱系”转向“少量高潜 residual 的算法级深挖”，同时允许零提案。

### 2. Deep-dive depth

当前 raw sweep 与 candidate-grade 三遍发现法之间缺少显式桥接。建议每 lane 维持 8–12 条宽筛，但只对 top 3 做完整深挖：至少两个非同义机制、facet-level current collision、算法 residual 测试、自然 carrier、有限 fidelity plan 和 72 小时 falsifier。Wave33 已证明 top-3 操作形状可落地，但需纠正判据后回测。

### 3. Source lens division

保留六 source lens + M1，不改成领域会话。Opportunity lens 是线索来源，不是 candidate ownership 或 admission silo。对 top-3 行允许记录 secondary lens；尤其当 O1–O5 的残余表现为新算法/数据结构时，必须执行 O7/N2 测试，而不是因“变成 selector/controller”直接终止。两次全局零提案后应按既有 cadence 触发一次 M1，自然 trace/profile 可提供当前 paper genealogy sweep 缺少的正 carrier。

### 4. Current-union subtraction

需要最小澄清：

- 当前 union 已实现相同核心方法、相同决策规则/保证，或在相同信息、预算和 full-cost 下可逐实例等价重放候选，才支持 `DIRECT_FATAL`/结构性 DROP。
- 当前 union 仅暴露合法动作、hook、配置项、tuner/plugin 或可枚举 action space，只能说明它是强基线，不能单独吸收新的算法、近似、数据结构、在线信息策略、复杂度或保证。
- `selector/controller` 只有在普通参数选择、wrapper、无非平凡算法增量，或被公平同信息基线等价重放时才不构成论文；名称本身不是淘汰证明。

### 5. Finite fidelity plan

保留现行门。应在 raw 日志中区分：

- `STRUCTURAL_DROP`：对象/保证改变、直接碰撞、无有限 same-object 路线；
- `NOT_ADMITTED_UNFROZEN`：本 assignment 尚未冻结 action/自然 carrier/fidelity plan，但没有结构性反证；
- `RESOURCE_BLOCKED`：具体外部资源不可达，无科学推论；
- `DEEP_DIVE_REQUIRED`：宽筛后值得用 top-k 预算闭合。

这些只是 Discovery raw 日志状态，不新增正式候选状态，不占 WIP，也不得用于复活终态 STOP。候选级 canonical 结论仍只有 `PROPOSE_STAGE0` 或 `DROP`。

### 6. Stage A executability ordering

只对已达到 Tier A/B 且经 Stage 0 独立确认的题增加独立队列字段 `STAGEA_YIELD_PRIORITY`，不得改变质量档或 STOP：

1. pre-claim fidelity 闭合清晰度；
2. 自然 corpus、当前强基线和 native checker/reader 可达性；
3. 小 witness/oracle 与机制特异 falsifier；
4. full-cost 可观测性；
5. 外部资源/人工核心风险；
6. 预计 AI core fraction。

建议使用 `P1_READY / P2_FINITE_CLOSURE / P3_RESOURCE_OR_HUMAN_CONDITIONAL`，仅决定空闲 lane 的先后顺序。高学术价值但 P3 的题仍进入 blocker/reserve 路径，不得学术 STOP。

### 7. Stage 0 dual review throughput

当前无输入，双审不是瓶颈，建议 `NO_CHANGE`。保留 PRIMARY→SENTRY→必要时 DECISIVE。等 grounded brief 恢复后，主线可用现有长期池做 1–2 题 frozen microbatch pipeline：SENTRY 确认前一 microbatch 时 PRIMARY 审下一 microbatch；`DISAGREE` 只阻塞争议题，其他题必须已获得逐题 confirmation 才能释放。先记录 queue wait；只有连续两批出现 head-of-line blocking 才提出规则 patch。

## Risk analysis

- False-negative risk: 中高。15/44 显式使用 controller/selector 等类别词；至少部分行未完成算法复杂度、信息条件、保证与 full-cost 的 residual 测试。
- False-positive/weak-paper risk: 若把任何新 chooser 都送 Stage 0，则很高；因此建议只澄清类别词并增加 top-k 深挖，不降低 PROPOSE 条件。
- Scientific-integrity risk: 低到中。现有 current-upstream 与 same-object 检查总体认真；主要风险是把“尚未冻结”过度表述为结构性否定，而非伪造正证据。
- Resource/time risk: 中。top-3 深挖增加 source-review 时间；通过固定 K=3、每 lane 最多 2 briefs、禁止实验/下载控制成本。
- State-migration risk: 低。raw 日志状态不进入正式 registry candidate state；旧候选与终态不迁移。
- Terminal-revival risk: 必须为零。历史 STOP 只可作为 negative control，不能重新命名、重跑或转回 active。

## Recommendation

- Decision: `BACKTEST_REQUIRED`
- Minimum effective change: 先做两部分：一是澄清“action-space overlap ≠ algorithmic absorption”并统一 raw disposition；二是对 broad-then-deep top-3 + StageA queue priority 做独立、盲化、时间切片回测。回测通过后，主线再应用最小 rule/template patch。
- Why a smaller operational fix is insufficient/sufficient: 只增加 raw coverage 已在 44 条触发集和后续 22 条 Wave31 上无收益；Wave33 只增加深度但未纠正判据，仍不足。直接放宽门会制造弱论文，因此必须回测。
- Non-relaxable gates preserved: Q2、same-object、latest collision、公平当前强基线、自然输入/正证据、full-cost、复现、claim ceiling、Stage B 用户审批与 STOP 不复活全部保持。

## Validation and rollback

- Historical cases/backtest required: 是。使用独立 PACKER/EXECUTOR/AUDITOR；冻结日期必须早于结果，标签对 executor 盲化。至少包括 6 个历史 Stage 0 PASS 形状（含最终唯一 Stage A PASS）、6 个结构性负对照/终态失败核，以及 4 个未冻结或资源型非科学失败案例。
- Shadow-run plan: 两个生产等价 wave 只做双轨日志，不改变 canonical 决策；old path 与 proposed path 并列记录。每 lane 8–12 raw、top-3 deep audit、最多 2 briefs，不运行实验/下载。
- Success/failure criteria:
  - 终态复活 `0`；6 个结构性负对照不得被强行包装；
  - 6 个历史正形状至少 5 个进入 deep-dive，至少 4 个恢复为 `PROPOSE_STAGE0` 或明确的 candidate-grade `DEEP_DIVE_REQUIRED`；
  - 4 个未冻结/资源案例至少 3 个不再被误标为 `STRUCTURAL_DROP`；
  - 所有以 selector/controller 为由的处置均填写算法 residual 六项测试；
  - shadow 两波的 100% structural drops 均有 exact-object/direct-collision/facet 证据；
  - StageA priority 用 Stage0 冻结材料回放时，唯一既有 PASS 位于优先级前半；不得因 priority 取消任何 Tier A/B 题；
  - 若新 brief 进入 Stage0，记录 PRIMARY 与 SENTRY queue wait；没有 head-of-line 证据时不修改双审规则。
- Rollback condition: 任一终态复活、负对照被包装、hard gate 被削弱、或 deep-dive 成本超过固定 K/brief 上限；立即回滚到 v8.7，并保留回测失败核。

## Mainline handoff

- User approval already present: 否。用户要求审计与提案，不等于批准规则生效或批准回测执行。
- Files proposed for change: `rules/ROLE_DISCOVERY.md`、`rules/ROLE_MAINLINE.md`、`templates/TOPIC_BRIEF.md`、`templates/STAGE0_REPORT.md`；`rules/ROLE_STAGE0_REVIEW.md` 暂不建议修改，只监测吞吐。
- Registry migrations proposed: 无正式候选状态迁移；若回测获批，主线只登记 method-backtest assignment 与未来 wave method revision。
- Existing active/blocked/hold/terminal topics affected: 无。active/blocked/paused/hold 保持原状态；terminal STOP 不复活。
- Shared files modified: `false`

