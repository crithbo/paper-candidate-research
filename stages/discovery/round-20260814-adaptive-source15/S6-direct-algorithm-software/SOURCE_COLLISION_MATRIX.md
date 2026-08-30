# Source/collision matrix — Source15

| Family | First-party semantic anchor | Current-union / witness result |
|---|---|---|
| AMDGPU atomic aggregation with address-space fence | LLVM AMDGPU source and memory-model guide [S1,S2] | Existing native atomic transformation; remaining grouping changes contract or is generic. |
| NVPTX mbarrier phase/transaction construction | LLVM NVPTX mbarrier guide [S3] | No same-contract two-plan closure; not admitted. |
| SPIR-V subgroup memory-model construction | LLVM SPIR-V target guide [S4] | Fixed memory model/capability contract; alternate lowering changes requirements or is generic. |
| AMDGPU software LDS lowering | LLVM current AMDGPU source | Existing pass and changed LDS/global resource contract; structural drop. |
| R600 clause plus control-flow construction | LLVM current R600 source | Generic clause/VLIW grouping; structural drop. |
| CPU RISC-V fence-field construction | LLVM RISC-V backend current source | No target-specific joint guarantee beyond memory-model lowering; not admitted. |

All entries are non-security objects. No attack, vulnerability, exploit,
protocol-security, or traffic-security source was used.
