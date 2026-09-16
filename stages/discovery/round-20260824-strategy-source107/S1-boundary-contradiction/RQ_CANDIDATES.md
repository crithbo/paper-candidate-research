# Source107 S1 pre-evidence RQ candidates

All RQs were frozen after the offline seed pool and before targeted source lookup. They are not raw proposals or novelty claims. Exact/contains terminal identities and Source106 declared failures remain excluded.

## RQ-S107-01 — legality-preserving low-bit tail lowering

- Seed: `S107-03`; type hypothesis: `COMPILER_TOOL`.
- Tentative public object: TorchInductor/Triton lowering of one current public low-bit linear operator for dynamically shaped LLM inference.
- Stable envelope: same operator outputs, quantization/rounding contract, layout, user API, and compile+runtime+fallback full cost.
- Primary RQ: Does a current compiler-side alignment/divisibility guard reject a dynamic-shape region for which a target-native low-bit core-plus-tail lowering is already semantically legal and not currently expressed?
- Falsifier: no such guard/fallback exists; current kernel already supports the tail; or tail requires changed quantization/precision semantics.
- FINER-lite: Feasible `CONDITIONAL`; Interesting `CONDITIONAL`; Novelty threat `HIGH`; scope `PASS`; Relevant `CONDITIONAL`.
- Precommitted route: current TorchInductor guard/lowering source → current Triton/TorchAO low-bit kernel contract → public native LLM carrier → contrary current union.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## RQ-S107-02 — reclassifying code-generation-only fallback

- Seed: `S107-08`; type hypothesis: `COMPILER_TOOL`.
- Tentative public object: a specific current `torch.compile`/Inductor fallback path for a public low-bit LLM operator.
- Stable envelope: fixed quantization semantics, output, error/rounding behavior, public API and end-to-end cost boundary.
- Primary RQ: Can a source-visible fallback condition be partitioned into semantically necessary versus code-generation-only cases, leaving one same-function low-bit lowering action outside the current implementation?
- Falsifier: condition is semantic/legality-required, or existing dispatch already recognizes equivalent cases.
- FINER-lite: Feasible `CLEAR` for static closure; Interesting `CONDITIONAL`; Novelty threat `HIGH`; scope `PASS`; Relevant `CONDITIONAL`.
- Precommitted route: first-party source/issue/docs → exact operator kernel implementation → public model carrier → most direct compiler baseline.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## RQ-S107-03 — fallback contract audit

- Seed: `S107-04`; type hypothesis: `MEASUREMENT_CHARACTERIZATION` or `COMPILER_TOOL`.
- Tentative public object: public low-bit LLM calls that cross from compiled to eager/fallback execution.
- Stable envelope: declared quantization operator contract and all host/device synchronization, compile, and fallback costs.
- Primary RQ: Is there a source-visible fallback boundary whose numerical semantics and end-to-end cost cannot be checked with current public compiler diagnostics, and whose audit changes a deployment decision for a native LLM carrier?
- Falsifier: existing diagnostics/reference tests already express the contract, or no native LLM carrier demonstrates a meaningful boundary.
- FINER-lite: Feasible `CONDITIONAL`; Interesting `UNCLEAR`; Novelty threat `HIGH`; scope `PASS`; Relevant `UNCLEAR`.
- Precommitted route: compiler diagnostics/source → quantized operator oracle → public native carrier → contrary tool search.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## RQ-S107-04 — capture island partition

- Seed: `S107-05`; type hypothesis: `SYSTEM_ARCHITECTURE` or `COMPILER_TOOL`.
- Tentative public object: a low-bit LLM decode path compiled with `torch.compile` and CUDA graph capture.
- Stable envelope: request/response order, outputs, quantization behavior, dynamic metadata semantics and total synchronization/memory cost.
- Primary RQ: Is there a current all-or-nothing capture fallback in a public low-bit LLM decode path that admits a semantics-preserving compiler partition with a stable captured compute island?
- Falsifier: capture constraint is already handled upstream, partition changes runtime object/SLO semantics, or it is a generic cache/graph recipe.
- FINER-lite: Feasible `CONDITIONAL`; Interesting `CONDITIONAL`; Novelty threat `HIGH`; scope `PASS`; Relevant `CONDITIONAL`.
- Precommitted route: current PyTorch CUDA graph documentation/source → Inductor graph-break/capture path → public low-bit LLM carrier → current inference-runtime comparison.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## RQ-S107-05 — semantic coverage frontier

- Seed: `S107-02`; type hypothesis: `MEASUREMENT_CHARACTERIZATION`.
- Tentative public object: a versioned public native LLM decode workload across shape/layout/quantization regimes.
- Stable envelope: explicit estimator for compiled-low-bit coverage, fallback class, numerical contract and end-to-end latency/cost.
- Primary RQ: Does a stable, deployment-relevant semantic-coverage frontier exist for low-bit dynamic-shape LLM compilation that current diagnostics cannot measure and that supports a nontrivial decision rule?
- Falsifier: no native carrier, existing metrics suffice, or frontier is only ordinary cold-start/SLO benchmarking.
- FINER-lite: Feasible `CONDITIONAL`; Interesting `CONDITIONAL`; Novelty threat `MEDIUM`; scope `PASS`; Relevant `CONDITIONAL`.
- Precommitted route: public compiler diagnostics → public LLM workload/profile → existing serving benchmark literature/tools.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## RQ-S107-06 — layout certificate guard discharge

- Seed: `S107-06`; type hypothesis: `THEORY_FORMAL` or `COMPILER_TOOL`.
- Tentative public object: compiler-visible low-bit layout metadata on a current public TorchAO/Triton operator path.
- Stable envelope: same packed data interpretation, quantization semantics, kernel legality and certificate checking cost.
- Primary RQ: Can a bounded, source-visible layout certificate soundly discharge an otherwise dynamic low-bit compiler guard for a family of LLM linear calls without being equivalent to an existing dtype/layout dispatch key or new packing format?
- Falsifier: no producer/consumer metadata path, existing dispatch is equivalent, or certificate adds a changed-object representation.
- FINER-lite: Feasible `UNCLEAR`; Interesting `CONDITIONAL`; Novelty threat `HIGH`; scope `PASS`; Relevant `UNCLEAR`.
- Precommitted route: current TorchAO representation/lowering source → TorchInductor guard source → public LLM model carrier → contrary metadata/dispatch search.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.

## Frozen closure ordering

1. `RQ-S107-01` and `RQ-S107-02`: seek a concrete source-level non-generic action and a current code-generation-only fallback.
2. `RQ-S107-04`: independently test whether capture partitioning is already a generic/current runtime facility.
3. `RQ-S107-03`, `RQ-S107-05`, `RQ-S107-06`: continue only if their required native carrier/action remains after the first closures.

No optional same-object alternatives were selected. These six records are distinct contribution contracts; conversion after evidence would be outcome-aware reformulation and is prohibited.
