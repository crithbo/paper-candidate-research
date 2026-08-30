# Source107 S6 Public Compiler/Runtime Screen

| RQ | Current public carrier | Disposition |
|---|---|---|
| S6-107-RQ01 | [PyTorch dynamic shapes](https://docs.pytorch.org/docs/main/user_guide/torch_compiler/torch.compiler_dynamic_shapes.html) | `EXCLUDED_BEFORE_RAW__CURRENT_GUARD_DYNAMIC_SPECIALIZATION_ACTION` |
| S6-107-RQ02 | [Triton autotune](https://triton-lang.org/main/python-api/generated/triton.autotune.html) | `EXCLUDED_BEFORE_RAW__CURRENT_CONFIG_PRUNING_AND_KEYED_AUTOTUNING_ACTION` |
| S6-107-RQ03 | [IREE Stream](https://iree.dev/reference/mlir-dialects/Stream/) | `EXCLUDED_BEFORE_RAW__CURRENT_NATIVE_ASYNC_PARTITION_SCHEDULING_ACTION` |
| S6-107-RQ04 | [TVM MetaSchedule](https://tvm.apache.org/docs/deep_dive/tensor_ir/tutorials/meta_schedule.html) | `EXCLUDED_BEFORE_RAW__CURRENT_STRUCTURAL_HASH_DATABASE_REUSE` |

Funnel: seed `6`; RQ/locator `4`; raw/C0/deep/brief `0`. CRFEPOCH Stage0/chat and group repository were not read.

## Frozen RQ audit fields (source check: 2026-08-24)

| RQ | Exact versioned locus and atomic action | Claim endpoint / counterfactual | Contrary evidence and full-cost boundary | Finite stop boundary |
|---|---|---|---|---|
| RQ01 | PyTorch main Dynamic Shapes docs, automatic-dynamic guarded specialization; action = mark/recompile a changing dimension. | Same `torch.compile` graph behavior across a fixed shape family; a new plan would have to reduce recompilation without weakening guards. | Current docs state guards/recompile behavior; cost includes guard evaluation, compilation latency, generated-code runtime, cache storage and eager fallback. | Stop: no distinct native plan action beyond guards/dynamic annotations is frozen. |
| RQ02 | Triton main `autotune`; action = key-triggered config evaluation with optional performance-model/early pruning. | Same kernel output for a fixed `triton.jit` function; new action must improve selection without changing configuration legality. | Current `configs`, `key`, `prune_configs_by`, benchmark repetitions and cache costs are the full comparator boundary. | Stop: proposed tile selection is a selector wrapper. |
| RQ03 | IREE Stream dialect current reference; action = target affinity, async resource encoding, timepoint scheduling. | Same IREE dispatch/resource semantics; new action must improve a fixed stream construction without changing ordering/lifetime legality. | Contrary source owns placement, partitioning, concurrency and resource encoding; cost includes copies, allocation/lifetime, synchronization and launch. | Stop: no separate target-native action was identified. |
| RQ04 | TVM MetaSchedule current tutorial; action = structural-hash task identity, tuning-record database lookup/warm-start. | Same TIR schedule application under fixed module equality; new action must preserve matching semantics. | Full boundary includes trials, measured runtime, database lookup/storage and compilation; structural/anchor-block matching already supplies reuse route. | Stop: proposed reuse is current database behavior. |

Search boundary: official PyTorch, Triton, IREE and TVM documentation only; no global-newness claim. Each disposition is current-action absorption or non-admission, never a claim of absence.
