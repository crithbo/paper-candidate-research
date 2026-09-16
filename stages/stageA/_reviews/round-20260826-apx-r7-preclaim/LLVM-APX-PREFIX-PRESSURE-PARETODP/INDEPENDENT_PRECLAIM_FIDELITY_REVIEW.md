# LLVM APX r7 独立 preclaim fidelity review

## 中文摘要

- 审查结论：`REJECT_PRECLAIM_FIDELITY__BOUNDED_METHOD_CORRECTION_OR_PIVOT_REQUIRED`。
- 决定性理由：owner 的 67/67 manifest、actual-DP raw、16+4 freeze 和 32-row plan 均真实存在且未漂移；但 PASS predicate 没有证明 frozen action interface。14 个 `transition` 标签未进入动作状态变换，native baseline 的动作/成本由代码硬编码，recursive oracle 与 candidate 共用同一个不完整 transition handler，corpus eligibility 又由宽泛 marker 和常量 same-target 标签替代。
- 真实负结果：current LLVM 与 `-x86-enable-apx-for-relocation` tuning 输出逐字节相同。这是一个真实的 null baseline result，表示该冻结 tuning arm 对该 MIR 没有观察到输出变化；不得隐藏或改称“无结果”。它不修复 baseline consumption 的方法缺口。
- 证据上限：仅为 `INDEPENDENT_PRECLAIM_CONTROL_AND_CORPUS_FIDELITY_ONLY__NO_NATURAL_OR_SCIENTIFIC_INFERENCE`。本结论不是 Stage A 科学 PASS/STOP，也不否定研究机制。
- 下一步：MAINLINE 可在同一 object/RQ/guarantee 下冻结一次有限 preclaim method correction；无需用户动作。本 gate 未消费 scientific revision 或 mechanism pivot，也未授权 natural/claim/Stage B/state/cleanup。

## 身份、独立性与范围

- Review lane: `STAGEA_GATE` / `01a034d0-d990-7d50-9d9f-a6d05a81bf11`
- Owner lane: `CANDIDATE_EXECUTION_LANE_3` / `01a034d0-d67f-7f32-ab5f-54454407cb22`
- Assignment: `STAGEA-GATE-20260826-LLVM-APX-R7-ACTUAL-DP-CORPUS-PRECLAIM`
- Context SHA256: `301CF11E5CBE9CA037BE8B42B562B723891CA59CC9A9377ACDFF8F6FABD48558`
- START SHA256: `028441AB1B0383A61C53A1EBDD094D9A5DFDBF324538FC75541CCE98D6EB684E`
- Reviewer 未参与 owner 实现；未读取旧聊天事实作为证据；未修改 owner/shared 文件。
- 审查方法：冻结源码、raw、manifest 与 corpus rows 的静态依赖审计；没有运行 Python、LLVM、checker、corpus、natural 或 claim。

## G0–G7 独立矩阵

| Gate | 独立结论 | 决定性证据 |
|---|---|---|
| G0 exact identity | `PASS` | commit `a1194...` 与 exact MachineIR/APX object 在 context、trace、catalog、raw 和 handoff 一致。corpus eligibility 单列于 G6。 |
| G1 native action catalog | `FAIL` | 14 rows/9 loci/hash 均存在，但 catalog compiler 只要求每个 locus 至少命中一个宽泛 token，再以 category 名称覆盖 action；`complete_enough_categories` 是原样复制。14 个 `transition` 标签没有任何执行消费者。 |
| G2 actual per-action DP | `FAIL` | 状态签名、action loop、Pareto pruning 与 backpointer 均存在；但 `apply_action` 除 `CONSUME_EFLAGS` 外只递增 boundary，未实现 copy/spill/save/frame/CFI/relocation 等 action-specific transition。所谓 nonproxy predicate 仅检查 forbidden string 与 transition count。 |
| G3 baseline/subtractor consumption | `FAIL` | labeled/generic 路径实际运行过，但 native parser 只搜索 `ADD32rr_ND` 与 `EFLAGS`，随后硬编码 `NDD_DIRECT + CONSUME_EFLAGS` 及 catalog cost；`consumed_by_*` 是常量布尔，MIR 输出没有决定 comparator/full-cost 语义。 |
| G4 tuning null result | `PASS__REAL_NULL_RESULT` | current/tuning MIR 均为 2024 bytes、同一 SHA `FE044E...`、逐字节相同。冻结 tuning arm 的观测效应为零。 |
| G5 oracle/certificate | `FAIL` | 两点 frontier equality 与 ECX/EDX 两边界 certificate 对 toy graph 非空；但 recursive oracle、generic、labeled 与 candidate 共享 legality/transition handler，无法发现 unused transition defect。记录的累计 row counts `6,8` 被求和为 14，实际 unique checks 为 8。 |
| G6 result-independent corpus | `FAIL` | selection keys/hashes 20/20 正确、严格排序、0 result read、0 selected tool、0 backfill；但 20 rows 中 10 个是 MC `FILE_SCOPE`，14 个 first marker 仅为 EVEX，且 same-target 字段由 selector 无条件写常量，未证明 317 个候选或冻结 16+4 都能形成 exact APX MachineIR liveness object。 |
| G7 unexecuted plan | `FAIL` | 32/32 row shape、16×2 replay、7 consumers 与执行数 0 均正确；但所有行依赖未冻结且当前不存在的 future `apx_r8_row_driver.py`，MC/IR 到 same-object trace、native baseline 与 full-cost 的决定性实现仍被隐藏在抽象 subcommand 后。 |

## 方法学与反方攻击

方法学视角下，当前 packet 的失败不是“代码没有跑”——control 确实跑过——而是四个比较路径共享同一简化 action semantics。frontier equality 因此只能证明这个 toy model 自洽，不能证明 frozen APX action interface fidelity。baseline 文件被读取也不等于其输出语义被消费；硬编码动作/成本使 current/tuning comparator 无法对候选形成独立约束。

最强反方解释是：3-versus-6 state reduction 完全来自把两个初始 ECX/EDX permutation canonicalize 到一起；由于 phase-0 actions 的 successor state 全部相同，candidate/labeled/generic/oracle 的相等结果可由共同简化模型解释，而不需要真实 APX target-table-to-transition compiler。这个解释直接命中 preclaim fidelity，但尚未触及自然数据或科学机制真假。

编辑视角下，题目仍保留 Stage 0 的条件性 Q2 shape；本 gate 无权重判 tier。由于缺口发生在任何 selected/natural/claim observation 之前，正确处置是 method-level preclaim correction，而不是科学 STOP、reserve、Stage B 或 exceptional revision。

## 有限同对象 correction route

建议 MAINLINE 冻结一个新的 preclaim-only correction assignment，原子包可命名为 `APX_R7C_ACTION_SEMANTICS_BASELINE_PARSER_ORACLE_AND_CORPUS_ELIGIBILITY_CLOSURE_V1`，并同时满足：

1. 给每个 catalog action 冻结 action-specific source anchors 与可执行 transition handler；unknown/unused transition 直接 fail。copy、spill/reload、save/restore、frame/CFI、relocation 与 flags 必须真实改变/约束 state。
2. 将 catalog completeness 从“任一 token + category 名称”改为 action-specific source/condition/transition/cost coverage；保留 current LLVM fallback 与有限 tuning arms。
3. 用结构化 MIR 解析得到实际动作与成本；current 与 tuning 作为两个独立输入进入 checker/full-cost，若仍逐字节相同，继续报告真实 null result。
4. 使用不复用 candidate `apply_action`/legality implementation 的 exhaustive micro-oracle，并按 unique transition rows 计数。
5. 在任何 selected tool/result 前重冻 eligibility：每行必须有可审计的 x86_64 APX MachineIR/function/trace 身份和同 ABI/feature 路线；MC `FILE_SCOPE` 或 EVEX-only 条目只有在预先冻结的同对象转换证明存在时才可进入。随后以同样的 result-independent key 规则重选 16+4。
6. 冻结并哈希真正的 row driver 与 type-specific commands，再生成 16×2 fully expanded plan；仍保持 r7c 中 0 selected/natural/claim execution。

这条路线不改变 exact object、主要 RQ、claim endpoint、保证、强 baseline 或自然证据要求；无 direct fatal、形式反证或有效自然/full-cost 负观察。它属于 `SOFT_METHOD_BLOCKER`，由 MAINLINE 自主冻结；本 review 不自行消费 revision/pivot。

## 权限与生命周期

- Review resource root：`null`；network/resource/experiment/claim/cleanup 均为 `0`。
- Owner manifest：`67/67` 复算通过，无 provenance drift。
- Owner cleanup 未执行；cleanup owner 仍为 MAINLINE。由于 correction route 可能继续依赖 source subset、toolchain 和 raw control，建议在 MAINLINE 接受本 review 并冻结下游依赖前保持 cleanup deferred。
- `scientific_revision_consumed=false`，`mechanism_pivot_consumed=false`，`stageb_authorized=false`。

## Canonical disposition

`REJECT_PRECLAIM_FIDELITY__BOUNDED_METHOD_CORRECTION_OR_PIVOT_REQUIRED`

`NO_SCIENTIFIC_INFERENCE__NO_STATE_TRANSITION_AUTHORITY`
