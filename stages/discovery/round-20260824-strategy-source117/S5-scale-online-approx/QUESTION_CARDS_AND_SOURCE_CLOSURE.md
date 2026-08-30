# Source117 S5 low-bit format / semantic / conformance closure

Static public-source closure only.  No fixture, model, parser, converter, or backend was downloaded or run.  Specifications, tests and documentation are carriers, not novelty or fault evidence.

## RQ01 — ONNX QDQ long-context interoperability

- **Exact semantic specification:** [ONNX 1.23 `QuantizeLinear`](https://onnx.ai/onnx/operators/onnx__QuantizeLinear.html) defines the quantization formula and supported per-tensor, per-axis and blocked granularities; its `axis`, `block_size`, output-type and saturation behavior are semantic fields, not cosmetic defaults.  The matching [ONNX `DequantizeLinear`](https://onnx.ai/onnx/operators/onnx__DequantizeLinear.html) defines same-shape reconstruction and scale/zero-point constraints.
- **Current semantics and contrary:** a valid Q/DQ graph can therefore be specified in several materially different ways.  A generic QDQ claim that omits opset, tensor shapes, axis, block size, scale/zero-point types, rounding/saturation setting, and current backend lowering path has no single same-tensor meaning.  The spec itself is contrary to treating “QDQ” as one interoperable low-bit object.
- **Missing carrier, comparator and endpoint:** no versioned natural LLM graph or canonical ONNX fixture, current parser/lowering commit, backend comparison pair, long-context/load condition, bit-exact or tolerance oracle, or decision-changing memory/load endpoint was frozen.  A spec alone cannot establish a true fault.
- **Full-cost / finite falsifier:** a later admissible packet would need graph parsing/lowering, conversion/dequant/packing, host/device transfer, compile/load, KV/cache memory, latency and output-accuracy denominator; one frozen cross-backend fixture result violating the declared oracle would be the minimum falsifier.  Those objects are absent here.
- **Disposition:** `PRE_RQ_NONADMISSION__OPSET_QDQ_SEMANTICS_CURRENT_LOWERING_FIXTURE_COMPARATOR_AND_ENDPOINT_UNFROZEN`.

## RQ02 — GGUF k-quant load / online-context robustness

- **Exact format/current source:** the current [GGUF specification](https://github.com/ggml-org/ggml/blob/master/docs/gguf.md) requires `general.quantization_version` for quantized files and distinguishes it from a tensor quantization scheme such as `Q5_K`; it also defines architecture, tensor type/layout and context-length metadata.  Current [`gguf.h`](https://github.com/ggml-org/ggml/blob/master/include/gguf.h) fixes the file magic/version, tensor metadata and alignment/default-alignment parser surface.
- **Current semantic boundary:** the specification explicitly permits tensor data to differ due to quantization or inference optimizations and asks that deviations be represented in metadata/architecture definitions.  Thus a k-quant name or GGUF filename does not fix same-tensor values, layout, metadata, model revision, parser flags, or output semantics.
- **Missing residual and strong comparator:** no immutable natural GGUF artifact, quantization version plus complete tensor-type map, current parser/lowering revision and flags, reference backend, fixed model-load/context endpoint, canonical prompt/trace, or output oracle was frozen.  No true fault is observed, and an alleged load-memory difference could be normal mmap/alignment/configuration behavior.
- **Full-cost / finite falsifier:** file bytes and storage, parse/metadata validation, mmap/read/dequant/packing, host/device memory, model-load time, KV/context allocation, and output semantics would have to share one denominator.  A fixed artifact rejected or semantically divergent under a current parser while the declared reference accepts it would be a finite falsifier; there is no such pair.
- **Disposition:** `PRE_RQ_NONADMISSION__GGUF_ARTIFACT_TENSOR_SEMANTICS_CURRENT_PARSER_COMPARATOR_AND_ENDPOINT_UNFROZEN`.

## RQ03 — torchao / ExecuTorch low-bit LLM export semantics

- **Current quantization and lowering loci:** current [torchao quantization documentation](https://docs.pytorch.org/ao/stable/api_reference/api_ref_quantization.html) distinguishes groupwise int4 configuration versions and limits some float8/int4 paths to group size 128.  Current [ExecuTorch LLM export documentation](https://docs.pytorch.org/executorch/stable/llm/export-llm.html) defines the `8da4w` mode, group-size setting, `use_kv_cache`, `use_sdpa_with_kv_cache`, backend-specific lowering and an XNNPACK configuration surface.
- **Contrary/current semantics:** the documentation states that TorchAO source-level quantization swaps Linear modules and that some Arm low-bit kernel routes should not be combined with XNNPACK.  These are configuration/semantic alternatives, not proof of a cross-backend mismatch.  They preclude calling a generic low-bit export difference a debug/conformance fault.
- **Missing exact contract:** no model checkpoint/config revision, qmode/group size/packing version, exported graph identity, dynamic-sequence bound, backend flag tuple, reference backend, canonical fixture/natural trace, same-tensor oracle, or online/load decision endpoint was frozen.  Hence neither same-function conformance nor a non-local robust action is defined.
- **Full-cost / finite falsifier:** export/lowering/compile, packing/dequant, runtime/KV memory, host transfer, warm/cold load, prefill/decode and output error would all be included.  A fixed graph and fixture whose declared oracle differs across named current backends would falsify equivalence; that testable pair is missing and is not invented.
- **Disposition:** `PRE_RQ_NONADMISSION__LOW_BIT_EXPORT_GRAPH_BACKEND_FLAGS_FIXTURE_ORACLE_AND_ENDPOINT_UNFROZEN`.

## Denylist and result

- The Source116 addendum excludes patch-as-novelty and generic negative replication.  None of the three RQs uses such a claim; each independently fails before raw because its exact semantic carrier and same-object residual are not frozen.
- No true fault was observed, so no debugging claim is made.  This closure is not a conformance-family STOP, absence claim, or statement that a cross-backend mismatch does not exist.

`offline_seed=4; provisional_RQ=3; valid_selected_RQ=0; pre_RQ_nonadmission=3; raw=0; deep=0; clean_brief=0`.

`COMPLETE_ZERO_PROPOSALS__LOW_BIT_CONFORMANCE_CONTRACT_NOT_FROZEN`.
