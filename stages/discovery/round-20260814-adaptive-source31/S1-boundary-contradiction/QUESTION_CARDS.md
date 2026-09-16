# Evidence-qualified Question Cards

## RQ-S01-2 — RISC-V Zcmp frame construction

| Field | Finding |
|---|---|
| Exact identity | Fixed RISC-V program/call graph, psABI unwind and exception observables, Zcmp-enabled target. |
| Proposed action | Jointly choose compressed push/pop versus ordinary frame/save/restore paths. |
| Current locus | RISC-V Zc extension v1.0; LLVM `RISCVUsage.rst` on `main` lists Zcmp as supported. |
| Carrier / full cost | Public compiler tests and C/C++ call graphs; compiler CPU/RSS, text bytes, frame bytes, unwind data, cycles. |
| Minimum falsifier | Candidate is ordinary frame-lowering/code-size selection with no target-specific action or guarantee. |
| Decision | **EXCLUDED_BEFORE_RAW__GENERIC_WRAPPER_OR_SOLVER.** The action remains generic frame lowering/cost tuning. No raw or absence claim is made. |

## RQ-S02-2 — Wasm exception tag materialization

| Field | Finding |
|---|---|
| Exact identity | Fixed Wasm EH module, tag/catch semantics, host-visible result, nominated engine ABI. |
| Proposed action | Whole-module tag/materialization construction preserving exception propagation/completion behavior. |
| Current locus | WebAssembly 3.0 core/embedding and EH draft specifications. |
| Carrier / full cost | Public EH modules conditional on engine pin; translation CPU/RSS, artifact bytes, boundary marshaling, runtime latency/RSS. |
| Minimum falsifier | A pinned engine already owns all tag representations, or the candidate changes embedding ABI. |
| Closure route | Pin one public engine commit, EH defaults/nondefaults and tag ABI/source paths, then select canonical module. |
| Decision | **LOCATOR_ONLY__PUBLIC_EVIDENCE_UNCLOSED.** The semantic object exists, but its required engine union/comparator is not frozen by this bounded route. |

`evidence_qualified_raw_count: 0`
