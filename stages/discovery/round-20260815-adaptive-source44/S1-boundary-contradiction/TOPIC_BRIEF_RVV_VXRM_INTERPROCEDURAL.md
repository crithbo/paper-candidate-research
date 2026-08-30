# RVV-VXRM-INTERPROCEDURAL — ABI-preserving rounding-state transition construction

## 中文摘要

- 研究机会：RVV 固定点 intrinsic 的舍入模式是四态常量，psABI 又规定 `vxrm` 跨调用不保留；固定内部调用图可形成一个按入口/出口模式汇总的 target-specific 转移构造。
- 为什么保留：该构造保持同一 RVV 程序、ABI、VLEN 策略和逐值数值结果，完整计入 CSR 转换、编译、代码、帧/溢出与执行成本，不是选 flag 或普通调度。
- 为什么仅建议 Stage0：当前 LLVM 完整 pass/config union、直接论文碰撞、原生两方案 witness 与 Q1/Q2 判断仍须独立重建；本 brief 不主张新颖性、二区、性能结果或 Stage0 接受。
- 下一步：Stage0 固定 LLVM commit 和 RVV intrinsic 测试子集，先以 caller(RNE)→callee(RNE)→caller(RNE) 的两方案 witness 攻击该构造。

- Status: `PROPOSE_STAGE0`
- Quality tier: `NOT_CLAIMED__INDEPENDENT_STAGE0_Q1_Q2_DEBT`
- Opportunity origins: `O1`
- Domain tags: `RISC-V`, `RVV`, `compiler backend`, `ABI semantics`
- Contribution route: `N2`
- Discovery date: `2026-08-15`
- Discovery method revision: `v8.7 / RAW_TO_STAGE0_OWNERSHIP_BRIDGE_V1`
- Discovery claim-pack mode: `OFF`
- Discovery RQ frontend mode/revision: `PRODUCTION`; `RQ_REFINEMENT_STAGED_EVIDENCE_V1`
- Opportunity family ID: `RVV_VXRM__INTERNAL_CALLGRAPH__ROUNDING_STATE_TRANSITION`
- Contribution type: `COMPILER_TOOL`
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY`

## Research question

For a fixed RVV fixed-point internal call DAG, can a four-state `vxrm` transfer-matrix construction preserve all numeric and ABI observations while reducing complete rounding-state transition cost compared with current compositional lowering?

## Canonical research claim package

- Exact object and same-function contract: fixed RVV fixed-point LLVM program, fixed ABI/VLEN, no explicit `vcsr` observations, same output and call semantics.
- Natural/canonical scenario: deterministic current LLVM RVV fixed-point-intrinsic test subset selected at Stage0 from one pinned `llvm-project` commit.
- Intervention and atomic action: choose legal function entry/exit `vxrm` modes and edge transitions by four-state call-graph dynamic programming.
- Mechanism: matched mode requirements compose across internal calls; a callee can leave a known mode even though the ABI never requires callers to assume it.
- Fair comparator: pinned stock LLVM RVV lowering with identical code, ABI, target and feature set.
- Expected endpoint: equal vector outputs with a non-worse complete state-transition cost; no result is claimed now.
- Full-cost: compile CPU/RSS, text, CSR writes, frame/spill traffic, static uops and runtime.
- Minimum falsifier: stock pipeline already realizes the same two-plan outcome, candidate changes ABI/result semantics, or the construction reduces to generic dataflow/cost tuning.

## Mechanism and alternatives

- Main mechanism: ABI-aware four-mode transfer matrices over a fixed internal DAG.
- Strong alternative: ordinary interprocedural scheduling/RA already supplies the action.
- No-gain boundary: external/unknown callees, explicit CSR access, dynamic rounding inputs, changed VLEN/ABI, recursive SCCs until separately formalized.

## Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`
- Native oracle: LLVM verifier, assembler/disassembler and an authorized RVV emulator/simulator.
- Small witness: caller(RNE) → internal RNE-only callee → caller(RNE).
- Finite Stage0 steps: pin one LLVM commit; freeze test and flags; map VSETVLI/RA/call lowering union; build two legal plans; check equal outputs and full cost.
- Structural failure: inability to preserve all fixed numerical/ABI observations, or direct absorption by current LLVM/direct work.

## Front-end closure-debt transfer

- Complete current union: `STAGE0`.
- Strongest current/paper collision: `STAGE0`.
- Complete native witness: `STAGE0`.
- Q1/Q2 judgment and final killer: `STAGE0`.
- Claim ceiling: potential-only; no novelty, quality tier, performance or acceptance claim.

## 72-hour first evidence

Pin one commit and one test; construct the two legal plans; kill on equal stock emission, semantic mismatch or generic reduction.

## Non-relaxable quality audit

- Same-object: fixed by contract.
- Current union: preliminary locus frozen; exhaustive audit is transferred.
- Natural carrier: deterministic public implementation-carrier rule.
- Full-cost: frozen dimensions.
- Reproducibility: source/commit/test selection and oracle are finite.
- Evidence honesty: `SEARCH_BOUNDED_OPEN`; no global novelty or outcome claim.
