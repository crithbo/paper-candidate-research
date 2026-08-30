# Source/collision matrix — Source14

| Family | First-party anchor | Minimal plan promise | Screen result |
|---|---|---|---|
| LLVM NVPTX address/parameter lowering | LLVM NVPTX backend and user guide [S1,S2] | Equivalent address-space lowering sequence | Generic ISel/pass-composition kernel. |
| Arm Ethos-U Vela command-stream/SRAM construction | Upstream Vela source/docs [S4] | Equivalent native tensor placement and command stream | Current config union plus generic packing/selector remainder. |
| LLVM R600 clause construction | LLVM R600 backend current source | Alternative resource-legal clause grouping | Generic clause/VLIW grouping; structural drop. |
| LLVM SPIR-V structured-control construction | LLVM SPIR-V backend current source | Equivalent structured-control serialization | Generic structured lowering/format action; structural drop. |
| GCC NVPTX/OpenACC lowering construction | GCC NVPTX backend current source | Equivalent offload-lowering decomposition | Pass composition/controller remainder; structural drop. |
| LLVM LoongArch immediate materialization | LLVM LoongArch backend current source | Equivalent legal immediate sequences | `NOT_ADMITTED_UNFROZEN__TARGET_SPECIFIC_GUARANTEE_NOT_CLOSED`. |

No historical or active identity was reused. This screen excludes active AMDGPU
occupancy codegen and Source13 Hexagon/IREE LLVMGPU. All security, vulnerability,
exploit, protocol and traffic-security families were excluded.
