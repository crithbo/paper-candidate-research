# Unique opportunity family

## F1 — joint Wasm local-index, stackification, and control-layout constructor

**Same-object contract.** Fixed Wasm function/module behavior, exports, tables, memory, and traps must remain valid under a stock validator/runtime. All `local.get`, `local.set`, `local.tee`, branch/control references, local declarations, and LEB-encoded indices may be regenerated consistently; changing the module interface, observable traps, runtime, or format is prohibited.

**Putative whole action.** Jointly choose local live-range coalescing, local declaration/type grouping, numeric local indices, stackification versus spill-to-local, tee/copy actions, and structured block/control placement. A genuine N2 would require a defined whole-function objective and a formal approximation/complexity/quality result beyond existing local coalescing and stackification.

**Minimal legal two-output witness.** For a typed straight-line fragment where a temporary feeds a later consumer, output A can spill the temporary to a local (`local.set` then `local.get`); output B can retain it on the operand stack when structured evaluation order permits. Both preserve function behavior and validation. If enough locals precede a referenced local, regenerated index assignments can also cross a ULEB-width boundary. This witnesses a semantic-preserving choice, but does **not** establish a union-external action: current LLVM stackification and Binaryen local coalescing are explicit comparators.

**Why not admitted.** Current Binaryen is a same-object wasm-to-wasm optimizer with Stack IR, code-size/speed passes, and a liveness-based local coalescer; LLVM has a native stackification code-size pass. The full compositional union—including complete pipelines, options, and direct paper/tool collision—is not source-pinned. Without a guarantee that survives those baselines, the alleged joint planner may be pass composition, generic register allocation, or tuning.

**Natural route.** WasmBench and LLVM Test-Suite are public natural carriers. A later finite gate would use a small fixed module plus stock validation/runtime equivalence and byte/compiler/reader costs; no such run was performed.
