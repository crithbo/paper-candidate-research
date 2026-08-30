# Same-object RQ candidates

## RQ45-01 — Vulkan sparse resource binding

For one fixed sparse buffer/image logical contents, queue family and observable device reads, is there a target-specific binding/update constructor with a guarantee on bind bytes, synchronization and residency cost after dense allocation is no longer dominant? The RQ fails if it is merely choosing standard sparse pages, queue operations, or eviction policy.

## RQ45-02 — OpenMP rectangular target transfer

For one fixed multidimensional source/destination values, dimensions and target-device endpoints, can a nontrivial constructor jointly choose legal rectangle/dependency transfer actions with a same-output full-cost guarantee? The RQ fails if it is a sequence/selection of `omp_target_memcpy[_rect][_async]` calls.

## RQ45-03 — Kokkos cross-memory-space view materialization

For one fixed `Kokkos::View` logical values/layout and execution endpoint, can a portable, target-specific mirror/materialization constructor provide a non-generic copy/temporary-memory guarantee? The RQ fails if it is a deep-copy/mirror API selection or general packing.

All versions were frozen before evidence review; none was rewritten after source outcomes.
