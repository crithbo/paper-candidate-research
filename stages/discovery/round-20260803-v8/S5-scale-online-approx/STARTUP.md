# DISCOVERY-S5-SCALE-ONLINE-APPROX 启动检查

- 会话：`DISCOVERY-S5-SCALE-ONLINE-APPROX`
- 批次：`round-20260803-v8`
- 机会来源：`O5_SCALE_ONLINE_OR_APPROXIMATION`
- 工作日期：2026-08-03（Asia/Shanghai）
- 唯一写目录：`stages/discovery/round-20260803-v8/S5-scale-online-approx/`
- 当前输出级别：`NONPRODUCTION_RAW_RECONNAISSANCE`

## 读取与权限检查

已按磁盘当前内容完整读取：

1. `AGENTS.md`
2. `plan.md`
3. `registry.yaml`
4. `rules/ROLE_DISCOVERY.md`
5. `templates/TOPIC_BRIEF.md`
6. `academic-research-suite/SKILL.md`
7. `academic-research-suite/ars/deep-research/WORKFLOW.md`
8. deep-research 当前所需的 bibliography、source-verification、synthesis 与 devil's-advocate 角色文件
9. GPU/编译器方向所需的 `hardware_design_papers.md`

启动时指定目录不存在，因而没有目录内的本波输入包或 S5 回测 handoff 可读。未越界读取其他来源会话目录。

## 回测前置门

`registry.yaml` 的 discovery method 为 v2，并明确要求新来源会话首次生产前完成独立历史回测。用户委派也明确说明 v2 尚未完成独立历史回测。因此：

- `production_allowed: false`
- `grounded_brief_allowed: false`
- `PROPOSE_STAGE0_allowed: false`
- `stage0_creation_allowed: false`
- 本轮只允许启动检查、可复现搜索策略和 4–6 个 raw opportunities。

这不是候选学术否决；它只限制本会话在回测通过前的产出等级。

## S5 搜索问题

优先寻找以下可观察转换：

1. 离线精确/组合优化方法在图规模、设备规模或请求规模增长后，求解时间超过可用编译/部署窗口；
2. 小规模方法在动态 shape、流式 token、动态 process group、更新流或未知未来请求下失去可部署性；
3. 可通过分解、层次化、anytime、局部修复、在线原始–对偶或可证明近似形成 `N2` 的残余；
4. 自然 workload 中存在稳定的局部性、偏斜或缓慢漂移，可支撑 `N3` 并决定算法动作；
5. 离线 OPT 仅作为 ceiling；部署比较必须与候选处于同一信息条件、同一语义和同一成本账本。

## 预先纳入与排除标准

纳入：

- exact object、决策变量和信息到达顺序可以写清；
- 至少存在一个可量化的规模/在线失效锚点；
- 可提出两个非同义机制；
- 有公开论文或 artifact，可构造 72 小时小探针；
- 可能形成算法、系统或编译器层面的 `N2/N3`，而不是仅有工具封装。

排除或降级：

- wrapper、checker、dashboard、普通 controller；
- 单 issue replay、换 API/硬件/应用名；
- 把离线 oracle 当作可部署基线；
- 不完整计入重配置、迁移、编译、profiling、cache warmup、质量损失或维护暂停；
- 把多个现成组件做万能 union 后据此声称新颖性；
- 在 2025–2026 直接相邻工作已经覆盖 exact object 时，仅靠“更大规模”重新包装。

## 证据与表述纪律

- 优先使用官方 proceedings、作者 arXiv/OpenReview 页面和官方项目文档。
- 2026 年近期 arXiv 结果标记为 `PREPRINT_RECENT`，不等同于同行评审结论。
- 本轮没有对全部来源执行 Semantic Scholar/OpenAlex/Crossref 三索引程序化三角验证；来源存在性以官方 proceedings 或原始预印本页核验。
- 所有“未找到”均表述为 `NOT_FOUND_WITHIN_SEARCH`，不声称全球首次。
- raw opportunity 中的数值是文献报告锚点，不是本项目复现实验结果。
- GPU/硬件相关方向当前最多主张算法、编译器或软件证据；没有 RTL、P&R、硅片或商品集群测量时不抬高证据等级。

## 启动结论

启动检查通过，但生产门关闭。本轮将交付 6 个非生产性 raw opportunities，其中保留高碰撞和负向侦察，以防止回测通过后在拥挤谱系上重复包装。

