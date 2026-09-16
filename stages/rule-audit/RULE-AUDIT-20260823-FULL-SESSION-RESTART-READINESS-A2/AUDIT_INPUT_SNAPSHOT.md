# 审计输入快照

- `audit_id`: `RULE-AUDIT-20260823-FULL-SESSION-RESTART-READINESS-A2`
- 日期：2026-08-23（Asia/Shanghai）
- 工作根：`<LEGACY_LOCAL_PROJECT_ROOT>`
- 审计性质：只提案；未修改共享文件

## 已检查的权威入口

- `AGENTS.md`：25,097 bytes，159 行，SHA256 `26DB9F4C2D43349A2BA5B741947561D4FED2FE5EC65327C02D273D3905F5A522`
- `plan.md`：10,471 bytes，64 行，SHA256 `4C4A8C2BEED93BE43378BADB0503631C2B971C5156D95AFFF068CE9315B224A2`
- `registry.yaml`：1,682,391 bytes，24,985 行，SHA256 `9FEF8A512F8419BCE095C18D2182D152B198F3BC3991F0568EB4B9AD58399707`
- `registry.yaml` 当前含约 262 个顶层记录、543 次 `assignment_id` 字面出现；它保存大量历史/兼容状态，不适合作为每个新分支会话的无差别人工入口。

## 已检查的生产角色规则

- `rules/ROLE_MAINLINE.md`
- `rules/ROLE_DISCOVERY.md`
- `rules/ROLE_DISCOVERY_BACKTEST.md`
- `rules/ROLE_STAGE0_REVIEW.md`
- `rules/ROLE_CANDIDATE_OWNER.md`
- `rules/ROLE_STAGEA_REVIEW.md`
- `rules/ROLE_STAGEB_INDEPENDENT_REVIEW.md`
- `rules/ROLE_RULE_AUDIT.md`
- `rules/ROLE_PAPER_PROJECT.md`
- `rules/RESOURCE_LOCALIZATION.md`
- `rules/DISCOVERY_CLAIM_PACK.md` 的条件入口与状态
- `rules/CORE_POLICY.md` 的 reference-only 状态

## 已检查的项目级 skills

- `.agents/skills/research-topic-discovery/SKILL.md`，SHA256 `FC041AE3DB89DDEA1771076E0824929C6AA29C9A34A08BE30C7F322F51721CD2`
- `.agents/skills/research-topic-discovery/references/source-portfolios.md`
- `.agents/skills/research-topic-discovery/references/selective-depth.md`
- `.agents/skills/hardware-stageb-runner/SKILL.md`，SHA256 `8FF96AF2F3E36AAE883CD7C831DE69FFDE2997373DB534569C2CD7EDA04E4649`
- `.agents/skills/hardware-stageb-runner/references/evidence-and-escalation.md`
- `.agents/skills/hardware-stageb-runner/references/hardware-domain-checks.md`
- `.agents/skills/hardware-stageb-runner/scripts/init_stageb_task.py`
- skill 自带 assets 与生产 `templates/` 的命名/字段对应关系

## 使用的方法

- 使用 `academic-research-suite` 的流程分层、证据/推断分离、handoff 与可复现性检查原则。
- 逐角色检查七项：身份/目标、最小读取、权限/写边界、顺序方法、结论/停止、canonical 工件、主线交接。
- 逐入口检查：文件是否真实存在、名称是否一致、条件 skill 是否被强制加载、重开后是否必须依赖旧聊天记忆。

## 不在范围内

- 不审查任何候选科学结论。
- 不启动 Discovery、Stage 0/A/B、回测、下载、实验或自动化。
- 不修改 `AGENTS.md`、`plan.md`、`registry.yaml`、`rules/`、`templates/` 或 `.agents/skills/`。

