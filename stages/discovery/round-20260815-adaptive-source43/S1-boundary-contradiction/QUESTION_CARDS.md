# Source43 — evidence-qualified question cards

## QC01 — Swift async context forwarding

- **Exact identity / same-object contract:** one fixed Swift `async throws` caller/callee graph, result/error and task-local observations, and the native Swift async ABI; not a task scheduler or ABI switch.
- **Hypothetical N2:** a target-specific interprocedural context-forwarding construction with an explicit call/frame-cost guarantee.
- **Current evidence:** `SRC01` establishes that async has a distinct ABI, but does not identify a current compiler lowering locus or a non-generic action; Wave294 is `RELATED_ONLY`, not an exclusion.
- **Natural carrier, oracle, full cost:** public Swift concurrency tests/examples; SIL/IR/object plus run-time result/error oracle; compile CPU/RSS, text, frame/context moves and execution cost.
- **Finite falsifier/closure:** one deterministic source route to `swiftlang/swift` default-branch commit returned on first successful Source43 retry, then identify the exact async-context lowering and one target test.  Kill the RQ if all remaining action is ordinary coroutine frame/call lowering or the action changes ABI observations.
- **Disposition:** `LOCATOR_ONLY__RQ_BACKLOG`; it cannot become raw before its source locus and non-generic discriminator close.

## QC02 — Wasmtime component-memory64 canonical ABI representation

- **Exact identity / same-object contract:** a fixed Wasmtime Component Model component using memory64, fixed canonical lift/lower result and trap behavior, and Wasmtime upstream main selected deterministically at retrieval date.
- **Hypothetical N2:** a component-artifact constructor jointly sharing memory-width representation across entry points without changing canonical ABI observations.
- **Current evidence:** `SRC02` exposes current memory32/memory64 canonical ABI size/alignment metadata and `SRC03` records current feature support.  This does not prove a global performance result, but removes the proposed primitive mismatch; the remaining statement is generic representation/layout planning.
- **Natural carrier, oracle, full cost:** public Wasmtime component tests; component validator/runtime result/trap oracle; compile/artifact bytes, eval latency and RSS.
- **Minimum falsifier:** a fixed component whose observable canonical ABI changes, or a purported method reducible to selecting/arranging the already exposed ABI metadata.
- **Disposition:** `EXCLUDED_BEFORE_RAW__NO_TARGET_SPECIFIC_N2_BEYOND_CURRENT_CANONICAL_ABI_METADATA`.

## QC03 — LLVM `byref` / `invoke` ABI lifetime

- **Exact identity / same-object contract:** a fixed LLVM IR `invoke` call graph with `byref` formal-parameter ABI, unchanged normal and unwind observations, and unchanged target ABI.
- **Hypothetical N2:** an LLVM-IR-native, target-specific call/frame-lifetime construction with a legality and full-cost guarantee; no call-convention selector or generic frame allocator.
- **Current evidence:** `SRC04` directly establishes that `invoke` supports operand-bundle syntax and that bundles are call-site semantics.  It does not, in the bounded retrieved lines, freeze the `byref`-specific current implementation/attribute composition.
- **Natural carrier, oracle, full cost:** LLVM IR and Clang ABI tests; verifier/assembler/object/unwind oracle; compile CPU/RSS, frame bytes, spills and code bytes.
- **Finite falsifier/closure:** inspect the `byref` parameter-attribute documentation plus current `llvm/llvm-project` default-branch lowering tests at the commit returned on the first successful Source43 retry; kill if `byref` cannot coexist under the fixed endpoint or all legal choices are normal frame lowering.
- **Disposition:** `LOCATOR_ONLY__RQ_BACKLOG`; source closure is concrete and bounded, but no raw is claimed before it completes.

## QC04 — MLIR Transform handle/payload validity

- **Exact identity / same-object contract:** fixed Transform IR and payload IR semantics, transform success/failure behavior and payload validity; no postprocessor or external checker wrapper.
- **Hypothetical N2:** a target-specific complete constructor for a transform sequence that preserves the declared payload contract.
- **Current evidence:** `SRC05` specifies transform effects, consumed-handle invalidation and current checking support.  The remaining proposed work is generic sequence scheduling/verification, not a target-specific action or guarantee.
- **Natural carrier, oracle, full cost:** public MLIR Transform dialect tests; Transform interpreter/check-use diagnostics and payload verification; transform CPU/RSS, produced IR size and resulting code cost.
- **Minimum falsifier:** any action no richer than ordering existing Transform operations or enabling an existing check.
- **Disposition:** `EXCLUDED_BEFORE_RAW__GENERIC_TRANSFORM_SEQUENCE_OR_CHECKER`.
