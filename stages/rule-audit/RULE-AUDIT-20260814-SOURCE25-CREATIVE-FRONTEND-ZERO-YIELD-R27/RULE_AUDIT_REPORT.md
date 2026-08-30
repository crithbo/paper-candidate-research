# Rule Audit Report

## 中文摘要

- 发现的问题：Source25 的创意发散层确实扩大了想法覆盖，但证据收敛层没有同步加深。六路共报告 66 个 seed、24 个 locator，只有 1 个 locator 完成 Question Card 并进入 raw/C0，随后被当前 LLVM 实现直接吸收；最终 0 brief。S2 还存在更基础的可审计性缺口：自报 4 个 locator，却没有记录精确身份、Question Card、碰撞表或网络核验，不能证明这些是 4 个可复核的 locator。
- 为什么重要：盲回测的 3/3 正例是“在历史富集材料已经提供精确对象、强比较器和有限 witness 时，方法能否恢复问题形状”；Source25 测的是“能否从前瞻宽题源中找到并闭合这些材料”。两者不是同一召回率。当前 0 brief 不能推翻创意前端，但暴露了一个未被回测覆盖的中间瓶颈：`locator → 公开证据闭合 → Question Card`。
- 64 MiB 结论：无法计算精确利用率，因为多数 lane 没有记录响应字节和响应哈希；这本身违反了当前公开资料获取的遥测要求。现有记录仍足以判断授权显著未被用足：S2 明确没有网络抓取，S3/S4/S5 均未下载任何 artifact，S5 持久化下载为 0，其他 lane 也主要停在 landing page、文档摘要或 Doxygen 页面。若缺口是公开源码、规则导出、结果 schema 或官方 archive，这类 `LOCATOR_ONLY` 中有一部分是可避免的浅闭合，而不是科学淘汰。
- 建议修改：只运行一轮 assignment-local 的 `SOURCE26_EVIDENCE_CLOSURE_TRIAD_V1`。不改 Question Card 硬门；把每路最多 4 个预承诺 locator 配成“问题/载体锚点—当前 union—最强反方”三类来源，使用既有 64 MiB/128 MiB 上限完成最多两条确定性官方路线的最小闭合。若公开路线可达，就必须查到 source/schema/rules/小 carrier；若直接吸收则立即停止；若两条路线均失败则诚实保留 locator-only/resource-unclosed，不补位。
- 是否需要用户批准：不需要新的 generic approval。现有 `USER_ADAPTIVE_DISCOVERY_CONTINUE_UNTIL_FIVE_STAGEA_PASS_20260814` 覆盖下一轮有界题源调度，`USER_BLOCKER_AUTONOMOUS_OPEN_SOURCE_ACQUISITION_20260814` 覆盖在新 assignment 内冻结的公开/开源资料获取。主线仍须作为 single writer 在 Source26 安全边界生成精确控制合同；本审计没有使任何共享规则生效。

## Identity

- `audit_id`: `RULE-AUDIT-20260814-SOURCE25-CREATIVE-FRONTEND-ZERO-YIELD-R27`
- `trigger`: `SOURCE25_ALL_SIX_LANES_ZERO_CLEAN_BRIEFS_AFTER_CALIBRATED_CREATIVE_FRONTEND`
- `requested_by`: Mainline under continuous user authority
- `date`: `2026-08-14`
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260814-SOURCE25-CREATIVE-FRONTEND-ZERO-YIELD-R27`
- `shared_files_modified: false`
- Assignment SHA-256 verified: `BF73F2079B088882E3C5AD435B4A8924D07BFEBA67A00AD509F116343B972B26`

## Question and scope

- 审查问题：为什么历史盲回测恢复 3/3 正例，而 Source25 前瞻六路仍为 0 brief；损失发生在 seed、locator、raw、C0、D1、deep 还是 brief；哪些缺口可以通过现有公开资料授权闭合；下一轮只能采用哪一个有界策略。
- 权威规则：`AGENTS.md` 的 Discovery 创意前端和资源授权；`rules/ROLE_DISCOVERY.md` 的“证据门控的多视角产题”“资源失败不得伪装为学术淘汰”；`templates/DISCOVERY_DIVERGENCE_SEED_POOL.md`；`templates/DISCOVERY_QUESTION_CARD.md`；Source25 冻结 `CONTROL.yaml`。
- 实例材料：Source25 control、六路 seed pool、Question Card/碰撞表（存在者）、Discovery log、handoff，以及盲回测 auditor 包。
- 超出范围：没有重新搜索文献或网站，没有运行 Source26、Stage 0/A/B、实验、下载、构建、E2、V9 或自动化；没有改变任何候选和共享状态。
- 证据方法：按 academic-research-suite 的 source verification、cross-source synthesis 和 devil's-advocate 原则，分别报告已观察事实、推断和建议；对缺失 telemetry 不作数值猜测，并用最强反解释检验“零 brief 是否只是健康 abstention”。

## Current authoritative behavior

现行规则的科学门本身没有要求放松：

1. seed 是非证据草图，必须先完整生成、聚类，再冻结 locator；不强制 Top-N、不按结果补位。
2. locator 只有在 Question Card 明确 exact identity、same-object 问题、claim endpoint、反事实后果、非通用判别、current union/最强反方、最低 falsifier、有限闭合路线和 full-cost 后才计 fresh raw。
3. “有限闭合路线”不等于 Discovery 已经实现候选、下载整个数据集或得到主结论。只要公开来源可达、对象和动作可区分、没有已知直接吸收，就可以冻结后续 Stage A 的 fidelity plan。
4. 若判断依赖“当前实现没有动作”，必须检查当前官方文档、实际源码和默认/非默认入口。landing page、旧文档、issue 或 future-work 不能单独证明 residual。
5. Source25 明确允许每 lane 最多 64 MiB 成功响应、128 MiB 存储，禁止安装/构建/实验；获取公开源码、论文、数据、trace、规则或结果 schema 时必须记录来源、版本、许可、响应字节和哈希。

因此本轮不能用“降低 Question Card 要求”修复。真正需要修复的是：在卡片仍有公开可闭合字段时，先执行有界 source closure；不能把“只看了首页后仍未知”误写成已经合理耗尽的 locator-only。

## Funnel reconciliation

### 六路逐项对账

| Lane | Seed | 报告 locator | 可审计精确 locator | Raw | C0 | D1 | Deep | Brief | 主断点 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---|
| S1 | 8 | 4 | 4 | 0 | 0 | 0 | 0 | 0 | 四题均停在当前实现 union、强 subtractor 或同对象 witness；多处只读 landing/spec 页面 |
| S2 | 12 | 4 | 0 | 0 | 0 | 0 | 0 | 0 | 只有四个泛化类别和自报计数；无 exact identity、Question Card、碰撞表，且明确未做网络抓取 |
| S3 | 12 | 4 | 4 | 0 | 0 | 0 | 0 | 0 | 大载体/成熟 registry、cache/index 风险与非通用动作未闭合；其中 crates.io 的明显动作被当前协议 union 吸收 |
| S4 | 12 | 3 | 3 | 0 | 0 | 0 | 0 | 0 | 三个规范 benchmark 测量问题均缺官方 export/schema/original panel；只读网页、没有获取结果 artifact |
| S5 | 12 | 4 | 4 | 0 | 0 | 0 | 0 | 0 | TFLM 可能是可闭合来源缺口；SPIR-V、MLIR、BTOR2 主要落入强现行 union 或通用 solver/lowering |
| S6 | 10 | 5 | 5 | 1 | 1 | 0 | 0 | 0 | RVV/VSETVLI 被 current LLVM dataflow+PRE+coalescing 直接吸收；其余缺精确 carrier/action 或退化为通用 peephole/controller |
| **总计** | **66** | **24** | **20** | **1** | **1** | **0** | **0** | **0** | raw 前证据闭合是主瓶颈，C0 的唯一负例是健康科学淘汰 |

`plan.md` 使用了“约 23 个 locator”的概述，但六份 canonical handoff/log 相加为 24。由于 S2 的 4 条没有精确身份，建议后续同时记录 `reported_locator_events=24` 和 `auditable_exact_locators=20`，不要把两者混成一个分母。这是计数/交付缺口，不改变任何科学状态。

### 各 lane 的原因分类

| Lane | 可由公开资料闭合的缺口 | 源型/动作选择问题 | Question Card 过早闭合问题 | 真实科学克制 |
|---|---|---|---|---|
| S1 | LLVM Clang/libomp、canonical ABI producer/engine、Level Zero spec/source/sample、单一 RISC-V toolchain/emulator 都有确定性公开路线 | RISC-V H 题横跨 compiler/runtime/hypervisor，若不先限定一个实现会过宽 | 把“尚未 pin 具体源码符号”直接作为终止，而未见替代官方路线耗尽 | 没有据此声称 absence，克制正确 |
| S2 | 无法判断；因为没有留下 locator 身份与 source attempt | 最严重：device command/coherence/chiplet/NDP 等仍是类别，不是 exact object | 是；在没有证据检索和卡片 artifact 的情况下宣布 4 个 locator 均不完整 | 没有强行形成 brief 是正确的，但过程证据不足 |
| S3 | OpenAlex/OSM 可用 manifest、API 或小 deterministic slice 核验有限路线；不需要下载数百 GB 全量载体 | 成熟 registry/history 容易退化为 cache/index/delta/partition，源型饱和 | 把“全量载体太大”与“没有有限小样本路线”混在一起；前者不应自动阻断后者 | crates.io 当前 sparse/git/conditional refresh 吸收明显动作，克制正确 |
| S4 | 官方 rules、result export/schema、archive/change-log 是最明确的可闭合缺口 | 题源方向正确，属于合法 measurement/benchmark 入口 | 最明显；三张卡已写出有限 falsifier，却没有验证官方 artifact 是否可取得 | 不外推自然部署、不补齐缺失能耗字段，克制正确 |
| S5 | TFLM current allocator source和版本化模型/调用 carrier 可进一步闭合 | SPIR-V/MLIR/BTOR2 多数是成熟通用工具面，残差不够 target-specific | TFLM 只停在 repository page，存在浅查；其余更多是源型问题 | SPIR-V current optimizer union、generic MLIR/solver 不强包，正确 |
| S6 | exact public trace 的 measurement route若预先存在可查；否则不应成为 locator | mixed precision、ld/st peephole、trace overlap 多为未冻结动作或通用壳 | 有一部分，但不是主因 | VSETVLI 直接吸收是本轮最清楚的健康 abstention |

## Why 3/3 historical recovery and 0 prospective briefs are compatible

盲回测 auditor 明确限定了结论：它只验证四个历史 problem shape，不能推出未来新颖性、可行性或 Stage 0 接受。三条正例的输入已经含有精确 same-semantics/workload 对象、具名强比较器、full-cost 和有限 checker witness；方法需要做的是从密集材料中恢复结构。回测漏斗为 22 seeds、12 locators、3 complete cards、1 direct-coverage exclusion，Question Card 完整率为 3/12。

Source25 则从宽、低先验的 seed 开始，必须自己找到 exact object、当前源码 union、强反方和小 carrier。其报告漏斗为 66 seeds、24 locators、1 complete raw card，完整率为 1/24；唯一完整卡又触发了与历史 CASE-D 相同类型的 direct absorption。二者共同说明：

- 创意前端能在材料已经“题目化”时重建已知正例，也能拒绝直接覆盖负例；
- 它尚未证明能从宽前瞻 source archetype 中完成 source qualification；
- Source25 的零 brief 既包含健康 abstention，也包含可避免的浅检索与交付缺口；不能把全轮统一归因于“科学门过严”或“方法失败”。

最强反解释是：即使把 64 MiB 用满，也可能仍找不到 union 外动作，因此 0 brief 可能完全合理。该反解释对 S3 的成熟 registry、S5 的 generic solver、S6 的 VSETVLI 很强；但它不能解释 S2 零抓取、S1 landing-page 终止、S4 未取得官方 export/schema，以及 TFLM 仅查 repository summary。故“全部健康 abstention”不成立。

## Creative mechanisms: exercised versus nominal

### 实际发挥作用

- 多种发散引擎和视角轮换确实执行；S4/S5 的 seed pool 尤其完整。
- conclusion-first 和 generic-shell test 避免了不少 dashboard、selector、普通 packing、generic solver 题。
- 聚类后冻结 locator、无强制 Top-N、无 outcome-aware backfill 均得到遵守。
- current-union 反证在 S3 crates.io、S5 SPIR-V 和 S6 LLVM RVV 上确实改变了决定。
- canonical benchmark claim ceiling 得到遵守，S4 没有把 MLPerf 外推为自然部署规律。

### 仍然停留在名义层或被合同执行抵消

- `BISOCIATION/REFRAMING/CONSTRAINT/INVERSION` 扩大了语言空间，但 S2 和若干 S6 seed 没有绑定 exact public identity，导致结构映射无法查证。
- “最便宜 decisive falsifier”多数只写成未来计划，没有触发当前 assignment 已授权的源码/schema/small-carrier 获取。
- source verification 多停在项目首页、release page 或 docs landing，而不是当前 source symbol、结果导出、规则 schema 和相反工作组成的 source-role triad。
- Question Card 被当作“一次页面查阅后必须全闭合”的验收表，而不是“先列明未知字段，再用有界检索关闭最便宜未知”的工作队列。
- Source25 几乎没有形成“近期研究锚点—当前实现 union—最强反方”的三角证据；创意引擎因此经常围绕成熟工具面产生可想象但没有 residual 的题。

## 64 MiB retrieval audit

### 可确认事实

- 控制合同允许每 lane 最多 `67,108,864` 成功响应字节和 `134,217,728` 存储字节。
- S2 handoff 明确写 `no_network_source_fetch_performed: true`。
- S3 明确未下载 artifact，并称页面响应远低于上限。
- S4 明确未下载 rules、results export 或 result bundle。
- S5 明确 `persisted_download_bytes: 0`。
- S1/S6 只列网页、官方文档或 Doxygen/current-source page，没有完整响应字节、哈希与许可 ledger。

### 不能确认的事实

没有统一记录每次响应的 exact bytes、hash、URL、source role 和 fallback attempt，因此不能诚实计算“使用了百分之几”。报告只能给出定性结论：授权没有因流量或存储上限耗尽而形成 blocker，且至少 S1/S2/S4/S5 存在没有执行到可用官方深层材料的证据。

### 判定

这是两类问题叠加：

1. **执行违例/交付缺口**：没有按当前资源授权规则保存 exact response-byte/hash ledger；S2 还缺 exact locator 和 Question Card。
2. **调度缺口**：没有规定“何种 LOCATOR_ONLY 必须先消耗一次 bounded source-closure ticket”，导致 lane 可以在只读 landing page 后合法结束。

不是 64 MiB 太小，也不是需要增加 lane 或下载整个大数据集。最小修复是把小而决定性的 source closure 变成 Source26 的显式工作阶段。

## Recommendation

- Decision: `PATCH_RECOMMENDED__ASSIGNMENT_LOCAL_PILOT_ONLY`
- 唯一策略：`SOURCE26_EVIDENCE_CLOSURE_TRIAD_V1`
- 不改共享门：Question Card 完整要求、same-object、current union、强基线、自然/canonical 载体、full-cost、falsifier、可复现性和 Q2 质量线全部保持。
- 不新增独立回测：该策略不改变录取判据，只改变 locator 之后的检索深度、证据角色和遥测。Source26 本身就是一次有界 prospective pilot；若未来要永久写入共享规则，再根据 Source26 的可识别漏斗决定是否做独立回测或两轮 shadow。

### Source26 的单一有界流程

`offline seed pool → precommitted exact-source locator portfolio → retrieval triad → complete/incomplete Question Card → raw → C0 → D1/deep → brief`

1. 每 lane 仍生成最多 12 个离线 seed；seed 规则完全不变。
2. 每 lane 最多选择 4 个 locator，不设最低数、不补位。选择前必须能写出 target-specific counterfactual 和一个计划中的官方 source triad；generic shell、active/STOP exact identity、换对象或已知 direct absorption 在 locator 前退出。
3. locator 组合冻结后，对每个 locator 预登记：
   - `ANCHOR`：精确自然/canonical 载体、官方 release/spec/benchmark 或近期 primary problem anchor；
   - `CURRENT_UNION`：当前源码/官方实现与默认、非默认入口；
   - `CONTRARY`：最强 same-object subtractor、直接工作或能推翻 residual 的材料。
   `CONTRARY` 没有找到时只能用带查询边界的 `NOT_FOUND_WITHIN_SEARCH` 闭合该来源角色，不能写成全球 absence 或新颖性证明。
4. 每 locator 最多两条确定性官方/primary 获取路线；每条成功响应最多 8 MiB，每 locator 最多持久化 16 MiB；仍受每 lane 64 MiB response、128 MiB storage 总上限约束。不得下载全量 OpenAlex/OSM；优先 manifest、schema、source file、API metadata、小 deterministic slice、rules 或 official result export。
5. 所有路线在查看内容前冻结 primary/fallback；失败后不得换题、增加 locator 或从 backlog 补位。每次记录 URL/确定性选择规则、版本、许可/provenance、响应字节、SHA-256、source role 和结果。
6. 若 source 表明 current direct absorption、same-object 不成立或只剩 generic solver/controller，立即结构停止该 locator；不为用完预算继续搜。
7. 若只缺实现或主结果，但 exact object、已知 union 外可攻击残差和有限公开闭合路线已经来源化，按现行规则完成 Question Card 并进入 raw；不得要求 Discovery 先得到核心结果。
8. 若两条预登记路线均不可达、歧义或超限，保持 `LOCATOR_ONLY__PUBLIC_EVIDENCE_UNCLOSED` 或资源 blocker ceiling；不得科学 STOP。

### 六路题源分工

| Lane | Source26 主要题源 | 进入 retrieval 的前置判别 |
|---|---|---|
| S1 | 单一 compiler/runtime/ABI/ISA stack 的规范—源码边界 | 必须先限定一个 producer/runtime/toolchain 和一个自然或 canonical witness；禁止跨四个实现的泛题 |
| S2 | 带 exact profiler/trace/benchmark identity 的 GPU/NPU/PIM/跨层瓶颈迁移 | 不接受“interconnect/NDP mapping”类别词；必须有版本化 trace 或官方测量锚点和具体受影响动作 |
| S3 | 可由 API/manifest/小 deterministic slice 核验的版本化自然变化 | 不以百 GB 全量 snapshot 作为唯一闭合路线；禁止成熟 registry/cache/index 普通构造器 |
| S4 | 官方 benchmark rules、versioned result export/schema、archive/change log | 只做 suite-specific measurement/benchmark conclusion；若无官方可冻结 panel，不外推也不进 raw |
| S5 | target-specific partial primitive + stock checker/oracle + versioned carrier 的 online/recourse 问题 | generic MLIR/SAT/layout/solver 不进入 locator；优先 source-level 可枚举 action union |
| S6 | 当前 backend/ISA 源码中存在 partial primitive、但尚可提出不同非调参算法结构的对象 | 先查 current action catalogue；已知 VSETVLI exact identity 与其他 ACTIVE/STOP identity 不重开 |

## Risk analysis

- False-negative risk：下降；公开可闭合字段不再因 landing page 浅查而直接到期。
- False-positive/weak-paper risk：不增加；raw 和 brief 硬门不变，独立 Stage 0 仍重做 current collision/Q2 判断。
- Scientific-integrity risk：下降；明确区分 source-unclosed、direct absorption 和 generic source archetype，且不再猜测未观测字节或 absence。
- Resource/time risk：单 locator 深查会减少同轮题源宽度，但每 lane locator 最多 4、路线最多 2、无 backfill，且保持原 64/128 MiB 总预算。
- Accessibility bias：可能偏向拥有清晰公开 source/schema 的对象；通过六 lane 的不同 source types 和 canonical measurement/formal routes缓解，但不能消除。
- State-migration risk：无。Source25 的 locator-only 不自动升级；只有新 assignment 中出现新的公开证据增量才可重开。
- Terminal-revival risk：无。任何 STOP/ACTIVE exact identity仍在 locator 前排除。

## Validation and rollback

- Historical cases/backtest required: `NO` for this one-cycle assignment-local retrieval scheduler；历史 3/3 不再被当作 end-to-end prospective recall 证明。
- Prospective validation: Source26 单轮完成后报告每 lane 的 seed、reported locator、auditable exact locator、retrieval-triggered、source-role-closed、raw、C0、D1、deep、brief；不得只报 brief。
- 机械接受条件：
  1. 100% selected locators 有 exact identity 和 Question Card path；
  2. 100% retrieval-triggered locator 有冻结 primary/fallback、response bytes/hash/provenance ledger，或有检索前的 decisive structural exclusion；
  3. seed/locator/raw/C0/D1/deep/brief 分母逐路相加一致；
  4. 没有 Top-N、brief 配额、结果感知补位或科学门补偿；
  5. 0 brief 仍可 PASS 流程验收，只要 source closure 与 disposition 可审计。
- 科学观察指标：Question Card 完整率、raw 后 direct-absorption率、Stage 0 的独立 disposition；不为命中指标降低门。
- Rollback condition：若 Source26 再次缺响应 ledger、出现 precommit 后替换、超预算或把 source-unclosed 写成 scientific DROP，立即停止复用该调度并回到现行 v8.7 前端；已有候选/状态不迁移。

## Mainline handoff

- User approval already present: `YES__ASSIGNMENT_LOCAL_SOURCE26_ONLY`
- Files proposed for change: 仅由主线新建 Source26 的 control 与六份 assignment；本提案不要求立即修改 `AGENTS.md`、`rules/` 或 `templates/`。
- Registry migrations proposed: `NONE`；主线可在下一次常规重写中把 Source25 计数澄清为 `reported_locator_events=24`、`auditable_exact_locators=20`。
- Existing active/blocked/hold/terminal topics affected: `NONE`
- Shared files modified: `false`
