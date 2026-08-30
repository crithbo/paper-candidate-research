# Candidate-grade deep reviews — Source13

| ID | Exact object and two-plan witness | Current strongest union / collision subtraction | N2 test and full-cost route | Disposition |
|---|---|---|---|---|
| D1 Hexagon VLIW | Fixed MachineIR/ABI/subtarget; two ready instructions competing for a constrained packet slot have two legal bundles. | Current Hexagon DFA packetizer, target scheduling and global scheduler; the direct algorithmic kernel is established VLIW/resource-constrained scheduling. | Any global packet/pressure solver is generic scheduling unless it adds a Hexagon-specific finite state and guarantee. Cost: compile CPU/wall/RSS/temp, code bytes, packets, latency proxy. | `STRUCTURAL_DROP__GENERIC_VLIW_SCHEDULING_KERNEL__NO_TARGET_SPECIFIC_GUARANTEE` |
| D2 IREE LLVMGPU layout | Fixed MLIR/tensor and generated-kernel semantics; two native tiling/distribution/layout configurations can yield equal tensor output. | LLVMGPU lowering/config union; direct GPU tiling/layout literature and configuration/search baselines. | Residual collapses to configuration control or generic layout packing; no target-specific exact/FPT/certified guarantee frozen. Cost: compile CPU/wall/RSS/temp, artifact bytes, dispatch/launch and target resource dimensions. | `STRUCTURAL_DROP__CONFIGURATION_OR_GENERIC_LAYOUT_KERNEL` |

Neither result relies on a missing implementation, unavailable hardware, absent
benchmark result, or AI readiness. No brief was warranted.
