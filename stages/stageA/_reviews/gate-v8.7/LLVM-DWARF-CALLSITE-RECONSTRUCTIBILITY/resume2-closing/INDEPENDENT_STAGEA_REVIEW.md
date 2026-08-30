# LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY Independent Stage A Review

## 中文摘要

- 审查结论：`STOP`；独立确认该冻结机制在本次 Stage A 范围内为 `BELOW_Q2_STOP`。
- 决定性理由：结果盲冻结的 30 个自然 call sites 全部保留，仅 site 02 形成 1 个原生 reconstructibility 正例；在全部 30 点和 18 个可执行 paired points 上，reconstructibility gain 的 p50 与 nearest-rank p90 均为 0。失败样本并未被静默删除，且仅看 18 个完整 paired points 仍为 1/18，因此 11 个 writer/roundtrip failures 不决定负结论。
- 主要风险或证据缺口：预登记的 killer 使用定性词 `nontrivial boundary`，没有冻结一个事后可机械套用的正例比例阈值。本裁决不把 p90>0 伪装为预登记数值门，而是依据 1/30、1/18、17/18 完整配对零收益及两个分母 p50/p90=0 的联合证据，判断自然边界不足以维持冻结的 Q2 论文形状。
- 建议下一步：主线仅登记这一窄冻结方向为 `STOP`；不得启动 Stage B，也不得把结论外推为 LLVM、DWARF call-site information、register allocation 或 reconstructibility 的一般不可能性。
- 需要用户决定：无。该科学 STOP 不请求 Stage B 授权。

- Review lane id: `STAGEA-GATE-REVIEW-LANE-1`
- Assignment id: `STAGEA-G1-20260815-LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY-RESUME2-CLOSING-V8.7`
- Input freeze SHA-256: `F6C0854A5616FFD72B183EBBB1FE40BC843CDCA67073DC193A8BD45018B12D7E`
- Reviewer non-participation and cross-assignment contamination declaration: reviewer 未参与 owner 实现或运行；未把前题未登记事实作为证据；`cross_assignment_contamination=false`。
- Decision: `STOP`
- Quality tier: `BELOW_Q2_STOP`
- Confidence: `0.94`
- Evidence ceiling: `STAGEA_DIRECTIONAL_RISK_PILOT_ONLY__FROZEN_LLVM_COMMIT_X86_64_SYSV_AND_30_SITE_COMPILER_RT_CORPUS__NO_GENERAL_IMPOSSIBILITY_CLAIM`
- Pre-claim contract fidelity gate disposition: `PASS_BEFORE_ACCEPTED_CLAIM_BEARING_OBSERVATIONS`
- Candidate action completeness / proxy check: 冻结的 allocation-time value retention、native register/CSR/CFI 路径在小 witness 与自然 paired run 中实际物化；不是 metadata-only/emitter-only proxy。
- Native codec/solver/reader/format parity: 两臂使用同一 LLVM commit、MachineIR/ABI、native writer、DWARF/unwind reader 与对象格式；唯一正例另有同 harness 的执行控制。
- Metric denominator and full-cost dimension completeness: 30/30 冻结点保留；18 个可执行 paired points 单独报告；对象、`.text`、debug payload/relocation、`.eh_frame`、planner/writer/reader CPU/wall/RSS 已计。原生 cycles 未观测且未估算，因而不能支持性能主张，但不会把零 reconstructibility prevalence 翻转为自然边界。
- Candidate Q1 venue family: compiler/debug-information optimization；当前证据不足以维持 Q2，故不作 Q1 venue 推荐。

## Frozen-input and manifest audit

- Assignment 文件独立复算 SHA-256 为 `F6C0854A5616FFD72B183EBBB1FE40BC843CDCA67073DC193A8BD45018B12D7E`，与主线冻结值一致。
- Owner `HASH_MANIFEST.sha256` 独立逐项复算为 `60/60 PASS`，无缺失、无哈希不匹配；manifest 本体 SHA-256 为 `75FB92A04BD42A678FC81560E22CED028378B61F3CA965B99D3EB508A5A14C90`。
- 决定性输入哈希与 assignment 一致：`NATURAL_CORPUS_RESULTS.json=ECC73BF2603EBAD24C77578037ED5C1D53F8FE9E08861BAFA3445709145474F5`，`NONSECURITY_CORPUS_FREEZE.json=373D25F5238185F82B51225B00BA8058483CC44C9AD9AC27828D8AA23F7477EA`，`SITE02_EXECUTED_BEHAVIOR.json=54E9464347646AEA4C49E344923C2273C3FEA79A06DB439163949F8201703DEC`，`FULL_COST_LEDGER.json=860712DFB7C3BB210665B2BAB9890951661DAC3AE91EBF8C51D2A1AE535A1336`。
- 本审查只读解析、静态审计和重算既有 JSON/文本；未运行新的 claim-bearing 实验，未联网，未修改 owner 包。

## Claim and novelty-route consistency

冻结对象保持为 LLVM `e72ba6cf366a3180cbf5a8690d9e50665880ab76`、`x86_64-unknown-linux-gnu` SysV、`-O2 -g`、InstrRef/LiveDebugValues 下的同一 optimized MachineIR/ABI/executable behavior 与原生 DWARF call-site observation。候选动作是 bounded debug-critical call cut 上 target-specific allocation-time value retention 与合法 CSR/CFI 计划；保证只覆盖冻结 bounded call-cut class 的 exact Pareto frontier，不是 generic register allocation、通用 ILP 或 post-emission patch。

Stage 0 的条件性 Q2 路线要求 Stage A 证明冻结动作可原生执行，并在结果盲自然分母中出现足以承载论文的 residual boundary。前一部分得到一个真实正例；后一部分被本次自然语料证据否定。因此 STOP 不是“动作从未成功”，而是“该冻结自然边界不足以维持最低论文形状”。

## Pre-claim ordering and fidelity audit

Resume1 的 `PRE_CLAIM_FIDELITY_GATE.md` 明确记录 gate `PASS`、gate 闭合时 claim-bearing observations 为 0，并把 common-bitcode comparator correction 定位在任何 accepted observation 之前。该修正保持同 optimized input、目标、ABI、reader/writer 与动作合同，属于 preclaim fidelity correction，不是看过自然结果后的 mechanism pivot。

随后冻结 current-union grid 的 3,072/3,072 arms 完成，14 个 unique objects，冻结 witness 上 reconstructible arms 为 0。Resume2 再固定自然语料和 30-site 分母。未发现先看自然结果再选择语料、改动作、改主要指标或删除失败点的顺序污染。

## Natural denominator recomputation

`NONSECURITY_CORPUS_FREEZE.json` 声明选择时未检查 candidate/union 结果。它从同一 pinned commit 的 `compiler-rt/lib/builtins/` 冻结 15 个 translation units，经“每个 call 先取最低参数，再按 translation unit 确定性轮转”的规则，从 73 个 eligible sites / 36 个 distinct calls 选择 30 点。

独立把 freeze 与 `NATURAL_CORPUS_RESULTS.json` 逐行连接，得到：

- indices 恰为 1..30，input、function、basic block 与 call offset 顺序一致；
- 30 个点全部存在；
- 18 个点包含完整 baseline/candidate native arms；
- 11 个点为 native baseline MIR roundtrip 或 writer failure，仍保留在 30 分母；
- 1 个点为 frozen mapper/fidelity mismatch，仍保留；
- 17 个完整 paired points 无 accepted gain；
- 唯一 accepted gain 是 site 02。

这同时支持两个口径：全部冻结分母为 1/30，完整可执行配对子集为 1/18。后者排除了“STOP 只是由 12 个不可执行点稀释分母”的解释。

## Decisive evidence audit

独立从 30 行重建 gain vector，并使用 owner 脚本中公开的 nearest-rank 定义 `ceil(q*n)`：

| Denominator | n | Positive | p50 | p90 nearest rank | Decisive rank |
|---|---:|---:|---:|---:|---:|
| Frozen all-sites, failures retained | 30 | 1 | 0 | 0 | rank 27 remains 0 |
| Executable paired subset | 18 | 1 | 0 | 0 | rank 17 remains 0 |

这与 `FULL_COST_LEDGER.json` 完全一致。冻结 killer 的原文是 `NATURAL_CORPUS_HAS_NO_NONTRIVIAL_BOUNDARY_AFTER_THE_GATE`，不是一个数值频率阈值。因此本报告不声称“p90>0 已预登记”；裁决基础是：结果盲有限分母上只出现一个尾部正例，且在消除 fidelity failures 后仍有 17/18 完整 paired points 为零。对这条冻结论文路线而言，natural boundary 风险已被决定性击中。

## Sole-positive same-object and behavior audit

Site 02 (`__do_fini`) 是真实正例，不得抹去：candidate 把同一 source value 经 `RBX` 保留再送入 `RDI`，保持 CFG、call regmask 和 debug records 不变；MachineVerifier、native writer、DWARF verify、unwind reader 与 disassembly 均通过。相对 baseline，candidate 增加 1 个 reconstructible parameter 和 1 个 `DW_OP_breg3` call value；对象 +16 B、`.text` +0 B、debug payload +16 B、debug relocation +0 B、`.eh_frame` +0 B。

执行 replay 将 `__do_fini` 的 linkage 对两臂同样从 internal 改为 externally linkable，使用同一 harness 两次调用函数。两臂各 3 次 warmup 与 30 次 repeat 均 exit 0，stdout/stderr 均为空，故该控制支持 frozen function 的行为等价。Blinkenlights wall time 只可作执行控制，不能当作 native cycles。另一个要求 allocated sections/relocations 字节完全相同的 `SITE02_BEHAVIOR_EQUIVALENCE.json` 对合法动作过度约束且已作 invalidated non-evidence；本裁决不使用它的 FAIL。

## Baseline fairness audit

Current union 在同一 LLVM commit、同一 optimized witness input 与同一原生 writer/reader 下覆盖冻结的 allocator、CSR cost、InstrRef/VarLoc、entry-value、shrink-wrap 和有限 pressure/split/spill controls；3,072 个 arms 全部可执行，冻结 witness 上 0 个 reconstructible arms。它证明动作不是一个已在该 witness 上由冻结 current controls 表达的普通 flag/configuration。

重要边界是：3,072-arm union 没有在全部 30 个自然 sites 上重跑。因此它不能证明“自然 site 02 已被 current union 吸收”，本报告也不据此作 direct-absorption STOP。科学 STOP 只依赖预登记的自然边界 killer；缺少自然全量 union 可能影响更强的 absorption claim，却不会把 1/30、1/18 与 p50/p90=0 改成足以承载冻结 Q2 路线的 natural support。

## Cost, ablation and failure-mode audit

18 个 executable pairs 的关键 paired deltas 独立重算如下：

- object bytes：p50 0，p90 +16，范围 0..+48；
- `.text` bytes：p50 0，p90 +8，范围 -1..+32；
- debug payload bytes：p50 0，p90 +16，范围 0..+17；
- debug relocation 与 `.eh_frame`：p50/p90 均 0。

Ledger 另覆盖 planner、writer、reader 的 CPU/wall/RSS 与 fallback/失败。原生 runtime cycles 对自然全集未观测，且明确未估算。这禁止任何运行时性能正结论；但负裁决来自 reconstructibility gain 在结果盲自然分母上的稀疏性，而不是假定未观测成本为零。任何未观测运行时成本至多影响这个唯一正例的代价判断，不能创造额外 29 个自然收益点。

## Latest collision audit

本 assignment 禁止联网，reviewer 未新增文献或 upstream 搜索，也未把网络缺失解释为 absence。冻结同 commit current-union 是本次可独立核验的最新同对象比较器。它支持“非普通配置重放”的机制性边界，但仅限 frozen witness；本 STOP 不依赖一般 latest-literature absence claim。

## Independent Q1/Q2 recalibration

- Candidate comparator audit: 同版本、同对象、同 native format 的 current union 在 witness 上公平；自然全集仅有 default/candidate paired comparison，未作自然全量 union absorption 推断。
- Venue/status verification: 本轮不新增外部 venue/status 证据；网络使用被 assignment 明确禁止。
- Independently added or replaced paper: 无。
- Editor/venue-fit view: 1/30 的尾部 reconstructibility 正例不足以支撑冻结的自然边界论文形状。
- Methodology view: 结果盲 30 点、失败保留、18 点 executable sensitivity analysis 与双口径 p50/p90 构成稳健的 Stage A 负风险证据。
- Domain-contribution view: target-specific call-site reconstructibility 仍可能在别的对象、语料、目标或新问题定义中成立，但那不是本题的继续路线。
- Devil's-advocate view: 最强反驳是“唯一正例也是真实机制证据，稀有但重要的 case 可能值得研究”。本 gate 接受正例真实性，但冻结题并未预登记 importance-weighted endpoint 或稀有事件论文形状；在看过结果后转向该 claim 会换研究问题。
- Status: `PARITY_NOT_PLAUSIBLE`
- Bounded gap audit: 欠缺的不是可留给 Stage B 的额外 workload/统计，而是冻结自然对象上最低论文形状所需的非空、非尾部 residual region。

## Q1/Q2 sufficiency judgment

- Clear problem: yes，call-site argument reconstructibility 在同一 native LLVM/DWARF 对象上定义清楚。
- Non-trivial contribution: bounded action 本身非普通调参，且 site 02 证明其可原生物化。
- Credible current evidence: yes，但方向是决定性窄负证据。
- Executable formal-experiment gap: no，若继续必须在已见结果后改 corpus/endpoint/稀有事件 claim，而不是闭合一个 Stage B 规模缺口。
- Reviewer-recognizable paper narrative: 对冻结 Q2 claim 为 no。

## Non-relaxable quality audit

- Same-object: PASS within the frozen native LLVM/MachineIR/ABI/DWARF boundary.
- Latest collision: PASS for the frozen same-commit executable union on the witness; no broader absence claim.
- Strong fair baselines: PASS for fidelity/current-union witness testing; natural-site absorption not claimed.
- Natural input/evidence: FAIL for the preregistered nontrivial-boundary requirement.
- Full-cost: PASS for directional risk judgement; native-cycle performance claim remains out of ceiling.
- Reproducibility: PASS，owner manifest 60/60，canonical rows and summaries independently recomputed.
- Evidence/claim honesty: PASS only under the narrow STOP scope below.

## Reproducibility and claim ceiling

独立复算没有执行候选程序，也没有产生新正证据；只读取冻结 artifacts，核对 hashes、行级分母、dispositions、paired deltas、行为日志与统计函数。结果可由 `NATURAL_CORPUS_RESULTS.json`、`NONSECURITY_CORPUS_FREEZE.json`、`FULL_COST_LEDGER.json`、`SITE02_EXECUTED_BEHAVIOR.json` 和冻结脚本重建。

允许的最高结论是：**在 LLVM commit `e72ba6cf366a3180cbf5a8690d9e50665880ab76`、x86_64 SysV、冻结 15-TU compiler-rt builtins 来源和结果盲 30-site selection 下，该 bounded call-cut allocation-time retention 机制仅产生 1/30（可执行子集 1/18）正例，两个分母的 p50/p90 均为 0，因而未形成预登记的 nontrivial natural boundary。**

不允许的外推包括：LLVM/DWARF reconstructibility 普遍不可能、所有 compiler-rt sites 无收益、其他 target/ABI/corpus 无收益、一般 register allocation 不可改进、或 site 02 的正例无效。

## Required stop kernel

`STOP_KERNEL = RESULT_BLIND_FROZEN_30_SITE_NATURAL_DENOMINATOR__ONE_ACCEPTED_NATIVE_GAIN_ONLY__EXECUTABLE_SENSITIVITY_1_OF_18__P50_ZERO_AND_NEAREST_RANK_P90_ZERO_IN_BOTH_DENOMINATORS__PREREGISTERED_NONTRIVIAL_NATURAL_BOUNDARY_NOT_ESTABLISHED`

- Recommended mainline state: `STOP`
- Stage B authorized: `false`
- Stage B user approval id: `null`
- Scientific revision consumed by this review: `false`
- Lane terminal state after freeze: `IDLE_REUSABLE_AWAITING_MAINLINE`

