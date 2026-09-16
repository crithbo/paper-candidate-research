# Topic brief — MLIR vector representation / register-pressure Pareto DP

## Recommendation and maturity

- `PROPOSE_STAGE0`; `TIER_B_Q2_VIABLE`; contribution type `COMPILER_TOOL` plus N2 algorithm.
- Structural paper potential: the fixed MLIR vector lowering makes a representation decision before backend register allocation, so a legally constrained joint algorithm can change compile/runtime/full-cost tradeoffs. Evidence readiness: `FINITE_FIDELITY_GAP`; no implementation or positive result is asserted.

## Exact claim package

- Fixed object/function: one MLIR `vector` function, values/shapes/fast-math and memory semantics, target triple/features, and stock LLVM-visible observable behavior. Candidate must lower to equivalent LLVM IR/machine behavior and cannot alter values, aliasing, masks, ABI or target.
- Current bottleneck transfer: vectorization/lowering reduces high-level tensor work but transfers cost to physical register pressure, explicit loads/stores and later spilling. The current representation choice determines what the backend can see.
- Joint N2 action: for a bounded tree of `vector.cast`, transfer, contraction and unroll decisions, compute an exact Pareto frontier over (legal representation: nested/flatten/mixed, target-lowering action, estimated live register units, explicit memory/shuffle cost). State stores boundary layout/type/live-vector interface; the algorithm returns a certificate that no allowed action with no greater register bound has lower static movement cost. It falls back to stock lowering outside the bounded grammar.
- Why it is nontrivial: stock MLIR supports each action, but documents virtual-to-hardware lowering as manual patterns and does not expose RA/spilling at MLIR. The algorithm changes the decision rule by jointly accounting for later register resource pressure, not by choosing a flag or ordering passes.
- Fair baseline union: current `vector` lowering patterns, `vector.cast`, target-specific dialect lowering, all relevant convert-vector options, then stock LLVM RA/scheduling. LLVM VPlan / LoopVectorize is an adjacent strongest baseline; it receives identical target/cost information but operates after the fixed MLIR representation decision.
- Current-source / collision: official MLIR documentation gives nested, flattened and mixed legal representations and their register/memory implications; current VPlan documentation/source includes later vector-plan and register-usage analyses. Bounded primary/current search found no current same-object MLIR-stage certified joint constructor. `SEARCH_BOUNDED_OPEN` is a claim ceiling only; independent Stage0 must re-search.

## Natural route and full cost

- Natural carrier: LLVM/MLIR in-tree vector lowering tests plus public CPU kernels/MLIR examples with fixed target and source-derived IR; formal small-expression family serves the initial certificate route.
- Native oracle: MLIR verifier, LLVM verifier, fixed functional output tests and target-code validity; no custom reader or changed format.
- Full-cost: planner CPU/RSS; MLIR/LLVM compile CPU/RSS/temp; IR/object bytes; estimated and actual spill/load/store/shuffle counts; binary size; controlled kernel runtime only after Stage A fidelity gate. No proposal relies only on a static proxy.
- 72-hour killer: freeze one CPU target and 20–50 fixed vector functions; enumerate legal lowering actions from source; construct a two-representation witness verified equivalent by stock tools; reject if no legal frontier divergence exists, if certificate equivalence fails, or if full-cost has no residual against the full stock union.

## Fidelity closure and boundaries

- Status: `FINITE_FIDELITY_GAP`.
- Finite closure: pin MLIR/LLVM revision; enumerate relevant vector-to-LLVM and target-dialect options; freeze bounded grammar/register-unit estimator; implement certificate checker; independently audit same-object collision; then pass Stage-A preclaim fidelity before a performance claim.
- Structural failure: current MLIR union already owns the same certified joint representation/register-resource optimizer; required action changes semantic/target contract; or no finite legal witness exists.
- No-gain: only one legal representation, representation changes that force forbidden dynamic indexing/extra memory, register pressure below threshold, or downstream RA dominates.
- Q2 rationale: target-specific exact/Pareto algorithm plus legality certificate, natural CPU carrier, strong current union, full cost and falsifier is a coherent compiler-tool N2 paper. Q1 needs multi-target/generalization evidence.
