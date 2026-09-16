# Candidate-grade deep reviews

## D01 — mimalloc heap/page constructor

- **Atomic union:** size-class selection, page/segment acquisition, local free-list handling, delayed/remote free, cache/sharding and OS interaction.
- **Oracle/cost:** fixed allocation trace with pointer legality/API behavior; charge metadata, committed/resident memory, allocation/free work, synchronization and OS calls.
- **Witness/72h killer:** two same-size allocations then free/reuse exposes page choice, but page/cache policy is a current native action. Public trace; kill on API/heap invariant failure or a parameter-only claim.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## D02 — jemalloc arena/bin/extent constructor

- **Atomic union:** request-to-size-class mapping, tcache/arena routing, bin/slab allocation, extent lifecycle, decay/purge and synchronization.
- **Oracle/cost:** same trace/API/allocator invariants; charge metadata, fragmentation/RSS, allocation/free, locks and purge costs.
- **Witness/72h killer:** an allocate/free/reallocate trace makes routing visible, but arena/bin selection is native union or configuration. Kill if only option selection remains.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## D03 — snmalloc ownership/message constructor

- **Atomic union:** local allocation, remote free message handling, slab/superblock management, ownership transfer and backing allocation.
- **Oracle/cost:** same concurrent allocation semantics and memory safety; charge messages, metadata, synchronization, committed memory and allocation/free latency.
- **Witness/72h killer:** cross-thread free is a minimal witness, but routing/ownership handling is native action space. Kill on safety/ABI change or merely policy tuning.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## D04 — rpmalloc span constructor

- **Atomic union:** size-class mapping, per-thread heap, span cache, global cache, mapping/unmapping and free/coalesce transitions.
- **Oracle/cost:** same trace and allocation contract; charge mapping, span/cache metadata, resident memory and all allocation/free work.
- **Witness/72h killer:** span reuse after a size-class request remains a cache/placement action already in union. Kill on allocation mismatch or omitted memory/OS cost.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## D05 — dlmalloc chunk/bin constructor

- **Atomic union:** chunk split/coalesce, small/large bin selection, top chunk, mmap/sbrk acquisition and free-list maintenance.
- **Oracle/cost:** same malloc/free behavior and chunk invariants; charge external/internal fragmentation, metadata, system allocation and all operations.
- **Witness/72h killer:** adjacent free chunks show coalescing choice; it is an established native chunk/bin action, not union-external N2. Kill if coalescing invariant fails.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## D06 — Ninja build-DAG scheduler

- **Atomic union:** dependency graph loading, dirty/ready decision, pool limits, command launch, completion propagation and failure handling.
- **Oracle/cost:** fixed build graph, commands, environment and identical generated artifacts; charge graph scan, process launch, waiting, I/O, resource use and rebuild correctness.
- **Witness/72h killer:** two independent jobs expose launch order, but dispatch is an online controller/scheduler action rather than a distinct same-object constructor; changing resources/environment changes object. Kill on dependency violation or controller-only mechanism.
- **Disposition:** `STRUCTURAL_DROP`.

## Result

All six full reviews yield zero briefs. The five allocator families are absorbed by native whole allocation unions. Ninja is structurally ineligible because the remaining residual is online dispatch/controller behavior. No row was rejected for missing implementation, result, resources, or AI readiness.
