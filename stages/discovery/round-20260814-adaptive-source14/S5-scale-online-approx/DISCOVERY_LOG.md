# Discovery log — Source14

Assignment: `DISCOVERY-S5-20260814-ADAPTIVE-SOURCE14`  
Method: v8.7 canonical; claim-pack `OFF`  
Result: `COMPLETE_ZERO_PROPOSALS`

## Result in brief

This screen concentrated on accelerator mapping and quantization correctness, while excluding all network-security, vulnerability, exploit, protocol-attack and reproduction families.  Six current, primary-source families were screened; ONNX Runtime and torchao received depth.  Their native action unions already contain the proposed format/precision/calibration/override choices, and their supplied debuggers are diagnostic rather than a certified target-specific two-plan constructor.  No clean brief is warranted.

| funnel | count | outcome |
|---|---:|---|
| scoped families | 6 | all checked against active/hold identities |
| direct exclusion/pre-depth drop | 4 | active identity, generic lowering, or native config union |
| deep review | 2 | no target-specific residual survives |
| `PROPOSE_STAGE0` | 0 | zero is intentional, not a quota failure |

## Scoped families

| family | disposition | principal reason |
|---|---|---|
| ONNX Runtime QDQ static quantization | `DROP_CURRENT_UNION_ABSORPTION` | QDQ/QOperator, calibration, types, symmetry, per-channel axes, node exclusions and tensor overrides are current union members. |
| torchao PT2E backend quantization | `DROP_CURRENT_UNION_ABSORPTION` | Current target/backend/packing/quantizer workflows occupy type-layout and conversion choices; numeric debugger is diagnostic rather than a guarantee-producing constructor. |
| ONNX Runtime QNN execution-provider QDQ | `EXCLUDED_ACTIVE_OR_RESERVE_IDENTITY` | Overlaps QNN/HTP reserve and prior accelerator admission work. |
| TensorFlow Lite Micro quantized flatbuffer construction | `EXCLUDED_ACTIVE_OR_HOLD_IDENTITY` | Registry already contains the fixed TFLite reader/oracle construction. |
| PRIVATE_TOOLCHAIN quantized accelerator lowering | `NOT_ADMITTED_UNFROZEN__NO_FIXED_STOCK_EQUIVALENCE_CHECKER` | Retargetable lowering and IR verification do not by themselves freeze an exact two-output semantic certificate. |
| StableHLO/TOSA uniform-quantized lowering | `DROP_PRE_RAW__STRUCTURAL_VERIFIER_NOT_TARGET_CHECKER` | Dialect-level validity does not certify the same model-output/error guarantee for alternative accelerator mappings. |

## Deep-review facts

The current ONNX Runtime quantizer declares both QOperator and QDQ formats; static configuration has calibration methods, activation/weight types and symmetry, per-channel/axis control, selected or excluded operators/nodes, tensor overrides, and several extra options.  Any proposal that chooses or coordinates those values is a configuration/selector inside the native union.  QDQ debugging can localize accuracy loss but is not a formal, target-specific certificate of an alternative construction.

torchao exposes PT2E conversion/quantizer workflows, backend-specific quantization and several tensor/packing forms.  Its numeric-debug tooling is useful for evidence collection, but cannot substitute for a frozen same-object guarantee and action-divergence certificate.  No absence claim is made about an unexamined backend action.

## Primary-source record, accessed 2026-08-14

- ONNX Runtime current quantizer: <https://github.com/microsoft/onnxruntime/blob/main/onnxruntime/python/tools/quantization/quantize.py>
- ONNX Runtime quantization tool/readme: <https://github.com/microsoft/onnxruntime/blob/main/onnxruntime/python/tools/quantization/README.md>
- ONNX Runtime public QDQ debugging example: <https://github.com/microsoft/onnxruntime-inference-examples/tree/main/quantization/image_classification/cpu>
- torchao current quantization material: <https://github.com/pytorch/ao/blob/main/torchao/quantization/README.md>, <https://github.com/pytorch/ao/releases>
- ONNX Runtime QNN execution provider: <https://github.com/onnxruntime/onnxruntime-qnn/blob/main/docs/execution_providers/QNN-ExecutionProvider.md>
- PRIVATE_TOOLCHAIN current project: <https://github.com/PRIVATE_TOOLCHAIN-org/PRIVATE_TOOLCHAIN>

No model, compiler, tool, benchmark or experiment was run.
