# 软卡点自主恢复与方法重设计规则

## 授权与目的

本规则依据用户授权 `USER-AUTONOMOUS-SOFT-BLOCKER-REDESIGN-20260826` 生效。目标是在不降低论文质量和科学硬门的前提下，减少对用户的常规中断：凡可由题目范围内工程纠错、有限替代方案、一次合法 mechanism pivot/revision 或新 ID 重新发现来继续的课题，主线应自主冻结并推进；只有真实外部硬阻塞或强制用户门才即时请求用户动作。

本规则不授权跳过 same-object、current collision、公平强基线、自然/canonical 证据、full-cost、复现、claim ceiling、独立 gate、Stage B 用户门、正式项目门或 revision 次数限制。

## 四类处置

### 1. `SOFT_ENGINEERING_BLOCKER`

包括 assignment-local 的 build、parser、checker、timer、wrapper、路径、缓存、命令编排、报告生成、依赖消费或 instrumentation 缺陷。只要 exact object、原子动作、机制、比较器、workload、指标、保证和 claim 均未改变，主线可自主冻结 `ENGINEERING_CORRECTION_IN_CONTRACT`：

- 保留失败 raw 与旧 handoff；
- 精确限定允许修改的文件、字段、命令和 attempt；
- 受影响结果全部失效并从最近可信 checkpoint fresh 重放；
- 每条新路线仍只有冻结次数，不允许静默 retry；
- 不消费 scientific revision。

### 2. `SOFT_METHOD_BLOCKER`

包括 proxy/action 不完整、候选与强基线未区分、比较器输出未被消费、自然分母构造无效、观测性不足、局部 witness 不足或非决定性负结果。主线先做独立或风险相称的 fidelity 审核；若同时满足以下条件，可自主冻结一个有界同对象重设计：

- 原 exact object、主要 RQ、claim endpoint、保证、自然/canonical workload 和公平强基线保持；
- 没有 `DIRECT_FATAL`、形式反证或有效自然 full-cost 决定性负结果；
- 当前阶段的 `MECHANISM_PIVOT / REVISE_ONCE` 尚未消耗；
- 改变可写成一个有限合同，列明原子门、一次执行次数、证据 ceiling、唯一写目录和 falsifier；
- 不通过删强基线、改分母、结果后排除、降保证或换对象获得成功。

满足时不再逐项请求用户 generic START；主线完成 hash-pinned context、ACK、START 与独立 gate。若同一阶段 revision 已消耗，则仍按 `INCONCLUSIVE_POLICY_HOLD` 和 exceptional revision 规则停下，本通用授权不构成 exceptional revision。

### 3. `NEW_ID_REDESIGN_ROUTE`

若可行方案必须改变 exact object、主要 RQ、原子动作、保证、自然分母或 claim endpoint，旧题不得原名复活。主线可自主：

- 保留旧题终态、失败核、资源与 resume capsule；
- 创建五字段 identity 明确不同的新候选 ID；
- 投递既有 Discovery lane，重新执行 current-source reality check、碰撞审查和 Stage 0；
- 把旧题证据仅作为已登记 contrary/failure-kernel 输入，不继承旧题的 PASS、novelty 或 scientific conclusion。

新 ID 仍须达到 `TIER_B_Q2_VIABLE`，不能成为规避 STOP、revision 或基线门的改名。

### 4. `HARD_EXTERNAL_OR_USER_GATE`

以下情况才即时向用户报告并请求动作：

- 系统/管理员/重启/WSL/驱动/SDK 或全局环境权限；
- 不可替代设备、私有数据、凭据、许可证、未公开 artifact 或外部 owner；
- 获批公开获取路线耗尽后仍缺 exact 输入；
- 需要扩大冻结资源预算、付费资源、排他设备或外部通信；
- `PENDING_USER_STAGEB_REVIEW`、formal project approval、作者/venue/投稿等强制用户门；
- 已消耗普通 revision 后需要 exceptional revision。

硬阻塞必须包含最低用户动作、版本/哈希/大小/许可、替代形式、已用 attempts/cost 和精确 resume point。等待不会变成 scientific STOP。

## 科学终态与汇报

- `DIRECT_FATAL`、形式反证、独立 gate 接受的自然/full-cost 决定性负结果和合法 `STOP` 不属于软卡点；同一 ID 不得继续。
- 科学 STOP、PASS、HOLD 和新发现的决定性负证据仍进入周期性主线报告，但不因无需用户动作而打断用户要求授权。
- 用户即时中断只用于 `HARD_EXTERNAL_OR_USER_GATE`、安全/污染/共享写冲突或必须由用户选择的政策分歧。

## 调度与生命周期

- 优先级：已验收 handoff 的单点工程纠错 → 同对象有限重设计 → 新 ID Discovery/Stage 0 → 浅层新发现。
- Stage A A0/A1 与题目累计预算以 `AGENTS.md` 为唯一规范；本协议只负责把预算耗尽路由为 execution hold、hard gate、可逆政策门或用户明确 exceptional continuation，不得自动再派 successor或形成科学 STOP。
- 最多复用现有 2–4 个长期 lane；不得为每次修补创建一次性会话。
- 每个恢复 assignment 必须有独立写目录或明确 addendum 边界、frozen hashes、attempt/budget、old evidence preservation 和 lifecycle plan。
- soft recovery 不授权 owner 清理；仍由 MAINLINE 按 `ARTIFACT_LIFECYCLE` 验收、downstream acceptance、containment、reparse 与 active-process 门执行 exact-leaf GC。
