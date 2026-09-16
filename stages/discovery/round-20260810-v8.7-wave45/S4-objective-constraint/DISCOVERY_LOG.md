# DISCOVERY-S4-20260810-V8.7-WAVE45-OBJECTIVE-CONSTRAINT

- Lane: `DISCOVERY-S4-OBJECTIVE-CONSTRAINT`
- Frozen cutoff: `2026-08-09`; retrieval and audit completed `2026-08-10`.
- Accepted method: production Discovery `v2/v8.1`, with v8.6 fidelity-plan discipline and v8.7 current-upstream reality check where applicable. The blocked two-axis `v8.2r2` method was not used.
- Assignment boundary: 10 new lineages, checked against the registry's Wave29--44, active, blocked, and terminal exclusions. None is WebGraph, HNSW, UST, Knative, a Wave35 object, or a terminal-topic revival.
- Result: `COMPLETE_ZERO_PROPOSALS`.

## Evidence and decision discipline

The first-party source corpus is the official FAST '26 proceedings/accepted-paper records. For each seed, the strongest union is constrained to compatible same-object actions with the same information, native semantics/guarantee, and all construction plus maintenance/foreground costs. The alleged action divergence is made concrete before subtraction. No candidate is rejected for being unimplemented, lacking a native output, lacking a result, lacking a downloadable artifact, or having low AI readiness.

`CURRENT_UPSTREAM_REALITY_CHECK`: none of these drops depends on a claim that mutable upstream source lacks an action, feature flag, or interface. The relevant current collision is an explicitly documented paper mechanism. Hence no absence claim is made from an old document, issue, or failed lookup. The current-source record for every seed is the official FAST '26 paper/proceedings record frozen below.

## Ten genealogy screens

### W45-01 — WARP / FDP SSD placement

- Exact object: flexible data-placement (FDP) writes to one device using its reclaim-unit handles (RUHs), preserving device-defined placement and completion semantics.
- Objective/constraint tension: write amplification versus RUH isolation, lifetime misclassification, and interference robustness.
- Minimal alleged action divergence witness: place an object in a second RUH only when a lifetime-confidence bound and a WAF budget both hold.
- Strongest union and six-dimensional subtraction: WARP already exposes per-RUH dynamics and configurable placement policies. The witness is a policy over the same RUH assignment (decision), lifetime/invalidations (information), RUH capacity/GC (resource), and native device correctness (guarantee); WAF, migration/GC, and metadata are the full cost. It either tunes the exposed policy or requires firmware action not present in the frozen host-visible object.
- Structural paper potential: potentially high only for a separately frozen firmware-interface/algorithm object; not established here. Current evidence readiness: emulator/characterization exists, not used as a negative factor.
- Decision: `DROP__NO_SAME_OBJECT_COMPLETE_ACTION_BEYOND_CONFIGURABLE_FDP_POLICY`; a finite Stage-A fidelity route would necessarily redefine the device/firmware object.

### W45-02 — ScaleSwap / all-flash swap array

- Exact object: Linux swap-in/out on an all-flash array with native page and LRU semantics.
- Tension: core/SSD scalability and latency versus bounded cross-core metadata contention.
- Witness: delegate one core's swap-metadata access to another only when its queue and SSD budget satisfy a tail cap.
- Union subtraction: ScaleSwap's one-to-one core resources, opportunistic inter-core assistance, and core-affinity page/LRU management already express the delegation. The witness has the same decision, queue/SSD information, resource costs, and swap semantics; extra global re-assignment either chooses an existing assistance action or changes the core-ownership invariant. Full cost includes delegation, metadata, LRU work, and device I/O.
- Structural potential: low after direct subtraction. Readiness: kernel implementation exists; not a drop cause.
- Decision: `DROP__CURRENT_COMPLETE_CONSTRUCTOR_ABSORBS_WITNESS`.

### W45-03 — ThinkAhead / virtual-disk image preload

- Exact object: a fixed virtual-disk image served through lazy/preloaded blocks with native image bytes and read semantics.
- Tension: tail waiting time versus cold-start work/bandwidth under historical and sparse-history workloads.
- Witness: issue a block preload only if a predicted miss bound and a startup bandwidth budget both pass.
- Union subtraction: ThinkAhead already predicts efficient block-preload sequences from historical traces/runtime conditions and handles limited/no-history cases. The witness is a same-information preloading policy; it neither creates a new block state nor preserves a different guarantee. Prediction, speculative I/O, wrong-preload bandwidth, cache eviction, and waiting time are the full denominator.
- Structural potential: none for the proposed policy rule; an alternative representation was not identified. Readiness: trace-driven and cluster routes exist, not used against it.
- Decision: `DROP__SAME_INFORMATION_POLICY_REPLAY__NO_N2`.

### W45-04 — CoFS / container image lookup

- Exact object: a fixed, read-only container filesystem tree with pathname-lookup and byte-identical file-read semantics.
- Tension: cold-start tail latency versus build-time metadata size and lookup I/O.
- Witness: partition a fixed tree into a dense MPHF-indexed table and sparse cache only when both lookup-I/O and image-metadata caps hold.
- Union subtraction: CoFS's build-time MPHF, dense metadata array, full-path MPHF, and sparse-file cache already supply the representation and lookup actions. The witness changes table partition thresholds/order, has the same build/tree information, and preserves correctness only through the same hash representation. Build, image layout, cache misses, path resolution, and kernel I/O must all be charged.
- Structural potential: low; the alleged residual is a configuration of the existing data structure. Readiness: natural container images are a plausible carrier, not a negative filter.
- Decision: `DROP__EXISTING_REPRESENTATION_AND_THRESHOLD_TUNING`.

### W45-05 — RosenBridge / virtualized express I/O

- Exact object: guest I/O crossing a VM--host virtualization boundary while preserving guest memory-safety and I/O semantics.
- Tension: express-path throughput/latency versus inter-VM fairness and isolated uBPF memory access.
- Witness: admit an XRP/GDS offload only under a per-VM fairness credit and memory-scope bound.
- Union subtraction: virtio-ndp/uBPF guest-host offload, address translation, restricted memory access, and collaborative multi-path throttling are the stated RosenBridge action set. The witness is the same admission/throttle decision using the same VM/path information. CPU, translation, throttle delay, verification, and I/O costs remain charged; an expanded program privilege changes the safety object.
- Structural potential: low after action/guarantee subtraction. Readiness: two system use cases are documented; not a drop cause.
- Decision: `DROP__CURRENT_UNION_ALREADY_JOINTLY_ENCODES_PERFORMANCE_FAIRNESS_SAFETY`.

### W45-06 — DRBoost / MSR degraded reads

- Exact object: degraded reads of one MSR-coded storage cluster with the code's native fault-tolerance contract.
- Tension: degraded-read tail latency/I/O amplification versus repair bandwidth and healthy-data fragmentation.
- Witness: reconstruct only a partial chunk when both a repair-bandwidth cap and a no-fragmentation condition are met.
- Union subtraction: DRBoost already combines partial-chunk reconstruction, reconstruction-friendly coding layout, and fragmentation-free layout. The witness uses the same reconstruction decision/information and code/layout resources. Correctness needs the same MSR guarantee; full cost includes encoding/layout, partial reconstruction, data reads, and request splitting. A new layout/code changes the fixed code object.
- Structural potential: low for the stated joint constructor. Readiness: evaluated workloads exist; not a rejection basis.
- Decision: `DROP__DIRECT_SUBTRACT_TO_EXISTING_THREE_PART_CONSTRUCTOR`.

### W45-07 — CETOFS / remote NVMe filesystem

- Exact object: file operations over disaggregated NVMe/RDMA with native permission, concurrency, and failure-atomic I/O semantics.
- Tension: concurrent throughput/latency versus permission checking and failure-atomicity cost.
- Witness: remote-offload a write's permission/concurrency/atomicity steps only when a latency and server-work budget is satisfied.
- Union subtraction: CETOFS already separates user-space data plane from kernel control plane and offloads precisely permission checking, concurrency control, and failure-atomic I/O guaranteeing. The witness is a scheduling criterion over that same offload triple. Network hops, server CPU, control checks, commit/atomicity work, and foreground latency are all full cost; omitting any changes the contract.
- Structural potential: low. Readiness: prototype exists; not used to drop.
- Decision: `DROP__DIRECT_CURRENT_JOINT_CONSTRUCTOR_COLLISION`.

### W45-08 — Lockify / shared-storage DLM

- Exact object: lock acquisition for file/directory creation in GFS2/OCFS2 shared-disk semantics.
- Tension: multi-client acquisition tail latency versus ownership/coherence correctness.
- Witness: immediately issue a self-owner notification while asynchronously changing directory ownership when a contention/latency bound holds.
- Union subtraction: that exact paired action is Lockify's self-owner notification plus asynchronous ownership management. It consumes the same client/directory state, resources, and ownership guarantee. Communication, deferred ownership work, retries, and acquisition latency constitute full cost. More aggressive transfer changes the native DLM correctness contract.
- Structural potential: none for an extensional replay. Readiness: official paper evaluates real filesystem workloads; not a criterion.
- Decision: `DROP__DIRECT_FATAL_SAME_ACTION_AND_GUARANTEE`.

### W45-09 — uCache / unikernel I/O cache

- Exact object: application I/O caching with filesystem-compatible reads, mmap-like surface, and explicit cache interface.
- Tension: userspace-cache flexibility/performance versus OS-cache simplicity/compatibility.
- Witness: use application semantics to choose an eviction/prefetch action while retaining the conventional interface.
- Union subtraction: uCache's uVFS is explicitly the interface that injects application knowledge into the cache and adapts it to I/O backends. The witness lacks a separately named atomic data-structure/algorithm action: it is a policy supplied through the existing interface. Same information, cache/memory/I/O costs, and compatibility guarantee follow directly; a new user-facing layer would be a forbidden wrapper.
- Structural potential: below Q2 in this formulation. Readiness: implementation exists, irrelevant to decision.
- Decision: `DROP__WRAPPER_OR_EXISTING_POLICY_INTERFACE__NO_N1_N2_N3`.

### W45-10 — UnICom / native I/O completion

- Exact object: native SSD I/O completion under low/high CPU utilization with OS-visible completion semantics.
- Tension: low completion latency versus CPU use, multi-process scaling, and direct-access safety.
- Witness: select a completion path that shares a centralized polling thread while maintaining a CPU budget and low tail latency.
- Union subtraction: UnICom's TagSched, centralized TagPoll, and SKIP already unite scheduling, shared polling, and kernel-assisted direct access. The witness has the same completion action/information, costs (CPU, traps, wakeups, queueing, device I/O), and safety semantics. A different decision rule is ordinary policy tuning; a different access path changes the interface/security contract.
- Structural potential: none after direct subtraction. Readiness: Linux implementation/evaluation documented; not used against it.
- Decision: `DROP__CURRENT_COMPLETE_UNION__POLICY_REWEIGHTING_ONLY`.

## Cross-lineage conclusion

All ten newly screened objects close before Stage0: WARP lacks a same-object host-visible joint action beyond the documented configurable policy; ScaleSwap, ThinkAhead, CoFS, RosenBridge, DRBoost, CETOFS, Lockify, and UnICom collide with a complete current constructor; uCache reduces to an existing policy interface/wrapper. The required quality floor `TIER_B_Q2_VIABLE` is therefore not met. No TOPIC_BRIEF and no `PROPOSE_STAGE0` are produced.

## Fidelity and reproducibility note

For every dropped line the fastest falsifier is the explicit minimal witness recorded above: if it is executable by the cited current union under the same information and full-cost ledger, the alleged residual closes; if making it non-replayable requires altered device/firmware, protocol, safety, or quality semantics, same-object fails. That is a finite contract-level check, not a benchmark result. A Stage-A fidelity closure plan is unnecessary because no candidate remains; no experiment, benchmark, download, Stage0, StageA, or StageB was created.
