# Rule Audit Report — GlobalISel exceptional static cost correction

## 中文摘要

- `audit_id`: `RULE-AUDIT-20260814-GLOBALISEL-INCONCLUSIVE-COST-CORRECTION-R19`
- 结论：`USER_POLICY_DECISION_REQUIRED__RECOMMEND_ONE_BOUNDED_EXCEPTIONAL_STATIC_CORRECTION`
- 推荐：批准一次且仅一次题目级静态例外修正，把 native directional copy cost 从错误的 `5` 改为 `4`，把 `P_local` 从 `9` 重算为 `8`，保持 `P_joint=4`，然后由未参与修正构造的 Stage 0 closing lane 独立复核。
- 不建议当前转入 `HUMAN_RESEARCH_RESERVE`：问题是 AI 可独立完成、信息增益高且范围很小的静态证书修正，不是人工核心能力或资源阻塞。
- 若用户不愿再投入，可选择可逆撤回/继续 hold；这不是科学 `STOP`。未经明确批准不得启动修正。
- 共享文件修改：`false`。

## Identity and scope

- 触发状态：`INCONCLUSIVE_POLICY_HOLD__WITNESS_DECLARED_COST_NOT_NATIVE_ACTION_COST`
- 题目：`GLOBALISEL-REG_BANK-ISEL-REPAIR-JOINT-PLAN`
- 普通 revision：`1/1 consumed`
- 审计证据 ceiling：`STATIC_EXISTING_ARTIFACT_REVIEW_ONLY__NO_NEW_SCIENTIFIC_EXECUTION`
- 本次只读材料：Stage 0 PRIMARY、独立 confirmation、revision1、独立 closing 及各自 assignment/handoff/manifest。
- 范围外：修订执行、源代码获取、编译、运行、实验、Stage A/B、候选状态迁移、共享控制文件修改、联系任何 lane。

## 现行规则是否正确工作

现行 `AGENTS.md` 与 `rules/ROLE_STAGE0_REVIEW.md` 要求：普通 `REVISE_ONCE` 耗尽后，若 closing 发现构造无效、既不能可信 PASS 又没有科学 STOP 证据，必须进入 `INCONCLUSIVE_POLICY_HOLD`；只有用户以题目、原子门、次数、证据 ceiling 和写目录均明确的授权批准 exceptional revision 后才能继续，而且必须由未参与构造的 lane 独立 re-close。

本题的状态处理符合这条规则。closing 没有把数字错误静默改掉，也没有把“证书未闭合”误判为机制被吸收或不可能。因此这里不需要修改全局规则；需要的是一次题目级用户政策例外。

## 证据链与问题定性

| 观察 | 已冻结材料 | 审计判断 |
|---|---|---|
| PRIMARY 与 confirmation 只给出条件性 Tier-B 路线 | PRIMARY decision=`REVISE_ONCE`; confirmation=`CONFIRM_REVISE_ONCE` | 没有提前 PASS；流程正确 |
| revision1 冻结 AArch64/AAPCS64/+neon、同一 GMIR、完整局部 action grammar 与 `A64-RBI-FDP` | revision1 report/action audit | 研究对象、动作和算法边界已足够具体，不是尚未定义的泛想法 |
| revision1 把最终 `%x:GPR -> FPR` repair 定价为 5，写成 `P_local=9` | revision1 report/action audit/handoff | 决定性 declared-cost certificate 中的事实错误 |
| closing 按 `copyCost(DesiredRegBank, CurRegBank)` 重算；此处是 `copyCost(FPR,GPR)=4` | closing report/handoff | `P_local=4+4=8`; `P_joint=4` |
| restricted load/OR 的 GPR/FPR alternatives 同价且 GPR-first；Greedy 只在严格更低时更新 | revision1 与 closing 一致 | strict-tie 导致的局部 GPR-first 行为没有被成本修正推翻 |
| `RepairingPlacement` 未被证明能回滚此前映射并构造 `P_joint` | closing | 未发现 direct absorption；但仍为 `SEARCH_BOUNDED_OPEN`，不是绝对无碰撞声明 |
| 原 gate 要求 exact declared-cost frontier | PRIMARY/confirmation/revision1 assignments | 数字虽小，却属于门控命题；不能当作非行为勘误 |

### 关键算术

冻结的四个 mapping unit costs 保持不变：

`1 + 1 + 1 + 1 = 4`

修正后的 native ledger 是：

| Plan | Mapping | Repair | Total |
|---|---:|---:|---:|
| `P_local` | 4 | `copyCost(FPR,GPR)=4` | **8** |
| `P_joint` | 4 | 0 | **4** |

因此成本优势仍严格存在，差值从错误证书隐含的 5 缩为 4。该变化不改变 Greedy 在前置 equal-cost alternatives 上的 strict-tie 行为，也不自行证明 Stage A 的 full-cost 优势。

## A/B/C 决策矩阵

| 方案 | 科学诚实性 | 信息增益/成本 | 状态风险 | 建议 |
|---|---|---|---|---|
| A. 一次 bounded exceptional static correction + independent closing | 高；明确承认旧证书失败并重建依赖项 | 高/低；只需静态定向成本与算术传播 | 低，只要不覆写旧证据且 fail closed | **推荐** |
| B. 用户导向 reserve | 不产生错误科学结论 | 低；把可由 AI 独立封闭的小问题长期搁置 | 容易把 reserve 误作 revision-budget 旁路 | 不推荐；仅当用户明确选择暂存 |
| C. 撤回/保持 hold | 诚实，且不是 STOP | 不再花时间，但放弃一个仍有结构性 residual 的低成本判别 | 无科学误报，存在假阴性机会成本 | 用户不批准 A 时的合理选项 |

## 推荐的最小安全范围

### 唯一允许修正的内容

1. 在全新、不可覆盖的 exceptional 目录中，把 witness 的 repair call direction 明写为 `Desired=FPR, Current=GPR`。
2. 从冻结的 native semantics 重建该方向的 cost 行，确认 `copyCost(FPR,GPR)=4`；不得交换参数或使用反方向的 5。
3. 重算 `P_local=8`、`P_joint=4` 及所有依赖这两个值的 declared-cost、Pareto/frontier 和 claim-matrix 文字。
4. 给出一张完整的 primitive-action ledger，逐行列出 mapping/action、方向、单位成本、来源锚和求和，避免只替换两个数字。
5. 给出旧证书到新证书的精确 delta，并声明 revision1 与 closing 原件均不修改、不过期、不被删除。

### 必须冻结、不允许改变的内容

- LLVM commit `ba5bccfe01368f76e74d6ff4c35f1330e155b4ba`、AArch64 target、AAPCS64、`+neon`、同一 legalized SSA GMIR witness。
- `G_LOAD/G_OR/G_FADD` restricted grammar、目标 RBI alternatives、Fast/Greedy/完整 `RepairingPlacement` union、信息条件和下游 pipeline。
- strict `<` tie behavior、GPR-first catalog order、`A64-RBI-FDP` 的边界状态与 action-to-path/path-to-action 结构。
- same-object、current collision、强公平 baseline、natural route、full-cost、复现、claim ceiling 和 Q2 最低线。
- `SEARCH_BOUNDED_OPEN`；不得把修正描述成已证明无 direct literature collision。

### 明确禁止

- 新 target、新 witness、新 action、换 cost model/weight、改 comparator、扩 theorem domain、加入新的机制或“顺便修正”其他科学缺口。
- 实现、编译、native replay、benchmark、实验、下载、联网检索、Stage A/B 或性能结论。
- 覆写 revision1/closing；把例外修正计作原普通 revision 的无痕替换；自动批准第二次 exceptional correction。

## 独立 closing 合同

- 构造 owner：由主线分配原长期 Stage 0 PRIMARY owner 或另一条未承担 closing 的 Stage 0 lane；一次只写修正目录。
- closing owner：必须是未参与 exceptional correction 构造的长期 Stage 0 closing/sentry lane。
- closing 必须独立重算：API 参数顺序、directional cost、四个 mapping costs、`8 vs 4`、strict-tie 行为、当前 union 是否构造 `P_joint`，以及修正值是否完整传播到 frontier/claim matrix。
- `CONFIRM_STAGE0_PASS` 只在整个静态 gate 闭合时允许；不能因“只差一个数字”降低审查。
- 若发现 direct absorption、witness 非法、native ledger 使严格 residual 消失或 action/path 证书结构性失效，可按真实科学证据作 STOP。
- 若只是又有静态证书缺项/歧义，则回到 `INCONCLUSIVE_POLICY_HOLD__EXCEPTIONAL_STATIC_CORRECTION_UNCLOSED`；不自动给第三次机会。

## 风险分析

- 假阴性风险：直接撤回会丢弃一个已具备明确同对象动作差异、且修正后仍有严格静态成本差的低成本候选。
- 假阳性风险：若只文本替换 `9→8` 而不重建 primitive ledger，可能掩盖其他方向/成本传播错误；所以要求完整逐项证书与独立 closing。
- 科研诚信风险：把旧证书原地改写会破坏 revision/closing 的可追溯性；新目录与 old→new delta 是硬门。
- 资源风险：低；授权只覆盖静态材料，不覆盖实现和实验。
- 状态风险：无授权前保持原 hold；例外失败后也不得自动 reserve、PASS 或复活任何 STOP。

## 验收与回滚

验收必须同时满足：

1. exceptional 输出目录与 closing 输出目录均为全新且各自 manifest 全通过；
2. 原 revision1/closing 的 registered hashes 不变；
3. ledger 机械得到 `P_local=8`、`P_joint=4`，方向为 `copyCost(FPR,GPR)`；
4. 所有依赖 `4 vs 9` 的表述均被逐项列入 delta，并在新证书中一致改为 `4 vs 8`；
5. independent closer 没有参与构造，并独立确认所有 gate，而非接受 owner 的结论；
6. 没有 implementation、run、download、Stage A/B、共享多写者或 evidence-ceiling 漂移。

回滚是封存新 exceptional/closing 目录并保持原 `INCONCLUSIVE_POLICY_HOLD`；绝不删除或覆盖旧 revision。用户若不批准，零执行、零状态变化。

## 精确用户授权文本

> 批准 `GLOBALISEL-EXCEPTIONAL-STATIC-COST-CORRECTION-20260814-R19A`。仅允许主线为题目 `GLOBALISEL-REG_BANK-ISEL-REPAIR-JOINT-PLAN` 建立一次且仅一次 `EXCEPTIONAL_STATIC_CORRECTION 1/1`：构造 lane 只能写入 `<LEGACY_LOCAL_PROJECT_ROOT>\stages\stage0\_revisions\GLOBALISEL-REG_BANK-ISEL-REPAIR-JOINT-PLAN\exceptional-static-cost-correction-r19a\`，保持 LLVM commit、AArch64/AAPCS64/+neon、同一 GMIR witness、action grammar、current union、strict-tie semantics、比较器和所有科学硬门不变；仅将 native call direction 冻结为 `copyCost(FPR,GPR)=4`，重算 `P_local=8`、`P_joint=4`，并重建所有依赖的 declared-cost/frontier/claim-matrix 静态证书和逐项 old→new delta。不得覆写 revision1 或原 closing。完成后必须由未参与构造的独立 Stage 0 closing lane 仅写入 `<LEGACY_LOCAL_PROJECT_ROOT>\stages\stage0\_reviews\round-20260814-globalisel-exceptional-cost-r19a-closing\GLOBALISEL-REG_BANK-ISEL-REPAIR-JOINT-PLAN\`，独立复核 API 参数方向、每项 native cost、`8 vs 4` 算术、strict-tie、union-external action 与整个原子 gate。证据上限固定为 `STATIC_NATIVE_ACTION_AND_COST_CERTIFICATE_ONLY__NO_BUILD_NO_PERFORMANCE_CLAIM`。本授权不允许新 target/witness/action/cost model/机制、实现、编译、运行、实验、下载、联网、Stage A/B、第二次 exceptional correction 或生产/正式项目推进。若独立 closing 未 PASS，除非出现 direct absorption、非法 witness 等真实科学负证据，否则回到 `INCONCLUSIVE_POLICY_HOLD__EXCEPTIONAL_STATIC_CORRECTION_UNCLOSED`；不得自动 reserve、撤回或 STOP。主线仅可按 single-writer 登记本 assignment 及其独立 closing 的实际结果。

## Mainline handoff

- 当前授权：`NOT_YET_PRESENT_FOR_EXCEPTION`
- 建议决策：`REQUEST_EXACT_USER_APPROVAL_TEXT_ABOVE`
- 全局规则 patch：`NO`
- 现有候选状态迁移：`NO_CHANGE_UNTIL_APPROVAL_AND_INDEPENDENT_CLOSING`
- 本审计共享文件修改：`false`

