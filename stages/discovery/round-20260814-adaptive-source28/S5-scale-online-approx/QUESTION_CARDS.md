# Question Cards — Source28 S5

## QC28-01 — LLVM target-ISA MC relaxation repair

- Exact identity: not frozen beyond LLVM `main` target encoding definitions; no target ISA, object format, relocation set, or versioned carrier was selected.
- Same-object question: bounded rewrite after a local assembly edit while retaining stock object-reader semantics.
- Current source locus: LLVM `Target.td` exposes target encoding, decoder and post-encoding/fixup surface.
- Required-field audit: INCOMPLETE — a target-specific atomic action, current relaxation union, carrier and finite stock oracle are not jointly fixed.
- Disposition: `LOCATOR_ONLY__PUBLIC_EVIDENCE_UNCLOSED`.

## QC28-02 — VTR fixed-architecture clustered-netlist update

- Exact identity: current VTR master flow for a Verilog design plus target FPGA architecture.
- Current union/contrary: official VTR describes a complete flow of elaboration/partial mapping, technology mapping, packing, placement, routing and timing analysis, with benchmark designs.
- Same-object question: bound changed clusters after a netlist edit without changing architecture legality.
- Hard-gate result: the named action remains generic packing/placement; no target-native partial primitive distinguishes it from the current flow.
- Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_KERNEL_AND_CURRENT_FLOW_UNION`.

## QC28-03 — NVDLA local graph-edit layer/buffer constructor

- Exact identity: NVDLA SW `master`, fixed hardware configuration (`nv_full`, `nv_large`, or `nv_small`), fixed supported network feature set, a logical network graph with one local edit, and stock NVDLA Loadable/runtime acceptance.
- Carrier kind: `CANONICAL_FORMAL_ORACLE`. Official CompilerFeatures records verified MNIST, ResNet-18 and ResNet-50 configurations; a specific official regression carrier is closure debt, not a claimed result.
- Problem: current NVDLA compilation is layer-by-layer and may split convolution into mini-operations as available convolution-buffer capacity requires. A local graph edit may therefore force a whole compilation although the semantic contract is fixed.
- Proposed insight: a target-specific complete action could jointly update hardware-layer partitioning and feature-map/buffer state with a bounded-recourse guarantee, distinguishable from generic graph partitioning because it preserves NVDLA-supported layer/configuration and stock Loadable/runtime semantics.
- Research contract: `SYSTEM_ARCHITECTURE`, N2; endpoint is a target-native bounded-recourse layer/buffer constructor. The counterfactual is that same-config compiled state can be updated without a full layer/buffer rebuild while preserving stock acceptance and logical network behavior.
- Current source locus: `umd/core/src/compiler` contains `Compiler.cpp`, `DLAResourceManager.cpp`, `Memory.cpp`, `Network.cpp`, `Surface.cpp`, `TargetConfig.cpp` and `Tensor.cpp`; official feature documentation identifies supported layers/configurations and verified networks.
- Initial strongest subtractor: stock NVDLA compiler's whole current layer-by-layer and capacity-driven mini-operation construction union, including all default/nondefault target-config entry points once enumerated.
- Initial full-cost boundary: parse/canonicalize, layer/buffer reconstruction, state-rewrite bytes, peak device/host buffer requirements, loadable bytes, compile CPU/RSS/temp, stock runtime/oracle work, and any rollback/rebuild cost.
- Minimum falsifier: one official network/config local edit where the construction changes stock Loadable/runtime semantics, cannot meet its predeclared recourse boundary, or is exactly expressible by the frozen stock union.
- Finite fidelity closure: `SOURCE_CLOSURE_QUEUE.yaml`; exact commit, action-union/flags, one canonical carrier and independent collision are each finite public/source tasks. No implementation or main result is claimed.
- Required-field audit: COMPLETE for evidence-qualified raw; complete current union, strongest same-object collision, full witness and engineering interface are registered finite closure debt.
- Disposition: `FRESH_RAW_OPPORTUNITY`; eligible for C0: YES.

## Funnel

| Stage | Count |
|---|---:|
| Offline seeds (non-evidence) | 6 |
| RQ candidate families | 3 |
| Evidence-qualified raw | 1 |
| C0 / deep / clean Stage0 brief | 0 / 0 / 0 |
