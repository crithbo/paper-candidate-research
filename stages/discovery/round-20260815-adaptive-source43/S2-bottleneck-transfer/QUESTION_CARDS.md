# Source43 question cards

| Card | Exact public object / same-object contract | Current official locus | Full-cost boundary | Current disposition |
|---|---|---|---|---|
| QC-43-01 | GFX12 kernel with fixed values, LDS contents, barriers and output; no changed memory-ordering contract | LLVM AMDGPU GFX12 instruction reference names legal `global_load_lds*` forms; current compiler lowering path still needs an exact source locus | compile CPU/RSS; ISA bytes; global/LDS traffic; waits; LDS/register occupancy; kernel latency | `SOURCE_CLOSURE_QUEUE` |
| QC-43-02 | oneVPL decode/VPP pipeline with same encoded stream, frames, access policy and release semantics | oneVPL Frame and Fields guide specifies lock/refcount surface allocation, reservation, reuse and release | decode/VPP CPU/device time; surface bytes; copies; peak frames; latency | `EXCLUDED_BEFORE_RAW__CURRENT_SURFACE_LIFETIME_UNION_OR_GENERIC_POOL_POLICY` |
| QC-43-03 | oneDNN grouped tensor with fixed values, cumulative offsets, groups and primitive output | oneDNN grouped-memory document specifies descriptor, two buffers, variable dimension and offsets representation | descriptor/build CPU; data+offset bytes; temporary/RSS; primitive execution latency | `EXCLUDED_BEFORE_RAW__FORMAT_FIXED_OR_ROUTINE_PARAMETER_CHOICE` |

No missing implementation, positive result, resource, hardware or AI-readiness condition was used as a scientific negative conclusion.
