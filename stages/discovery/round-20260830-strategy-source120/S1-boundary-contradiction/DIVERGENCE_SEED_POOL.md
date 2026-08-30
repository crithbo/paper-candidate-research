# Source120 S1 Exact-Carrier Seed Pool

- Assignment: `DISCOVERY-S1-20260830-SOURCE120-EXACT-CARRIER`
- Exact carriers located before RQ convergence: `YES`
- Seed count: `8`
- Seeds are non-evidence sketches and make no novelty claim.

| Seed | Exact public carrier | Candidate contribution boundary |
|---|---|---|
| S120-S1-01 | StableHLO quantized golden tests in official quantization documentation/repository | cross-consumer quant arithmetic conformance |
| S120-S1-02 | StableHLO `tests/vhlo` serialized compatibility compendium | semantic rather than syntactic compatibility oracle |
| S120-S1-03 | StableHLO specification + reference interpreter coverage/status | spec–interpreter differential negative replication |
| S120-S1-04 | ONNX `backend/test/case/node` QuantizeLinear cases | cross-backend quantize semantics coverage |
| S120-S1-05 | ONNX `backend/test/case/node` DequantizeLinear cases | per-axis/low-bit semantic boundary coverage |
| S120-S1-06 | ONNX-MLIR `inference_backend.py` disabled per-axis DequantizeLinear case | exact public negative-replication carrier |
| S120-S1-07 | IREE comparative benchmark StableHLO/TFLite artifacts plus input/output arrays | same-workload ranking/accuracy conformance benchmark |
| S120-S1-08 | StableHLO quant-to-int/QDQ fallback fixture and passes | fallback-preserving quant lowering contract |

No additional seed may be added after targeted closure begins.
