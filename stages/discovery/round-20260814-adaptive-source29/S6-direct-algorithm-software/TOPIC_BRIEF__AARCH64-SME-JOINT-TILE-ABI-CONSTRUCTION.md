# AARCH64-SME-JOINT-TILE-ABI-CONSTRUCTION — certified joint tile/ABI-state lowering

## 中文摘要

- 研究机会：固定 Arm SME MLIR/LLVM 函数、调用属性与 ABI，联合构造虚拟 tile-ID 绑定和 streaming/ZA 边界状态，而非把二者按现有独立 pass 顺序组合。
- 为什么可能值得做：SME ABI 的 PSTATE.SM/ZA 状态会改变允许指令、向量状态与调用边界；MLIR 同时有函数模式选择和 tile allocation。两者构成目标专属、有限状态的联合构造空间。
- 为什么保留：当前官方资料显示 native state/action 存在，但本轮有界检索尚未发现已完成的“joint certified tile/ABI Pareto constructor”。完整 union、合法双计划 witness 与同对象论文减法均有有限公开闭合路线。
- 下一步：独立 Stage0 先攻击最小双计划是否合法、current sequential union 是否已达到同一 frontier，以及是否存在直接同对象构造论文；任一成立即收缩或淘汰。

- Status: `PROPOSE_STAGE0__FINITE_FIDELITY_GAP`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origins: `O7`
- Domain tags: AArch64, SME, LLVM, MLIR, compiler backend, ABI
- Contribution route: `N2`
- Discovery date: 2026-08-14
- Discovery method revision: `v8.7 + RQ_REFINEMENT_STAGED_EVIDENCE_V1`
- Discovery claim-pack mode: `OFF`
- Discovery RQ frontend mode/revision: `PRODUCTION`; `RQ_REFINEMENT_STAGED_EVIDENCE_V1`
- Opportunity family ID: `AARCH64-SME-JOINT-TILE-ABI-CONSTRUCTION`
- Contribution type: `COMPILER_TOOL`
- Local coordinates: `C0/D1/DEEP/E0_UNKNOWN`
- Front-end disposition: `EVIDENCE_QUALIFIED_RAW`
- Carrier kind: `CANONICAL_FORMAL_ORACLE`

## Canonical research claim package

- Exact object / contract: fixed MLIR/LLVM function CFG, ArmSME operations, callsite attributes, target features and AArch64 SME ABI; generated code must preserve ordinary behavior, calling convention, and the ABI’s PSTATE.SM/ZA requirements.
- Scenario: LLVM/MLIR ArmSME in-tree regression/MIR carrier selected at Stage0.
- Intervention: a finite-state dynamic program over CFG cuts jointly selects native legal tile bindings and ABI transition/lazy-save representation.
- Mechanism / prediction: treating tile liveness and interface state together can dominate independent function-mode selection plus tile allocation on at least one exact cost vector without changing semantics.
- Fair comparator: current LLVM SME ABI lowering and MLIR conversion-integrated tile allocation, with the same IR, target features and profile information.
- Guarantee: certificate of ABI legality plus exact/FPT or certified Pareto frontier parameterized by finite live-tile and cut-state bounds.
- Full cost: compiler CPU/RSS/temp, code and save-area bytes, state transition instructions, and stock verifier/object checks.
- No-gain region: functions with no SME tile overlap/call boundary, or a source-confirmed current joint constructor.
- Minimum falsifier: no valid two-plan minimal witness, current composition produces identical frontier, direct same-object collision, or recurrence becomes generic allocation after removing SME states.

## Current collision and evidence honesty

- Official anchor: LLVM’s [SME support documentation](https://llvm.org/docs/AArch64SME.html) describes call-boundary mode changes, ABI lowering and lazy-save. Current [SME attribute source](https://llvm.org/doxygen/AArch64SMEAttributes_8h_source.html) exposes callsite state/lazy-save predicates. Current [MLIR pass documentation](https://mlir.llvm.org/docs/Passes/) documents streaming/ZA options and conversion-integrated tile allocation.
- `SEARCH_BOUNDED_OPEN`: the brief does not claim exhaustive same-object collision closure or a completed union-external primitive. It proposes an N2 joint algorithm over native legal state/actions. Stage0 owns a bounded literature/source reconstruction.
- Current-upstream reality: no absence claim is relied on. Default/nondefault mode options visible in current docs are included in the comparator; external configuration sweeps are not the intervention.

## Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`.
- Finite steps: (1) pin a current LLVM commit and inspect tile allocation plus SME ABI lowering entry points/options; (2) make a two-tile, one-call legal MIR/IR witness; (3) compare a reconstructed sequential plan against the joint recurrence under common semantic and cost contracts; (4) run independent same-object collision audit in Stage0.
- 72-hour killer: direct current or literature absorption, witness illegality, or generic-kernel reduction.
- Claim ceiling: no performance or novelty conclusion before these closures. Lack of an implementation/result would only lower readiness, not be a scientific drop.

## Q2 sufficiency hypothesis

If a finite target-specific algorithm/certificate survives, the paper shape is an LLVM/SME compiler-tool N2: precise state model, legality theorem/certificate, complexity/parameterization, in-tree natural carrier, and full compilation/output cost. It is Tier B pending independent Stage0.

## Non-relaxable audit

- Same-object: preserved by fixed IR, attributes, target and ABI.
- Strong baseline: current LLVM composition is named and must be reconstructed.
- Natural/canonical carrier: finite public LLVM/MLIR regression route.
- Full cost: frozen above; runtime claims excluded until a later authorized stage.
- Reproducibility: public current docs/source, test route and finite falsifiers.
