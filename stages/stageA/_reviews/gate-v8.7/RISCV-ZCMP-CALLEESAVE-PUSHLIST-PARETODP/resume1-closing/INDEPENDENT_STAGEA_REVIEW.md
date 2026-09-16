# RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP 独立 Stage A closing review

## 中文摘要

- 审查结论：`STOP`
- 质量标签：`BELOW_Q2_STOP`
- 置信度：`0.94`
- 决定性理由：冻结候选在 4 个结果无关保留的自然函数上，最佳可执行 text/frame 坐标均被当前 LLVM 默认或冻结 union 的可执行 arm 覆盖；独立重算得到 text/frame 的 paired p50/p90 全为 `0 B`，严格 useful residual 为 `0/4=0%`，低于预登记的 `10%` killer，且候选增加规划 CPU/wall 成本。
- 适用边界：只否定冻结 commit、RV32IMAC+Zcmp/ILP32/O2、one-call scalar、`w<=4`、4 个 Embench-IoT 自然函数上的 `WL_ZCMP_PARETO_DP` 机制与成功规则；不否定 Zcmp、一般寄存器分配、任意 CFG、其他 corpus、其他 LLVM 版本或运行时收益的可能性。
- 用户动作：无。不得启动 Stage B。

## Review identity and disposition

- Review lane id: `STAGEA-GATE-REVIEW-LANE-1`
- Assignment id: `STAGEA-G1-20260814-RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP-RESUME1-CLOSING-V8.7`
- Topic id: `RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP`
- Decision: `STOP`
- Quality tier: `BELOW_Q2_STOP`
- Evidence ceiling: `BOUNDED_STAGEA_SCIENTIFIC_NEGATIVE__FROZEN_MECHANISM_AND_NATURAL_4_FUNCTION_DENOMINATOR_ONLY`
- Pre-claim contract fidelity gate: `CONFIRMED_PASS_BEFORE_CLAIM_BEARING_NATURAL_OBSERVATION`
- Reviewer independence: 本 reviewer 未参与 owner 的资源获取、实现、运行或结果选择；`cross_assignment_contamination=false`。
- Stage B: `authorized=false`, `started=false`, `stageb_user_approval_id=null`。

## Input and integrity audit

独立复算 owner canonical manifest 的 `54/54` 条目全部匹配，未发现缺失或哈希漂移。assignment 指定的 owner report、results、Q1 comparator、Q1 gap、full-cost ledger、native results、analysis、handoff 与 manifest 均匹配冻结 SHA-256。Stage0 closing 的 decision 为 `CONFIRM_STAGE0_PASS`，handoff 与 manifest 分别匹配 `A720928B...5A88` 和 `5F18D438...34B5`。

审查只读取本题 Stage0 closing 与 owner resume1 冻结包；未修改 owner、Stage0 或共享控制文件，也未运行候选实验。

## Preclaim sequence audit

顺序闭合。原始 preclaim artifacts 的文件时间依次覆盖 tiny oracle、五个 witness materialization、18-arm union，随后形成 `PRE_CLAIM_FIDELITY_GATE.md`；自然 corpus freeze 与最早自然编译产物均晚于该 gate 文件，最终 natural native results 与 analysis 更晚。具体顺序为：preclaim artifacts `15:50–15:54`，gate 文件 `15:58`，natural freeze 文件 `16:02`，最早自然准备产物 `16:04`，canonical module build `16:06`，初筛 `16:11`，single-function freeze `16:16`，final native results `17:33`，analysis `17:39`（均为同一主机日期与时区）。

文件内的 `frozen_at/closed_at` 是声明性记录，和 filesystem last-write 分钟值不完全一致，因此本审查不把声明时间单独当作证明；可验证的 artifact 顺序仍显示没有 claim-bearing natural observation 先于 preclaim gate。资源失败、build 和 witness 只用于 fidelity，不被当成科学正负结果。

## Natural denominator and selection audit

冻结来源是 Embench-IoT `embench-1.0` commit `0466a18e4f6b47e19598d7c6ba72916d54b68f65`。canonical module manifest 包含 23 个成功模块；静态规则对 273 个函数检查单基本块、恰好一个 `PseudoCALL`、1–4 个跨调用 scalar GPR virtual value 以及冻结的排除条件，得到 5 个初筛对象：`aes_invert_key`、`sha256_init`、`freeecc`、`sglib_rbtree_add`、`sglib_rbtree_it_next`。

`freeecc` 的 exact single-function MIR 在任何 candidate/union outcome 生成前由同一 interface parser 判定为“no scalar virtual register is live across the call”，对应 candidate `0/0`、union `0/0`；其排除不依赖收益。其余 4 个函数全部保留。初次筛选曾发现 24 个 MIR，其中多出的 CRC smoke duplicate 不产生 eligible function；事后以 23-module allowlist 重算得到完全相同的 5-function set。canonical 重算文件虽然生成于 final pilot 后，但没有改变输入集合或保留结果，因此不构成 post-hoc outcome selection。

结论：4 个最终自然函数的筛选是对象结构驱动，而非结果驱动。

## Candidate and current-union execution audit

独立读取 `NATIVE_RESULTS.json` 并逐行聚合：

| Function | Width | Candidate | Current union | Candidate best text/frame | Equal union coordinate |
|---|---:|---:|---:|---:|---|
| `aes_invert_key` | 2 | `5/5` | `18/18` | `28/16 B` | `17` arms（含 default） |
| `sha256_init` | 1 | `2/2` | `18/18` | `38/16 B` | `17` arms（含 default） |
| `sglib_rbtree_add` | 1 | `2/2` | `18/18` | `28/16 B` | `17` arms（含 default） |
| `sglib_rbtree_it_next` | 1 | `2/2` | `18/18` | `16/16 B` | `17` arms（含 default） |

总计 candidate `11/11`、union `72/72` 均通过 `llc + MachineVerifier -> llvm-mc -> ld.lld -r -> llvm-readobj -> llvm-objdump`。四个 best candidate 坐标均被当前默认 arm 本身覆盖，不依赖把多个 arm 拼成不可执行的 synthetic configuration。最佳程序集还显示四组都没有普通跨调用 spill/reload；`aes_invert_key` 的 candidate 与 selected union 虽寄存器映射/assembly hash 不同，但 text、frame、spill action 与 frozen observable semantics 相同。

重要限定：union 并未逐字节覆盖全部 candidate action；`8/11` candidate assembly hashes 不同，且 `aes_invert_key` 有一个 `38/32 B` 的 candidate 坐标不在 union coordinate set，但它被 union 的 `28/16 B` 点严格支配。故本审查不采用“所有 assembly/action identity 都被吸收”的宽表述；成立的是“每个冻结自然对象的 candidate 最佳注册主坐标被覆盖，且不存在严格主收益”。

## Independent arithmetic and killer audit

本审查直接从原始 native rows 重新按冻结次序选择：先最小 complete function text，再最小 frame，再以同类 full construction CPU/wall/name 破同主坐标的 tie；未复用 owner 的最终判断。得到 candidate-minus-strongest-union：

| Function | Text | Frame | Full construction CPU | Full construction wall |
|---|---:|---:|---:|---:|
| `aes_invert_key` | `0 B` | `0 B` | `+0.156250 s` | `+0.2214615 s` |
| `sha256_init` | `0 B` | `0 B` | `+0.218750 s` | `+0.1766210 s` |
| `sglib_rbtree_add` | `0 B` | `0 B` | `+0.156250 s` | `+0.1691989 s` |
| `sglib_rbtree_it_next` | `0 B` | `0 B` | `+0.218750 s` | `+0.2550727 s` |

按冻结 nearest-rank 算法，text p50/p90=`0/0 B`，frame p50/p90=`0/0 B`，CPU p50/p90=`+0.156250/+0.218750 s`，wall p50/p90=`+0.176621/+0.2550727 s`。严格 primary benefit count=`0`，useful residual=`0/4=0%`，因此确定触发 `<10%` killer。

Full-cost 账本计入 candidate planner 加 identical native continuation、union native continuation、CPU、wall、peak working set、artifact bytes、verification 与 rejection/fallback。目标 runtime 未提供且未估算；这不会隐藏 frozen success rule 所要求的 text/frame/spill 主收益，因为四个 best 点已经在这些主维度被覆盖，候选规划时间又为正。不存在以 RSS、temporary bytes 或未知 runtime 的 nondominance 替代冻结 primary gate 的合法 PASS 路径。

## Same-object and baseline fairness audit

- Exact object：同一 LLVM commit `ba5bccfe01368f76e74d6ff4c35f1330e155b4ba`、同一 RV32IMAC+Zcmp/ILP32/O2、同一 single-function pre-greedy MIR、相同 psABI/行为与 stock native continuation。
- Candidate action：物化的是跨调用 value identity 到固定 Zcmp CSR prefix 或 native stack object 的 bounded action，不是 object rewriting 或代理 codec。
- Baseline：18 个 arm 均为当前 LLVM 可单独执行的同信息配置；而且 decisive best-coordinate coverage 已由 default arm 在 4/4 函数上实现，避免 strongest-union oracle envelope 成为科学结论的必要条件。
- CFI/unwind：自然函数各 arm 都没有生成 `.eh_frame`/CFI directive，candidate 与 comparator 的这一空状态一致；显式 small witness 已单独验证两种计划的非空 unwind rules。没有把空自然 CFI 冒充非空验证。
- Exactness：宽度 1/2 的自然对象合法 plan 数与冻结枚举一致；small witness 对 `w=0..4` 的 DP/Cartesian oracle 完全相符。该保证只适用于冻结 bounded interface，不是一般 RA 最优性。

## Q1/Q2 and adversarial assessment

结构上，目标特定 joint allocation/Zcmp frame planning 曾具有 `TIER_B_Q2_VIABLE` 的条件性 N2 形状；当前 evidence readiness 已产生决定性负结果。最强反方解释是：4 个函数样本小、runtime 未测、8/11 action hash 不同，因此仍可能存在其他 workload 或运行时 residual。该反方不推翻本题冻结 killer，因为合同预登记的成功条件是同一 4-function denominator 上存在严格 text/frame/spill 主收益，而非未来 corpus 存在性或 assembly novelty。它只要求严格限制 STOP 外推范围。

普通三篇 Q1 comparator parity 仍未闭合，但该不足不是 STOP 原因。科学 STOP kernel 是 same-object、可执行当前默认/union baseline 对冻结自然 denominator 的主坐标吸收，加上 `0/4` useful residual 与正规划成本。

## Reproducibility and claim ceiling

Owner package 的 claim-critical manifest 为 `54/54 PASS`。冻结分析可由已有 raw JSON 和脚本静态重算；本 review 没有重跑实验。可复现 ceiling 为：在固定 LLVM commit、target、ABI、优化级别、Embench commit、筛选规则、4 个 exact replay eligible 函数、18-arm union 与 frozen primary/full-cost rule 上，确认 `0/4` 的 bounded scientific negative。

不得声称：所有 Zcmp 优化无用、候选对所有自然程序均失败、任意 CFG/宽度均被 LLVM 吸收、或运行时性能已经被否定。

## Stop kernel and final authorization boundary

`STOP` 建立于：`FROZEN_NATURAL_4_FUNCTION_DENOMINATOR__ALL_CANDIDATE_BEST_PRIMARY_COORDINATES_COVERED_BY_EXECUTABLE_CURRENT_DEFAULT_OR_UNION__ZERO_OF_FOUR_STRICT_USEFUL_RESIDUAL__POSITIVE_CANDIDATE_PLANNING_COST`。

这是真实、同对象、公平 baseline 下的 Stage A 窄机制负证据，不是资源、readiness、样本格式或论文尚未完成导致的 STOP。该裁决不授权改名复活、机制 pivot、Stage B、正式项目或共享状态写入；共享状态只能由主线更新。Lane 完成后返回 `IDLE_REUSABLE_AWAITING_MAINLINE`。
