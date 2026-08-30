# Collision and closure matrix

| Family | Current/source fact | Direct subtractor or closure failure | Disposition |
|---|---|---|---|
| ONNX opset | Operator sets are semantic snapshots and model imports declare them. | Backend-specific lowering makes “current native union” unfrozen; changing importer/backend changes object. | NOT_ADMITTED_UNFROZEN |
| MLPerf Tiny | Same workload/model/quality methodology spans disparate accelerators. | Mapping is a platform/submitter selector; active MLPerf family adds an identity boundary. | EXCLUDED |
| LLVM test suite | Versioned test corpus. | Explicit contract exclusion: test is not a natural carrier. | EXCLUDED |
| ONNX model panel | Version semantics are documented. | Immutable official multi-version semantic panel absent; no repeated source closure. | DORMANT_UNFROZEN |
| ROCProfiler | Current profiler API/trace tooling is documented. | Tool output is not independently natural carrier; only selector action remains. | NOT_ADMITTED_UNFROZEN |
| Nsight Compute | Current report formats/metric collection are documented. | Same telemetry-as-workload failure; no whole offline action. | NOT_ADMITTED_UNFROZEN |
