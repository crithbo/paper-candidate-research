# PPC-MMA-JOINT-ACCUMULATOR-CONSTRUCTION Stage 0 Report

## 中文摘要

- 结论：`STOP`。
- 为什么：冻结动作把三条并不共存为一个同对象联合构造的 current path 拼在一起：(1) Power10 `ACC/UACC↔VSR` allocation hints；(2) ISAFuture 的 `WACC`；(3) PPC64/P9、medium code model、float/double FMA 压力重结合。current `PPCRegisterInfo::getRegAllocationHints()` 明确说明 ISAFuture WACC 不同于 Power10 ACC，因而直接跳过 ACC/UACC hint logic；current `shouldReduceRegisterPressure()` 又明确只为 PPC64+P9Vector+medium code model 的 float/double FMA 打开。没有一个冻结 MMA MachineFunction/feature/ABI/numerical-semantics contract 可把这三者作为两个完整且同语义的 native plans 来比较。
- 下一道门：无。同 ID revision 不建议；缩窄到单一目标/单一 accumulator family 会改变 exact object 与 atomic action，必须新 ID。
- 是否需要用户操作：否。

- Lane id: `STAGE0-BATCH-GATE/PRIMARY`
- Assignment id: `STAGE0-P1-20260814-PPC-MMA-JOINT-ACCUMULATOR-CONSTRUCTION-PRIMARY-V8.7`
- Input freeze SHA-256: `E92732A2C6FBAE80B18C789E6C2AD4AB81DB2083395445ACB473CD556FAEC61E` (brief)
- Cross-assignment contamination declaration: 本审查未使用 MVE、SME 或 AMX 的候选事实、证据或结论；仅使用 PPC-MMA 冻结材料与 PPC/LLVM 一手资料。
- Decision: `STOP`
- Quality tier: `BELOW_Q2_STOP`
- Confidence: 高
- Evidence ceiling: `E1_STATIC_STAGE0_ONLY__NO_IMPLEMENTATION_NO_RESULT_CLAIM`
- Novelty route: `N2` 未成立
- Candidate Q1 venue family: 不适用；同对象论文核未定义。
- Stage semantics: conditional paper-potential screen; this report does not establish the main claim.

## Structural paper potential vs current readiness

- Structural paper potential if successful: 一个**单一** PPC target/accumulator family 上、保持完整 numerical/ABI/object semantics 的 bounded allocator could in principle be an N2 compiler paper. 这不是本冻结题。
- Current evidence-acquisition readiness/risk: current source 的决定性 action-domain fork 已静态可见；不需要实验、硬件或实现来判断。
- Why missing implementation/results/proof/hardware is or is not structurally fatal: 均不是停止理由。本题停止原因是同一“joint”动作并不存在于一个可冻结的 target/semantics object 中；实现只会选择其中一个不同对象。

## Discovery provenance

- Opportunity origins: current PPC backend 的 accumulator allocation hints、spills/restores 和 FMA pressure-reduction code。
- Domain tags: LLVM PowerPC, MMA, register allocation, spill lowering, machine combiner.
- Paper genealogy: Power ISA MMA facility、LLVM PPC backend、generic register-allocation and spill-placement literature.
- Discovery method revision: `RQ_REFINEMENT_STAGED_EVIDENCE_V1`。
- Discovery claim-pack mode: `OFF`。
- Contribution type and type-contract verdict: `COMPILER_TOOL / N2`; **FAIL** for the frozen exact object because its action set is cross-target/cross-semantics.

## Frozen object and claim

Frozen object is `FIXED_POWERPC_MMA_MACHINEFUNCTION__ABI__MATRIX_RESULT`; frozen action is `JOINT_ACC_UACC_WACC_VSR_BINDING__FMA_PRESSURE_FORM__NATIVE_SPILL_REPRESENTATION`. The atomic action requires a single feature set and numerical contract to admit ACC/UACC/WACC binding, an FMA pressure form and native spills as alternative actions. Current source rejects that premise: WACC is treated as different ISAFuture machinery; FMA pressure reduction is a P9 float/double facility rather than an MMA-accumulator action.

## Claim-package completeness audit

- Atomic action and mechanism: not closed. `ACC/UACC/WACC` is not one uniform binding grammar in current source.
- Information/assumption contract: fails to pin one subtarget, one accumulator family and one legal floating-point reassociation contract.
- Effect target/output/guarantee: no same-object two-plan guarantee can be stated because one purported plan would require a different target/family or semantic allowance.
- Boundary/failure region/competing explanation: selecting only ACC/UACC removes WACC; selecting WACC removes the current hint relation; allowing FMA reassociation requires an explicit FP semantic contract. Each is a material object/action change.
- Minimum falsifier: current `getRegAllocationHints()` source branch at ISAFuture and current machine-combiner target/type guard jointly falsify the required unified plan grammar.
- Dependencies and evidence ceiling: all decisive evidence is current official static source; no result claim is used.
- Evidence-ledger integrity and contradiction disclosure: Discovery correctly identified native components but incorrectly assumed they compose into one same-object action space.

## Positive opportunity map

- Natural workloads: MMA kernels are natural carriers for a future, separately frozen single-family study.
- Observed or expected cost/headroom: no cost or performance observation was made or needed here.
- Mechanism-specific prediction: not applicable to this ID; any prediction would choose one different object.

## Named baselines and fairness contract

1. **B0 current Power10 ACC/UACC path:** LLVM greedy allocation with current hints, ACC/UACC copies and accumulator spill/restore lowering.
2. **B1 current ISAFuture WACC path:** same source configuration, where `getRegAllocationHints()` returns before ACC/UACC logic.
3. **B2 current machine combiner:** FMA pressure-reduction configurations `ppc-fma-rp-reduction` and `ppc-fma-rp-factor`; only active under documented PPC64/P9Vector/medium-code-model/float-double conditions.
4. **Generic RA/ILP:** subtractor/oracle only; it cannot repair the target-domain mismatch.

No fair union may combine B0, B1 and B2 as if they were alternative actions for one target/semantic plan. Doing so changes target features or numerical legality and violates the frozen comparator contract.

## Collision analysis

### Eight-predicate direct-coverage audit

| Predicate | Independent evidence/locator | PASS / FAIL / UNKNOWN |
|---|---|---|
| Same object/function/protocol | source has distinct Power10 ACC/UACC and ISAFuture WACC paths | FAIL |
| Same scenario/workload | FMA pressure reducer targets float/double P9 vector patterns, not declared MMA accumulator plan | FAIL |
| Same or weaker information | each native component uses internal MachineFunction information | PASS locally / FAIL jointly |
| Atomic action covered | action is not a single legal current grammar | FAIL |
| Same/stronger legality, quality and guarantee | no common numerical/target legality contract | FAIL |
| Same non-worse full-cost boundary | cross-target union is not a deployable fair baseline | FAIL |
| Comparable scale/platform/version/config | one current LLVM source, but mutually distinct subtargets/configs | FAIL |
| Sufficient full-text/implementation/reproduction depth | official source is decisive | PASS |

### Nearest-prior facet matrix

| Work / source | ACC/UACC hints | WACC path | FMA pressure reducer | Same MMA native two-plan union | Disposition |
|---|---:|---:|---:|---:|---|
| LLVM `PPCRegisterInfo::getRegAllocationHints` | yes | explicitly bypassed | no | no | decisive domain split |
| LLVM `lowerACCSpilling/lowerACCRestore` | yes | distinct WACC lowering follows separately | no | no | native spill subtractor |
| LLVM `PPCInstrInfo::shouldReduceRegisterPressure` | no MMA coupling stated | no | P9/float-double only | no | non-equivalent subtractor |
| generic RA/spill methods | can model interference | abstractly | abstractly | no native semantic guarantee | methodological adjacent |

### Seed-distance and method-name deletion test

Deleting “PPC”, “MMA”, “ACC”, “UACC” and “WACC” leaves generic allocation, reassociation and spill placement. The only potential PPC-specific content was the family/subregister relation, but current source proves the proposed three-family relation is not a single relation. Thus no N2 remains for this frozen object.

## Competing mechanism decision

- Selected mechanism: none; the declared joint mechanism is structurally ill-typed.
- Registered backup: none. Rebinding to Power10 ACC/UACC-only or ISAFuture WACC-only would be a new research question and new ID.
- Pivot boundary: any removal of WACC, change from Power10 to ISAFuture, or relaxation of numerical reassociation semantics is material and cannot use this ID's revision.

## Residual paper kernel

None for this exact object. Current source supports useful native actions, but their conjunction is not a valid same-function action set. The remaining within-family allocation/spill question is ordinary target-constrained RA unless a new object first supplies a different non-product invariant.

## Evidence route

`PARETO_APPROXIMATION / COMPLEXITY_THEORY` fails at object/action definition before performance evaluation.

## Performance-optimization admissibility

- Same-function contract: not satisfiable for all declared components.
- Algorithmic delta: reduces either to a generic RA/spill formulation or an altered single-family target.
- Full-cost ledger: cannot be shared across cross-target alternatives; source-level costs are not comparable plans.
- Strong-implementation fairness: current source must remain separated into B0-B2.
- Generality and failure boundary: the failure is target/family/numerical-semantics type drift.
- Why not routine tuning: no valid nontrivial action is left on this ID.

## Q1/Q2 paper shape

- Problem: potentially interesting only after new exact-object freeze.
- Contribution: absent for this ID.
- Evidence plan: no Stage A plan is valid because preclaim fidelity would necessarily change object.
- Expected paper narrative: none.

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Status: `PARITY_NOT_PLAUSIBLE`
- Contribution-shape gap: atomic action is cross-target/cross-semantics rather than a defined algorithm.
- Evidence-shape gap: non-curable by implementation or measurements.
- Stage A closure plan: none; Stage A is not authorized.

## Non-relaxable quality audit

- Same-object: FAIL — declared action combines mutually distinct current target families.
- Latest collision: current upstream reality check finds a direct source-level contradiction, not merely an unsearched paper gap.
- Strong fair baselines: current B0-B2 are identified but cannot form a fair combined baseline.
- Natural input/evidence: a natural kernel cannot repair target mismatch.
- Full-cost: cross-target costs are not same-object full cost.
- Reproducibility: official source locations and immutable commit anchor recorded in `SOURCE_AUDIT.md`.
- Evidence/claim honesty: no performance or candidate implementation claim was made.

## Evidence path and AI completion

- E1/E2 execution-readiness audit; scientific inference explicitly excluded: static source review only; no compiler run, build, benchmark or candidate implementation.
- AI executability class: `NOT_APPLICABLE_AFTER_STRUCTURAL_STOP`
- Estimated ai_core_fraction: not scored.
- 72-hour first evidence: none for this ID; it would require selecting a new exact object.
- Human-only items and why they are non-decisive: none.

## Fidelity closure plan audit

- Discovery status: `STRUCTURALLY_UNCLOSABLE`
- Complete action and native semantics are finite and same-object: each family is finite, but their frozen conjunction is not same-object.
- Comparator, denominator, full-cost and small-witness plan: cannot be frozen without a target/family choice.
- Why an unimplemented interface/format/checker is or is not structurally fatal: not relevant; static target incompatibility is fatal.

## Independent current upstream reality check

- Frozen upstream commit/tag and check date: official LLVM `main` observed 2026-08-14; GitHub current history identifies `ba5bccfe01368f76e74d6ff4c35f1330e155b4ba` on 2026-08-12. Direct raw source was read from official `main`; immutable raw retrieval was unavailable because the local Schannel transport lacked credentials. This provenance limitation is not used as absence or as a scientific conclusion.
- Current official documentation checked: official LLVM Doxygen and current raw source for `PPCRegisterInfo` and `PPCInstrInfo`; Power ISA MMA background literature.
- Actual source paths/symbols checked: `PPCRegisterInfo::getRegAllocationHints`, `lowerACCSpilling`, `lowerACCRestore`, `lowerWACCSpilling`, `PPCInstrInfo::shouldReduceRegisterPressure`, `getMachineCombinerPatterns`, `reassociateFMA`.
- Default/non-default flags, thresholds and configurations checked: `ppc-fma-rp-reduction=true` and `ppc-fma-rp-factor=1.5` by default; combiner restricted to aggressive opt level and pressure reducer restricted to documented P9 conditions. `ppc-report-acc-moves` is a debug reporting switch, not an optimization action; paired-vector spill control is part of current spill lowering.
- Discovery absence claim confirmed, narrowed or contradicted: contradicted as a **composition claim**. The named components exist but are not one joint same-object alternative set.
- If contradicted, current native mechanism and finite configuration-grid baseline: B0/B1/B2 separately listed above.
- Any non-tuning residual that remains: none under this ID; selecting an ACC/UACC-only or WACC-only target is a new ID.

## Stage A highest-risk probe plan

Not authorized. A probe would have to first change the frozen target/family/semantic contract, so it cannot serve as a Stage A test for this candidate.

## Stop conditions

Triggered now: `NO_NATIVE_LEGAL_SAME_OBJECT_TWO_PLAN_WITNESS` and `CROSS_TARGET_ACTION_GRAMMAR_TYPE_DRIFT`. No same-ID revision is permitted because resolving either requires replacing the frozen action/object.

## Discovery repair vector

- Codes: `ATOMIC_ACTION_UNCLEAR`, `OMITTED_CURRENT_SAME_OBJECT`, `CONTRIBUTION_TYPE_CONTRACT_MISMATCH`.
- Materiality: material; current source supplied a target-family branch that invalidates the claimed joint action.
- Was the missing information available before the frozen cutoff?: yes, public current source.
- Does this feedback alter the independent scientific decision?: `YES` — it changes conditional raw potential to structural STOP.

## Dual-axis score

- Academic value: `0/70` for the frozen object (not a ranking statement about a new single-family topic)
- AI executability bonus: `0/30`
- Total: `0/100`

