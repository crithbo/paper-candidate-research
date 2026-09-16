# Source119 S1 Question Cards

| RQ | Exact object/action endpoint | Current-source result | Front-end disposition | Reason |
|---|---|---|---|---|
| RQ01 | PRIVATE_TOOLCHAIN HAL direct dispatch vs repack/copy | HAL exposes allocation alignment, subspans, wrap/create/assert and encoding metadata | `EXCLUDED_BEFORE_RAW__CURRENT_UNION` | Candidate action is already representable; no distinct algorithm frozen. |
| RQ02 | PRIVATE_TOOLCHAIN parameter zero-copy placement | IRPA is aligned; safetensors penalty and conversion/provider routes are explicit | `EXCLUDED_BEFORE_RAW__CURRENT_UNION` | The proposed placement/format action collapses to existing conversion/provider choices. |
| RQ03 | PRIVATE_TOOLCHAIN dispatch partition + guard formation | Stream already owns target affinity, partition, encoding and scheduling | `EXCLUDED_BEFORE_RAW__GENERIC_OR_CURRENT` | No target-specific action beyond existing dispatch formation was frozen. |
| RQ04 | MLIR Quant invariant-driven integer lowering | Quant types preserve scale/zero-point/axis; qcast rounding is pipeline-defined | `LOCATOR_ONLY` | Exact backend, rounding guarantee, canonical carrier and non-generic lowering action remain unfrozen. |
| RQ05 | MLIR memref ABI layout-transform decision | DataLayout and LLVM lowering expose ABI alignment, aligned pointers and nontrivial-layout materialization | `EXCLUDED_BEFORE_RAW__CURRENT_UNION` | Proposed ABI action is already part of current data-layout/type-conversion interfaces. |
| RQ06 | Sparse encoding-driven GPU format/vector action | Sparse encoding drives sparsifier-generated storage/iteration code | `LOCATOR_ONLY` | A GPU-specific action, comparator and natural sparse workload were not frozen; generic format selection risk remains. |
| RQ07 | ExecuTorch delegate boundary selection | Partitioners maximize supported regions, permit per-op mode/precision filters and fallback | `EXCLUDED_BEFORE_RAW__CURRENT_OR_GENERIC` | Full-cost partitioning residual is not target-specific and the QNN mutable-buffer knob is already explicit. |
| RQ08 | ExecuTorch planner/delegate lifetime reconciliation | Per-device planning exists; custom preassigned mem_id collision is an explicit limitation | `LOCATOR_ONLY` | The apparent fix is generic ID namespace/remapping without a nontrivial mechanism or natural decision evidence. |

## Funnel counts

- Seeds: 8
- Primary RQs frozen before evidence: 8
- Selected locators: 8
- Excluded before raw: 5
- Locator only: 3
- Evidence-qualified raw: 0
- Clean briefs: 0
