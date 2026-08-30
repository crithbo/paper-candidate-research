# Source/collision matrix — Source13

| Family | Current first-party anchor | Minimal same-object plan promise | Screen result |
|---|---|---|---|
| LLVM Hexagon VLIW packet construction | LLVM Hexagon packetizer and global scheduler [S1,S4] | Alternative resource-legal bundle for a ready instruction pair | Directly reduces to generic VLIW scheduling. |
| LLVM RISC-V VSETVLI state placement | LLVM RISC-V backend source tree | Two legal placement choices of equivalent vector-state setup | `NOT_ADMITTED_UNFROZEN__NO_SOURCE_CLOSED_TARGET_SPECIFIC_GUARANTEE`; not promoted. |
| LLVM SystemZ short/long-displacement construction | LLVM SystemZ backend source tree | Equivalent legal addressing-form selection | Generic instruction selection/costing; structural drop. |
| IREE LLVMGPU lowering configuration | IREE LLVMGPU source [S5] | Two valid tiling/distribution layouts | Deep review: generic layout/config residual. |
| OpenXLA GPU collective construction | OpenXLA GPU service source [S6] | Equivalent collective emission decompositions | Controller/schedule family, excluded by contract. |
| LLVM AMDGPU occupancy/register allocation | LLVM AMDGPU guide and occupancy calculator [S2,S3] | Resource-equivalent register/occupancy alternatives | `EXCLUDED_REPEATED__ACTIVE_AMDGPU_OCCUPANCY_JOINT_CODEGEN_FAMILY`. |

All entries are non-security compiler/architecture objects. No network-security,
protocol-security, vulnerability, exploit, or traffic-security family was screened.
