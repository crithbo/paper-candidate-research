# Discovery log — Source15

Assignment: `DISCOVERY-S5-20260814-ADAPTIVE-SOURCE15`  
Method: v8.7 canonical; claim-pack `OFF`  
Result: `COMPLETE_ZERO_PROPOSALS`

## Result

Source15 screened hardware semantic boundaries with a mandatory stock semantic oracle and fixed hardware/language contract.  The viable-looking ISA/ABI objects are already active, held, or terminal; remaining accelerator lines either reduce to existing codegen/config unions or lack a fixed stock oracle for two same-object outputs.  No new proposal was manufactured by renaming an ISA, changing ABI semantics, or using a generic verifier.

| stage | count | result |
|---|---:|---|
| scoped semantic-boundary families | 6 | deduplicated against active/hold/terminal registry records |
| excluded due to active/terminal identity | 4 | not reopened |
| deep current-union/oracle review | 2 | no certified residual |
| clean briefs | 0 | no Stage0 recommendation |

## Families

| family | disposition | rationale |
|---|---|---|
| LLVM RISC-V Zcmp callee-save construction | `EXCLUDED_ACTIVE_IDENTITY` | Current Stage 0 confirmation is active for the exact Zcmp pushlist object. |
| LLVM AArch64 SVE/SME ZA-state construction | `EXCLUDED_ACTIVE_OR_HOLD_IDENTITY` | Existing exceptional revision/closing controls the same ABI-state object. |
| LLVM x86 APX ABI frame/register construction | `EXCLUDED_ACTIVE_OR_HOLD_IDENTITY` | Existing frozen MachineIR/ABI/oracle contract occupies the action space. |
| LLVM DWARF call-site reconstructibility | `EXCLUDED_ACTIVE_IDENTITY` | Revision closing is active; no duplicate follow-on. |
| LLVM AMDGPU occupancy/resource code generation | `EXCLUDED_ACTIVE_OR_BLOCKED_IDENTITY` | Existing exact LLVM AMDGPU recovery action owns the same target/cost semantics. |
| NVPTX/CUDA async-copy semantic mapping | `DROP_CURRENT_UNION_ABSORPTION` | Current compiler/runtime primitives already encode the relevant movement/synchronization plans; a new threshold/schedule is a controller. |

## Deep-review conclusion

The AMDGPU/occupancy line cannot be reopened under a new name: the registry already freezes its target, full-cost ledger and stock LLVM oracle, with a specific recovery state.  The NVPTX/CUDA candidate likewise has no independent hardware-semantic atomic action after subtracting existing async-copy/TMA/compiler lowering primitives; timing or scheduling selection would violate the assignment's controller exclusion.

No result, resource or readiness shortfall was used as a negative inference.  The absence of a brief follows direct identity collision or current-union absorption only.

## Primary-source boundary

- LLVM RISC-V usage/current extension matrix: <https://github.com/llvm/llvm-project/blob/main/llvm/docs/RISCVUsage.rst>
- LLVM source tree: <https://github.com/llvm/llvm-project>
- CUDA programming model documentation: <https://docs.nvidia.com/cuda/cuda-c-programming-guide/>
- ROCm/LLVM AMDGPU documentation: <https://rocm.docs.amd.com/projects/llvm-project/en/latest/LLVM/llvm/html/AMDGPUUsage.html>

The registry supplied the active/hold collision record; official current sources supplied the semantic-primitives boundary.  No source was built, executed or benchmarked.
