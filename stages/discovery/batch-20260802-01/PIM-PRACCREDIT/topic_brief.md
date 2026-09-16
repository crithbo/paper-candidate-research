# PIM-PRACCREDIT Security-credit scheduling for PRAC-constrained host/PIM co-execution

- Status: `PROPOSE_STAGE0`
- Primary lane: PIM/体系结构；安全–性能协同
- Discovery date: 2026-08-02
- Novelty state: `SEARCH_BOUNDED_OPEN`

## Research question

在 host 与 banked PIM 共享 DRAM、且 RowHammer 防护采用 PRAC/RFM/back-off 的系统中，能否把每 bank/row 的 activation headroom 当作显式安全 credit，联合决定 PIM micro-op 的发射、拆分和 bank placement，从而在保持防护保证的同时减少 host stall 与强制 RFM 干扰？

## Importance and group fit

[PRAC 分析](https://arxiv.org/abs/2406.19094)表明阈值降低时 back-off/RFM 会带来显著调度约束；[COSM](https://arxiv.org/abs/2606.30553)则直接研究 CPU/PIM 的 command co-scheduling。这两个趋势交叉后，PIM 不再只是占用空闲周期，还会消费与安全机制耦合的 activation budget。问题影响的自然 workload 包括公开 AiM/PIM memory traces、CPU–PIM concurrent kernels 和 adversarial/benign activation streams。

该题不是普通 PIM mapping、单一 RowHammer checker 或 dashboard。它要求一个保证保持的跨层 scheduler，并把 RFM/back-off、PIM command expansion、metadata 与 host interference 全部计入。

当前 registry 没有同一 PRAC–host/PIM 调度对象；工作区也未提供课题组完整公开论文表或未公开题目清单，因此组内所有权仍须主线/研究者在升级前确认。

## Exact object

- 系统对象：在公开 cycle-level DRAM/PIM simulator 中，PIM macro-op 被展开为可观察 ACT/PRE/RD/WR/compute command，host 请求与 PIM 请求共享 bank/command bus。
- 安全对象：PRAC/RFM 或 QPRAC/MOAT 等可公开建模的 per-row/bank activation state和 back-off 规则。
- 决策：何时发射/暂停/拆分 PIM burst，在哪个等价 bank 放置下一 tile，以及为 host 保留多少 security headroom。
- 主要指标：在相同安全上界下的 host/PIM weighted slowdown、RFM/back-off 次数、row-buffer/locality 损失和调度开销。
- 证据 ceiling：Ramulator2/AiM 类 simulator；不外推为 JEDEC 器件或 silicon 结果。

## Opportunity map

- 技术变化：PRAC 将防护状态暴露为会阻塞请求的动态约束；CPU/PIM 并发又让 activation demand 由两个命令源共同决定。
- strongest baseline 边界：COSM 优化 idleness/preemption；QPRAC/MOAT 优化安全控制；P-PIM 让特定 PIM 结构自跟踪 RowHammer。尚未在本批范围内找到以 security credit 为共同调度资源、并同时选择发射/拆分/placement 的同对象工作。
- 自然 workload：Ramulator2 trace、公开 GDDR6-AiM 模型和 PIM kernels，外加明确标注的 adversarial activation trace。
- 72 小时观察：先证明 simulator 中 PIM 操作确实展开为可计数的 activation；再比较 `COSM scheduler + QPRAC controller` 是否已经做出相同决策。

## Strongest fair baseline

1. [COSM](https://arxiv.org/abs/2606.30553) 的 CPU/PIM co-scheduling 与 preemptable PIM commands；
2. [QPRAC](https://arxiv.org/abs/2501.18861) 或 [MOAT](https://arxiv.org/abs/2407.09995) 的安全 PRAC controller；
3. [P-PIM](https://doi.org/10.23919/DATE56975.2023.10137204) 的 PIM-side RowHammer 防护；
4. [Ramulator2](https://github.com/CMU-SAFARI/ramulator2) 上的公平组合 `COSM + QPRAC/MOAT`。

公平比较冻结相同 DRAM timing、PRAC threshold、安全 oracle、host/PIM trace、command expansion 和 metadata/storage 开销；不得把更弱安全阈值换来的吞吐当作提升。

## Mechanism hypothesis

首选假设：PRAC headroom 可以建模为会随 ACT 消耗、随安全动作恢复的不可借用 credit。若 scheduler 在选择 PIM burst 时同时约束 bank-local credit 与 host 的短期 activation demand，就能避免“先占空闲 command slot、后触发全局 back-off”的局部最优。

## Competing mechanisms

- Mechanism A — credit-reservation scheduler：决策变量是 per-bank/row credit、host reserve、PIM issue/preempt 时机；预期特异结果是同等安全下减少 back-off burstiness，强反例是 QPRAC priority 已隐含相同保留；最小成本是 Ramulator2 scheduler extension。
- Mechanism B — activation-shaped PIM decomposition：决策变量是一个 PIM macro-op 的 micro-op 顺序、chunk 大小和暂停点；预期结果是不改变 placement 也能平滑 activation，强反例是器件命令语义不允许重排；成本是对公开 PIM command expansion 加合法 rewrite。
- Mechanism C — security-slack-aware bank placement：决策变量是下一 tile/operand 的等价 bank 映射；预期结果是把 PIM activation 转移到高 headroom bank，强反例是数据搬移和 locality 成本吃掉收益；成本必须计入一次映射/搬移与 metadata。
- Preferred mechanism and why: A。它最直接检验“PRAC 是调度资源”这一机制；若 A 被 `COSM+QPRAC` 等价覆盖，而 B 的合法重排空间存在，可保持相同对象、workload、指标使用一次 `MECHANISM_PIVOT` 到 B。C 只有在搬移成本可机械计入时才保留。

## Candidate paper claim

对显式展开 PIM 命令的公开 DRAM 模型，security-credit-aware scheduling 在保持与 QPRAC/MOAT 相同的 RowHammer 安全上界时，相对 COSM 与公平组合控制器减少 PRAC-induced stall/RFM interference，并揭示由 host/PIM activation demand 相位关系决定的可推广 regime。

当前没有结果；该 claim 必须同时包含安全不退化和端到端成本，且只声明 simulator/analytical evidence。

## Current collision subtraction

- COSM：`DIRECT_SUBTRACT`，覆盖 host/PIM co-scheduling，但其公开主要对象不是 PRAC security headroom。
- QPRAC/MOAT：`DIRECT_SUBTRACT`，覆盖 PRAC 安全/性能控制，但不是 PIM command 的联合发射/拆分/placement。
- P-PIM：`METHODOLOGICAL_ADJACENT`，在特定 dual/triple-row activation PIM 结构内自跟踪和缓解 RowHammer。
- 公平组合基线是最危险反例；只有它没有给出同一决策、同等保证和同等成本时，residual 才成立。当前记 `SEARCH_BOUNDED_OPEN`。

## Decisive falsifier

第一 fatal：公开 simulator 中 PIM 内部 row operations 无法以不改变研究对象的方式映射为 PRAC 可计数 activation。第二 fatal：`COSM + QPRAC/MOAT` 已在相同命令流上做出相同 issue/preempt/credit 决策并得到同等安全保证和成本。若 A 失败但 B 有合法独立重排空间，允许一次 pivot；若只有调权重或普通 bank mapping，停止。

## Executable evidence path

公开路径为 Ramulator2 + COSM/QPRAC 代码或论文中可重建策略，并选择 [GDDR6-AiM simulator](https://github.com/arkhadem/aim_simulator) 作为 PIM command 语义参考。AI 可生成带 ground-truth activation 的微型自然/对抗 trace，运行 CPU simulator，冻结 config、seed、trace、commit 和结果哈希。

### 72-hour first evidence

1. 在 Ramulator2/AiM 源码中追踪一个 PIM macro-op 到 ACT/PRE 序列，冻结 exact semantics。
2. 实现只读 instrumentation，输出 host/PIM 分源的 per-bank activation/PRAC credit timeline。
3. 重建最小 `COSM-like + QPRAC-like` 组合，在一个自然 PIM kernel trace 和一个 adversarial trace 上判断是否出现 baseline 无法预防的后续 back-off。
4. 若没有可观察耦合或组合基线决策等价，立即停止，不进入性能优化。

### AI core fraction and critical path

- 估计 `ai_core_fraction`: 84%
- Class: `AI_CORE_EXECUTABLE`
- AI 可完成：artifact 构建、command 语义追踪、scheduler/controller 实现、trace 生成、模拟、统计、消融、日志/哈希与安全 invariant 检查。
- 核心 claim 在公开 simulator 上可决定；真实 DRAM/PIM 只提高证据 ceiling。
- 主要风险是对象语义是否成立，而不是依赖人工标注或闭源设备。

### Semantics-preserving open alternatives

- 首选 Ramulator2；若 COSM artifact 尚不可用，只按论文重建其公开 scheduler，并把偏差列为限制。
- PIM 语义可用 AiM simulator 或另一个显式 command-level 开源 PIM model；只有保持 ACT/PRE、bank timing 与 host sharing 语义时才算替代。
- 若只能把 PIM 当作黑盒固定延迟，不能声称同对象，必须停止或缩小为新 ID。

## Dual-axis score

- Academic value: `57/70`（重要性 14/15；headroom 12/15；机制深度 15/20；推广性 10/12；独立边界 6/8）
- AI executability bonus: `26/30`（artifact 5/7；核心比例 8/8；开源路径 6/7；速度 4/5；重放 3/3）
- Total: `83/100`

## AI and researcher boundary

AI 能完成决定 simulator-level claim 的核心实现、强组合基线和安全/性能证据。研究者负责确认未公开组内边界、是否认可 simulator ceiling，以及未来是否获取真实 PIM/DRAM 资源；任何 JEDEC/silicon 外推都必须由更高证据支持。
