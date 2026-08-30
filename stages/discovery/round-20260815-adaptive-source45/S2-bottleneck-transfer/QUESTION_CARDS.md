# Evidence-qualified question cards

## QC45-01 — Vulkan sparse binding

- **Object/endpoint:** fixed sparse resource logical values and stock Vulkan reads under the same queue/device contract; candidate would reduce sparse bind/update/residency cost without changing resource contents or synchronization semantics.
- **Atomic-action hypothesis:** construct sparse page bindings and required queue submissions as a target-specific whole action with an explicit recourse/bytes guarantee—not a page choice, cache policy or queue controller.
- **Current locus:** Vulkan 1.4 specification defines sparse-resource support through `VK_QUEUE_SPARSE_BINDING_BIT` and sparse memory-management operations.
- **Comparator/full cost:** stock `vkQueueBindSparse`/resource requirements under equal contents and queue semantics; host construction, bind calls, synchronization, resident bytes, temporary memory and device latency.
- **Carrier/oracle/falsifier:** version-pinned Khronos validation/conformance sparse-resource route; stock reads and validation are the oracle. Kill on showing that only legal page/bind API composition remains.
- **Disposition:** `STRUCTURAL_DROP__GENERIC_RESOURCE_BINDING_OR_QUEUE_POLICY`; no target-specific whole action or guarantee was frozen.

## QC45-02 — OpenMP rectangular target transfer

- **Object/endpoint:** fixed multidimensional array values, source/destination extents and target-device endpoints; exact copied rectangle and completion behavior are unchanged.
- **Atomic-action hypothesis:** joint rectangle/dependency construction with a bounded copy/synchronization guarantee, excluding API sequencing or dependency scheduling.
- **Current locus:** OpenMP 5.1/6.0 device-memory routines specify `omp_target_memcpy_rect`, `omp_target_memcpy[_rect]_async`, allocation, association and dependency parameters.
- **Comparator/full cost:** the stock runtime routines with equal rectangle/endpoint/dependency semantics; setup CPU, transfer bytes, temporary staging/RSS, synchronization and wall latency.
- **Carrier/oracle/falsifier:** a version-pinned LLVM OpenMP target runtime test or OpenMP specification example, with exact destination values and completion as oracle. Kill if shape/dependency is only a call-level configuration grid.
- **Disposition:** `STRUCTURAL_DROP__CURRENT_API_ACTION_UNION_OR_GENERIC_COPY_SCHEDULING`.

## QC45-03 — Kokkos view materialization

- **Object/endpoint:** fixed compatible `Kokkos::View` values, layout/padding and execution-space observation.
- **Atomic-action hypothesis:** a target-specific constructor jointly materializing a mirror and transfer temporary with a full-cost guarantee, excluding ordinary mirror/deep-copy call selection and generic packing.
- **Current locus:** Kokkos documents `View`, `create_mirror[_view]`, `deep_copy`, accessible memory spaces, and the rule that deep copies require compatible layout/padding; no hidden deep copy is performed.
- **Comparator/full cost:** same view/layout and `create_mirror`/`deep_copy` path; profile/setup CPU, copy bytes, temporary/resident memory and target completion time.
- **Carrier/oracle/falsifier:** version-pinned Kokkos core example/test with stock view-value equality. Kill if preserving layout and padding leaves only existing mirror/deep-copy actions.
- **Disposition:** `STRUCTURAL_DROP__CURRENT_NATIVE_MIRROR_DEEPCOPY_UNION_OR_GENERIC_PACKING`.
