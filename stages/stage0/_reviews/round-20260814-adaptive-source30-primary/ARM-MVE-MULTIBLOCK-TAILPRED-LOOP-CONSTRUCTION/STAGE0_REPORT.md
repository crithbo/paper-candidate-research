# ARM-MVE-MULTIBLOCK-TAILPRED-LOOP-CONSTRUCTION Stage 0 Report

## 中文摘要

- 结论：`REVISE_ONCE`。
- 为什么：current LLVM `81ac5c7c26efb70ffaffb91b26053437093ee085` 的 `ARMLowOverheadLoops::IsTailPredicationLegal()` 明确限制 tail-predication 为单基本块（`ML.getNumBlocks() == 1`）；这保留了一个可能的同对象多块残差。可是冻结包尚未给出两份均为原生合法、且保留 active-lane、branch 与 exception 语义的完整计划，也没有未来 native-action preserving 的 MVE 专属状态与 recurrence。因此当前不能把“解除限制”认定为 N2。
- 下一道门：仅一次静态门 `NATIVE_TWO_BLOCK_MVE_PLAN_DIVERGENCE__FUTURE_PRESERVING_VPT_VCTP_FRONTIER_CERTIFICATE`。
- 是否需要用户操作：否。

- Lane id: `STAGE0-BATCH-GATE/PRIMARY`
- Assignment id: `STAGE0-P1-20260814-ARM-MVE-MULTIBLOCK-TAILPRED-LOOP-CONSTRUCTION-PRIMARY-V8.7`
- Input freeze SHA-256: `A4087015629B716E1C2F4289187399483B21FBDDF2435C49E960E7987AD346CB` (brief)
- Cross-assignment contamination declaration: 本报告未使用 SME 或 AMX 的候选、证据或结论；仅使用本题冻结包与 MVE/LLVM 一手资料。
- Decision: `REVISE_ONCE`
- Quality tier: `TIER_B_Q2_VIABLE`（条件性；未通过 revision 关闭前不得推进）
- Confidence: 中等（current-source 结论高；多块两计划尚未闭合）
- Evidence ceiling: `E1_STATIC_STAGE0_ONLY__NO_IMPLEMENTATION_NO_RESULT_CLAIM`
- Novelty route: `N2`
- Candidate Q1 venue family: CGO / CC / TACO 的 target-specific compiler-algorithm 方向
- Stage semantics: conditional paper-potential screen; this report does not establish the main claim.

## Structural paper potential vs current readiness

- Structural paper potential if successful: 若能在固定 Armv8.1-M MVE+LOB MachineFunction 上给出同语义的两种原生计划，并用有限的 VPT/VCTP/LOB frontier 精确或 FPT 地选择多块区域/回退，则是 target-specific code-generation algorithm，而不是一般 CFG 排程；最低可达可信 Q2 形状。
- Current evidence-acquisition readiness/risk: E1 静态资料与 current source 已固定。主要风险不是资源，而是候选尚未证明该 native action space 中存在 comparator 外、同时保留未来合法动作的 two-plan divergence。
- Why missing implementation/results/proof/hardware is or is not structurally fatal: 都不是本次停止理由；revision 只要求静态 witness、状态充分性与算法证书。若这些无法形成，才是算法核不存在而非“尚无结果”。

## Discovery provenance

- Opportunity origins: current LLVM 对 tail-predicated low-overhead loop 的显式 single-basic-block legality restriction。
- Domain tags: LLVM, Armv8.1-M, MVE/Helium, low-overhead loops, tail predication.
- Paper genealogy: LLVM MVE tail-predication lowering、Arm Helium/LOB ISA 支持、LLVM ARM backend current implementation。
- Discovery method revision: `RQ_REFINEMENT_STAGED_EVIDENCE_V1`。
- Discovery claim-pack mode: `OFF`。
- Contribution type and type-contract verdict: `COMPILER_TOOL / N2`; 有条件成立，取决于 revision 是否给出 MVE-specific finite plan construction。
- Reminder: method backtest is calibration, not candidate evidence.

## Frozen object and claim

`FIXED_ARMV8_1M_MVE_LOB_LLVM_MACHINEFUNCTION__ACTIVE_LANE_BRANCH_EXCEPTION_SEMANTICS`。输入为固定 LLVM MachineFunction、Armv8.1-M Mainline + MVE + low-overhead-branch target，输出须保持 vector result、active lanes、control-flow branch、可观察 exception 和 ABI 语义。候选动作限定为 `MULTIBLOCK_VPT_VCTP_LOW_OVERHEAD_LOOP_REGION_AND_FALLBACK_CONSTRUCTION`；不得以改 IR、改变分支/异常语义、改 ISA 或在同对象外比较替代。

## Claim-package completeness audit

- Atomic action and mechanism: 在二基本块 loop 中联合选择 VPT/VCTP placement、DLSTP/WLSTP/LETP lowering 与合法 fallback；候选必须证明这是一个完整 native-plan constructor。
- Information/assumption contract: 仅使用冻结 MachineFunction、LoopInfo、VPT/VCTP/reaching-definition、layout/range 和 target legality；不得引入 profile、不同 CFG 或额外 oracle。
- Effect target/output/guarantee: 完整 native legal plan，或在不可转换时保留 stock fallback；声明的 Pareto/优化或 FPT 保证必须覆盖后续 native actions。
- Boundary/failure region: 非同一 VCTP reaching definition、else-VCTP、不可 tail-predicate 指令、非 header loop-end、branch-range 失败、live-out 变化、异常/branch 语义变化均必须回退。
- Minimum falsifier: 一个 public in-tree 或同等可公开固定的两块 MachineFunction，若不存在两份同对象原生合法计划，或任一计划改变 active-lane/branch/exception observable，则方向停止。
- Evidence-ledger integrity and contradiction disclosure: Discovery 的“single block”不是 absence 推断；本审查以 current source 直接确认其为 current eligibility condition。

## Positive opportunity map

- Natural workloads: CMSIS-DSP/ML kernels 中由 LLVM LoopVectorize 产生的 predicated vector loops；必须在 Stage A 冻结公开 IR/MIR 和 target feature ledger。
- Observed or expected cost/headroom: 当前只知 complete baseline 对 multi-block loop 不发出 tail-predicated LOB；未观察性能收益。
- Mechanism-specific prediction: 合法 two-plan witness 若存在，candidate 只能在相同 vector results、active lanes、branch/exception 和 full codegen cost 下减少 explicit predicate/loop-control cost或扩展合法 tail-predicate frontier；不把此写成已证实收益。

## Named baselines and fairness contract

1. **B0 current LLVM composition (anchor):** fixed `LoopVectorize → HardwareLoops → MVETailPredication → MVETPAndVPTOptimisations → MVEVPTBlock → ARMLowOverheadLoops`，所有默认行为保持。
2. **B1 current LLVM configuration envelope:** 同一 source pin 下 `-tail-predication=disabled|enabled-no-reductions|enabled|force-enabled-no-reductions|force-enabled`；非默认项只作为合法配置对照，不能选择弱设置制造缺口。
3. **B2 current native fallback:** 同一 MachineFunction 的 VCTP/VPT + normal low-overhead-loop expansion/revert，即 `t2LEUpdate` 或 revert 路径；与 B0 同信息同 full cost。
4. **Oracle only:** 枚举有限的 native legal two-plan set，可检验 revision 的 certificate；不能作为候选方法或部署基线。

Full-cost ledger 必须包含 vectorizer/analysis、legality check、region construction、VPT/VPST repair、range/layout validation、register pressure/spills、code size、LOB setup/loop-end、fallback、compile CPU/RSS 与 runtime/energy；不可只比较 body instruction count。

## Collision analysis

### Eight-predicate direct-coverage audit

| Predicate | Independent evidence/locator | PASS / FAIL / UNKNOWN |
|---|---|---|
| Same object/function/protocol | current LLVM ARM backend handles same MachineLoop/MachineFunction | PASS |
| Same scenario/workload | current path covers MVE tail-predicated LOB lowering but accepts only one block | PARTIAL |
| Same or weaker information | B0 uses the same MachineLoop, reaching-def and layout information | PASS |
| Atomic action covered | current conversion/recompute/fallback exists, but `IsTailPredicationLegal` requires one block | FAIL |
| Same/stronger legality, quality and guarantee | no multi-block action certificate supplied | UNKNOWN |
| Same non-worse full-cost boundary | current pipeline cost is a fair baseline; candidate accounting absent | UNKNOWN |
| Comparable scale/platform/version/config | LLVM main pin and Armv8.1-M MVE+LOB target frozen | PASS |
| Sufficient full-text/implementation/reproduction depth | current source adequate; candidate witness/recurrence absent | PARTIAL |

### Nearest-prior facet matrix

| Work / source | Same MVE object | Multi-block tail-predicated plan | VPT/VCTP/LOB legality | Future-preserving FPT/Pareto constructor | Disposition |
|---|---:|---:|---:|---:|---|
| LLVM `MVETailPredication.cpp` | yes | no (IR VCTP insertion) | partial | no | strong subtractor |
| LLVM `ARMLowOverheadLoops.cpp` | yes | no for tail-predication (`getNumBlocks()==1`) | yes, incl. VPT repair/revert | no | decisive current boundary |
| Arm/LLVM MVE lowering materials | yes | not established | ISA/lowering context | no | domain anchor |
| generic CFG/loop scheduling | partial | may schedule CFG | not MVE legality complete | generic only | not a valid candidate core |

### Seed-distance and method-name deletion test

Removing the names “VPT”, “VCTP”, “MVE” and “tail predication” leaves a generic bounded-region CFG scheduling problem unless the revision includes the native legal plan grammar, current VPT state, matching VCTP reaching definitions, LOB branch-range/loop-end constraints and a future-action preserving finite state. The present brief does not yet satisfy that deletion test; the single revision may do so.

## Competing mechanism decision

- Selected mechanism: MVE-native state-space construction over VCTP identity, VPT block masks, LOB start/end form, loop layout/range, live-out and fallback status.
- Registered backup: none. A generic CFG/ILP formulation is a negative comparator, not a pivot.
- Pivot boundary: changing active-lane branch/exception semantics, using non-native edges or changing the target requires a new ID.

## Residual paper kernel

Current source has real multi-block-aware housekeeping (`VPTState`, `ConvertVPTBlocks`, mask recomputation and revert), yet `IsTailPredicationLegal` rejects multi-block tail-predication. This is a narrow but real implementation/action boundary. It becomes a paper kernel only if a legal multi-block native plan has a non-product coupling beyond independently scheduling CFG blocks and applying the existing low-overhead loop pass.

## Evidence route

`PARETO_APPROXIMATION / COMPLEXITY_THEORY / PERFORMANCE`.

## Performance-optimization admissibility

- Same-function contract: fixed MachineFunction and exact observables listed above.
- Algorithmic delta: currently unproven; must be a bounded native plan constructor, not enabling a flag or patching emitter order.
- Full-cost ledger: frozen above.
- Strong-implementation fairness: B0-B2 are current LLVM source-pinned paths.
- Generality and failure boundary: only loops meeting an explicit two-plan/native legality grammar; failure must retain B2.
- Why not routine tuning: only if revision produces a target-specific state/guarantee; otherwise it is routine backend engineering.

## Q1/Q2 paper shape

- Problem: current LLVM tail-predication leaves multi-basic-block MVE loops on explicit-predicate/fallback path.
- Contribution: conditional on a finite native plan grammar and a non-generic FPT/certified frontier.
- Evidence plan: public MIR/IR corpus plus same target compiler baselines, strict semantic/oracle checks and full-cost accounting.
- Expected paper narrative: compiler legality/algorithm paper, not an ISA or benchmark claim.

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Reference set: LLVM MVE code-generation material, current LLVM implementation, and compiler-algorithm venue expectations.
- Status: `PARITY_CONDITIONAL`
- Contribution-shape gap: witness and native recurrence are absent.
- Evidence-shape gap: Stage A must perform the contract-fidelity closure and use natural MVE workloads.
- Stage A closure plan: only after independent confirmation and only if revision closes the static gate.

## Non-relaxable quality audit

- Same-object: fixed; revision must preserve it.
- Latest collision: current source pin independently checked; `SEARCH_BOUNDED_OPEN` remains for literature, not an absence assertion.
- Strong fair baselines: B0-B2 fixed.
- Natural input/evidence: finite public MVE IR/MIR route specified; no result asserted.
- Full-cost: frozen ledger required.
- Reproducibility: source blobs, commit and revision witness must be hash-pinned.
- Evidence/claim honesty: no performance, compile-time or legality success was observed in this E1 review.

## Evidence path and AI completion

- E1/E2 execution-readiness audit; scientific inference explicitly excluded: E1 only. Current source blobs are archived under `current-source/`; no LLVM build or candidate execution occurred.
- AI executability class: `AI_CORE_CONDITIONAL`
- Estimated ai_core_fraction: 0.65 if static verifier/MIR replay harness is accepted at Stage A.
- 72-hour first evidence: formalize one existing public two-block MIR, enumerate native legal plan grammar, run no claim-bearing work until fidelity gate passes, then compare B0/B2 and candidate under same target.
- Human-only items and why they are non-decisive: Arm architecture clarification may improve confidence but is not needed to formulate the static gate.

## Fidelity closure plan audit

- Discovery status: `FINITE_FIDELITY_GAP`
- Complete action and native semantics are finite and same-object: potentially, but the candidate must enumerate them at revision; current source provides finite native constraints.
- Comparator, denominator, full-cost and small-witness plan: B0-B2 plus one fixed two-block MIR and legality/equivalence checker.
- Why an unimplemented interface/format/checker is or is not structurally fatal: not fatal; a missing valid native second plan or target-specific state is structural.

## Independent current upstream reality check

- Frozen upstream commit/tag and check date: LLVM `81ac5c7c26efb70ffaffb91b26053437093ee085`, checked 2026-08-14; source blobs and SHA-256 values are recorded in `SOURCE_AUDIT.md`.
- Current official documentation checked: LLVM Doxygen for `MVETailPredication`, `ARMLowOverheadLoops`, `MVETailPredUtils`; LLVM developer-meeting MVE material; Arm Helium programmer guide.
- Actual source paths/symbols checked: `MVETailPredication.cpp`, `MVETailPredUtils.h`, `ARMLowOverheadLoops.cpp`, `ARMTargetMachine.cpp`; `IsTailPredicationLegal`, `AddVCTP`, `ConvertVPTBlocks`, `Expand`.
- Default/non-default flags, thresholds and configurations checked: `-tail-predication` default is `enabled`; disabled, enabled-no-reductions, force-enabled-no-reductions and force-enabled are exposed. The decisive current condition is not a flag: tail-predication requires `ML.getNumBlocks()==1`.
- Discovery absence claim confirmed, narrowed or contradicted: narrowed/confirmed as a precise current legality restriction, not a broad absence claim. Current code already performs VPT reconstruction, VCTP equivalence checking, live-out checks, range validation and fallback.
- If contradicted, current native mechanism and finite configuration-grid baseline: N/A; it is not contradicted, but the current union is stronger than the brief's simplified description.
- Any non-tuning residual that remains: a legal multi-block same-object plan with native future-action-preserving state is possible in principle but unshown.

## Stage A highest-risk probe plan

- Risk-bearing premise: a two-block vector loop admits two complete native plans, one stock fallback and one tail-predicated region plan, without changing active-lane/branch/exception behavior.
- Cheap discriminating probe or counterexample search: after a revision certificate and confirmation, use one pinned public MIR to check legality, VCTP reaching identity, VPT masks, branch ranges, live-outs and observable equivalence before any performance claim.
- Negative result that kills the direction: no legal candidate plan; any semantic mismatch; or every valid plan is B0/B2-reachable.
- Positive-result ceiling: preliminary support/non-falsification only; not main-claim proof.

## Stop conditions

Immediate `STOP` after revision if the proposed state loses future native actions, becomes generic CFG/loop scheduling, has no same-object two-plan witness, or a current LLVM configuration/path realizes its entire frontier. No hardware, implementation or benchmark absence is a stop condition.

## Discovery repair vector

- Codes: `R_CURRENT_UNION_UNDERSTATED`, `R_TWO_PLAN_WITNESS_MISSING`, `R_TARGET_SPECIFIC_STATE_MISSING`.
- Materiality: material; one source-level condition and missing static certificate determine the decision.
- Was the missing information available before the frozen cutoff?: current source is public and should have been included in the source closure.
- Does this feedback alter the independent scientific decision?: `YES` — it converts an implied pass into one bounded revision, not a STOP.

## Dual-axis score

- Academic value: `44/70`
- AI executability bonus: `18/30`
- Total: `62/100`

