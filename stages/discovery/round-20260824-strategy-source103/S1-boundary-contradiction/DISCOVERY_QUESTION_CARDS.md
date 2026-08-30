# Source103 S1 — Evidence-Qualified Question Cards

## Shared source-closure boundary

- Public sources consulted: MLIR Quant Dialect and LowerQuantOps documentation; vLLM INT4/W4A16 documentation and current releases; compressed-tensors; TorchAO INT4 configuration and layout/dispatch source; TensorRT Edge-LLM INT4 groupwise GEMM documentation; TVM QNN compiler paper; LUT Tensor Core; PIMCOMP; CHIME; SpecVLA.
- Global terminal identity surface consulted: frozen `registry.yaml`, especially `QPACK-REFINE-REV0`, `QGROUP-GUARD-REV0`, and `SEGMENTED-SCALE-W4A16-REV0`.
- Search boundary: exact format/action phrases plus current official docs/source and the mandatory same-object subtractors. No search result is used as an absence claim.
- All group-repository material remains `LOCATOR_AND_RESOURCE_ALIGNMENT_ONLY`; no unlisted file, build, test, VCS, server, or write action occurred.

## `RQ-S1-103-01` — IR-to-backend W4 lowering boundary

- Exact public identity: MLIR `quant` dialect plus a W4A16 runtime was proposed, but no single public carrier was frozen that owns both the IR contract and the target execution action.
- Current/source loci: MLIR quant type/lowering documentation; vLLM W4A16 documentation; TVM QNN paper.
- Global identity preflight: `RELATED_ONLY` to `QPACK-REFINE-REV0`; it must not be reframed as vLLM's already-absorbed unpack/repack action.
- RAW_REQUIRED audit: `INCOMPLETE` — missing one exact same-object target carrier and a source-supported non-generic action beyond current IR lowering and runtime dispatch.
- Minimum falsifier: a current public compiler/backend that already expresses the proposed fixed-contract lowering.
- Disposition: `LOCATOR_ONLY`.
- Reason: MLIR explicitly provides quantized type conversion/lowering; vLLM provides W4A16 execution. Bridging them without one native carrier would be a cross-system wrapper, not an admissible paper object.

## `RQ-S1-103-02` — K-tile partial-sum merge

- Exact public identity: fixed W4A16 GEMM/GEMV arithmetic contract plus target K-tile merge action was not frozen from a single current source.
- Current/source loci: TensorRT Edge-LLM INT4 groupwise GEMM plugin; TorchAO INT4 tiled layouts; LUT Tensor Core.
- Global identity preflight: a vLLM K-group variant would be `TERMINAL_CONTAINS`/forbidden because `QGROUP-GUARD-REV0` and `SEGMENTED-SCALE-W4A16-REV0` already close the frozen guard and routine retile actions.
- RAW_REQUIRED audit: `INCOMPLETE` — no distinct target-specific merge construction or small separating witness; ordinary split-K/mixed-precision/current kernel union remains the strongest explanation.
- Minimum falsifier: a source showing that the proposed merge has semantics not covered by target-native K-group legality and existing groupwise kernels.
- Disposition: `LOCATOR_ONLY`.
- Reason: retaining it would either revive an excluded vLLM action or generalize an unspecified tile optimization beyond a same-object carrier.

## `RQ-S1-103-03` — group metadata under layout transform

- Exact public identity: groupwise INT4 weight, scales/zero points, and target layout transform.
- Current/source loci: TorchAO documents groupwise INT4, packing format/layout selection, and dispatch to packed INT4 linear execution; TensorRT plugin documents fragment layout and group scales.
- Global identity preflight: `TERMINAL_CONTAINS` for the vLLM unpack/transpose/repack/scale/zero/nibble-group formulation in `QPACK-REFINE-REV0`; `RELATED_ONLY` to other backends.
- RAW_REQUIRED audit: `INCOMPLETE` — no distinct target action survives the current layout/packing union; reducing the idea to address or metadata checking is a generic checker.
- Minimum falsifier: any current layout abstraction that retains quantized-linear semantics while choosing target packing, which TorchAO already provides for the proposed generic form.
- Disposition: `EXCLUDED_BEFORE_RAW`.
- Reason: the vLLM form is terminally absorbed; the cross-backend form is a generic layout/packing mechanism with no frozen residual.

## `RQ-S1-103-04` — quantized fusion legality

- Exact public identity: a specific W4A16 fused operator and current target fusion action were not identified.
- Current/source loci: MLIR lower-quant operations; TVM QNN canonicalize/legalize; vLLM W4A16 runtime documentation.
- Global identity preflight: `RELATED_ONLY` to the terminal W4 packing actions; no terminal identity is reused.
- RAW_REQUIRED audit: `INCOMPLETE` — current source supports the general legality/canonicalization mechanism, but no same-object W4 target fusion action, exact endpoint, or non-generic discriminator was frozen.
- Minimum falsifier: an official current fusion path that either exactly implements or renders the action ordinary.
- Disposition: `LOCATOR_ONLY`.
- Reason: a generic “fusion legality rule” cannot enter raw without a concrete native operator/fusion carrier.

## `RQ-S1-103-05` — tail/fallback semantic selection

- Exact public identity: a current W4A16 fast/fallback pair with one fixed endpoint was not frozen.
- Current/source loci: TorchAO INT4 configuration exposes group-size/layout constraints; vLLM W4A16 documentation exposes supported execution, but neither supplied the required same-object tail action in this bounded closure.
- Global identity preflight: `RELATED_ONLY`; no old stopped topic is revived.
- RAW_REQUIRED audit: `INCOMPLETE` — no source-supported target-native fallback action or small tail witness; a missing fallback source is not absence evidence.
- Minimum falsifier: current source/docs showing equivalent native fast and fallback semantics for the selected format/shape.
- Disposition: `LOCATOR_ONLY`.
- Reason: the available evidence does not distinguish a scientific lowering action from ordinary configuration coverage.

## `RQ-S1-103-06` — decode GEMV / prefill GEMM shared-format lowering

- Exact public identity: one runtime with a shared W4 format and separately inspectable decode GEMV/prefill GEMM actions was not closed.
- Current/source loci: vLLM W4A16 documentation and current releases; Arm low-bit LLM kernel paper confirms that prefill and decode have distinct execution regimes, but on a different CPU carrier.
- Global identity preflight: `RELATED_ONLY`; existing vLLM W4A16 support cannot be re-described as a new shared-format action without source-level identity.
- RAW_REQUIRED audit: `INCOMPLETE` — shared format, fixed semantics, and distinct current native actions are not jointly established by the bounded source set.
- Minimum falsifier: a public runtime source showing both paths already use the same proposed format/action abstraction.
- Disposition: `LOCATOR_ONLY`.
- Reason: the remaining claim would combine different systems or merely restate specialized kernels.

## `RQ-S1-103-07` — NDP cross-slice representation/reduction

- Exact public identity: W4A16 LLM reduction on a public NDP carrier was not found.
- Current/source loci: PIMCOMP (layout/computation/storage mapping for DNN PIM); CHIME (DIMM-PIM long-context attention-FC); the frozen group repository's NDP material only as non-evidence locator.
- Global identity preflight: `RELATED_ONLY` to CHIME/PIMCOMP; no exact terminal containment.
- RAW_REQUIRED audit: `INCOMPLETE` — PIMCOMP is a different DNN/carrier and CHIME's attention-FC disaggregation is not the fixed low-bit reduction object. No natural/canonical W4 LLM NDP carrier or finite semantic witness was frozen.
- Minimum falsifier: a public carrier expressing the proposed cross-slice quantized reduction endpoint and its target communication semantics.
- Disposition: `LOCATOR_ONLY`.
- Reason: changing the carrier to the group repository's unvalidated/private-resource path would violate the public evidence and resource boundary.

## `RQ-S1-103-08` — representation-transition optimization

- Exact public identity: target-constrained low-bit representation transition graph was not concretely frozen.
- Current/source loci: MLIR quant lowering, TVM QNN, and TorchAO layout/dispatch mechanisms.
- Global identity preflight: `RELATED_ONLY` to the named W4 terminal topics; no distinct action signature exists.
- RAW_REQUIRED audit: `INCOMPLETE` — the proposed graph has no target-specific atomic transition, fixed endpoint, or construction beyond generic conversion/selection.
- Minimum falsifier: existing compiler conversion/lowering graph behavior, already present in the consulted current mechanisms.
- Disposition: `EXCLUDED_BEFORE_RAW`.
- Reason: `GENERIC_SHELL`; it fails the noun-swap and non-generic-discriminator test without a new same-object construction.

## Front-end result

| Metric | Count |
|---|---:|
| Non-evidence seeds | 8 |
| Frozen primary RQs | 8 |
| Selected locators / bounded closures | 8 |
| `EVIDENCE_QUALIFIED_RAW` | 0 |
| C0 / D1 / deep reviews | 0 / 0 / 0 |
| Clean Stage 0 briefs | 0 |

No source-closure queue is left open: every card has either a finite missing same-object source requirement (`LOCATOR_ONLY`) or a structural pre-raw exclusion. No resource failure was used as scientific evidence.
