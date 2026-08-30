# S1-CARD-01

## Identity and source boundary

- Exact public identity: `huggingface/optimum-quanto`, current `main` README; `optimum/quanto/quantize.py`; `optimum/quanto/tensor/qbits.py`.
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY`.
- Exact object: current Optimum Quanto eager-mode quantized model/tensor workflow.
- Source actions: six official repository search/open calls, the frozen maximum.

## Raw-gate result

- Current-source loci: `quantize.py` replaces modules, `freeze()` freezes QModuleMixin modules, and `quantization_map()` records only weight/activation qtypes per module; `requantize()` rebuilds modules from that map before loading a state dict. `qbits.py` represents packed data, scale, shift, axis and group-size state for dequantization.
- Same-object backend-lowering action: `NOT_FROZEN`.
- Typed claim endpoint: `NOT_FROZEN`.
- Non-generic discriminator: `NOT_FROZEN`.
- Minimum falsifier / finite route: the allotted official source budget is exhausted without an explicit backend-lowering decision that consumes one unified freeze/serialization/tensor contract.
- Initial full-cost boundary: `NOT_FROZEN`.
- Disposition: `LOCATOR_ONLY`.
- Plain-Chinese reason: 当前实现可定位量化、冻结、重载和张量数值状态，但未定位把这些状态合为一个、并据此改变后端 lowering 的原子动作。不能把缺少该 action 的观察写成新颖性或科学负结论。
- Eligible for C0: `NO`.
