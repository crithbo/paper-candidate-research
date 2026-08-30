# Stage B Autonomous Execution Specification

## 1. 目标

把 Stage B 从“结果交付清单”补全为 agent 可长期复用、可恢复、可审计的执行协议。在不降低 Q2、same-object、latest collision、公平强基线、自然证据、full-cost、复现和 claim ceiling 的前提下，尽量由 agent 完成 claim-critical 实现、比较、评测、重放和整理，只在逐题批准、资源越界、所有权或真正 blocker 时使用用户时间。

## 2. 进入条件

Stage B 仅在以下条件全部成立时初始化：

- 独立 Stage A gate 已被主线机械验收；
- registry 为 `PENDING_USER_STAGEB_REVIEW`；
- 用户查阅逐题材料并签发与 topic/assignment 匹配的非空 `stageb_user_approval_id`；
- 主线冻结唯一写目录、输入/规则哈希、claim ceiling、kill gates、资源 envelope 和自主恢复 envelope；
- 分配的候选 lane 没有其他 active assignment。

generic 规则批准不能替代逐题 Stage B 批准。

## 3. 强制工件

在首个 claim-bearing observation 前，题目 Stage B 目录必须至少包含：

- `STAGEB_EXECUTION_CONTRACT.yaml`；
- `STAGEB_WORK_BREAKDOWN.yaml`；
- `ENVIRONMENT_LOCK.yaml`；
- `AUTONOMOUS_RECOVERY_LEDGER.yaml`；
- `CLAIM_EVIDENCE_MATRIX.yaml`；
- `RUN_INDEX.yaml`。

最终还必须包含 prototype/baseline/harness、immutable run directories、`REPRODUCE.md`、`STAGEB_REPORT.md`、`handoff.yaml` 和严格 SHA manifest。

## 4. B0–B6 状态机

| 子阶段 | 必做工作 | 前进门 | fail-closed 行为 |
|---|---|---|---|
| `B0_CONTRACT_FREEZE` | 冻结对象、claim、kill gates、资源/恢复 envelope、命令所有权、停止条件 | 合同字段 100% 完整，批准 ID 匹配 | 拒绝初始化 |
| `B1_PRECLAIM_PREFLIGHT` | 环境锁、current-upstream、强基线、原子动作映射、小 witness、full-cost 采集和 smoke | 所有 hard predicate 可执行/可复核 | 范围内自行纠错；越界才 blocker |
| `B2_CORE_IMPLEMENTATION` | reference/oracle、完整候选机制、checker、baseline、deterministic replay | same-object fidelity 与核心测试通过 | 结果不得 claim-bearing |
| `B3_KILL_GATE_LADDER` | 按低成本高否决力排序执行碰撞、合法性、吸收、最小自然 probe、full-cost | 每门有明确 PASS/FAIL/UNRESOLVED | 决定性科学失败停止昂贵后续工作 |
| `B4_PAPER_GRADE_EVIDENCE` | 主自然 workload、正交验证、强基线、消融、统计、full-cost、no-gain/failure region | 至少一个主要 claim 决定性支持且覆盖闭合 | 不足则按真实证据 REVISE/STOP/BLOCKED |
| `B5_INTERNAL_REPLAY` | 未编写该组件的子代理或父 lane 的隔离重放；raw→table 重算、hash 与 claim matrix | deterministic exact 或预注册 stochastic/environment tolerance 通过 | mismatch 必须显式，不得提交 ACCEPT |
| `B6_FREEZE_AND_HANDOFF` | 冻结报告、命令、输入、结果、负证据、ceiling、manifest | 主线机械验收 | 只投递独立 Stage B review，不创建项目 |

## 5. kill-gate 排序

每题必须按预计信息增益/成本排序，而不是先跑最大实验。默认优先级：

1. `DIRECT_FATAL`、current collision、形式反证；
2. action legality、same-object fidelity、当前源码语义；
3. strong-union absorption 与 comparator parity；
4. 最小自然对象 decisive run；
5. paper-grade full-cost；
6. 规模、鲁棒性、迁移与正交验证。

较早 gate 给出决定性科学负结果时，停止尚未必要的昂贵运行并保留负证据。资源或构建失败不是科学负结果。

## 6. 自主恢复 envelope

逐题批准包必须冻结：允许来源/工具/版本、网络字节、存储、CPU/GPU/设备时长、最大重试次数、超时、允许的同语义替代、全局环境禁区和失败后的恢复点。

在 envelope 内，owner 无需逐次打断用户，可依次：

1. 检查日志、hash、版本、磁盘、现有缓存和环境变量；
2. 在题目目录内重建隔离环境；
3. 使用获批 portable toolchain 或 exact-commit clean build；
4. 按批准次数重试官方获取路线；
5. 使用 hash 一致的官方镜像或预先批准的同语义开源替代；
6. 缩小 smoke/pilot 规模但不改变对象、保证或 claim ceiling；
7. 从最近 immutable checkpoint 恢复并记录 attempt。

任一路线成功后继续当前子阶段；全部路线耗尽或需要权限扩张时才形成 blocker。不得静默重试、覆盖失败目录、使用任意非官方镜像、降低保证、删除强基线或把替代对象当原对象。

以下必须暂停：私有数据/密钥/许可证、未公开所有权、系统级安装/全局环境修改、超预算大型下载、排他设备或 EDA、付费资源、外部通信，以及任何会改变对象/主要 claim/保证的路线。

## 7. repair 与 revision

`ENGINEERING_CORRECTION_IN_CONTRACT` 仅在 exact object、原子动作、机制、比较器、workload、指标、保证、claim 和证据路线均不改变时成立。它可修复 build、parser、计时器、checker、实现 bug 或报告生成错误，不消费 scientific revision，但必须：

- 记录 defect、影响范围与修复 diff/hash；
- 把所有受影响 run 标为 `INVALIDATED_NON_EVIDENCE`；
- 从最近可信 checkpoint 重跑；
- 在资源/attempt envelope 内完成。

修改机制、模型、比较器、主要 workload、指标、保证、claim 或证据路线属于 `SCIENTIFIC_REVISION`，仍受 Stage B `REVISE_ONCE` 限制。换对象、删强基线、改分母或降保证不得伪装成工程纠错。

## 8. 并行与单写者

- 每个 active Stage B topic 只有一个父候选 lane；
- 父 lane 唯一写 canonical 合同、报告、矩阵、handoff 和 manifest；
- 最多三个一层子代理，分别优先承担机制、baseline/full-cost、replay/collision；
- 子代理只写预分配 scratch/run 子目录；不得同时编辑 canonical 文件；
- 不以多数投票决定科学结论；父 lane必须核验每项来源、命令和 hash；
- Stage B 顶层 WIP 默认 1；只有两个题目逐题获批、资源互斥检查通过且存在两个独立 lane 时可 burst 到 2；共享 GPU/build/EDA/data path 默认串行。

## 9. claim-bearing 后的 blocker

若已有部分有效 observation 后，后续正交验证、规模、设备或数据受阻，状态仍可为 `BLOCKED_USER_ACTION_REQUIRED`，但 blocker packet 必须额外记录：

- 已验证 claim 与证据 hash；
- 未闭合/不支持 claim；
- 当前 evidence ceiling；
- 未执行 gate 及其对论文充分性的影响；
- 可继续的其他已批准工作及完成状态；
- 精确恢复入口。

不得用资源失败否定已获得的科学证据，也不得把部分证据升级为 Stage B PASS。

## 10. 独立复审

独立 reviewer 必须核对 B0–B6 轨迹、批准 envelope、run 分类、invalidated 结果隔离、repair/revision 分类、claim-evidence matrix、full-cost 和 clean replay。Reviewer 可以重放入口、只读源码核验和独立重算，但不得修候选、补主要机制或生成唯一正结果。

## 11. ARS 适配

`academic-research-suite` experiment-agent 的 monitoring、timeout、deterministic/stochastic/environment-sensitive 分类和 reproducibility verdict 可复用。其通用“每次命令和每次 retry 都请求用户”的默认安全语义，在本项目中由题目级 `stageb_user_approval_id + STAGEB_EXECUTION_CONTRACT + AUTONOMOUS_RECOVERY_ENVELOPE` 提供等价的事先明确授权；超出 envelope 后仍必须请求用户，且不得外传私有数据。

