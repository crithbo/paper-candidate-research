# LLVM MachineOutliner target-cost global candidate selection — Stage 0 PRIMARY

## 中文摘要

- 结论：`REVISE_ONCE`，仅允许一个静态门；不授权 Stage A/B。
- 为什么：LLVM 已有 CGData 跨模块候选发现和全局候选表，但当前 `outline()` 以单一 size-ratio 排序后贪心处理并剪除重叠候选。因而“global outlining”本身已被吸收；仍可能成立的仅是固定目标 ABI 成本下、完整互斥组件的目标成本 Pareto 选择与有限保证。
- 下一道门：`PINNED_MACHINEOUTLINER_GLOBAL_CANDIDATE_CATALOG__TARGET_COST_CONFLICT_COMPONENT_PARETO_CERTIFICATE`。
- 是否需要用户操作：否。

- Assignment: `STAGE0-P1-20260814-LLVM-MACHINE-OUTLINER-TARGET-COST-GLOBAL-CANDIDATE-SELECTION-PRIMARY-V8.7`
- Decision: `REVISE_ONCE`
- Quality tier: `TIER_B_Q2_VIABLE` conditional
- Confidence: 0.77
- Evidence ceiling: `E1_STATIC_CURRENT_SOURCE_AUDIT`
- Novelty route: `N2`
- Stage semantics: conditional paper-potential screen; no implementation, result, or performance claim.

## Structural paper potential vs current readiness

If successful, the paper kernel is not a new outliner, suffix tree, or global-CGData feature.  It is a target-specific exact/FPT/certified Pareto constructor for a bounded connected component of *already native-legal* outlining alternatives, preserving MachineInstr, call/frame, ABI, unwind, relocation and object semantics.  That can plausibly reach a credible Q2 compiler-optimization shape.  Current readiness is static only: no target-pinned conflict witness or target-cost frontier has been constructed.  This is one finite certification gap, not a STOP based on absent code or measurements.

## Frozen object and claim

The revision must freeze one LLVM v22.1.8 source release commit `ca7933e47d3a3451d81e72ac174dcb5aa28b59d1`, one supported target backend (recommended AArch64), one subtarget and ABI/unwind/relocation contract, and one MachineIR module.  The output is a compatible subset of candidate groups accepted by the *existing* `TargetInstrInfo` hooks; replacement functions, frames and calls must be built by native hooks and produce equivalent object/unwind semantics.

The proposed action is not selecting a flag, rerunning the outliner, or using a generic weighted set-packing solver.  It jointly selects mutually incompatible native candidate groups under target-call/frame costs and returns an exact/certified code-size/runtime Pareto frontier over a bounded conflict component.

## Current upstream reality check

Current LLVM source is decisive:

- MachineOutliner maps legal machine instructions, discovers local repeated substrings through a suffix tree, and calls target `getOutliningCandidateInfo`, `buildOutlinedFrame`, `insertOutlinedCall`, and `isFunctionSafeToOutlineFrom` hooks.
- Current controls include the benefit threshold, candidate-leaf policy, reruns, `-disable-global-outlining`, linkonce-odr enablement and content-hash naming.
- CGData **already** supports global outlining: previous codegen produces outlined hash data, `llvm-cgdata`/LLD/ThinLTO merge it, and read mode creates global candidates.  It is a mandatory baseline, not a residual.
- The source nevertheless sorts `FunctionList` by `notOutlinedCost / outliningCost` and walks it greedily; overlapping candidates of later functions are pruned.  Global matching is therefore not an exhaustive target-cost compatibility/Pareto selection.

This establishes a narrowed action gap.  It does not prove the residual is publishable: a revision must show a legal conflict component whose target frame/call/unwind costs make the greedy choice and the native Pareto optimum diverge.

## Fair baseline contract

The same-information union must run the identical pinned module and target through: default local suffix-tree mode; all legal candidate leaf/rerun/benefit settings; CGData `None/Write/Read` with the same prior corpus; target hooks; global greedy priority ordering; and applicable linkonce/PGO modes.  IR outlining, post-link outlining, function merging/ICF and generic conflict solvers are subtractors or controls, not same-object replacement baselines.  Full cost includes candidate discovery, CGData I/O, selection time/RSS, outlined bodies/calls/frames, object bytes, relocation/unwind metadata, and runtime impact.

## Collision analysis

The original LLVM outliner and current global-CGData work directly cover machine-sequence mapping, suffix/hash discovery and cross-module candidate discovery.  They fail the direct-coverage predicate for a target-cost complete compatible-set Pareto constructor because the inspected current source uses a scalar priority greedy walk and removes overlapping later candidates.  Post-link outlining changes the object/stage; global function merging changes the action.  `SEARCH_BOUNDED_OPEN` remains for external same-MachineIR exact-frontier work, so no absence claim is made.

| Direct-coverage predicate | Status | Reason |
|---|---|---|
| Same MachineIR/object function | PASS for LLVM current union | same pass and hooks |
| Same global candidate discovery | PASS | CGData read mode |
| Complete compatible-set action | FAIL | source greedily walks and prunes later overlaps |
| Target-cost Pareto guarantee | FAIL | current priority is scalar size ratio |
| Same full-cost/ABI/unwind contract | PARTIAL | target hooks provide costs; frontier ledger absent |
| Direct fatal collision | NOT ESTABLISHED | bounded official/primary search only |

## Atomic revision gate

`PINNED_MACHINEOUTLINER_GLOBAL_CANDIDATE_CATALOG__TARGET_COST_CONFLICT_COMPONENT_PARETO_CERTIFICATE`

The revision must, in one pinned AArch64 (or equally named supported target) contract, provide:

1. the complete native candidate/action catalogue, including local/global CGData, target hooks, frame/call and function-safety paths, and all relevant controls;
2. a legal MachineIR conflict component with at least two individually profitable candidate groups that are mutually incompatible and whose scalar greedy order is different from a target-cost Pareto point;
3. a finite target-specific state, recurrence and exact/FPT/certified bound whose states map bijectively to native candidate/frame/call actions and retain ABI, unwind, relocation and MachineInstr legality;
4. an explicit degeneration map: if target costs are additive scalar weights, the method must collapse to current greedy/ordinary interval selection rather than relabel generic set packing as a contribution; and
5. a finite Stage-A preclaim fidelity killer, not an already-run experiment.

If the witness is rejected by hooks, target costs cannot create a non-product component, CGData/current target paths already construct the same frontier, or the recurrence is generic conflict-graph packing, the same-ID revision must STOP under `BELOW_Q2_STOP__CURRENT_MACHINE_OUTLINER_GLOBAL_SELECTION_ABSORPTION_OR_GENERIC_CONFLICT_GRAPH_PACKING`.

## Q1/Q2 shape and evidence route

The natural carrier is a fixed LLVM Test-Suite/Clang MachineIR corpus plus native verifier, object, relocation/unwind and regression oracles.  Before any claim-bearing run, a Stage A owner must close the exact target/toolchain/reader contract and reproduce the small witness.  The pre-registered killer is: rejected native action; no greedy-vs-frontier non-dominance on the exhaustive witness; any object/unwind/relocation mismatch; or no full-cost Pareto point against the complete union.

Academic value: `52/70`; AI execution bonus: `22/30`; total `74/100`; AI class `AI_CORE_CONDITIONAL`, estimated `ai_core_fraction=0.65`.  Scores do not override the atomic gate.

## Stop conditions

Stop on direct current/frontier absorption, generic solver collapse, changed ABI/object semantics, or a witness that needs non-native frame/call actions.  Missing implementation or a current performance result is not a stop condition.

## Discovery repair vector

`OMITTED_FIRST_PARTY_FEATURE`, `ATOMIC_ACTION_UNCLEAR`, `EVIDENCE_LOCATOR_OR_VERSION_GAP`.  Materiality: the discovery brief called the action global but did not fully subtract CGData's existing global candidate discovery and greedy selection path.  This does not alter the present `REVISE_ONCE` decision.
