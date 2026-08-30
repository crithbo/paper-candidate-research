# MLIR-VECTOR-REPRESENTATION-REGISTER-PRESSURE-PARETO-DP — Stage 0 PRIMARY

## 中文摘要

- 结论：`REVISE_ONCE`。
- 为什么：当前 MLIR 已明确 nested aggregate、flattened 1-D 与 `vector.cast` mixed 表示的合法性和不同 memory/shuffle/indexing 后果；LLVM VPlan 已使用寄存器数及 spill/reload cost 评价 loop-vectorization plan。仍可研究的不是“按寄存器压力选 unroll/VF”，而是在一个冻结 target MLIR lowering contract 中，对表示/cast 边界进行有保证的联合选择。Discovery 尚未给出完整 target action catalog 和一个能区别 MLIR 表示选择与 VPlan/stock-lowering union 的合法 witness。
- 下一道门：`PINNED_MLIR_REPRESENTATION_ACTIONS__VPLAN_SEPARATED_BOUNDED_FRONTIER_CERTIFICATE`。
- 是否需要用户操作：否。

- Assignment id: `STAGE0-P1-20260814-MLIR-VECTOR-REPRESENTATION-REGISTER-PRESSURE-PARETO-DP-PRIMARY-V8.7`
- Decision: `REVISE_ONCE`
- Quality tier if gate closes: `TIER_B_Q2_VIABLE`
- Confidence: `0.79`
- Evidence ceiling: `STATIC_ACTION_AUDIT_AND_FIDELITY_PLAN__NO_COMPILE_OR_PERFORMANCE_CLAIM`
- Novelty route: `N2`
- Stage semantics: conditional paper-potential screen; no main result is asserted.

## Structural paper potential vs current readiness

If narrowed to a target-specific, source-complete representation/cast decision problem, an exact/FPT frontier over bounded MLIR vector-expression trees can support a Tier-B compiler-tool N2 paper. The mechanism would select between legal nested/mixed/flattened representation boundaries while preserving fixed MLIR semantics and charging target lowering consequences. It cannot claim direct physical register allocation or replace later LLVM RA.

Current readiness is `FINITE_FIDELITY_GAP`: no target, conversion pipeline, legal action catalog, cost bridge, or comparator-separating two-plan witness is pinned. Missing implementation or results does not cause this decision.

## Same-object contract

Revision must fix MLIR/LLVM commits, one CPU target triple/subtarget/features, data layout, an MLIR vector function including value/shape/mask/fast-math/memory semantics, selected conversion pipeline and every semantically permitted target lowering option. Output must preserve MLIR verifier acceptance, LLVM verifier acceptance, ABI/observable value semantics and stock toolchain behavior.

The action set may contain only source-defined representation/cast boundaries and lowering patterns. It must exclude changing semantics, alignment assumptions, reassociation, UB-enabling flags, target features, and VPlan VF/UF policy unless those decisions are identically available to all comparators and separately charged.

## Independent current-upstream reality check

- Check date: 2026-08-14.
- [Current Vector dialect documentation](https://mlir.llvm.org/docs/Dialects/Vector/) confirms that current n-D lowering is nested 1-D LLVM aggregates; flattened 1-D and mixed (`vector.cast`) are discussed legal alternatives. It specifies static/dynamic indexing and memory/shuffle consequences, plus legality limits for irregular casts.
- The same source says virtual-to-hardware lowering is manually specified patterns, and explicitly says MLIR does not envision exposing RA/spilling directly; target operations/types have abstract ranking costs. This limits the claim ceiling: a Stage-0 candidate may use a frozen target-cost abstraction and later validate it, but cannot state an exact physical-spill result at MLIR.
- [Current MLIR pass documentation](https://mlir.llvm.org/docs/Passes/) exposes `convert-vector-to-llvm`, `convert-vector-to-scf` and target-dialect routes, with options affecting semantics/assumptions and target lowering. These are mandatory baseline-grid actions, not absent features.
- [Current LLVM VPlan analysis](https://llvm.org/doxygen/VPlanAnalysis_8cpp_source.html) calculates register usage and uses target spill/reload costs when users exceed available registers. VPlan is a strong adjacent baseline. It directly absorbs a proposed VF/UF/register-budget selector, but does not by itself select an MLIR n-D representation/cast contract before MLIR-to-LLVM conversion.

## Named fair baselines

1. Stock pinned MLIR vector conversion pipeline with all legal target conversion options under the frozen semantics.
2. Stock pipeline plus finite conversion configuration grid: vector contract/transpose strategy, SCF transfer lowering, target dialect enablement and other non-UB options that preserve the fixed object.
3. Identically downstream LLVM LoopVectorize/VPlan/RA/scheduling for every representation admitted to the candidate; VPlan's factor/unroll/register model is a direct subtractor for any overlapping action.
4. A bounded exhaustive oracle only for the declared small grammar; never the candidate method.

Full cost must include candidate analysis/DP/certificate CPU/RSS, all MLIR/LLVM pipeline CPU/RSS/temp, emitted MLIR/LLVM/object bytes, explicit cast/shuffle/load/store actions, post-RA spill/frame effects, and controlled runtime only after fidelity closure. Static register-unit ranking alone is not a main claim.

## Collision analysis

### Eight-predicate direct-coverage audit

| Predicate | Independent evidence | Result |
|---|---|---|
| Same object/function | VPlan is LLVM loop plan; Vector dialect is pre-conversion n-D representation | `FAIL_SAME_ACTION_STAGE` |
| Same scenario/workload | no pinned MLIR target/corpus supplied | `NOT_CLOSED` |
| Same or weaker information | candidate must use only source-defined target patterns/costs; VPlan sees same downstream target data | `CONDITIONAL` |
| Atomic action covered | VPlan covers VF/UF plan choices, not necessarily MLIR representation/cast boundary | `PARTIAL_DIRECT_SUBTRACT` |
| Same/stronger guarantee | neither current source supplies bounded MLIR exact frontier | `FAIL_DIRECT_COVERAGE` |
| Same full-cost boundary | VPlan estimates register spill; no current source found a whole MLIR representation frontier with full compile cost | `FAIL_DIRECT_COVERAGE` |
| Comparable target/config | absent from brief | `NOT_CLOSED` |
| Sufficient current source depth | current docs/source sufficient for current union; literature bounded | `PASS_CURRENT_SOURCE_ONLY` |

No `DIRECT_FATAL` found. `SEARCH_BOUNDED_OPEN` remains for direct literature collision and is not an absence assertion.

## Atomic revision gate

`PINNED_MLIR_REPRESENTATION_ACTIONS__VPLAN_SEPARATED_BOUNDED_FRONTIER_CERTIFICATE`

The single proposition is:

> For one immutable MLIR/LLVM target pipeline and a bounded legal vector-expression grammar, there are two semantically equivalent all-edge MLIR representation/cast plans, both accepted by the stock conversion path, such that the complete stock configuration/VPlan union does not already choose or certify the candidate plan; a finite target-specific state recurrence returns an exact/FPT/certified frontier over only those representation actions and its cost bridge is later falsifiable against downstream code generation.

The one revision must jointly provide:

1. pinned MLIR/LLVM target pipeline and a complete legal representation/cast/lowering action catalog with forbidden semantic options marked;
2. a small two-plan witness covering nested/mixed/flattened boundary actions, exact source legality, same outputs, and a distinction from VPlan VF/UF or stock option selection;
3. a finite state sufficient for future cast/layout/type/live-interface effects, an action/path bijection and an explicit exact/FPT/certified-frontier bound; and
4. a finite Stage-A preclaim killer: a stock MLIR→LLVM verifier route and small independent oracle reject the mechanism if the candidate is a configuration/VPlan duplicate, a cast is illegal, or the source cost bridge cannot be reconciled with post-lowering effects.

Generic Pareto/ILP wrapping, pass ordering, unroll factor selection, cost weight tuning, or physical-RA claims at MLIR fail this gate.

## Q1/Q2 paper shape and evidence route

- Evidence route: `PARETO_APPROXIMATION + COMPLEXITY_THEORY + PERFORMANCE`.
- Tier-B shape if gate closes: target-specific algorithm/certificate, rigorous same-object pipeline, strong current union, natural MLIR/CPU corpus, and full cost.
- Q1 extension: multi-target representation grammar or theorem, plus evidence beyond one target/corpus.
- First Stage-A killer after authorization: up to 20 fixed target-supported MLIR functions; stop if no legal two-plan witness, any conversion/verifier mismatch, baseline union selects/certifies the same plan, or all charged points are dominated.

## Discovery repair vector

- Codes: `ATOMIC_ACTION_UNCLEAR`, `OMITTED_CURRENT_SAME_OBJECT`, `NATURAL_CARRIER_GAP`, `FULL_COST_GAP`.
- Materiality: high. Discovery identified real lowering tradeoffs but understated VPlan's register/spill model and did not freeze the target conversion surface.
- Available before cutoff: yes, from current MLIR Vector/Passes and LLVM VPlan sources.
- Does it alter the scientific decision: `NO`; it determines the revision gate.

## Non-relaxable audit and score

- Same object: conditional on target/pipeline pin.
- Latest collision: current source independently checked; no direct fatal found.
- Baselines: stock conversion grid + VPlan/RA full union mandatory.
- Natural route: feasible but unpinned.
- Reproducibility: commit/pattern/options/corpus/oracle required before claim-bearing work.
- Academic value: `53/70`; AI bonus: `22/30`; total `75/100`; `ai_core_fraction: 0.65` conditional.

