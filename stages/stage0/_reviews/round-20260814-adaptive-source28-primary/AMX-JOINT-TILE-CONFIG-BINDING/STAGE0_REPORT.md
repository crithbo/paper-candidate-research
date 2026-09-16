# AMX-JOINT-TILE-CONFIG-BINDING — Stage 0 PRIMARY Report

## 中文摘要

- 结论：`REVISE_ONCE`，仅允许一个静态、同一 MachineFunction 的闭合证书门；不得据此进入 Stage A/B。
- 为什么：当前 LLVM 已有完整的 ManagedRA AMX 配置—分配—物理 shape 回写链，且包含 `-O0` fast 配置/分配/回写链。因此“在调用后重载配置”或“在 RA 后写入 TMM shape”本身已被吸收。不过 `-O2` 主链仍是先做配置位置、再 tile RA、最后用 `VirtRegMap` 写物理配置的顺序组合；现有材料没有给出该链与一个联合、有限前沿构造之间的同对象双计划反例，也没有给出 target-specific recurrence。这个狭窄残差尚可被一次静态证书证伪。
- 下一道门：`SAME_MANAGEDRA_MF_TWO_PLAN__UNION_EXTERNAL_CONFIG_BINDING_FRONTIER_CERTIFICATE`。
- 是否需要用户操作：否。

- Lane id: `STAGE0-BATCH-GATE / PRIMARY`
- Assignment id: `STAGE0-P1-20260814-AMX-JOINT-TILE-CONFIG-BINDING-PRIMARY-V8.7`
- Input freeze SHA-256: `232D2B31BB246B9DBA937E1302A1F38DE603FC62FF144F07D9A2B4B6A92D75DB`
- Cross-assignment contamination declaration: 只使用本 assignment 的冻结 Discovery 包、当前 LLVM 官方源和下列公开论文；未把其他题材料或执行结果引入。
- Decision: `REVISE_ONCE`
- Quality tier: `TIER_B_Q2_VIABLE`（条件性；未获 confirmation）
- Confidence: `0.78`
- Evidence ceiling: `E1_STATIC_STAGE0_ONLY__NO_IMPLEMENTATION_NO_RESULT_CLAIM`
- Novelty route: `N2`
- Candidate Q1 venue family: CGO / CC / TACO 的 target-specific code-generation algorithm 形状；目前只满足可信 Q2 潜力，不主张 Q1 对等。
- Stage semantics: conditional paper-potential screen; this report does not establish the main claim.

## Structural paper potential vs current readiness

**Structural paper potential if successful.** 在固定 `ManagedRA`、`+amx-tile` MachineFunction、同一 call/ABI/数值语义下，若能给出一个完整的有限状态算法，同时决定 `PLDTILECFG` 的合法支配/重载位置与八个 TMM 的 shape binding，并以 exact/FPT/certified Pareto 保证严格超出当前顺序链，则是可发表的编译后端 N2，而非调参。

**Current evidence-acquisition readiness/risk.** 路线有限且可复核：LLVM 当前 in-tree AMX MIR 测试已提供真实 ManagedRA、call、shape 的载体；但现有包没有两个完整 stock-native-legal plan、union-external action witness、状态充分性证明或复杂度声明。风险高，故一次 revision 而非 PASS。

缺少实现、编译结果或性能数据不是本决定的 STOP 理由；它们只限制证据上限。这里的修订门要求的是静态同对象 proposition；如果该 proposition 不能定义或被 current union 覆盖，才形成科学停止。

## Frozen object and claim

- Exact object: `FIXED_X86_AMX_MACHINE_FUNCTION__TILE_CONFIG_CALL_ABI_AND_NUMERICAL_OUTPUT`。
- 语义冻结：同一个 `ManagedRA` MachineFunction、x86-64 ABI、call-clobber、tile intrinsic shape、数值输出和 MachineVerifier/对象代码语义；不能改为 MTE、外部 tile runtime 或不同 IR。
- Frozen action: `JOINT_LDTILECFG_DOMINANCE_RELOAD_PLACEMENT__PHYSICAL_TMM_SHAPE_BINDING`。
- Intended claim ceiling: 仅可声称对该冻结 action catalog 的 code-size / config-reload / spill-full-cost Pareto 或理论性质；不得由静态检查声称性能提升。

## Claim-package completeness audit

- Atomic action and mechanism: 选择合法 `PLDTILECFG` placement/reload 与 TMM0–TMM7 binding 的一体化有限前沿 DP，而不是改 `-regalloc`、`-O`、参数或单一 pass 顺序。
- Information/assumption contract: 只读 fixed MachineFunction CFG、shape defs、live intervals、call regmasks、ABI/target 和当前 native action catalog；不得使用 profile、未来编译结果或新增 oracle。
- Effect target/output/guarantee: complete native plan，保留 tile shape、call clobber、frame/stack config 与 object semantics；目标为预注册 lexicographic/Pareto full-cost tuple。
- Boundary/failure region/competing explanation: 仅基本块内可替换、任一 plan 非法、或一切 Pareto 点被 current optimized/fast union 到达时失败；不能把 fast pipeline 的现有 config sinking 重命名为贡献。
- Minimum falsifier: 一个 public in-tree ManagedRA MIR 上，candidate 的任一点均被下面的 complete current union 支配，或两个合法计划并不存在。
- Dependencies and evidence ceiling: 所有源材料可公开取得；无硬件/GPU依赖。

## Positive opportunity map

自然载体不是臆造 trace：当前 LLVM AMX 测试 `amx-sink-config-after-calls.mir` 明确固定 `ManagedRA`，并以 call 后将 `ldtilecfg` 下沉、避免调用覆写配置寄存器值为行为合同；`amx-greedy-ra-spill-shape.ll` 固定 Greedy RA 的 tile shape/use 链。它们证明该语义空间存在，**不**证明联合算法的收益。

## Named baselines and fairness contract

| Baseline | Same-information role | Required full cost |
|---|---|---|
| Current optimized LLVM | `X86PreTileConfig → Greedy(tile-only RA, default x86-tile-ra=true) → X86TileConfig` | all config stores/loads, spills, code bytes, compile CPU/RSS |
| Current fast LLVM | `X86FastPreTileConfig → regallocfast → X86FastTileConfig` | 同上；是强 negative-control，不能被忽略 |
| Customized allocator / `x86-tile-ra=false` | action-boundary control, 非候选弱基线 | 必须列出其改变的 allocator 边界，不能替代 current union |
| Exact enumerator | 小图 oracle only | 仅验证 recurrence，不可当候选方法 |

公平性要求固定同一个 MachineFunction、`+amx-tile`/ABI、目标输出与 full-cost。不同优化级、不同 `-regalloc` 或新 profile 只能作为 action-boundary 对照，不能偷偷替换 candidate 的同对象基线。

## Collision analysis

### Eight-predicate direct-coverage audit

| Predicate | Independent evidence/locator | PASS / FAIL / UNKNOWN |
|---|---|---|
| Same object/function/protocol | LLVM `ManagedRA` guards in all四个 pass；不等于已有联合优化器 | PARTIAL |
| Same scenario/workload | in-tree call/shape test与assignment对象相符 | PASS |
| Same or weaker information | current passes use CFG, shape operands, liveness/VRM；是否共同搜索未证 | PARTIAL |
| Atomic action covered | placement、spill/reload、physical shape write均被各 pass表达；一体联合选择未见 | PARTIAL |
| Same/stronger legality, quality and guarantee | source supplies legality but无global Pareto/exact guarantee | FAIL |
| Same non-worse full-cost boundary | no source-level full-cost optimizer claim | FAIL |
| Comparable scale/platform/version/config | exact current LLVM pin | PASS |
| Sufficient full-text/implementation/reproduction depth | official current source充分；论文直接碰撞仍 `SEARCH_BOUNDED_OPEN` | PARTIAL |

**Direct-coverage disposition:** 没有证据支持“直接论文/当前源码已实现同一个联合有保证算法”的 DIRECT_FATAL；但 current source 已吸收任何只主张 config sinking、call reload 或 RA 后 shape rewriting 的较弱命题。

### Nearest-prior facet matrix

| Prior / source | Config placement | call/clobber handling | physical TMM shape | global joint optimizer / guarantee | Role |
|---|---:|---:|---:|---:|---|
| `X86PreTileConfig` | yes | yes | deferred | no | strongest optimized component |
| Greedy tile RA + `X86TileConfig` | sequential input | allocator | yes, via `VirtRegMap` | no | strongest optimized component |
| `X86FastPreTileConfig` + FastTileConfig | yes | yes, including spill/reload transformations | yes | no | strongest fast-pipeline component |
| Unison-style integrated RA/scheduling | generic integration | generic | not AMX config contract | generic exact/CP framing | subtractor/oracle, not same action |

### Seed-distance and method-name deletion test

去掉“joint”“Pareto”“DP”后，剩余必须仍是：同一 AMX native action grammar 中的 config-dominance/reload 与 TMM-shape binding 的联合**算法/保证**。若剩下的只是调用后 sink、不同 `-O`、tile RA 开关或 generic CP/ILP，则门失败。

## Residual paper kernel and revision gate

唯一 atomic gate 的单一命题：

> 在 pin `3de6fef89d9f9eb602a5bdaa2a3fe2a75a468030`、同一 public `ManagedRA` MachineFunction、固定 x86-64 ABI 与 `+amx-tile` 下，存在两个完整 native-legal plan；其中联合 plan 的冻结 full-cost 向量严格优于 optimized+fast current union 的全部同信息计划，且该差异由一个保留 future legality/cost 的、至多八个 TMM 的 target-specific finite-frontier recurrence（exact、FPT 或 certified Pareto）给出，而非通用 RA/ILP。

**反证条件：** (i) 无两个合法 plan；(ii) 一个当前计划到达每个 candidate point；(iii) witness 只靠改变 optimization level/allocator/object；(iv) recurrence 不能保留后续 call, shape, config, frame 与 TMM legality/cost。任一条即 `BELOW_Q2_STOP__CURRENT_AMX_SEQUENTIAL_UNION_OR_GENERIC_RA_WRAPPER`。

该 gate 是一个可攻击证书（同一 witness、action catalog 和 recurrence 必须共同成立），不是多个独立新题。

## Q1/Q2 paper shape

- Problem: AMX 配置状态与仅八个物理 tile register 的后端资源耦合。
- Contribution: 只有 gate 闭合后才可能形成 bounded-state joint codegen algorithm；当前没有该贡献的实证。
- Evidence plan: 先以 current in-tree MIR 做 exact plan legality/replay；再对自然 AMX-bearing LLVM test/公开 kernel 集作 full-cost Pareto，最后报告失效区。
- Expected paper narrative: target-specific finite action grammar + nonlocal witness + formal/algorithmic frontier + fair current-pipeline evaluation。

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Reference set: Unison/TACO 的 integrated codegen algorithm 形状，LLVM upstream 的真实 target semantics。
- Status: `PARITY_CONDITIONAL`
- Contribution-shape gap: 尚无非通用 recurrence 或 action-divergence witness。
- Evidence-shape gap: 未执行 Stage A；这不是 STOP 理由。
- Stage A closure plan: 仅在 revision 和 confirmation 通过后进行 `PRE_CLAIM_CONTRACT_FIDELITY_GATE`。

## Non-relaxable quality audit

- Same-object: 已冻结；revision不得换 target、ABI、MIR或输出。
- Latest collision: 已作 current-source reality check；论文端为 `SEARCH_BOUNDED_OPEN`，不把传输/未检索到当 absence。
- Strong fair baselines: optimized 与 fast 两链均冻结；不允许只比较单一默认流水线。
- Natural input/evidence: 有 in-tree public MIR/IR 载体；自然规模效应未声称。
- Full-cost: 配置 stack stores、tile spills/reloads、text bytes、compile CPU/RSS、runtime都须进入后续 ledger。
- Reproducibility: current pin、blob hashes、命令及 action mapping见 `SOURCE_AUDIT.md`。
- Evidence/claim honesty: 无实现/结果/性能主张。

## Evidence path and AI completion

- AI executability class: `AI_AUDITABLE_STATIC_ALGORITHM_AND_REPLAY`
- Estimated ai_core_fraction: `0.72`（MIR catalog、enumerator、certificate/replay；真实性能解释仍需后续审查）
- 72-hour first evidence: 固定两个 current in-tree inputs，列举 legal plan action catalog；用 tiny exact checker 验证同一 MachineFunction 的两计划，并比较完整 tuple。若找不到 union-external point，停止。
- Human-only items and why they are non-decisive: 无。

## Fidelity closure plan audit

- Discovery status: `FINITE_FIDELITY_GAP`
- Complete action and native semantics are finite and same-object: 是，TMM0–TMM7、call regmask、shape operands、config stack 和 `VirtRegMap` path皆有 current source locus。
- Comparator, denominator, full-cost and small-witness plan: 固定在本报告的四基线表与唯一 gate。
- Why an unimplemented interface/format/checker is or is not structurally fatal: 不致命；后续 checker 必须读写 same MachineFunction plan、并验证 native legality，不能改作抽象 graph。

## Independent current upstream reality check

- Frozen upstream commit/tag and check date: LLVM official `main` = `3de6fef89d9f9eb602a5bdaa2a3fe2a75a468030`, queried 2026-08-14 by `git ls-remote`。
- Actual source paths/symbols checked: `X86PreTileConfig.cpp`, `X86TileConfig.cpp`, `X86FastPreTileConfig.cpp`, `X86FastTileConfig.cpp`, `X86TargetMachine.cpp`; source blob hashes见 audit。
- Default/non-default configurations checked: hidden `x86-tile-ra` default `true`; optimized path uses PreTileConfig→tile-only Greedy RA→TileConfig; `-O0` fast path uses FastPreTileConfig→FastRA→FastTileConfig; customized `-regalloc` disables tile-RA injection.
- Discovery absence claim confirmed, narrowed or contradicted: **narrowed/contradicted for all component-level claims**。尤其当前测试已经直接覆盖 call 后 config 下沉及 fast配置/物理shape回写。未确认/未否定的是强定义的全局联合 frontier algorithm。
- Any non-tuning residual that remains: 仅上述 gate 中的 finite, future-preserving joint recurrence；若不能给出，不保留残差。

## Stage A highest-risk probe plan

- Risk-bearing premise: fixed `-O2` current union 未包含一个合法的 config-placement/TMM-binding Pareto plan。
- Cheap discriminating probe or counterexample search: first close static revision certificate; then a two-plan verifier over the same MIR.
- Negative result that kills the direction: current union reaches all points, or any purported alternative changes semantics/ABI/target.
- Positive-result ceiling: preliminary support/non-falsification only; not main-claim proof.

## Stop conditions

1. revision gate给不出同一 `ManagedRA` MachineFunction 的两个完整合法 plan；
2. candidate 只复现 FastPre 的 sink/spill/reload 或 TileConfig 的 physical shape writes；
3. action/state/guarantee退化为 generic RA、ILP、pass ordering或开关调参；
4. current complete union 支配所有宣称点。

## Discovery repair vector

- Codes: `R1_CURRENT_UNION_UNDERSPECIFIED`, `R2_WITNESS_ABSENT`, `R3_TARGET_SPECIFIC_RECURRENCE_ABSENT`
- Materiality: 高；它们直接决定 N2 是否存在。
- Was the missing information available before the frozen cutoff?: current-source composition主要可取得；但需独立静态闭合。
- Does this feedback alter the independent scientific decision?: `NO`（本报告为独立裁决）。

## Dual-axis score

- Academic value: `49/70`
- AI executability bonus: `22/30`
- Total: `71/100`

