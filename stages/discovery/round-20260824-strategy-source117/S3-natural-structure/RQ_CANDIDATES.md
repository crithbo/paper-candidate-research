# Source117 S3 RQ candidates and pre-RQ closure

All three checks were made against `SOURCE116_IDENTITY_DENYLIST_ADDENDUM.yaml` before their named source lookup. `EXACT_OR_CONTAINS` would not be replaced in this assignment; none of the three is a patch/fault/negative-replication identity.

## S3-117-RQ01 — ONNX QDQ shape/axis fixture basis

- Seed / prelookup denylist: `S3-117-SEED02`; `RELATED_ONLY` — distinct ONNX operator-spec/opset and graph-semantics object, not a Source116 merged-patch identity. Discriminator: QDQ scale/zero-point broadcasting and axis semantics.
- Exact anchor: ONNX 1.23.0 `QuantizeLinear` and `DequantizeLinear` specification, accessed 2026-08-24; current ONNX Runtime `quantize.py` main (QDQ configuration path).
- Primary RQ: for one frozen quantized natural ONNX model graph and one declared opset, can a shape/axis partition be shown to be a finite semantics-complete fixture basis for the declared QDQ lowering contract?
- Immutable boundary: same ONNX tensor/graph semantics, including scale, zero point, axis, rounding and dtype; no claim about GGUF or StableHLO equivalence.
- Current-source/flags observation: ORT's QDQ path exposes `per_channel`, type/opset handling and options such as `UseQDQContribOps`; the source therefore cannot be treated as an unspecified or absent baseline.
- Finite falsifier: a pair of tensors in the same proposed class with different required QDQ result/lowering, or a current backend flag expressing the proposed partition/action.
- Result: `PRE_RQ_NONADMISSION`. No exact natural model graph, fixed backend comparator, fixture corpus, or decision-changing coverage endpoint was frozen. A specification plus a proposed test selector is only a carrier/checker route, not an N1/N2/N3 contribution.

## S3-117-RQ02 — GGUF k-quant layout invariant

- Seed / prelookup denylist: `S3-117-SEED04`; `RELATED_ONLY` — distinct public GGUF format object and no source116 exact-or-contains identity. Discriminator: serialized tensor layout and quantization metadata, rather than a patch/current residual.
- Exact anchor: `ggml-org/ggml` `docs/gguf.md` on `master`, accessed 2026-08-24.
- Primary RQ: for one named GGUF model and declared GGUF version/quantization version, does a natural tensor-shape invariant predict a format-preserving interoperability or conversion decision across two current loaders?
- Immutable boundary: serialized GGUF tensor metadata/encoding and the same model tensor meaning; no claim that GGUF itself defines an operator-level graph equivalence.
- Current-source/spec observation: GGUF documents file-level metadata, tensor type and alignment, and explicitly leaves encoding content/type mixture/arrangement to user code. This prevents inferring a universal cross-loader graph operation from the format alone.
- Finite falsifier: a named current loader pair with identical declared semantics but incompatible result, or a model fixture showing the proposed invariant does not predict the stated conversion decision.
- Result: `PRE_RQ_NONADMISSION`. A canonical model/loader pair, exact conversion endpoint, and fair full-cost comparator are not frozen; no true fault is present, so no debugging claim is admissible.

## S3-117-RQ03 — StableHLO per-axis quantized-type lowering boundary

- Seed / prelookup denylist: `S3-117-SEED06`; `RELATED_ONLY` — a distinct StableHLO typed-IR object with quantized-type semantics, not a Source116 issue/patch/fault identity. Discriminator: declared per-axis quantized type and same-shape conversion semantics.
- Exact anchor: current StableHLO specification and official quantization guide, accessed 2026-08-24.
- Primary RQ: for one frozen StableHLO quantized model IR and target backend pair, is there a natural shape/quantized-dimension condition that predicts when direct lowering preserves the declared uniform-quantization semantics without dequantize/requantize conversion?
- Immutable boundary: StableHLO `uniform_quantize`/`uniform_dequantize`, declared scale/zero-point and quantized dimension, same tensor shape and expressed type.
- Current-spec observation: the specification defines element-wise quantize/dequantize and shape preservation; its guide specifies per-tensor and per-axis semantics. A specification alone does not establish parser/lowering behavior or a residual against a current backend.
- Finite falsifier: a current backend source path/flag that already performs the claimed direct lowering under the same contract, or a frozen IR fixture whose result requires conversion despite satisfying the proposed condition.
- Result: `PRE_RQ_NONADMISSION`. No exact current parser/lowering source, backend comparator, or natural model fixture was jointly frozen. The proposed boundary would otherwise be a restatement of the specification.

## Funnel accounting

`offline_seed=6`; `selected_rq=3`; `denylist_exact_or_contains=0`; `denylist_related_only=3`; `valid_selected_locator=0`; `pre_rq_nonadmission=3`; `evidence_qualified_raw=0`; `deep=0`; `clean_stage0_brief=0`.

These nonadmissions are bounded evidence/contract outcomes only. They make no absence, STOP, category-exclusion, fault, or global-interoperability inference.
