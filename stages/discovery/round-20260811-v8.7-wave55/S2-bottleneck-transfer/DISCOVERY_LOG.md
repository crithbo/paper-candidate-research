# Discovery log — S2 bottleneck transfer / hardware–software

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE55-BOTTLENECK-TRANSFER-HARDWARE-SOFTWARE`  
**Lane:** `S2-bottleneck-transfer`  
**Cutoff:** 2026-08-11  
**Decision:** `COMPLETE_ZERO_PROPOSALS`

## Frozen method and scope

This package applies `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`, under `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__discovery-six-lanes-direct-20260811__p1-shadow-not-authoritative`, with `DISCOVERY_QUALITY_MODE=OFF`.  It does not apply v8.8, R7 shadow/dormant semantics, or repair vectors as decision authority.

The search starts from a hardware/software boundary whose prior acceleration moves full-cost to data ownership, registration, completion, mapping, or metadata handling.  A direction is admission-eligible only if it names a whole same-object and same-guarantee N1/N2/N3 action that the strongest current union cannot express.  A selectable policy, a backend hook, or a configuration switch alone is not deemed absorption; conversely it is not an action gap unless the proposal changes the complete construction/algorithm rather than selecting an existing path.

## Funnel ledger (R5-P0)

| Event | Family / rationale | Classification |
|---|---|---|
| raw-01 | UCX RDMA registration/cache after data-path zero-copy | unique family; deep screened |
| raw-02 | DPDK mbuf/descriptors after kernel-bypass packet I/O | unique family; deep screened |
| raw-03 | SPDK NVMe-oF bdev/accel sequence after polled user-mode I/O | unique family; deep screened |
| raw-04 | SPDK NVMe-oF multipath/queue selection | repeat of raw-03 | `EXCLUDED` (selector) |
| raw-05 | Linux DMA-BUF/IOMMU map lifecycle for device sharing | unique family |
| raw-06 | Linux RDMA umem / page-pinning lifecycle | repeat of raw-01 | `EXCLUDED` (same registration object) |
| raw-07 | LLVM OpenMP target data mapping and runtime launch | unique family |
| raw-08 | GCC offload data-map lowering/runtime | unique family |
| raw-09 | Linux blk-crypto/DMA completion ownership | unique family |
| raw-10 | KVM dirty-log hardware bitmap to software metadata scan | unique family |
| raw-11 | Arrow Flight zero-copy transport vs CPU serialization | unique family |
| raw-12 | OpenJDK NUMA/GC memory placement after concurrent collection | unique family |

Counts: `raw_row_events=12`; `repeat_rescreen_events=2`; `unique_opportunity_families=10`; `candidate_grade_deep_reviews=3`; `grounded_briefs=0`.

## Deep reviews and decisions

### 1. UCX registration/cache and protocol selection — `DROP`

Exact final object is a UCX point-to-point transfer with its existing completion/ordering semantics. The apparent residual is registration and rkey-cache cost after zero-copy/RDMA transfer. Current upstream already exposes the relevant registration/cache/protocol mechanics: the current FAQ names `UCX_MEMTYPE_CACHE`, while current `NEWS` records indirect-memory-key cache, dma-buf registration, and protocol/rkey-selection changes. The putative action would select cache/protocol/registration paths per transfer, not create a new whole transfer construction. Its strongest same-object union therefore includes transport/protocol selection, memory registration, cache behaviour and fragment/memory-type configuration. It fails the action-divergence witness and is a controller/cache-policy collapse, not an eligible N2.

No claim is made that a different UCX algorithm cannot exist; this exact framing is dropped because the frozen atomic action is already selectable/configurable in the same object.

### 2. DPDK mbuf/descriptors and NIC queue lifecycle — `DROP`

Exact final object is a DPDK packet transmit/receive operation preserving packet bytes and delivery semantics. The transfer of cost from kernel processing to buffer/descriptors invites a recycling, ownership or timestamp scheduling proposal. DPDK's current mlx5 documentation has queue-specific memory regions/umem and internal clock/rearm objects for packet scheduling. The relevant candidate actions are allocation, recycle, queue assignment, timestamp enablement and descriptor submission. A proposal limited to choosing/reweighting these operations is a native policy/controller; a proposed global constructor was not frozen without changing packet-carrier ownership or adding an unbounded new allocator/driver contract. The family therefore has no finite same-object union-external witness.

### 3. SPDK bdev/NVMe-oF request, accel sequence, and completion — `DROP`

Exact final object is an SPDK block request, retaining bdev/NVMe completion and data-integrity semantics. SPDK's primary repository documents the cost transfer caused by user-mode polled drivers. Current releases expose an acceleration *sequence* joined to bdev I/O, metadata ownership/hide APIs, iovec-capable NVMe-oF request-copy operations, polling/interrupt options, and a `multipath_opts` policy/selector. Thus a scheduling/placement formulation is not falsely rejected merely for being called policy; it is rejected here because its enumerated atomic action is only composition/selection of already exposed submit, accel, metadata, poll and multipath actions. No distinct whole object-construction, quality guarantee, or bounded divergence witness was found. The strongest union directly absorbs this formulation.

## Other unique families: bounded screen

| Family | Boundary and post-optimization residual | Why not advanced |
|---|---|---|
| Linux DMA-BUF/IOMMU | mapping and attachment costs after cross-device sharing | `NOT_ADMITTED_UNFROZEN`: a proposed global map/lifetime construction was not frozen without changing export/import ownership semantics; no finite same-function witness. |
| LLVM OpenMP target mapping | compiler lowering transfers cost to runtime map/launch | `STRUCTURAL_DROP`: map-clause/mapper/target-data emission would be a compiler emitter/wrapper absent a new output-preserving construction. |
| GCC offload map lowering | host-device transfer bookkeeping after offload | `STRUCTURAL_DROP`: same reason; a tuning or lowering-path choice has no union-external complete action. |
| Linux blk-crypto/DMA | software crypto path shifts cost to mapping/completion | `DEEP_DIVE_REQUIRED` converted to `DROP`: the natural object couples hardware key/sector capability; an algorithmic action could not be fixed without changing device/guarantee. |
| KVM dirty logging | hardware-assisted marking shifts cost to bitmap scan/metadata | `NOT_ADMITTED_UNFROZEN`: no bounded proposal preserving migration recovery semantics was identified; a scan schedule is controller-only. |
| Arrow Flight | zero-copy changes CPU serialization/layout cost | `STRUCTURAL_DROP`: copy/elision changes the carrier/ownership boundary; no same-object construction fixed. |
| OpenJDK NUMA/GC | concurrent collection moves cost to memory locality | `STRUCTURAL_DROP`: available framing is heap-placement/policy tuning, not a new full GC algorithm under an auditable finite closure. |

## Evidence and honesty note

The three deep reviews used current official source/documentation and upstream release material. The remaining rows are deliberately only raw/bounded screens, not implementation-absence claims. No direction was dropped for missing implementation, benchmark result, artifact download, hardware access, AI readiness, or lack of a positive result. No experiment, benchmark, large download, automation, Stage 0, Stage A, or Stage B was created or run.

## Outcome

`PROPOSE_STAGE0: []`. No grounded brief is emitted. A future independent family may be revisited only with a new exact object and a source-backed, finite same-function divergence witness; this package does not reserve or revive any terminal object.
