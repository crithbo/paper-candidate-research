# Source104 S1 — Public Carrier Closure and Question Cards

## Shared evidence boundary

- Current public carriers examined: TorchAO `Int4WeightOnlyConfig` source and releases; ExecuTorch LLM quantization/QNN backend documentation; llama.cpp current Q4_K quantization source and Metal/Vulkan loci; MLIR quant operation/lowering source.
- Contrary sources: TorchAO layout/dispatch documentation and release migration notes; current llama.cpp Metal Q4_K tuning issue; public ExecuTorch 16a4w invalid-response issue; frozen terminal identities listed in `DIVERSIFICATION_NOTE.yaml`.
- Global identity result: no Source103 exact failure identity was repeated. `QPACK/QGROUP/SEGMENTED_SCALE` remain terminal; generic compiler-layout bridge, low-bit format rename, and uncarried NDP sketch remain excluded by the frozen diversification note.
- Source104 Rule-Audit output: not read and not used.

## `RQ-S1-104-01` — TorchAO INT4 packing/dispatch

- Exact public identity: current TorchAO `Int4WeightOnlyConfig` groupwise INT4 pipeline.
- Current locus: `quant_api.py` constructs the configured INT4 tensor subclass, with packing formats and target-specific `ntile`; public layout/dispatch documentation records packed quantized-linear dispatch.
- RAW_REQUIRED audit: `INCOMPLETE`.
- Strongest skeptic: the current layout tensor and dispatch mechanism already express the proposed format-to-kernel action.
- Identity relation: `RELATED_ONLY_DO_NOT_EXCLUDE` to old W4 terminal topics, but the proposed residual is absent.
- Disposition: `LOCATOR_ONLY`.
- Reason: no distinct target-native action remains after subtracting current format/packing/dispatch; changing the format name would violate the Source104 anti-repeat boundary.

## `RQ-S1-104-02` — ExecuTorch delegate boundary

- Exact public identity: ExecuTorch current QNN quantizer plus QNN partitioner/delegate.
- Current locus: official QNN backend documentation defines 16a4w/16a4w_block and the partitioner's support-driven delegation.
- RAW_REQUIRED audit: `INCOMPLETE`.
- Strongest skeptic: current quantizer/partitioner already owns supported-node selection; the available contrary evidence is a single public invalid-response report.
- Identity relation: `RELATED_ONLY_DO_NOT_EXCLUDE`.
- Disposition: `LOCATOR_ONLY`.
- Reason: a one-issue replay is forbidden, while exact semantic closure needs QNN SDK/device evidence not available under this public-single-GPU assignment; no resource failure is inferred as scientific negative.

## `RQ-S1-104-03` — MLIR rounding obligation

- Exact public identity: MLIR quant operations plus an unspecified target backend.
- Current locus: MLIR quant operations define stored/expression conversion and lower-level decomposition; current docs assign rounding details to a transform pipeline.
- RAW_REQUIRED audit: `INCOMPLETE`.
- Strongest skeptic: this is a generic quant-dialect/lowering formulation unless one target backend and atomic code-selection action are frozen.
- Identity relation: `RELATED_ONLY_DO_NOT_EXCLUDE`.
- Disposition: `LOCATOR_ONLY`.
- Reason: no same-object versioned MLIR-to-target carrier was closed in the frozen query set; pairing MLIR with another runtime would be a generic bridge.

## `RQ-S1-104-04` — llama.cpp Q4_K backend action

- Exact public identity: current llama.cpp Q4_K block format and current backend kernels.
- Current locus: Q4_K source defines scale/min reconstruction and nibble dequantization; current Metal and Vulkan paths expose explicit Q4_K kernels and tuning/coalesced scale-load work.
- RAW_REQUIRED audit: `INCOMPLETE`.
- Strongest skeptic: the only concrete current action located is backend kernel parameter/load tuning, which is ordinary implementation tuning rather than a new atomic algorithm or semantic construction.
- Identity relation: `RELATED_ONLY_DO_NOT_EXCLUDE`.
- Disposition: `LOCATOR_ONLY`.
- Reason: the public affine-to-integer-zero-point mismatch is a useful falsifier, but no public same-object target action beyond existing backends was frozen; an NDP mapping would violate the carrier-first boundary.

## `RQ-S1-104-05` — TorchAO tiled legality boundary

- Exact public identity: current TorchAO tiled INT4 tensor/dispatch path.
- Current locus: current source explicitly selects `Int4TilePackedTo4dTensor` for the tiled packing format with finite ntile choices.
- RAW_REQUIRED audit: `INCOMPLETE`.
- Strongest skeptic: current type/packing/dispatch captures legality, and unsupported cases would amount to skip/configuration behavior without a new action.
- Identity relation: `RELATED_ONLY_DO_NOT_EXCLUDE`.
- Disposition: `EXCLUDED_BEFORE_RAW`.
- Reason: generic layout/legality bridge, explicitly prohibited by Source104 diversification boundary.

## `RQ-S1-104-06` — ExecuTorch qparam materialization

- Exact public identity: one current ExecuTorch quantized-decomposed op plus a public backend partitioner.
- Current locus: Vulkan registry exposes quantize/dequantize/qparam operations; QNN partitioner documentation describes backend support and delegation.
- RAW_REQUIRED audit: `INCOMPLETE`.
- Strongest skeptic: qparam materialization/partition is either current graph/backend machinery or cannot be closed without SDK/device-specific material.
- Identity relation: `RELATED_ONLY_DO_NOT_EXCLUDE`.
- Disposition: `LOCATOR_ONLY`.
- Reason: no target-specific atomic action and smallest public semantic witness were jointly established.

## `RQ-S1-104-07` — llama.cpp packed ownership/offload

- Exact public identity: current llama.cpp K-quant tensor with backend/offload interface.
- Current locus: current source gives the packed format semantics; public backend/offload controls exist, but no distinct representation-ownership action was identified.
- RAW_REQUIRED audit: `INCOMPLETE`.
- Strongest skeptic: generic memory placement/offload policy, which belongs to a different lane/object unless a quant-format action changes the same endpoint.
- Identity relation: `RELATED_ONLY_DO_NOT_EXCLUDE`.
- Disposition: `EXCLUDED_BEFORE_RAW`.
- Reason: no non-generic action survives the full-cost and lane-boundary test.

## `RQ-S1-104-08` — abstract representation-state action

- Exact public identity: none; carrier selection was intentionally deferred to source closure.
- RAW_REQUIRED audit: `INCOMPLETE`.
- Strongest skeptic: existing compiler conversion/layout graph mechanisms.
- Identity relation: `RELATED_ONLY_DO_NOT_EXCLUDE`.
- Disposition: `EXCLUDED_BEFORE_RAW`.
- Reason: `GENERIC_SHELL`; no versioned same-object carrier and atomic target action were identified.

## Front-end result

| Metric | Count |
|---|---:|
| Non-evidence seeds | 8 |
| Frozen primary RQs | 8 |
| Selected exact public carrier closures | 8 |
| `EVIDENCE_QUALIFIED_RAW` | 0 |
| C0 / D1 / deep review | 0 / 0 / 0 |
| Clean Stage 0 briefs | 0 |

No source-closure queue remains: each RQ either reaches a bounded `LOCATOR_ONLY` conclusion or is structurally excluded before raw. No resource absence supports any scientific conclusion.
