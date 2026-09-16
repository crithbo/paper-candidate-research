# Collision matrix

| Family | Collision / direct subtractor | Disposition |
|---|---|---|
| OpenTitan RTL | Generic synthesis mapping, current union not source-closed. | NOT_ADMITTED_UNFROZEN |
| StableHLO | Contained OpenXLA/MLIR historical/active boundary. | EXCLUDED |
| ONNX | Source18 identity and same missing native-union facet. | EXCLUDED |
| Omnitrace | Tool telemetry is not natural carrier; only configuration action. | NOT_ADMITTED_UNFROZEN |
| CUDA profile trace | Source18 same telemetry gap. | EXCLUDED |
| CUDA fatbinary | Current `nvcc` architecture/code/fatbin action union. | DROP |
