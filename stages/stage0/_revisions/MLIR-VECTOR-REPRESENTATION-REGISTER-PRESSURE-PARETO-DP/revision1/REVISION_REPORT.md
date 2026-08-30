# MLIR Vector Representation Frontier — revision 1

## Decision

- Recommendation: `RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`
- Tier if independently confirmed: `TIER_B_Q2_VIABLE`
- Revision: `1/1 CONSUMED`
- Atomic gate: `PINNED_MLIR_REPRESENTATION_ACTIONS__VPLAN_SEPARATED_BOUNDED_FRONTIER_CERTIFICATE`
- Evidence ceiling: `STATIC_STOCK_LOWERABILITY_AND_FRONTIER_CERTIFICATE__NO_BUILD_NO_PERFORMANCE_CLAIM`
- Stage A/B: not authorised.

The proposal is narrowed to a target-specific planner for source-defined `vector.shape_cast` representation cuts. It does not choose VF/UF, unroll, pass order, target-cost weights, physical register allocation, spills, speed or code size.

## Immutable object and proposition

Frozen source: `llvm-project` commit `ba5bccfe01368f76e74d6ff4c35f1330e155b4ba`. Frozen target: `x86_64-unknown-linux-gnu,+avx2`, SysV x86-64 ABI, unchanged Vector-to-LLVM then LLVM pipeline. Relevant source: `VectorLinearize.cpp`, `LowerVectorShapeCast.cpp`, and `X86TargetTransformInfo.cpp`. Current X86 TTI reports a 256-bit fixed-width vector register for AVX when preferred width is at least 256.

**Proposition.** On a bounded acyclic static-vector expression tree, the complete nested/mixed/flattened grammar has a legal mixed cut which is neither current nested conversion nor current whole-graph VectorLinearize. `AVX2-Representation-Frontier-DP` computes an exact frontier for its declared representation/cast cost vector and retains the full MLIR/LLVM escaping interface for identical downstream processing.

The proposition is refuted if a plan fails stock lowering or semantics; if stock nested conversion, VectorLinearize, a legal configuration, or VPlan reproduces the mixed action; if a legal suffix distinguishes merged states; or if the finite Stage-A full-cost ledger contains no nondominated candidate point. The last is a future cost-bridge test, not an asserted result.

## Complete grammar and current union

The theorem admits only pure static `f32` vectors with element product 16: no mask, memory effect, dynamic index, scalable dimension, fast-math relaxation, reduction or contraction. Labels are `N=vector<2x2x4xf32>` (nested), `M=vector<2x8xf32>` (mixed outer structure retained), and `F=vector<16xf32>` (fully flat). A conversion is only an equal-product/type/scalability/row-order `vector.shape_cast`. Allowed nodes are source-defined `Vectorizable` elementwise operations plus `vector.interleave`, `extract`, `insert`, `to_elements` and `from_elements` only when current VectorLinearize and ShapeCast lowering admit fixed-vector lowering. Every other node delegates to stock.

The comparator union includes: current nested Vector-to-LLVM conversion; complete current `VectorLinearize` (which maps every linearizable rank>=2 type to its fully flat product and materialises shape casts); current fixed-vector ShapeCast extract/insert/strided-slice lowering; all semantics-preserving Vector-to-LLVM options; and identical LLVM VPlan, RA, scheduling, MC and linker. Whole `F` is therefore a direct subtractor. The candidate only selects joint partial `M` cuts. Semantic-changing FP reassociation, alignment, forced index narrowing, UB-enabling GEP flags and target-dialect switches are excluded.

## Same-function witness and VPlan separation

```mlir
func.func @interleave_cut(%a: vector<2x1x4xf32>, %b: vector<2x1x4xf32>) -> vector<2x2x4xf32> {
  %r = vector.interleave %a, %b : vector<2x1x4xf32> -> vector<2x2x4xf32>
  return %r : vector<2x2x4xf32>
}
```

Current source explicitly linearizes `vector.interleave`. The complete plans are `P_N: 2x1x4 -> 2x2x4 -> 2x2x4` (stock nested); `P_F: 8 -> 16 -> shape_cast back to 2x2x4` (stock full linearization); and `P_M: 2x4 -> 2x8 -> shape_cast back to 2x2x4` (candidate). Each plan preserves sixteen ordered `f32` values and the exact ABI result. `P_M` uses only current equal-product casts and current stock lowerers, but the current full-linearize converter does not expose a preserved-outer `M` selection. The fixed function has no loop, hence no VPlan VF/UF action; in later corpus replay all plans use identical fixed VPlan/RA controls.

## Certificate and bound

For a nice tree decomposition of width `w`, state is `(L,T,O,Q,H,C)`: labels `L`; exact types/scalability/order `T`; current lowering predicate `O`; ShapeCast decomposition obligations `Q`; escaping type/value/ABI/cast interface `H`; and additive declared cost `C` (cast expansion, AVX2-width chunks, IR bytes, planner CPU/RSS and interface count). Introduce enumerates only catalog labels/casts; forget charges completed casts; join requires identical `L,T,O,Q,H`. Thus equal states have identical legal suffixes and increments. Every legal plan determines exactly one state path, and every path uses only source-defined actions. Dominance pruning happens only within an identical future-action interface.

With three labels and finite catalog size `a`, time is `O(n * 3^(w+1) * a^(c(w+1)) * poly(w))`, for bounded operand/edge constant `c`. The result is an exact FPT frontier for the declared MLIR representation/cast contract, not generic ILP/Pareto wrapping, identity enumeration, pass ordering or a scalar target-cost policy. The no-gain boundary delegates to stock for unsupported, dynamic, scalable, masked, oversized or union-duplicate regions.

`H` preserves all frozen downstream interfaces but the theorem does not assert final RA/spill/scheduling/runtime cost. MLIR’s own documentation places precise RA/spill modelling outside this abstraction. Those dimensions are mandatory charged observations in the finite Stage-A preclaim gate.

## Finite Stage-A killer and ceiling

After authorization only, freeze at most 20 public static AVX2 vector functions in the grammar. A separate tiny `N/M/F` enumerator checks the catalog and is not the method. Every plan must pass MLIR verification, pinned lowering, LLVM verification and same ABI/value digest. Charge planner/pattern CPU/RSS, full MLIR/LLVM compilation, IR/object bytes, cast/shuffle/extract/insert expansion, post-RA spills/frame and controlled same-executable runtime. Stop if a cast is illegal, the full union duplicates `P_M`, the oracle exposes an omitted action, or p50/p90 charged full cost has no nondominated candidate point.

No implementation, compile or result has occurred. If independently confirmed, this is a narrow Tier-B N2: target-complete grammar, nonproduct mixed-cut action, bounded certificate and finite falsifier. Collision remains `SEARCH_BOUNDED_OPEN`, never an absence assertion.
