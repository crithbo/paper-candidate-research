# 全会话重启就绪矩阵

| 会话/角色 | 做什么已写清 | 怎么做已写清 | 权限/停止已写清 | skill/模板入口 | 重启就绪度 | 主要缺口 |
|---|---|---|---|---|---|---|
| Mainline | 是 | 是 | 是 | 部分 | 部分就绪 | `plan.md` 没有当前 lane→assignment→下一动作看板；分支被要求通读巨大历史 registry；正式论文 lane/状态衔接不完整 |
| Discovery S1–S6/M1 | 是 | 是 | 是 | 完整，强制读取 `$research-topic-discovery` | 就绪 | 只需接收新的冻结 assignment/context，不应依赖旧聊天 |
| Backtest PACKER | 是 | 是 | 是 | 条件协议明确 | 基本就绪 | 缺统一 restart/context 包，但角色隔离与交付明确 |
| Backtest EXECUTOR | 是 | 是 | 是 | 条件协议明确 | 基本就绪 | 同上；必须继续保证看不到 key/目标身份 |
| Backtest AUDITOR | 是 | 是 | 是 | 条件协议明确 | 基本就绪 | 同上；不得由重启过程破坏独立性 |
| Stage 0 PRIMARY/SENTRY/DECISIVE | 是 | 是 | 是 | 报告与 comparator 模板明确 | 就绪 | 新会话仍需冻结 exact assignment 和最小上游，不应从全 registry 猜任务 |
| Stage A/B Candidate Owner | 是 | 是 | 是 | Stage A/B 报告模板明确 | 部分就绪 | 硬件 Stage B skill 未被列为条件必读；Stage B canonical 工件与 skill initializer 不一致 |
| Stage A Independent Gate | 是 | 是 | 是 | 独立审查模板明确 | 就绪 | 需 restart/context 包确认未参与 owner 工作 |
| Stage B Independent Review | 是 | 是 | 是 | 独立审查与 comparator 模板明确 | 就绪 | 需 restart/context 包确认独立性和 frozen inputs |
| Rule Audit Sentry | 是 | 是 | 是 | 审计模板明确 | 就绪 | 应以 idle/新 assignment 重开，不继承旧聊天中的未登记判断 |
| Formal Paper Project Owner | 是 | 基本是 | 是 | 只写“formal-project templates”，未逐一列名 | 部分就绪 | Mainline 长期会话池未列正式项目 lane；主状态机停在 `FORMAL_CANDIDATE`，与 AGENTS/论文角色的后续状态不完全一致 |
| Independent Manuscript Review | 部分 | 部分 | 是 | 与 owner 共用角色文件 | 未完全就绪 | assignment 未强制冻结 `FORMAL_PROJECT_OWNER / INDEPENDENT_MANUSCRIPT_REVIEW` mode，容易混淆作者与独立审稿人职责 |
| Resource Localization | 是 | 是 | 是 | 条件必读已标注 | 就绪 | Stage B initializer 尚未按 assignment 级 `resources/` 布局生成 |

## 总判断

现行体系已覆盖绝大多数科学任务和阶段方法；不需要重写全部规则。重启前必须解决的是控制面可恢复性，而非增加更多科学门：

1. 让每个新会话有唯一、很短、可核验的当前 assignment/context；
2. 让 `AGENTS.md` 的角色映射同时标出 role、skill、条件协议和 canonical 输出；
3. 对齐 Stage B 规则、模板和 hardware skill；
4. 补齐正式论文阶段的 lane、mode 与状态衔接；
5. 通过 bootstrap 演练证明新会话不看旧聊天也能正确说明“我是谁、现在做什么、下一步是什么、不能做什么”。

