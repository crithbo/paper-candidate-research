# Source117 S3 Divergence Seed Pool

## Pool metadata

- Assignment / lane: `DISCOVERY-S3-20260824-SOURCE117-LOW-BIT-CONFORMANCE-INTEROP-V1` / `DISCOVERY_S3`
- Frozen profile: `SOURCE117_PUBLIC_LOW_BIT_FORMAT_CONFORMANCE_INTEROPERABILITY_ROTATION_V1`
- Seed ceiling: `12`; generated: `6`
- RQ candidate ceiling: `8`
- Network-security exclusion check: `PASS`
- Generation completed before evidence lookup: `YES`

## Seed records

### S3-117-SEED01

- Engine / perspective: `ABSTRACTION_LADDER` / `COMPILER_OR_BACKEND_ENGINEER`
- Starting hunch: natural transformer graphs contain repeated per-channel QDQ tensor-shape families; an invariant might permit semantics-preserving conformance partitioning rather than one fixture per model.
- Exact public anchor candidate: ONNX `QuantizeLinear`/`DequantizeLinear` operator specifications, current opset.
- Counterfactual consequence: a fixed shape/axis invariant could reduce the conformance fixture set while retaining a stated cross-backend semantic coverage criterion.
- Risk and pre-evidence disposition: the result may be only a test-selection wrapper or already covered by a canonical conformance suite; `KEEP_FOR_CONVERGENCE`.

### S3-117-SEED02

- Engine / perspective: `CONSTRAINT_MANIPULATION` / `MEASUREMENT_REVIEWER`
- Starting hunch: per-tensor and per-axis quantization differ structurally in scale/zero-point broadcasting; real model-graph incidence may identify a compact, semantically complete axis/shape partition.
- Exact public anchor candidate: ONNX QDQ semantics plus a public quantized transformer model graph.
- Counterfactual consequence: partition membership predicts which lowering/conformance checks must remain distinct.
- Risk and pre-evidence disposition: requires a frozen natural graph and a decision endpoint, otherwise merely a catalogue; `KEEP_FOR_CONVERGENCE`.

### S3-117-SEED03

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `THEORIST`
- Starting hunch: use equivalence-class minimisation ideas to derive a finite canonical QDQ fixture basis from tensor rank, axis normalization and zero-point dtype.
- Exact public anchor candidate: ONNX QDQ specification and ONNX backend test corpus.
- Counterfactual consequence: two backends agreeing on the basis would have a bounded semantics claim for the defined opset fragment.
- Risk and pre-evidence disposition: without a nontrivial coverage theorem and an implementation-independent oracle this is a generic checker; `KEEP_FOR_CONVERGENCE`.

### S3-117-SEED04

- Engine / perspective: `JANUSIAN_TENSION` / `END_USER`
- Starting hunch: GGUF k-quant blocks compress semantic parameters and physical layout together; model tensor-shape regularity might expose an interoperability cost/error trade-off across current loaders.
- Exact public anchor candidate: GGUF format specification and a named public GGUF model.
- Counterfactual consequence: an invariant could choose a format-preserving conversion/lowering route before model load.
- Risk and pre-evidence disposition: the format may not define a same-graph cross-backend operation or a fair comparator; `KEEP_FOR_CONVERGENCE`.

### S3-117-SEED05

- Engine / perspective: `PROBLEM_REFRAMING` / `MAINTAINER`
- Starting hunch: treat quantization conformance as graph semantics rather than kernel accuracy: repeated QDQ motifs in natural graphs may determine a minimal parser/lowering differential set.
- Exact public anchor candidate: ONNX Runtime quantization documentation and current parser/lowering source.
- Counterfactual consequence: a motif-level invariant would identify a test subset that can falsify a claimed backend equivalence.
- Risk and pre-evidence disposition: debug framing is invalid absent a true fault; this remains a measurement/benchmark question only; `KEEP_FOR_CONVERGENCE`.

### S3-117-SEED06

- Engine / perspective: `NEGATION_OR_INVERSION` / `HARDWARE_ARCHITECT`
- Starting hunch: instead of optimising a low-bit format, look for graph-shape conditions under which cross-backend semantic equivalence is impossible without dequantisation or metadata conversion.
- Exact public anchor candidate: StableHLO/MLIR quantization semantics and an exported quantized model graph.
- Counterfactual consequence: the boundary could give a useful no-direct-lowering rule with complete conversion cost.
- Risk and pre-evidence disposition: may only restate specification limits and lack a decision-changing endpoint; `KEEP_FOR_CONVERGENCE`.

## Clustering and convergence

| Cluster | Seeds | Shared boundary | Representative |
|---|---|---|---|
| QDQ natural-shape fixture basis | 01, 02, 03, 05 | ONNX QDQ graph semantics and shape/axis structure | S3-117-SEED02 |
| Format/layout interoperability | 04 | GGUF block-quant semantics | S3-117-SEED04 |
| Quant dialect no-direct-lowering boundary | 06 | StableHLO/MLIR quant semantics | S3-117-SEED06 |

Selected before lookup: `S3-117-SEED02`, `S3-117-SEED04`, `S3-117-SEED06`. No seed is a locator, raw record, novelty claim, or absence conclusion.
