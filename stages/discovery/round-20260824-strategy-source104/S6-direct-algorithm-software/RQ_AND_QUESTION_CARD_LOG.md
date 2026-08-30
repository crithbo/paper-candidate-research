# Source104 S6 Public-Carrier RQ and Question-Card Log

All cited material is public current source; no download, resource action, Rule Audit input, or group-repository access occurred.

| RQ | Carrier | Question | Disposition |
|---|---|---|---|
| S6-104-RQ01 | [CUTLASS grouped scheduler](https://github.com/NVIDIA/cutlass/blob/main/media/docs/cpp/grouped_scheduler.md) | Does a new target-native tile-segment construction remain after current grouped scheduling assigns persistent threadblocks and `next_tile()` actions across irregular GEMM problems? | `EXCLUDED_BEFORE_RAW__CURRENT_NATIVE_ATOMIC_ACTION_COVERS_PROPOSED_SCHEDULING` |
| S6-104-RQ02 | [CUTLASS grouped-GEMM example](https://github.com/NVIDIA/cutlass/blob/main/examples/24_gemm_grouped/gemm_grouped.cu) | Is there a nontrivial public grouped-GEMM ordering action beyond `kDeviceOnly`, `kHostPrecompute`, problem sorting, and externally supplied irregular benchmark shapes? | `EXCLUDED_BEFORE_RAW__CURRENT_UNION_AND_GENERIC_SCHEDULER` |
| S6-104-RQ03 | [CUTLASS block-scaled grouped GEMM](https://github.com/NVIDIA/cutlass/blob/main/examples/75_blackwell_grouped_gemm/75_blackwell_grouped_gemm_block_scaled.cu) | Can a low-bit grouped-layout candidate retain exact block-scale semantics while differing from current grouped block-scaled kernel and scheduler arguments? | `LOCATOR_ONLY__SAME_OBJECT_RESIDUAL_NOT_FROZEN` |
| S6-104-RQ04 | [Triton matmul tutorial](https://github.com/triton-lang/triton/blob/main/python/tutorials/03-matrix-multiplication.py) | Does a distinct compiler-native irregular tile-cover action survive current `GROUP_M` grouping and standard tile configuration? | `EXCLUDED_BEFORE_RAW__GENERIC_KERNEL_SELECTOR_REPEAT` |
| S6-104-RQ05 | [TorchAO issue documenting int4 dispatch](https://github.com/pytorch/ao/issues/391) | Does one exact current TorchAO low-bit carrier expose a tail representation action beyond `_weight_int4pack_mm`, its packed layout, and dispatch conditions? | `LOCATOR_ONLY__EXACT_CURRENT_CARRIER_AND_RESIDUAL_NOT_FROZEN` |

## Gate result

- Exact public carrier first: satisfied for five locator routes.
- Same-object, target-native non-generic residual: not established for RQ03/RQ05; current atomic action absorbs RQ01/RQ02; generic-selector repeat excludes RQ04.
- `EVIDENCE_QUALIFIED_RAW`: `0`; C0/deep/clean brief: `0`.
- No implementation-absence claim was made, so no absence-based current-upstream assertion is carried.
- Related-only policy respected: TorchAO remains locator-only rather than being falsely equated with CUTLASS; no terminal identity was revived.
