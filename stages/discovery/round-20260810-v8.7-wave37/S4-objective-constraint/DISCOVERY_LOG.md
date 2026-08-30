# DISCOVERY-S4-20260810-V8.7-WAVE37-ALGORITHMIC-RESIDUAL

- Lane: `DISCOVERY-S4-OBJECTIVE-CONSTRAINT`
- Frozen cutoff: `2026-08-09`; discovery work completed `2026-08-10`.
- Method: accepted production Discovery method `v2/v8.1` with v8.6 fidelity-plan and v8.7 current-upstream reality checks. The TLS-blocked two-axis `v8.2r2` method was not used.
- Scope: six new, mutually distinct FAST '26 object lineages. They do not reuse Wave35's TileLoom/FORGE/GOODPUT objects or a terminal/active candidate object.
- Result: `COMPLETE_ZERO_PROPOSALS`.

## Procedure

For every seed, I first froze the same-object decision and a smallest purported action divergence. I then subtracted the strongest executable/meaningful union on: decision rule, information, complexity/resources, quality/guarantee, full cost, and generalization/no-gain. “Controller” was not treated as an automatic rejection: it is rejected below only where the alleged constructor is extensionally a scheduling/configuration rule already expressible by the frozen union. No rejection is based on an unimplemented candidate, missing benchmark, unavailable artifact, or AI readiness.

The official FAST '26 proceedings page is the first-party anchor for all six records and was searched through the frozen cutoff. It directly records the paper mechanisms and, for several seeds, public/production-trace evidence. No absence claim about a moving upstream implementation is used; therefore a current-source absence claim is neither made nor needed for these `DROP` outcomes.

## Six independent residual audits

### 1. ODINANN — on-disk graph ANNS insert/search stability

- Exact natural object: a fixed stream of vectors inserted into one billion-scale on-disk graph ANNS index, with query result quality held at the index's native recall contract.
- O4 tension: foreground search p99 stability versus insertion throughput and disk update cost.
- Smallest alleged action divergence witness: after inserting one vector, make its forward edges searchable now but defer a bounded set of reverse-edge repairs until an SLO-safe epoch.
- Strongest union: direct insert (OdinANN) plus the established buffered/batch-merge alternative, with native graph neighbor selection and update parameters.
- Six-dimensional subtraction: (1) the proposed rule is still immediate-or-deferred edge update; (2) it uses the same graph and arrival/order information; (3) its repair queue adds state/cost without changing the update primitive; (4) a deferred reverse edge changes the moment at which the native recall/connectivity invariant is supplied, unless it is a legal partial direct insert; (5) full cost includes deferred repair, durable writes, and query interference; (6) under the legal partial-direct-insert interpretation it is replayed by a bounded direct-insert configuration, and under the other interpretation it changes the quality contract.
- Disposition: `DROP__DIRECT_SUBTRACT_TO_NATIVE_DIRECT_INSERT_OR_GUARANTEE_CHANGE`. A queue is not automatically a controller; here its only complete action is the pre-existing graph-edge update at a different time.

### 2. DMTREE — disaggregated-memory range index

- Exact natural object: point/range operations on one disaggregated-memory tree index with the same linearizable locating/locking semantics.
- O4 tension: bounded memory-server RDMA IOPS/bandwidth versus tail latency for both scans and writes.
- Smallest alleged action divergence witness: route one hot key's locate/lock phase through a peer compute server while retaining its range scan in the existing tree.
- Strongest union: DMTree's compute-side collaborative locate/lock offload plus private-cache designs.
- Six-dimensional subtraction: (1) the witness is exactly the peer compute-side locating/locking action; (2) it needs the same key/range and peer-resource information; (3) it uses the same RDMA path and adds coordination; (4) it retains the same range-index semantics only by using DMTree's lock protocol; (5) peer hop, RDMA operations, cache coherence, and lock coordination are all already charged; (6) changing only an objective cap selects a feasible DMTree action, while an extra lease/relocation primitive would change the frozen protocol/object.
- Disposition: `DROP__CURRENT_CONSTRUCTOR_ABSORBS_JOINT_RESOURCE_ACTION`.

### 3. RASK — cloud block-store range-as-key index

- Exact natural object: online reads/writes to a cloud block store represented by one range-key tree with native overlap and range-fragmentation semantics.
- O4 tension: metadata memory capacity versus update throughput/fragmentation cost.
- Smallest alleged action divergence witness: coalesce two adjacent ranges only when the resulting leaf stays below both a memory cap and a split-amplification cap.
- Strongest union: RASK log-structured leaves, range-tailored search/GC, and range-aware split/merge.
- Six-dimensional subtraction: (1) conditional coalescing is RASK's range-aware split/merge decision; (2) it uses the same adjacent-range/leaf statistics; (3) it changes only the threshold/order on existing leaf maintenance; (4) it maintains identical block-map semantics; (5) merge, split, GC, metadata, and I/O work are the native denominator; (6) no separate action remains once both threshold caps are allowed in the existing operation—only configuration/tuning remains.
- Disposition: `DROP__ROUTINE_CONFIGURATION_OF_EXISTING_RANGE_CONSTRUCTOR`.

### 4. HATS — Cassandra foreground/background coupling

- Exact natural object: one Cassandra distributed-LSM deployment serving foreground reads while performing necessary compaction, with native replication and consistency semantics.
- O4 tension: read-tail fluctuation versus compaction progress/load balance.
- Smallest alleged action divergence witness: postpone a compaction subtask until a replica-specific read queue falls below an SLO budget, then choose that replica for the next read.
- Strongest union: HATS coarse/fine replica selection and adaptive compaction rate control, plus Cassandra's native compaction/replica actions.
- Six-dimensional subtraction: (1) the witness is the pair `(read replica, compaction rate/time)` already optimized by HATS; (2) it consumes the same queue/load/replica information; (3) it adds no primitive beyond existing scheduling and rate control; (4) it preserves consistency only under the existing native constraints; (5) queue delay, compaction debt, read cost, and replica load remain the same full-cost ledger; (6) a different objective function changes the controller policy but not the algorithmic action set or guarantee.
- Disposition: `DROP__SAME_INFORMATION_SAME_ACTION_CONTROLLER_REPLAY`, not merely because the word “scheduler” appears.

### 5. LESS — erasure-coded repair construction

- Exact natural object: a fixed Reed--Solomon-compatible erasure-coded HDFS stripe and its single-block/full-node repair contract.
- O4 tension: amount of accessed data versus I/O seeks while retaining balanced reductions and code fault tolerance.
- Smallest alleged action divergence witness: choose a repair sub-stripe layering that satisfies both a seek cap and a data-access cap for the same failed block.
- Strongest union: the configurable LESS family of layered extended sub-stripes and current I/O-optimal erasure-code comparators.
- Six-dimensional subtraction: (1) the witness is the LESS code-construction parameter; (2) it uses the same stripe/failure information; (3) its code/sub-stripe costs are already the construction resource; (4) retaining a fixed RS-compatible repair guarantee leaves the same design family; (5) encoding, layout, repair reads/seeks, full-node recovery and balance are all necessary costs; (6) an online per-failure choice either chooses a prebuilt LESS configuration or introduces a new code/layout and changes the fixed-object guarantee.
- Disposition: `DROP__CONFIGURABLE_CURRENT_CODE_FAMILY_OR_CHANGED_CODE_OBJECT`.

### 6. DPAS — SSD I/O completion

- Exact natural object: completion of native SSD I/Os under CPU contention, with the OS-visible completion semantics unchanged.
- O4 tension: completion latency/tail responsiveness versus CPU consumption and context-switch overhead.
- Smallest alleged action divergence witness: assign one request to an interrupt, polling, or calibrated sleep-poll mode from its recent-I/O latency state and a CPU-budget cap.
- Strongest union: DPAS/PAS plus native interrupt and polling modes.
- Six-dimensional subtraction: (1) the witness is exactly DPAS's mode-switch action; (2) recent I/O latency and CPU contention are its stated information; (3) the proposed budget changes its switching criterion but creates no completion primitive; (4) completion correctness is unchanged; (5) CPU use, sleep/wakeup and I/O time are precisely the relevant full-cost denominator; (6) a constrained objective is a same-information policy replay, and batching beyond it changes the completion interface/latency semantics.
- Disposition: `DROP__DIRECT_ACTION_REPLAY__NO_N1_N2_N3_RESIDUAL`.

## Cross-seed conclusion

Each witness either reduces to a current complete constructor (DMTree, RASK, LESS), a same-information policy replay (HATS, DPAS), or requires a changed native quality/protocol contract (OdinANN). Thus none reaches `TIER_B_Q2_VIABLE`. No TOPIC_BRIEF is produced and no `PROPOSE_STAGE0` is recommended.

## Search boundary and evidence honesty

- Primary-source corpus: official USENIX FAST '26 technical sessions/paper summaries, searched on 2026-08-10 with cutoff frozen at 2026-08-09.
- Latest-collision status: `SEARCH_BOUNDED_OPEN` is not used as a novelty conclusion. The documented current paper mechanisms are sufficient direct subtractors for the six proposed residuals.
- Natural routes that would have been available if a residual survived: billion-scale vector datasets (OdinANN), range-index workloads (DMTree), four production cloud-block traces (RASK), Cassandra workloads (HATS), HDFS repair workloads (LESS), and YCSB/SSD contention (DPAS). They do not cure the structural absorptions above.
- Stage A: not authorized; no experiment, benchmark, download, Stage0, StageA, or StageB was created.
