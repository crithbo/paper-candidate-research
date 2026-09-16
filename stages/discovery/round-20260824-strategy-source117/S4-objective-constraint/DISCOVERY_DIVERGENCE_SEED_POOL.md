# Source117 S4 offline divergence seed pool

- Assignment/lane: `DISCOVERY-S4-20260824-SOURCE117-LOW-BIT-CONFORMANCE-INTEROP-V1` / `DISCOVERY_S4`
- Generation completed before evidence lookup: `YES`
- Frozen focus: `BIT_EXACT_CONFORMANCE_BENCHMARK_OR_SPEC_GAP_WITH_FIXED_ESTIMAND`
- Source116 denylist precheck: all seeds are `DISTINCT`; none treats an issue, a local fix, a merged patch, or generic negative replication as a contribution.

| Seed | Denylist before lookup | Offline conformance/interoperability sketch | Anchor family | Disposition |
|---|---|---|---|---|
| S4-117-SEED01 | `DISTINCT` | Can ONNX QDQ axis/zero-point semantics produce a fixed bit-exact cross-backend conformance endpoint? | ONNX QDQ spec/fixture | keep |
| S4-117-SEED02 | `DISTINCT` | Can opset-specific QDQ rounding semantics change a canonical tensor result across current parsers? | ONNX opset conformance | keep |
| S4-117-SEED03 | `DISTINCT` | Can GGUF K-quant block-layout semantics expose a same-tensor interoperability ranking endpoint? | GGUF format/fixture | keep |
| S4-117-SEED04 | `DISTINCT` | Can a low-bit loader/parser preserve bit-exact tensor interpretation while changing conversion and dequant full cost? | GGUF current source | keep |
| S4-117-SEED05 | `DISTINCT` | Can TorchAO quantizer configuration create a canonical eager-vs-compiled conformance discrepancy with a true fault? | TorchAO source/tests | keep |
| S4-117-SEED06 | `DISTINCT` | Can ExecuTorch delegated quantized lowering preserve the same graph semantics under a defined quant scheme? | ExecuTorch source/tests | keep |
| S4-117-SEED07 | `DISTINCT` | Can OpenVINO current QDQ parsing distinguish an opset carrier from a real semantic residual? | OpenVINO source/spec | keep |
| S4-117-SEED08 | `DISTINCT` | Can StableHLO quantization encoding and lowering be compared against a canonical fixture at fixed units? | StableHLO/MLIR spec | keep |
| S4-117-SEED09 | `DISTINCT` | Can a canonical fixture establish an interoperability benchmark only when spec, parser, and output hash are all frozen? | public fixture | keep |
| S4-117-SEED10 | `DISTINCT` | Can the format/spec default versus non-default flags alter quant semantics rather than only performance? | docs/source flags | keep |
| S4-117-SEED11 | `DISTINCT` | Can a bit-exact mismatch be classified as a true fault only with a same-tensor reference and finite falsifier? | conformance test | keep |
| S4-117-SEED12 | `DISTINCT` | Can an interoperable low-bit representation retain a residual after current strong backends already share the same parser semantics? | backend comparator | keep |

All entries are non-evidence seeds; no spec/fixture is treated as novelty, and no debug claim is made.
