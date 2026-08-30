# Evidence-qualified Question Cards

## RQ-S01-B — Cooperative-matrix layout construction

| Required field | Finding |
|---|---|
| Exact identity | Fixed SPIR-V cooperative-matrix shader and numeric/device-visible output contract. |
| Same-object problem | Choose legal cross-region layout transitions without changing the shader result. |
| Proposed endpoint | Full-cost reduction in conversion, binary, and runtime execution costs. |
| Non-generic discriminator | Target-visible cooperative-matrix layout legality. |
| Current locus | Official unified SPIR-V specification, cooperative-matrix layout section. |
| Natural carrier | Public cooperative-matrix shader modules, once a compiler/runtime pair is pinned. |
| Falsifier | A source-pinned compiler/runtime already owns all legal layout transitions, or no same-object target-specific action remains. |
| Closure route | Pin one public compiler/runtime revision and its default/nondefault feature union; then derive a legal shader witness. |
| Initial full cost | Compile CPU/RSS, binary bytes, conversion operations, runtime latency, device memory. |
| Decision | **LOCATOR_ONLY__PUBLIC_EVIDENCE_UNCLOSED.** The specification alone cannot establish the compiler/runtime action union or a fair strongest comparator. No absence claim or scientific negative inference is made. |

## RQ-S02-B — MLIR GPU async-token ownership

| Required field | Finding |
|---|---|
| Exact identity | Fixed MLIR GPU async program, token dependency semantics, buffer results, and completion behavior. |
| Same-object problem | Reduce token materialization/storage/synchronization cost while preserving dependencies and completion observables. |
| Current locus | LLVM MLIR `gpu` dialect documentation and `GPUDialect.h` define `gpu.async_token`; current source includes async-region rewriting. |
| Natural carrier | MLIR GPU async test programs and GPU dialect modules. |
| Falsifier | The candidate action is an ordinary generic async-region/token rewrite. |
| Initial full cost | Compiler CPU/RSS, IR/binary size, synchronization/storage, runtime latency, resident memory. |
| Decision | **EXCLUDED_BEFORE_RAW__GENERIC_WRAPPER_OR_SOLVER.** The action has no target-specific semantic primitive beyond the general token/rewrite machinery, so it does not provide an S1 N2 contribution. |

`evidence_qualified_raw_count: 0`
