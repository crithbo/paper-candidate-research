# Source55 Question Cards

## QC-S55-01 — Component Canonical ABI

- Exact public identity: fixed component imports/exports, values and traps under the stock Canonical ABI lift/lower/memory/realloc/post-return contract.
- Five-field preflight: exact historical Source30/35 identity. Excluded before raw; no closure/deep work is performed.

## QC-S55-02 — ELF DT_RELR

- Exact public identity: fixed ELF relocation targets and ABI under stock dynamic-loader relocation result.
- Five-field preflight: exact historical Wave166 identity. Excluded before raw; no closure/deep work is performed.

## QC-S55-03 — LLVM ORC JITLink LinkGraph stubs/GOT

- Exact public identity: fixed relocatable input graph, target architecture, symbol/relocation resolution and callable JIT runtime result.
- Contribution hypothesis: `COMPILER_TOOL/N2` only if an atomic target-specific LinkGraph-to-stub/GOT construction has a formal/complexity/Pareto guarantee beyond generic graph arrangement and stock pass composition.
- Current union evidence: LinkGraph provides passes before/after pruning, allocation and fixup; documented/source builders construct GOT/PLT stubs and target code performs access relaxation.
- Counterfactual: an actual residual would change JIT materialization and lookup/full cost without changing resolution semantics or merely scheduling/allocating a graph.
- Minimum falsifier: produce one target-specific action and guarantee not expressible by a LinkGraph pass plus current GOT/stub builders. None is source-frozen.
- Initial full cost: object parsing, graph/pass CPU/RSS, allocation/transfer, GOT/PLT/stub bytes, resolution/materialization latency and executable memory.
- Raw gate: `INCOMPLETE__DIRECT_CURRENT_UNION_OR_GENERIC_GRAPH_LAYOUT`; no raw admission.

None of the entries is dropped for lack of implementation, result, resource, corpus, hardware or AI readiness.
