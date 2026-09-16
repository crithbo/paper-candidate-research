# Current action and certificate audit

## First-party current-source audit

- [Vector dialect lowering tradeoffs](https://mlir.llvm.org/docs/Dialects/Vector/) documents current nested aggregate lowering, flattened 1-D lowering and mixed partial flattening; it treats irregular casts as possibly masked, shuffled or infeasible.
- [VectorLinearize](https://mlir.llvm.org/doxygen/VectorLinearize_8cpp_source.html) is a direct subtractor: its type converter maps every linearizable rank>=2 vector to the 1-D product and materialises `vector.shape_cast`; it has an explicit interleave pattern.
- [ShapeCast lowering](https://mlir.llvm.org/doxygen/LowerVectorShapeCast_8cpp_source.html) supplies the fixed-vector extract/insert/strided-slice decomposition and rejects unsupported scalable forms.
- [Vector-to-LLVM pass options](https://mlir.llvm.org/docs/Passes/) are all in the comparator grid; options relying on changed semantic preconditions are not candidate actions.
- [X86 TTI](https://llvm.org/doxygen/X86TargetTransformInfo_8cpp_source.html) provides the target-width boundary. [VPlan analysis](https://llvm.org/doxygen/VPlanAnalysis_8cpp_source.html) remains the direct subtractor for VF/UF/register-budget selection, not the pre-conversion representation cut.

## Action catalog and separation

| Family | Current action | Revision disposition |
|---|---|---|
| `N` nested | stock n-D aggregate lowering | baseline |
| `F` full flat | VectorLinearize plus materialised shape casts | direct subtractor |
| `M` mixed `2x8` | legal current ShapeCast action, no current whole-graph partial-cut selector found | candidate action |
| ShapeCast expansion | current source construction | mandatory cost/legality action |
| VPlan / physical RA | downstream vectorization and register actions | identical comparator; never MLIR theorem |

For equal `(L,T,O,Q,H)` state, every remaining source action has the same legality, shape-cast decomposition and target-width cost increment. Therefore `C` may be dominated only inside that equality class. This is the future-action argument; it rejects untyped generic graph labelling. `H` keeps the exact escaping MLIR/LLVM interface so later RA/spill claims cannot be smuggled into the static certificate.

## Witness audit

The source-defined full linearizer can make `P_F` from the interleave witness, and default conversion can make `P_N`. `P_M` uses current casts to retain the outer dimension while exposing inner width eight. It changes neither values, masks, fast-math, memory/alias condition nor ABI. Its existence does not prove a performance result; it is the required comparator-separating action divergence.

