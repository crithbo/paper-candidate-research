# Independent revision-1 closing — MLIR vector representation frontier

## Decision

| Field | Result |
|---|---|
| Assignment | `STAGE0-C2-20260814-MLIR-VECTOR-REPRESENTATION-REGISTER-PRESSURE-PARETO-DP-REVISION1-CLOSING-V8.7` |
| Revision gate | `PINNED_MLIR_REPRESENTATION_ACTIONS__VPLAN_SEPARATED_BOUNDED_FRONTIER_CERTIFICATE` |
| Revision budget | `1/1 consumed` |
| Closing decision | `INCONCLUSIVE_POLICY_HOLD` |
| Scientific STOP | `not established` |
| Stage A / B | `false / false` |

The revision cannot be confirmed for Stage 0 PASS.  Its sole same-function `N/M/F` witness is not a legal `vector.interleave` operation, so the claimed stock-lowerable mixed cut and the associated frontier certificate are not closed.  This is a static action-contract failure, not evidence that the topic is absorbed by the current union or structurally impossible.  Since the ordinary revision budget is exhausted, the required disposition is `INCONCLUSIVE_POLICY_HOLD`; this review does not create a corrected witness or a second revision.

## Frozen-package check

All four canonical revision artifacts match the supplied manifest.  The review independently attacked the declared x86-64 AVX2, SysV, same-function action grammar; the `N/M/F` witness; current `VectorLinearize`; downstream VPlan separation; and the stated bounded-frontier certificate.  No implementation, compilation, experiment, or Stage A/B activity occurred.

## Decisive failure: the proposed interleave witness is not native-legal

The revision declares:

```mlir
%r = vector.interleave %a, %b : vector<2x1x4xf32> -> vector<2x2x4xf32>
```

`vector.interleave` interleaves the **trailing/final dimension**, and its result has that trailing dimension doubled.  Thus, for inputs `vector<2x1x4xf32>`, the native result shape is `vector<2x1x8xf32>`, not `vector<2x2x4xf32>`.  The operation as written changes the middle dimension and fails the dialect's operation contract.  [Vector dialect reference](https://mlir.llvm.org/docs/Dialects/Vector/)

The current `VectorLinearize` source confirms this precise rule with its own valid example: `vector<4x1xT> -> vector<4x2xT>`, where `T` is the element type and therefore the final vector dimension is `1`; it does not license changing an interior dimension of `vector<2x1x4xf32>`.  [VectorLinearize source](https://mlir.llvm.org/doxygen/VectorLinearize_8cpp_source.html)

Consequently all three submitted plans lack the required common same-function base:

| Submitted plan | Failure impact |
|---|---|
| `P_N: 2x1x4 -> 2x2x4` | purported stock nested plan contains an invalid operation |
| `P_M: 2x4 -> 2x8 -> shape_cast back to 2x2x4` | no longer denotes the same native interleave result or an equal-product cast path |
| `P_F: 8 -> 16 -> shape_cast back to 2x2x4` | likewise cannot be a stock lowering of the declared operation |

The illegal witness is not a harmless presentation defect.  The gate explicitly required a stock-legal same-function representation-boundary action divergence.  Without it, there is no path-to-native-plan bijection for the declared grammar, no valid `N/M/F` oracle domain, and no exact frontier theorem for the stated action/cost contract.

## Current-union and algorithm attacks

- `VectorLinearize` is correctly a direct subtractor for full flattening: it converts n-D vectors to one-dimensional products and has an explicit `vector.interleave` conversion pattern.  `F` is therefore not candidate novelty.  The source does not by itself prove a whole-graph partial-cut planner, so it does not supply a scientific direct-absorption finding against a *valid* `M` plan.  [VectorLinearize source](https://mlir.llvm.org/doxygen/VectorLinearize_8cpp_source.html)
- Fixed-vector ShapeCast lowering is real, but legality alone cannot turn the invalid result shape into an equal-product `vector.shape_cast` route.  Its source lowerer operates on an actual `ShapeCastOp`; it is not a custom emitter escape hatch.  [ShapeCast lowerer](https://mlir.llvm.org/doxygen/LowerVectorShapeCast_8cpp_source.html)
- VPlan remains a downstream VF/UF/register-budget subtractor.  The submitted witness has no loop, so it contains no VPlan decision at all.  This appropriately prevents a VPlan-based PASS, but the principal failure is the pre-VPlan MLIR operation's illegality.
- The declared state `(L,T,O,Q,H,C)` could only be future-action sufficient after the catalog contains valid actions for every introduced operation.  Because the sole separating operation is invalid, the action/path bijection and FPT exact-frontier claim are unproven for the frozen contract.  Replacing the result shape with a different legal program would be a new gate-bearing construction, which this closing role is not authorized to perform.

## Disposition and boundary

The review found no current same-object method that directly absorbs a valid complete mixed-cut optimizer, and the literature/collision status stays `SEARCH_BOUNDED_OPEN`.  It therefore makes no scientific `BELOW_Q2_STOP` finding.  Conversely, no PASS can issue from an invalid native action witness; missing compile output, native replay, corpus result, or measured benefit played no role in this decision.

Mainline should retain the frozen material and record `INCONCLUSIVE_POLICY_HOLD__INTERLEAVE_WITNESS_NOT_NATIVE_LEGAL`.  It must not automatically execute a second revision, reroute to Stage A/B, convert to reserve, or infer a scientific STOP.  Reconsideration requires a future user-authorized exceptional assignment with an explicit gate, count, evidence ceiling, and write boundary.

Lane terminal state: `IDLE_REUSABLE_AWAITING_MAINLINE`.
