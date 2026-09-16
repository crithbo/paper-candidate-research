# Same-object RQ candidates

## Public anchor

Current ONNX Runtime source exposes graph-optimization controls, sequential-execution memory-pattern optimization and CPU/GPU arena configuration. Its documented memory pattern traces allocations for repeated identical input shapes; current configuration headers also expose memory-optimizer and capacity-aware partitioning options.

## RQ-1 — primary

For a fixed ONNX graph, execution-provider set, input shapes/values and stock `InferenceSession` observable outputs, can a **provider-partition plus repeated-run allocation-pattern constructor** jointly choose legal graph partitions/fusions and a static allocation pattern so as to certify a full-cost frontier over first-run build, repeated-run allocation/dispatch, host-device bytes, peak RSS/device memory and latency?

Only a target-specific N2 algorithm/guarantee over the fixed ONNX/ORT semantics could survive. A provider selector, memory-pattern flag, cache, generic packing, or changed execution-provider/object is excluded.

## RQ-2 — alternate

Can the same-object joint constructor dominate separately composed stock graph optimization/partitioning and memory-pattern replay under identical shape/profile information?

RQ-2 is a restatement, not another family.
