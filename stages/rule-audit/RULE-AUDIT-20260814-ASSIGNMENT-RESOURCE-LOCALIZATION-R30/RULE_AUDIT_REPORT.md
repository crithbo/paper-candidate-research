# Rule Audit Report

## 中文摘要

- 发现的问题：现行规则已经要求唯一写目录、有限资源 envelope、隔离/便携环境、下载 provenance/hash，以及禁止系统级安装；但没有统一的 assignment 级 `RESOURCE_ROOT`、标准子目录、进程局部重定向、下载前 fail-closed 检查和逐次资源清单。
- 影响：主动下载或构建产生的文件可能散落在默认缓存、临时目录或不同题目目录中，难以统计总大小、证明来源、判断能否删除，也增加误删用户目录或工程根的风险。
- 建议修改：新增一个跨角色公共协议 `rules/RESOURCE_LOCALIZATION.md` 和一个 `templates/RESOURCE_INVENTORY.yaml`；角色文件只保留短引用，避免重复和会话阅读负担。
- 是否需要用户批准：用户已在本会话明确批准，主线可在下一安全 assignment 边界实施；不需要再次请求相同 generic approval。

## Identity

- `audit_id`: `RULE-AUDIT-20260814-ASSIGNMENT-RESOURCE-LOCALIZATION-R30`
- `trigger`: 用户要求所有主动科研下载、构建、环境、缓存和临时文件严格局部化并可清理。
- `requested_by`: USER
- `date`: `2026-08-14`
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260814-ASSIGNMENT-RESOURCE-LOCALIZATION-R30/`
- `shared_files_modified: false`

## Current authoritative behavior

现有规则提供了四块基础，但彼此没有闭合：

1. `rules/CORE_POLICY.md` 要求 assignment 冻结唯一写目录、资源和权限。
2. `AGENTS.md` 与 `rules/ROLE_MAINLINE.md` 允许题目级公开/开源自主获取，要求来源、字节、存储、CPU/wall 和 attempt 上限，禁止系统安装/全局环境修改。
3. `rules/ROLE_DISCOVERY.md`、`ROLE_STAGE0_REVIEW.md`、`ROLE_CANDIDATE_OWNER.md` 要求下载来源、许可证、字节、哈希并在唯一目录隔离构建。
4. `ROLE_MAINLINE.md` 已提到只有具有复用价值的资产可留在 `projects/_assets/`，但没有规定它是唯一共享资产根、资产登记模式或 assignment 消费方式。

缺失项正是用户本次要求的六个机械门：统一根、统一布局、进程局部 redirect map、不能重定向时下载前 fail closed、逐 run inventory、只从冻结根清理。

## Evidence and classification

| Observation | Authority | Classification |
|---|---|---|
| 各角色只写 assignment 目录，但没有规定 pip/npm/git/build/temp 等写入面必须落在其中 | multiple role rules | Rule/schema gap |
| Stage B 合同有 `workspace_bytes_max` 和安装禁令，但没有 `RESOURCE_ROOT` 或 inventory | `templates/STAGEB_EXECUTION_CONTRACT.yaml` | Template gap |
| blocker 包记录下载大小/hash，却不能列出一次运行留下的全部可删除资源 | `templates/USER_BLOCKER_PACKET.md` | Auditability gap |
| shared cache/asset 表述分散，硬件 skill 允许“approved shared cache”但未冻结唯一根 | hardware Stage B skill + mainline | Ownership ambiguity |
| cleanup 只要求绝对路径和活跃任务检查，没有 root containment/reparse/inventory deletion gate | `rules/ROLE_MAINLINE.md` | Destructive-safety gap |

## Correct scope boundary

能够强制本地化的是项目主动控制的持久化操作：论文/数据/源码下载，压缩包，clone，隔离环境，包缓存，构建树，转换结果，临时文件和日志。

不能诚实保证全部位于 D 盘的是 Codex 应用、Windows、驱动、浏览器、IDE 和预装 Python/Node/工具链自己的既有系统缓存。这些可作为外部系统依赖被读取，但不得记成项目资产；如果项目主动调用的工具有可配置缓存或临时目录，则仍必须重定向。不能可靠重定向而又会开始下载、安装、解压或构建的工具必须在动作前停止。

## Risk analysis

- False-negative/scientific risk: none；资源路径规则不改变候选录取、证据门或 scientific revision。
- Reproducibility risk without patch: medium-high；下载来源与实际本地内容可能脱节，环境/构建不可完整清点。
- Disk/cleanup risk without patch: high；无法从单一根估算或安全删减，默认缓存可能散落。
- Performance risk from patch: low-medium；全文件内容哈希大型 mutable build/cache 会拖慢。提案因此区分 content SHA、tree manifest 和明确标注的 metadata-index hash；claim-critical 文件始终使用内容 SHA。
- Compatibility risk: medium；正在运行的 assignment 已冻结规则，不能强搬或改写。采用新 assignment 强制、active assignment 下一资源边界 compatibility addendum。
- Destructive risk: reduced；清理必须精确解析 root、拒绝 reparse traversal，并由 inventory 控制。

## Recommendation

- Decision: `PATCH_RECOMMENDED`
- Minimum effective change: 一个公共协议、一个 inventory 模板、AGENTS/CORE/MAINLINE 的简短权威入口，以及资源活跃角色/模板的短引用或字段。
- Why smaller wording-only fix is insufficient: 只在 AGENTS 写一句“下载放 D 盘”无法告诉每个会话如何处理 package cache、TEMP、构建树、共享资产、目录哈希和清理边界。
- Non-relaxable gates preserved: Q2、same-object、current collision、strong baseline、natural/canonical、full-cost、reproducibility、claim ceiling、STOP non-revival、Stage B/formal approval全部不变。

## Proposed ownership and readability design

为了服务长期主线/支线会话并保持可读性：

- `AGENTS.md`：只写一段不可违反的摘要和“所有 assignment 读取公共资源协议”的入口；
- `rules/RESOURCE_LOCALIZATION.md`：唯一详细语义源；
- `rules/ROLE_MAINLINE.md`：只写主线冻结 root、登记共享资产和执行 cleanup 的职责；
- 其他 role：每份只加 2–4 行，说明资源生产前读取协议并 fail closed；
- `templates/RESOURCE_INVENTORY.yaml`：机器可读清单；
- Stage B/formal/blocker/handoff 模板只增加引用字段，不复制整段规则。

## Validation and rollback

- Historical scientific backtest: not required。
- Mechanical validation required:
  1. 用一个非科学 fixture assignment 创建八个目录并生成 inventory；
  2. 验证所有设置仅作用于子进程；
  3. 验证一个本地零网络小文件可进入 `downloads/`、哈希和大小一致；
  4. 验证 workspace root、stage root、用户目录、未解析变量、glob、junction/reparse target 全部 fail closed；
  5. 验证 inventory 缺字段或 root mismatch 会阻止资源命令；
  6. 验证 shared asset 只能由 mainline 登记并被 lane read-only 引用。
- Rollback: 在没有新 assignment 引用时可恢复共享文件旧 hash并移除新增协议/模板；已经按新协议冻结的 assignment 继续使用原冻结合同直到 handoff，不得中途取消隔离或把资源移出根。

## Mainline handoff

- User approval already present: `true`
- Proposed approval ID: `USER_ASSIGNMENT_RESOURCE_LOCALIZATION_20260814`
- Backtest required: `false`
- Mechanical implementation validation required: `true`
- Existing states affected: none
- Existing active assignments: no retroactive move/delete; addendum only at next resource-producing boundary
- Shared files modified by audit: `false`

