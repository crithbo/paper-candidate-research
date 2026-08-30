# Candidate-grade deep review

## F1 — Wasm local-index / stackification joint planner

**Disposition:** `NOT_ADMITTED_UNFROZEN`; no brief.

| Gate | Frozen record |
|---|---|
| Exact semantics | Same Wasm module function results, imports/exports, tables, memory effects, traps, and stock validator/runtime behavior. |
| Complete proposed action | Coalesce/reassign locals; group declarations by type; regenerate local references; choose stack versus spill, tee/copy, and structured control representation; serialize all affected LEB fields. |
| Current strongest union | LLVM WebAssembly backend stackification; Binaryen `wasm-opt`, Stack IR, `CoalesceLocals`, code-folding/control passes and all applicable pipelines/options; WABT/standard validator-reader routes. Complete current union is unclosed. |
| Legal witness | A temporary can be represented as stack-carried or as `local.set`/`local.get` with regenerated legal indices, without altering the function’s semantics. This is not a residual certificate. |
| Putative N2 | Whole-function joint construction with an explicit byte/code-quality/compile-cost approximation or structural guarantee. No such union-external guarantee is frozen. |
| Natural carrier | WasmBench or LLVM Test-Suite modules. |
| Full cost | Writer/compiler CPU+wall+RSS+temporary files; Wasm bytes; validation/parse CPU+RSS; runtime CPU/RSS with identical inputs; code-size and compile-time effects jointly. |
| 72h killer | Pin LLVM, Binaryen, WABT revisions; enumerate stackify/local-coloring/reorder/spill/control options and default pipelines; construct the two-output witness; validate and compare runtime behavior; reject if a stock union path emits it, only pass ordering/parameters remain, any semantic difference appears, or full cost removes benefit. |
| Fidelity closure | Finite but not complete: current-source/action union and direct collision are the closure prerequisites. |

### Six-dimensional residual check

1. **Decision rule:** joint allocation and stack/control construction is larger than choosing a pass sequence.
2. **Information:** only the same Wasm IR/module facts may guide it.
3. **Resource/complexity:** any claim must outperform or characterize existing liveness-based coalescing and stackification with full construction cost.
4. **Guarantee:** byte changes at LEB thresholds are not a code-quality or algorithmic guarantee.
5. **Full cost:** compilation, validation, and runtime belong in the denominator.
6. **No-gain zone:** pass ordering, flag tuning, isolated local reorder, and generic register allocation are excluded.

The withheld outcome follows unclosed union/collision, not lack of implementation, results, resources, or AI readiness.
