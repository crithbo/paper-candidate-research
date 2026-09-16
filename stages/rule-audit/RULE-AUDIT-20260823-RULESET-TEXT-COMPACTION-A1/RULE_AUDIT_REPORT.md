# Rule Audit Report

## 中文摘要

- 结论：存在明显的过期兼容层和大量语义冗余，建议大幅精简，但不应直接批量删除。
- 最大目录冗余：V9/R3 shadow-preview bundle，占 `rules+templates` 约 22.2%。
- 最大运行负担：每个 lane 强制读取 1.68 MB 的全量 `registry.yaml`，占最小入口 94%–96%；这比 rule prose 更影响速度、注意力和指令遵循。
- 建议：先做无行为变化的 shadow 归档与 role/template 压缩，再对 assignment-local registry slice 做独立回测。

## 问题分类

### 1. 明确非生产但仍位于 live rules 目录

`rules/_shadow_v9/`、`templates/_shadow_v9/` 和 `rules/CORE_POLICY.md` 是经过验证但未 cutover 的 preview。它们保留历史价值，但不应继续与当前 authoritative role 并列展示。更严重的是 shadow roles 固定的旧 common-policy hash 已不等于当前 `CORE_POLICY.md`，容易造成误读。

处置：保存原始字节、路径映射和 hash 后迁移到版本化 policy archive；live `rules/` 仅留一份短索引，声明 `REFERENCE_ONLY / NOT_PRODUCTION`。禁止删除唯一历史副本。

### 2. 全局硬门在多个 role 重复

Q2、same-object、current collision、强基线、natural/canonical、full-cost、reproducibility、claim ceiling、STOP non-revival、resource blocker 和 revision 边界已在 `AGENTS.md` 定义，又在 Mainline、Discovery、Stage0、Candidate、StageA/B reviewer 中反复解释。

处置：`AGENTS.md` 保留唯一全局规范；role 文件只保留一句不可覆盖的继承声明以及本角色特有的应用条件、流程、决策表和输出。不要新建另一份通用 policy 形成第三来源。

### 3. Discovery policy 与 skill 职责重叠

`ROLE_DISCOVERY.md` 约 37.6 KB，是当前最大 role 之一。项目级 `$research-topic-discovery` 已覆盖 seed→anchor→RQ→closure→raw→type-specific deep→brief 的操作步骤、source portfolio 和 selective depth；role 又重复这些步骤以及已 dormant 的 R7 历史策略。

处置：

- role 保留权限、模式、科学准入/淘汰门、允许 disposition、资源与 handoff；
- skill 独占查询顺序、seed/RQ 组织、closure 操作、强模型 slot 和 telemetry runbook；
- R7 dormant 细节移入历史 archive，live role 只保留 `OFF` 兼容条目；
- V9 只保留条件读取指针，不在 role 内复述协议。

### 4. 模板承担了过多政策说明

`TOPIC_BRIEF.md` 8.2 KB、`STAGE0_REPORT.md` 5.5 KB、`STAGEA_REPORT.md` 3.6 KB、`STAGEB_REPORT.md` 4.3 KB、`HANDOFF.yaml` 4.5 KB。大量文字是 role 已定义的提醒、枚举解释和重复审计问题。

处置：模板保留 mandatory fields、enum、数据表和一行 claim-ceiling 提示；解释性规则回到 role/skill。通用 handoff 只保留身份、冻结输入、结论、证据 ceiling、资源、状态、下一步和 canonical hashes；阶段专属信息留在阶段报告。

### 5. 真正的上下文瓶颈是全量 registry

所有 lane 都被要求读取 1.68 MB `registry.yaml`，其绝大多数内容是其他题、旧周期、历史 audit 和已完成 backtest。即使把所有 role 缩短一半，最小入口也只改善几个百分点。

处置：主线仍独占并完整读取 authoritative registry；分支 lane 改读主线冻结的 `ASSIGNMENT_CONTEXT.yaml`，其中包含：

- full registry hash、生成时间和 slice schema；
- 当前 assignment/topic/lane 的完整相关节点；
- 当前规则/模板/skill hashes；
- 所需 terminal identity 与 prior-collision digest；
- 用户批准、资源、revision、blocker、resume 和全局目标字段；
- 被省略区域的清单与 fail-closed 条件。

slice 不能自己成为第二状态源；任何 hash/字段缺失都回退全量 registry 或 fail closed。

## 文件分级

| 分级 | 文件/区域 | 建议 |
|---|---|---|
| ARCHIVE_CANDIDATE | `rules/_shadow_v9/*`、`templates/_shadow_v9/*`、`CORE_POLICY.md` | 版本化迁移并保留原 bytes/hash；live 仅留索引 |
| COMPACT_IN_PLACE | `AGENTS.md`、所有 active role | 去掉跨角色重复，只保留 global invariant + role delta |
| MOVE_TO_SKILL | `ROLE_DISCOVERY.md` 中的操作步骤、query allocation、selective depth | 由已安装 project skill 单独维护 |
| SCHEMA_COMPACT | 大型 stage/report/handoff templates | 字段优先，删除 role-level 解释性重复 |
| COMPATIBILITY_AUDIT | `HANDOFF.yaml`、`DISCOVERY_METHOD_BACKTEST.md`、`USER_REVIEW_PACKET.md` | 先查所有未终态 frozen assignments，再决定 deprecate/archive |
| KEEP | `RESOURCE_LOCALIZATION.md`、active role、`DISCOVERY_CLAIM_PACK.md` | 仍有独立且明确的权威职责；仅压缩，不删除 |

## 风险

- 过度集中：若把所有内容搬到新 common-policy 文件，会增加跳转并制造新的多源冲突。
- 历史路径断裂：直接移动 shadow/template 会破坏已冻结路径与 hash 证据。
- slice 漏字段：可能遗漏 terminal identity、approval 或 revision 状态，必须回测和 fail closed。
- 模板过瘦：若删除 mandatory field 而不是解释性文字，会降低交接完整性。

## Decision

- `PATCH_RECOMMENDED`：shadow 归档、active prose 压缩和 template schema 化。
- `BACKTEST_REQUIRED`：用 assignment-local registry slice 替代分支全量 registry 读取。
- `shared_files_modified: false`
