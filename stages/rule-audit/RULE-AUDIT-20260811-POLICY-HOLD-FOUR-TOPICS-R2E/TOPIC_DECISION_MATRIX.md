# FOUR-TOPIC POLICY-HOLD DECISION MATRIX

`audit_id`: `RULE-AUDIT-20260811-POLICY-HOLD-FOUR-TOPICS-R2E`  
`decision_owner`: `USER`  
`shared_file_writer_if_approved`: `MAINLINE`  
`current_effect`: `NONE`

## 总览

| 题目 | 当前阶段 | 有效保留证据 | 不能 PASS 的原因 | 不能 STOP 的原因 | 推荐政策 |
|---|---|---|---|---|---|
| `S4-SLO-PAGEPACK` | Stage A closing hold | same-object residual 与有限 trace 程序 | allocator、comparator、分母、判定逻辑四轴无效 | faithful strong union 未被执行，且 comparator 有 SLO-illegal 情形 | 继续 HOLD |
| `PARQUET-PAGE-COSEGMENT` | Stage A closing hold | 20 个自然文件、双 replay、340/340 hash、稳定 action 和尺寸事实 | 计价混杂、顺序偏置、representation family 不全 | 去混杂后近似持平，真实 outside-family action 尚存 | 优先批准一次 fidelity-only 例外 |
| `GIN-POSTING-CUT-DP` | Stage 0 closing hold | native hierarchy 映射与潜在 exact DP 路线 | strict-successor witness 错误、`rho` 不充分、warm-cache 不闭合 | 无 direct absorption 或形式反证 | 继续 HOLD |
| `KALLSYMS-VERSIONAWARE-TOKEN-STABILITY` | Stage 0 closing hold | same-object 固定点表述与受限 LKF 路线 | 唯一 witness 被自身 baseline grid 表达 | 单 witness 吸收不证明整类吸收 | 低优先 HOLD；可由用户撤回但非 STOP |

## 1. `S4-SLO-PAGEPACK`

### 可选方案

| 方案 | 精确边界 | 风险 | 最小下一步 | 结束条件 |
|---|---|---|---|---|
| A. 继续 HOLD（推荐） | 不运行、不改状态、不解释为负结论 | 延迟潜在题目 | 无；等待新的用户政策 ID | 用户未来再裁决 |
| B. 一次 exceptional repair | 同对象、同 trace、同 SLO、同目标；必须同时修复 non-overlap allocator/checker、adaptive OBASE first-fit、common-denominator benefit、真实 Pareto 与 planning-work budget | 多轴修改容易实质形成新实验设计；高成本、高再失败率 | 主线先冻结四项静态/可执行断言，再交候选 lane；本审计不执行 | 有效 gate 后 PASS/STOP；若任一构造再次 invalid，则回 HOLD，不再自动追加 revision |
| C. 用户撤回但非科学 STOP | 只做管理处置，不写“机制失败” | 丢失未来可恢复机会 | 用户明确决定，主线登记 | 以用户定义的非科学撤回状态结束 |

### rollback 边界

若方案 B 获批后在首个 claim-bearing observation 前发现任一冻结断言不满足，fail closed，不产生科学结论；新 exception assignment 停止，旧 HOLD 与旧证据保持不变。

## 2. `PARQUET-PAGE-COSEGMENT`

### 可选方案

| 方案 | 精确边界 | 风险 | 最小下一步 | 结束条件 |
|---|---|---|---|---|
| A. 一次 `EXCEPTIONAL_FIDELITY_REPAIR`（推荐） | 保持同一 20-file natural corpus、同对象、同 workload、同 action family、同阈值、同 query set；恢复 Stage 0 的完整 native representation family；分别记录 baseline-only/shared/candidate-only 时间；预注册对称 allocation/amortization；执行 deterministic Latin rotation 和相同 warmup/repetition；不得换机制、换 corpus、调阈值或根据结果增删 arm | 即使公平复验仍可能无 residual；例外先例必须严格限题限次 | 主线取得新的逐题用户批准 ID 后冻结 exception contract；候选 lane 仅做上述 fidelity repair；独立 gate 复核 | 构造有效则由真实结果判 PASS/STOP；若再次构造无效，回 HOLD，禁止再追加例外 |
| B. 继续 HOLD | 不再运行 | 最接近可判定的题目被搁置 | 无 | 等用户未来裁决 |
| C. 用户撤回但非科学 STOP | 只做管理撤回 | 放弃已有高质量自然证据 | 用户明确决定 | 不得把 7.8358% 或旧 126–131× 写成科学 STOP |

### 必须逐项验收

1. `arm_schedule_latin_rotation_coverage = 100%`。
2. `baseline_only/shared/candidate_only` 三类计时均非空且定义冻结。
3. cost allocation 对两臂对称，并同时报告不摊销与冻结摊销口径。
4. Stage 0 冻结的 native representation family 覆盖率为 100%，或在运行前由独立 gate 明确认定某 arm 同对象等价；不得运行后删除。
5. 20 个自然文件、语义 checker、输出 hash、query/full-cost 分母均不改变。
6. 结果由独立 gate 审查；owner 不得自判解除 HOLD。

### rollback 边界

任何验收项在 claim-bearing run 前失败：停止 exception assignment，不覆盖旧目录、不消耗第三次机会、不改变 HOLD。有效运行后即使结果不利，也不得回滚数据；按科学证据判定。

## 3. `GIN-POSTING-CUT-DP`

### 可选方案

| 方案 | 精确边界 | 风险 | 最小下一步 | 结束条件 |
|---|---|---|---|---|
| A. 继续 HOLD（推荐） | 不运行、不改状态 | 延迟一个可能的 N2 方向 | 无 | 等待用户后续单独裁决 |
| B. 一次 exceptional certificate repair | 保持 PostgreSQL frozen commit、same-object `next_gt` 语义与保证；重建 strict-successor witness；给出 Markov-sufficient `rho`；在运行前二选一冻结 `Bc=0` cold proxy 或 joint multikey state；完整列出 buffer/list/offset/end/lossy/exact temporal state 和 full-cost | 容易从“修证书”扩张为新算法；历史 witness 过拟合；中高设计风险 | 先做纯静态 source-semantic 与 state-sufficiency preflight；只有 preflight 全通过才可另行请求执行授权 | Stage 0 独立审查可判 PASS/REVISE/STOP；若证书再次 invalid，回 HOLD，不再自动追加 revision |
| C. 用户撤回但非科学 STOP | 管理处置 | 放弃潜在 exact route | 用户明确决定 | 不形成 direct-absorption 结论 |

### rollback 边界

任何新 witness 必须先由未参与构造的 reviewer 按 frozen current source 手工/机械重放。失败即撤销 exception assignment 的后续执行权，不改变旧 HOLD 或历史证据。

## 4. `KALLSYMS-VERSIONAWARE-TOKEN-STABILITY`

### 可选方案

| 方案 | 精确边界 | 风险 | 最小下一步 | 结束条件 |
|---|---|---|---|---|
| A. 低优先继续 HOLD（推荐的保守选项） | 保留题目但不占 lane | 队列继续携带低成熟度题目 | 无 | 等真正的新 union-external 线索出现后再向用户申请 |
| B. 一次 exceptional novelty repair | same-object、同 R0 保证、同 full-cost；运行前必须提交完整 comparator action map 和至少一个不能由 finite predecessor-token-stability grid 表达的自然 witness；禁止仅通过缩窄 baseline 定义制造外部性 | 事后构造、baseline gaming 与过拟合风险最高 | 先做静态 baseline-externality certificate；没有证书则不得运行 | Stage 0 独立审查；证书不成立即回 HOLD，不再追加 revision |
| C. 用户撤回但非科学 STOP（队列精简选项） | 明确是优先级/资源选择，不是 scientific STOP | 未来若出现新证据需按用户政策恢复或新立项 | 用户明确决定 | registry 不得记录“LKF 被完全吸收” |

### rollback 边界

方案 B 若通过缩窄 union、移除强 baseline、换对象或降保证才获得 witness，视为越界并立即撤销该 exception assignment；不允许把越界结果转为 PASS。

## 用户专属决策点

建议用户只需回答两个政策问题：

1. 是否授权 `PARQUET-PAGE-COSEGMENT` 一次、限边界的 `EXCEPTIONAL_FIDELITY_REPAIR`？
2. 是否批准把 revision-admissibility 工件先做两次非阻塞 shadow，再决定是否写入正式规则？

除非用户另行逐题授权，本矩阵不授权 S4、GIN 或 KALLSYMS 的额外 revision。

