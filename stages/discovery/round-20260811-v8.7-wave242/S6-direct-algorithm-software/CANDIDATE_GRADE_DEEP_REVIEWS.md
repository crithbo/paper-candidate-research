# Candidate-grade deep review

## D1 — GNU ld/BFD layout, relaxation, thunk and padding joint N2

| Required facet | Frozen review |
|---|---|
| Same object | Same input objects, resolution result, ABI/relocations, linker-script semantics and stock loader/runtime behavior. A script-imposed address/order or address-observable program removes the corresponding degree of freedom. |
| Current upstream reality | GNU Binutils documents `binutils-gdb.git` as development source and documents ld 2.46. Network review reached current official manuals, but did not yield a frozen source commit or complete BFD backend/default/config call-path audit. |
| Current strongest union | GNU ld default/custom linker scripts, output-section mapping/order/address/alignment, target relaxation/thunks/stubs as implemented, GC/ICF where exposed, target/backend flags and pass behavior; lld ELF GC, ICF and target thunk/relaxation are independent strong subtractors. This union is intentionally incomplete pending current source closure. |
| Static witness | Two independent default-script text sections can be legally output in alternate regenerated order only under the explicitly frozen non-address-observing and script-permitting condition. The witness does not license changed input order, script or semantic contract. |
| Nontrivial N2 ceiling | Joint, target-aware placement-plus-relaxation algorithm with a stated byte/branch/relocation or approximation guarantee, against the complete native composition. Routine placement, pass ordering, generic ILP or flags alone fail. |
| Natural route | A pinned public ELF build trace preserving objects, command, script and target. Native oracle: `readelf` structural/relocation checks plus stock load/run equivalence. |
| Full cost | Link CPU/wall/RSS/temp/output bytes, relocations, thunks/stubs, loader/startup and fixed workload I-cache/branch effects. |
| 72-hour killer | Pin GNU ld/BFD and lld commits; enumerate all layout/relaxation/thunk/script/default/config paths; validate the two-layout legal witness under a fixed trace; replay native strongest compositions; terminate the candidate if an action is already expressible, script/semantics must change, no guarantee survives, or a direct collision absorbs it. |
| Decision | `NOT_ADMITTED_UNFROZEN`; zero briefs. The blocker is source/collision closure, not implementation, result, resources or AI readiness. |
