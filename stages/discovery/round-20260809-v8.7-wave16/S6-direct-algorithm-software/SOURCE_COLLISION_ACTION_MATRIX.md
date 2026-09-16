# Source / collision / action-space matrix

Frozen cutoff: `2026-08-09`. Only official Lean documents and upstream source were used.

| Object/source | Current, pinned fact | Action space / constraints | Decision |
|---|---|---|---|
| Lean reference, modules: <https://lean-lang.org/doc/reference/latest/Source-Files-and-Modules/> | `.olean` serializes the environment plus a compacted heap region. | Current module environment to native `.olean` image. | `NATIVE_OBJECT` |
| Lean reference, elaboration: <https://lean-lang.org/doc/reference/latest/Elaboration-and-Compilation/> | Terms/values are represented as in memory so the file may be directly memory-mapped; kernel checks additions before serialization. | Preserve native mapped-image and checked-environment semantics. | `SAME_OBJECT_CONTRACT` |
| Lean build-tools reference: <https://lean-lang.org/doc/reference/latest/Build-Tools-and-Distribution/> | `leanchecker` replays `.olean` elaboration results through the kernel. | Native checker/oracle. | `NATIVE_CHECKER` |
| Current official release tag `v4.31.0`: <https://lean-lang.org/doc/reference/latest/releases/v4.31.0/> | Frozen released toolchain tag for this audit. | Default and non-default user configuration was checked at the tool/document level; none makes a new compactor action available. | `VERSION_PIN` |
| Current upstream source snapshot, observed 2026-08-09: <https://raw.githubusercontent.com/leanprover/lean4/master/src/runtime/compact.cpp> | `object_compactor::save_max_sharing` uses a content-hash/equality table; `insert_constructor`, `insert_array`, `insert_string`, `insert_sarray`, `insert_task`, and `insert_promise` invoke it. `region_reader::read` has mapped-at-base no-fixup fast path. | Native maximum structural sharing plus compact region mapping/fixup. | `DIRECT_FATAL__CURRENT_UNION_ABSORBS_SHARING_CONSTRUCTOR` |
| Current upstream environment source: <https://raw.githubusercontent.com/leanprover/lean4/master/src/Lean/Environment.lean> | `ModuleData` comment states `compact.cpp` generates the on-disk image. | Native writer binding. | `CURRENT_SOURCE_CONFIRMATION` |
| Lean 4 thesis: <https://lean-lang.org/papers/thesis-sebastian.pdf> | Describes historical compact/mapped `.olean` rationale and discusses a more compact representation only as a different representation. It is not absence evidence. | Alternative image/reader representation. | `DROP_CHANGED_READER_FORMAT` |

## Explicit action-gap disposition

- **Maximal sharing constructor:** current source implements it; `DROP_CURRENT_UNION_ABSORPTION`.
- **Reorder or change the max-sharing table:** either a local implementation tweak without a new action interface or a routine engineering optimization; `DROP_MICRO_OPTIMIZATION`.
- **Use narrow pointers/elide padding/change layout:** requires a different serialized image and reader relocation semantics; `DROP_CHANGED_OBJECT_OR_NATIVE_READER`.
- **External compression/cache/wrapper:** adds a decoder/pipeline outside `.olean`; `DROP_WRAPPER_CHANGED_DENOMINATOR`.
