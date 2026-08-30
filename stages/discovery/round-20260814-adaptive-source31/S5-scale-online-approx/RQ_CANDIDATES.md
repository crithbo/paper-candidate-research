# Source31 RQ candidates

## RQ31-A — XLS schedule update
- Same object: fixed XLS DSLX/IR function or proc, stock generated Verilog and XLS functional-equivalence semantics.
- Selected question: can one name a native schedule-update action with a target-specific bound beyond XLS optimization/scheduling/codegen and built-in equivalence tools?
- Falsifier: action is only generic schedule selection or project-owned HLS construction. `RQ_READY_FOR_EVIDENCE_LOOKUP`.

## RQ31-B — hls4ml local realization
- Same object: fixed supported model and FPGA HLS output with exact stock inference contract.
- Selected question: is a candidate action distinct from hls4ml’s own converter/backend construction? Falsifier: it requires the complete project constructor. `RQ_READY_FOR_EVIDENCE_LOOKUP`.

## RQ31-C — Vitis AI DPU mapping
- Same object: fixed model/DPU target and stock quantized execution semantics.
- Selected question: is there a target-native bounded-recourse action rather than cross-target quantizer/compiler configuration? Falsifier: action is portable generic quantization/partitioning. `RQ_READY_FOR_EVIDENCE_LOOKUP`.
