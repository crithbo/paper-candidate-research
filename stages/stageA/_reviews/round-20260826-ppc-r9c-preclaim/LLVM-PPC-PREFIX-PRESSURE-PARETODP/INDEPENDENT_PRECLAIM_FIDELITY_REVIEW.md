# LLVM PPC r9c 独立 preclaim fidelity review

## 中文摘要

- 审查结论：`REJECT_PRECLAIM_FIDELITY__BOUNDED_ENGINEERING_CORRECTION_EXISTS`。
- 已闭合：r9c 不再是先前的 two-state/method-label-only 构造。12 个 load actions 形成真实逐动作 recurrence，8190 transitions、4096 terminal states、完整 parent/action backpointer chain 均可静态复核；`ppc_tpd` 与 `form_aware_fixed_ra` 在全部 8190 state signatures 和 8140 cost rows 上有实质差异。8×2 current union 的命令也确实执行，32 对 raw inspection 与 deterministic payload 两次重放精确一致。
- 未闭合：full-cost consumer 没有消费 current-union 的 command costs。两个 replay 各有 56 条 baseline compile/link/readobj/objdump metrics，但 `strong_baseline_full_cost.json` 只含 artifact/text/relocation/uop rows。所谓 zero-orphan 只覆盖 bundle IDs/artifacts，未覆盖 command CPU/wall/RSS/status/exit。
- 后续路线：r10 尚未创建且 route 有限，但当前 `r10_plan.validate()` 会因 baseline dependency graph 不是 candidate output 而拒绝自己的合法 checker/full-cost inputs；同时 G4 的 command-cost omission 会传播到 r10。这两项可在同一 object/RQ/guarantee 下作一次有限工程纠正，不消费 scientific revision/pivot。
- 证据上限：`INDEPENDENT_PRECLAIM_CONTROL_FIDELITY_ONLY__NO_SELECTED_OR_SCIENTIFIC_INFERENCE`。本结论不是 Stage A 科学 PASS/STOP，也不授权 natural/claim/r10/Stage B/state/cleanup。

## 身份、独立性与范围

- Review lane：`STAGEA_GATE / 01a034d0-d990-7d50-9d9f-a6d05a81bf11`
- Owner lane：`CANDIDATE_EXECUTION_LANE_2 / 01a034d0-d37f-7ae1-9ccd-635f285d8279`
- Assignment：`STAGEA-GATE-20260826-LLVM-PPC-R9C-PER-ACTION-PRECLAIM`
- Context SHA256：`D5E20FF0A2BCE7BC938CD9E915158DE743D84D0CC2F690D1845569AEB3C67B28`
- START SHA256：`BDD2DAE5DA8A8E745F5E87E49B25CE110D9F68943A5853378CA228CAAF956450`
- Reviewer 未参与 owner 实现；owner handoff 的 PASS 没有被当作权威 verdict。
- 方法：冻结源码、JSON/YAML、manifest、command metrics、dependency graph 与 raw replay 的只读静态审计。未运行任何 compiler/linker/checker 或 owner Python。

## G0–G6 独立矩阵

| Gate | 结论 | 决定性证据 |
|---|---|---|
| G0 identity | `PASS` | commit `f127b4c...`、Power10 ppc64le Linux ELFv2 medium code model、non-GOT PCREL34 direct-value/PADDI8pc+LD object 与 Stage 0 contract 一致。 |
| G1 actual per-action DP | `PASS` | 12 actions；每层 transitions 为 `2..4096`，总计 8190；4096 terminal states；所有 parent references 可解析，0 unresolved；无 physical-register enumeration 或 heuristic truncation。实际 control 没有 merge/prune，但等价 merge/可区分 nonmerge controls 均通过。 |
| G2 method distinctness | `PASS` | 两方法的 8190/8190 transition signatures 不同，8140 cost rows 不同；差异来自 RA/spill/frame transition mode，而不只是 branch label；forced-identical control 按预期失败。 |
| G3 current union | `PASS__REAL_NULL_ARMS` | 8 个 compile argv 完整覆盖 greedy/PBQP × pcrel on/off × late peephole on/off；16 个 link argv 覆盖 relax on/off，全部 exit 0。产生两个 object/link families；pcrel/peephole/relax 的其余相同输出是该 control 上的真实 null baseline arms，不是遗漏配置。 |
| G4 dependency/full-cost | `FAIL` | 16/16 artifact checker/full-cost IDs 与 object/link/readobj/objdump cost rows存在，但 full-cost consumer 不含 56 条 baseline command metrics 的 CPU/wall/RSS/status/exit。源码 audit 只要求 `command_metric_ids` 字段存在，不解析其消费；`FULL_COST_CONSUMER_AUDIT` 声称 command metrics 必需，与其 evidence file 内容矛盾。 |
| G5 raw reproducibility | `PASS` | 两次 fresh replay 各 59 commands；32/32 raw readobj/objdump pairs 逐字节相同；两份 deterministic payload 同一 SHA 且逐字节相同。inspection operand 在运行前改为稳定相对 basename；raw text 未 posthoc normalization/filter/exclusion。 |
| G6 next route | `FAIL__BOUNDED_ENGINEERING` | r10 目录/plan/output 均不存在，16 selected + 4 reserve static freeze 与 32-row future plan generator 使路线有限；但 validator 将含外部 baseline graph 的 checker/full-cost inputs 错误要求为 candidate outputs 子集，32 行都会 fail，且 full current-union command costs 仍未进入 r10 full-cost。 |

## 方法学与反方攻击

方法学视角下，r9c 的核心纠正是实质性的：DP 不再由两个全局状态或方法标签支撑，baseline grid 也不是未执行的计划。关键失败集中在 full-cost dependency 的定义与验证，而非 action recurrence 或 replay provenance。

最强反方解释是：`checker_edges=16 / full_cost_edges=16 / orphan=0` 只是对 16 个 bundle ID 的集合闭合；它不能推出每个 compile/link/inspection command 的资源成本进入 full-cost。实际 metrics 文件提供了 CPU/wall/RSS，但 consumer 不读取这些字段，graph audit 也没有解析 `command_metric_ids`。因此当前 packet 仍可能在自然阶段漏计 current-union 的主要执行成本，即使命令和 artifacts 全部真实存在。

编辑视角下，这个缺口发生在任何 selected/natural/claim observation 前，不改变 Stage 0 的条件性 `TIER_B_Q2_VIABLE` paper shape，也没有形成 direct fatal 或科学负结果。正确处置是一次有限工程 correction，而不是科学 STOP、reserve、Stage B 或 exceptional revision。

## 有限同对象 correction route

建议 MAINLINE 冻结 `PPC_R9D_COMMAND_COST_EDGE_AND_R10_VALIDATOR_CLOSURE_V1`，只允许：

1. 对每个 baseline bundle，把四个 exact `command_metric_ids` 解析到 metric record，并把 CPU、wall、peak RSS、status、exit code 纳入 full-cost；共享 compile command 在两个 relax bundles 间必须明确只计一次。
2. 校验两个已保留 replay 各 56 条 baseline metrics、metric file hash、bundle-to-command edges 与 zero command-cost orphan；新增“删除或篡改一个 command-cost edge 必须失败”的 negative control。
3. 修正 r10 validator：合法输入集合是 candidate outputs 与 baseline graph producer output 的并集，并验证 producer-before-consumer；不能把 baseline graph 错当成 candidate output。
4. r10 full-cost 必须消费每 process 的 128 compile、256 link、512 inspection command costs，重复共享命令的计价规则预先冻结。
5. correction 仅消费现有 hash-pinned replay raw/metrics 并作静态 consumer/validator closure；保持 r10 absent、0 selected/natural/claim execution、0 network、0 cleanup。

该路线不改变 object、主要 RQ、原子动作、自然分母、guarantee 或强 baseline，属于 `SOFT_ENGINEERING_BLOCKER`；本 review 不自行实施、不消费 scientific revision/pivot。

## 权限与生命周期

- Review resource root：`null`；network/resource/compiler/linker/checker/natural/claim/cleanup 均为 `0`。
- Owner manifest：858 entries；本 gate 针对 decisive source、两个 replay roots、raw、graphs 和 canonical summaries 复算 `333/333 PASS`。
- Owner cleanup 未执行；cleanup owner 仍为 MAINLINE。两次 replay raw、metrics、graphs、source 与 toolchain 在 correction 依赖冻结前保持 deferred。
- `scientific_revision_consumed=false`，`mechanism_pivot_consumed=false`，`stageb_authorized=false`。

## Canonical disposition

`REJECT_PRECLAIM_FIDELITY__BOUNDED_ENGINEERING_CORRECTION_EXISTS`

`NO_SELECTED_OR_SCIENTIFIC_INFERENCE__NO_STATE_TRANSITION_AUTHORITY`
