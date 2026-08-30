# Discovery log — Source13

Assignment: `DISCOVERY-S5-20260814-ADAPTIVE-SOURCE13`  
Method: v8.7 canonical; `DISCOVERY_CLAIM_PACK_MODE=OFF`  
Scope exclusion: network/protocol security, vulnerabilities, exploit/reproduction, attack/defense and traffic-security objects.  
Result: `COMPLETE_ZERO_PROPOSALS`

## Source-mix execution

The assignment's compiler/architecture/GPU/NPU mix was used as a *search allocation*, never an admission quota.  Six families were checked against current registry/active lanes before depth; only two reached current-union review.  Neither retained a target-specific checked action beyond its stock union.

| funnel step | count | outcome |
|---|---:|---|
| scoped families | 6 | all from official source/current documentation |
| direct repeat or pre-depth exclusion | 4 | active identity, existing layout union, or no fixed semantic checker |
| candidate-grade deep review | 2 | current union / checker contracts examined |
| clean briefs | 0 | no `PROPOSE_STAGE0` |

## Scoped families

| family | disposition | reason |
|---|---|---|
| OpenVINO Intel NPU compiled-model construction | `DROP_CONTROLLER_OR_CURRENT_UNION` | Compiler type, optimization level, performance mode and tile count are native config/selection variables; the emitted graph is proprietary and no fixed stock semantic checker closes a new same-object action. |
| CIRCT Handshake/Verilog lowering | `NOT_ADMITTED_UNFROZEN__NO_FIXED_SEMANTIC_CHECKER` | CIRCT provides IR compilation/tools and verifier/test infrastructure, but this review did not establish a stock checker proving two emitted HDL plans equivalent under one frozen I/O/timing contract. |
| CUTLASS/CuTe layout construction | `DROP_CURRENT_UNION_ABSORPTION` | Current CuTe layout algebra, MMA/Copy atoms and template-instance space directly cover layout composition/tiling actions; a policy is not a new action. |
| OpenXLA GPU scheduling/buffer construction | `DROP_PRE_RAW__CONFIG_CONTROLLER_AND_NO_FIXED_CHECKER` | Current source exposes a broad DebugOptions/config space; no target-specific two-plan certified constructor was frozen. |
| LLVM RISC-V Zcmp prologue construction | `EXCLUDED_ACTIVE_IDENTITY` | Exact active Stage 0 object `RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP`. |
| LLVM AArch64 SME/ZA state lowering | `EXCLUDED_ACTIVE_OR_HOLD_IDENTITY` | Overlaps active/held compiler-architecture state construction work; no reopening. |

## Deep-review finding

OpenVINO's own NPU plugin documentation states that compilation converts `ov::Model` to a proprietary format and exposes compiler type, optimization-level, performance-hint, tile and platform choices, with dynamically advertised supported properties.  These are current union/config mechanisms; no checker-backed same-object global constructor survives after subtracting them.

CIRCT is a real compiler/tool project, but a structural verifier or successful HDL toolchain run is not automatically an equivalence checker for two hardware outputs.  Without a frozen semantic/timing oracle, a scheduling or lowering proposal would become either a generic formal-tool project or a changed object.  This is an unclosed contract, not an absence claim or resource inference.

## Primary sources accessed 2026-08-14

- OpenVINO Intel NPU plugin/source: <https://github.com/openvinotoolkit/openvino/blob/master/src/plugins/intel_npu/README.md>
- CIRCT source/project: <https://github.com/llvm/circt>
- CUTLASS source and layout algebra: <https://github.com/NVIDIA/cutlass>, <https://github.com/NVIDIA/cutlass/blob/main/include/cute/layout.hpp>
- OpenXLA source and current compilation options: <https://github.com/openxla/xla>, <https://github.com/openxla/xla/blob/main/xla/xla.proto>
- LLVM RISC-V extension support: <https://github.com/llvm/llvm-project/blob/main/llvm/docs/RISCVUsage.rst>

No build, install, execution, experiment, benchmark, download of large assets, or downstream-stage action occurred.
