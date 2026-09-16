# LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY `CallSite-Reconstructibility Pareto DP for Optimized LLVM Debug Information`

## 中文摘要

- 研究机会：优化后的 LLVM 在寄存器分配后才恢复调试位置；call-site 参数的可重构性因寄存器 clobber 而丢失，与仍可合法保留/表达同一值的 codegen 选择发生边界错配。
- 为什么可能值得做：在不改变可执行程序、ABI 或 DWARF 合法性的前提下，提出受代码尺寸/额外 spill 预算约束的 call-site 值可重构性联合优化与 Pareto 保证。
- 为什么保留：当前 pipeline 是强基线，但已核对的一手材料描述的是分配后的传播/表达，不是所述“在预算内联合选择保留动作与 call-site expression”的目标；结论为有界开放，交由 Stage0 攻击。
- 下一步：以固定 LLVM revision 和 `-g` C/C++ corpus 建立 clobber-cut witness；若只能由现有 allocation cost 或 LiveDebugValues 配置表达，则停止。

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origins: `O1 / O6`
- Domain tags: compiler, debug-information, DWARF, register-allocation, ABI
- Contribution route: `N2`
- Discovery date: 2026-08-14
- Discovery method revision: `V8_7_POTENTIAL_READINESS_SEPARATED`
- Discovery claim-pack mode: `OFF`
- Opportunity family ID: `LLVM_DWARF_CALLSITE__PARAMETER_RECONSTRUCTIBILITY__REGALLOC_SPILL_DEBUG_EMISSION__FIXED_OPTIMIZED_CODE`
- Contribution type: `COMPILER_TOOL`

## Research question

For fixed optimized LLVM MachineIR, ABI and executable semantics, can a bounded call-site/clobber-graph DP select legal value-retention and DWARF-expression actions that Pareto-improves reconstructible call-site parameter coverage over LLVM’s current composition at non-worse declared code-size/spill budgets?

## Canonical research claim package

- Exact object and same-function/protocol/quality contract: optimized C/C++ functions compiled by a pinned LLVM with the same return values, exceptions, ABI and native instruction legality; quality is valid DWARF call-site parameter reconstructibility.
- Natural/canonical scenario or workload: LLVM test-suite and public optimized C/C++ debugging workloads compiled with `-g`; the small witness is a call whose parameter register is clobbered by the callee.
- Intervention and atomic action: jointly select only legal existing actions—retain/move a value to a valid location, reuse/select an allowed spill, emit legal entry/rematerialization expression, or leave it unavailable—under a fixed per-function budget.
- Mechanism and prediction: a call-site/clobber DAG exposes choices invisible to post-RA propagation; DP returns a Pareto frontier with at least as much weighted reconstructibility at an equal budget, when such a frontier point exists.
- Fair comparator: full current LLVM pipeline (`LiveDebugVariables`, RA/spills, `LiveDebugValues`, `DwarfDebug`, target hooks) at the same revision, target, `-O` and `-g` settings.
- Full cost: compile CPU/RSS, text bytes, added/reused spills and moves, unwind/frame effects, DWARF bytes, debug-coverage metric and run-time cycles.
- Minimum falsifier: after source pinning, show the chosen action is already realizable by current allocation cost/pass composition with the same information and budget, or find no legal witness on the finite corpus.

## Competing mechanisms

- A: current post-allocation propagation and entry-value emission already recovers the value.
- B: a bounded pre-/during-allocation preservation choice keeps a verifier-legal location across the clobber.
- Preferred mechanism: B, only if Stage0 source and witness checks distinguish it from A.

## Current collision classification

`SEARCH_BOUNDED_OPEN`. Current LLVM docs and source are a strong direct subtractor for debug-location propagation. The search did not establish a direct paper or current implementation of the exact joint budgeted objective; this is not a claim of global novelty or implementation absence.

## Current upstream reality check

No action-gap absence claim is made. Checked current official LLVM debugging documentation, current `LiveDebugValues` source path, and documented default/hidden instruction-reference route. The candidate may use already available legal actions; Stage0 must pin revision, target hooks and relevant `-g`/debug-info options.

## Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`
- Oracle: `llvm-dwarfdump`/DWARF verification plus debugger reconstruction at the frozen call site; compilation retains the normal code generator.
- Finite closure: pin LLVM revision and one CPU target; enumerate candidate locations/expressions for 5–10 minimal clobber witnesses; establish whether stock composition expresses the same Pareto point; then use a bounded LLVM test-suite subset.
- 72-hour killer: direct absorption by stock cost/pass composition, invalid DWARF expression, changed executable/unwind semantics, or no nontrivial Pareto point.
- Claim ceiling: Stage0 potential only; no implementation, theorem or positive measurement is claimed here.

## Q1/Q2 sufficiency hypothesis

At Q2 level, a target-independent but LLVM-source-pinned compiler-tool contribution could combine a precise call-site debug-quality contract, a nontrivial budgeted algorithm, a formal Pareto/dominance property and fair costed evidence. It is Tier B until Stage0 closes direct literature collision and validates a natural corpus route.

## Non-relaxable quality audit

- Same-object: fixed executable semantics, ABI and valid DWARF consumer contract.
- Strong baseline: full current LLVM debug/codegen composition.
- Natural route: public LLVM C/C++ tests and standard DWARF/debugger tools.
- Evidence honesty: no current-absence, performance or novelty conclusion is asserted.

