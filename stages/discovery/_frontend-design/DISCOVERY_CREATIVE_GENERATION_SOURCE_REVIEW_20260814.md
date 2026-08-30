# Discovery 创意生成层来源审查（2026-08-14）

## 结论

本项目继续采用“改造现有 Discovery 前端”，不直接安装外部 skill 运行时。优先吸收高使用度、方法可审计且适合本项目的机制；GitHub stars/forks、npm 下载和维护活跃度仅是使用度代理，不是统一评分，也不证明科学正确。

## 参考优先级

1. `Imbad0202/academic-research-skills`：GitHub 主页面在本次核验时约 42.4k stars / 3.4k forks。采用探索式与目标式提问分离、Socratic 反问、FINER 只用于收敛、Devil's Advocate、避免过早闭合和 generic noun-swap 检查。
2. `Orchestra-Research/AI-Research-SKILLs`：独立索引约 11.2k stars；GitHub 约 822 forks；npm 当前约 493 weekly downloads。采用 creative-thinking 的八种发散框架，以及 brainstorming 的“先生成、后评价”、保留异常想法、两句测试和最强反对意见。
3. `andrehuang/research-companion`：GitHub 约 702 stars / 60 forks。采用 `Seed → Diverge → Evaluate → Deepen → Frame → Decide` 的阶段分离和 conclusion-first/idea-critic 思路，但不采用其单一 Pursue/Refine/Kill verdict 替代项目硬门。
4. `joshzyj/open-scholar-skill`：GitHub 约 111 stars / 15 forks。只作为 human-in-loop、可审计阶段门和独立验证边界的交叉校验；其社会科学期刊定位不直接迁入本项目。

## 已采用

- Question Card 前新增非证据性的 `DIVERGENCE_SEED_POOL`；先发散、后聚类、再选 locator。
- 八种发散引擎：结构联想、问题重构、约束操纵、反转、抽象阶梯、邻接可能、矛盾并置、组合/拆分/简化。
- 每路最多 12 个短 seed，至少四种引擎；seed 阶段不联网，外部 locator/raw/C0/deep 容量不增加。
- generic noun-swap 检查、机制层结构映射、异常想法 append-only backlog。
- conclusion-first 两句测试与用户/操作者/维护者/编译器工程师/硬件架构师/测量审稿人/理论研究者的视角轮换；两者只改善创意表达与覆盖，不作证据门。
- coverage-constrained portfolio selection，避免单一成熟工具表面支配；不强制 Top-N。
- 生成与评价分离；FINER、反方和最便宜 falsifier 在收敛后使用，不在第一句创意出现时提前淘汰。

## 明确不采用

- 直接安装第三方运行代码、自治全论文流水线或外部状态机；
- 星数/热度/venue 名声作为录取证据；
- 多数投票、可补偿总分、强制输出固定数量好题；
- seed 数量作为 raw、机会数、precision 或科学召回率分母；
- 用人工偏好替代独立 Stage 0；本项目的人工权力仍是政策与资源决定，科学准入仍按冻结证据门；
- 网络安全、漏洞、攻击、防御、协议安全、恶意流量与 exploit 方向。

## 与现有科学门的关系

创意层只扩召回，不移动 Question Card、same-object、current-source reality check、强基线、自然/canonical carrier、full-cost、可复现性、Stage 0 或 Stage A gate。一个 seed 即使很新奇，也必须从 locator 开始重新经过完整证据漏斗。
