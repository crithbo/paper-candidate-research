# Source and collision matrix — DISCOVERY-S2-20260809-V8.7-WAVE20

| Object / candidate line | Source status | Strongest same-object union and fair information | Claimed residual after subtraction | Collision finding | Disposition |
| --- | --- | --- | --- | --- | --- |
| Wasmtime compile → instantiate | Official current docs and rendered upstream `wasmtime/config.rs` source, observed 2026-08-09 | AOT/serialized compilation artifact plus cache; parallel compilation; `InstancePre` import preparation; COW heap images; allocation through default `OnDemand` or non-default feature-gated `Pooling`.  Each works on a Wasmtime module/instance with native runtime semantics. | An alleged compile-metadata/instantiation-layout co-design. | No atomic action was frozen outside that union. Choosing an existing cache/allocation/image point is ordinary configuration; stitching them externally is an instantiation wrapper.  Current source is affirmative counterevidence to an absence claim. | DROP — direct absorption / controller-wrapper boundary. |
| Distributed accelerator compute → communication | Primary FiCCO paper plus first-party FlashOverlap artifact | Fine-grained compute–communication/DMA ordering, signaling, and reordering for the same distributed iteration; both have the schedule and dependency information needed by the alleged residual. | A new overlap schedule after communication became dominant. | The residual’s only discernible action is another ordering/scheduling policy over existing transfers and kernels.  It is either absorbed by the union or a selector, not a new object-preserving N2 action. | DROP — direct absorption / controller boundary. |
| Compressed index construction → native access | Primary-paper and project-source screening; no adequate fixed source pair survives | No exact same index format, query semantics, and current executable union could be simultaneously frozen without selecting an excluded object. | Joint construction/layout action. | A potential action would either change representation/query guarantees, reduce to format plumbing, or lack a source-supported current union; no action-gap certificate. | DROP — same-object/action-gap gate not met. |

## Current-upstream details for the first row

- Frozen upstream evidence: official rendered `wasmtime/config.rs`, observed
  2026-08-09; source symbols `InstanceAllocationStrategy`, `Config::new`,
  `parallel_compilation`, `cache`, and `allocation_strategy`.
- Defaults: `InstanceAllocationStrategy::OnDemand`; `cache: None` until
  configured; parallel compilation `!cfg!(miri)`; defaults may vary with Cargo
  features and target.
- Non-default path: `Pooling(PoolingAllocationConfig)` exists behind the
  `pooling-allocator` feature and reuses precreated resources.  The cache field
  is gated by the `cache` feature.  Thus the collision includes relevant
  non-default configuration, not merely default API behavior.
- Contrary evidence recorded: the API has current allocation/cache/compiler
  controls.  No statement that an upstream feature is absent is used to support
  a retained candidate.

## Admission conclusion

No row reaches `TIER_B_Q2_VIABLE`; consequently there is no action-gap
certificate, fidelity-closure plan, or Stage-A killer to freeze.  These are not
missing deliverables: each would be false because its prerequisite, a
union-external same-object atomic action, failed.
