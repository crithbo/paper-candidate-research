# ARM-MVE-MULTIBLOCK-TAILPRED-LOOP-CONSTRUCTION — MVE multiblock tail-predicated region constructor

## 中文摘要

- 研究机会：对固定 Armv8.1-M MVE + low-overhead-loop 的 LLVM loop，联合构造多基本块 tail-predicated region 与 fallback，而不是只接受当前单块转换路径。
- 保留理由：官方 current source 将 active-mask→VCTP 与后端 LOB lowering 组成当前强基线，并明确 tail predication 暂只支持单基本块；这给出一个可攻击、target-specific 的有限状态边界。
- 贡献形状：N2 compiler-tool；在 VPT、VCTP、DLSTP/WLSTP/LETP 与 CFG 边界组成的有限接口上给 exact/FPT/认证 Pareto 构造及同语义合法性证书。
- 下一步：Stage0 先证明最小双块 loop 的两条原生合法计划，再减去 current union 和同对象论文；若任一证伪则停止，不以未实现或未出结果淘汰。

- Status: `PROPOSE_STAGE0__FINITE_FIDELITY_GAP`
- Quality tier: `TIER_B_Q2_VIABLE`
- Origin / type / route: `O7` / `COMPILER_TOOL` / `N2`
- Discovery method: v8.7 canonical; RQ front-end `PRODUCTION / RQ_REFINEMENT_STAGED_EVIDENCE_V1`; claim-pack `OFF`.
- Opportunity family: `ARM-MVE-MULTIBLOCK-TAILPRED-LOOP-CONSTRUCTION`
- Carrier kind: `CANONICAL_FORMAL_ORACLE`

## Claim package

- Same-object contract: fixed LLVM IR/MachineFunction, MVE + LOB target features, vector results, active-lane masks, branches and exception behavior; stock verifier/object semantics are the oracle.
- Whole action: construct a legal partition of a multiblock loop into tail-predicated and fallback regions, reconstructing native VPT/VCTP/DLSTP/WLSTP/LETP actions.
- Comparator: current LLVM vectorizer → `MVETailPredication` → `ARMLowOverheadLoops`, under identical feature flags and semantics.
- Target-specific guarantee: FPT/certified Pareto plan parameterized by MVE width, VPT state and region boundary state; certificate validates each emitted native region.
- Full-cost: compilation CPU/RSS/temp, output bytes, predicate/LOB instruction count, semantic/oracle check. Initial claim does not assert hardware speed.
- Minimum falsifier: no same-object legal two-plan witness; current union emits equivalent plan; direct same-object collision; or reduction to generic CFG scheduling.

## Evidence and bounded debt

Official current [MVE tail-predication source](https://llvm.org/doxygen/MVETailPredication_8cpp_source.html) defines enabled/disabled/force controls and converts active masks. Current [ARM low-overhead-loop source](https://llvm.org/docs/doxygen/ARMLowOverheadLoops_8cpp_source.html) documents the later native lowering and states it currently supports only a single basic block for tail predication. [Native mapping helpers](https://llvm.org/doxygen/MVETailPredUtils_8h_source.html) fix width-specific VCTP→DLSTP/WLSTP actions.

Complete current-union coverage, a current commit pin, direct same-object paper subtraction, and a legal two-block witness are finite Stage0 closure debts. No source absence is asserted beyond the cited implementation restriction, and no performance/result/newness claim is made before closure.

## Finite fidelity plan and 72-hour killer

1. Pin LLVM current commit and inspect the MVE pass, LOB pass and both default/non-default controls.
2. Choose one public ARM/MVE regression/MIR carrier with a two-block loop and preserve its exact semantics.
3. Construct and verify both stock fallback and proposed native plans; compare the frozen full cost vector.
4. Independently search direct same-object compiler literature.

Kill if current lowering already encodes the plan, legality fails, collision absorbs it, or only a generic loop scheduler remains. This is `FINITE_FIDELITY_GAP`, not an implementation blocker.
