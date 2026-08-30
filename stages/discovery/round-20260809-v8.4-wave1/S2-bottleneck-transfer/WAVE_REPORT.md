# DISCOVERY-S2-20260809-V8.4-WAVE1 — zero-proposal report

## Assignment and production boundary

- Assignment: `DISCOVERY-S2-20260809-V8.4-WAVE1`
- Lane: `DISCOVERY-S2-BOTTLENECK-TRANSFER`
- Date cut-off: `2026-08-09` (Asia/Shanghai)
- Permitted method: production Discovery method `v2/v8.1`, O2 `CALIBRATED`.
- Excluded method: two-axis `v8.2r2`; registry records its TLS-credential blocker and does not authorize production use.
- Result: **zero `PROPOSE_STAGE0` briefs**. No candidate met `TIER_B_Q2_VIABLE` after same-object and current-strong-baseline checks.

The zero result is a scientific selection result, not a resource-failure conclusion. No artifact was downloaded or executed and no hardware was used.

## Search protocol

Only paper originals and official conference/project pages were retained. Each lead was searched by its bottleneck before and after the apparent optimization, ownership/placement terminology, data movement/scheduling terminology, and named system papers. A `DIRECT_FATAL` is assigned only where a current work covers the same object, primary decision structure, principal objective, and core mechanism; otherwise the lead is held as adjacent or dropped for lack of a bounded, non-wrapper residual.

### Queries executed

- `GPU data movement ownership scheduling communication bottleneck 2025 2026`
- `CXL metadata overhead memory tiering scheduling object placement 2026`
- `shared disaggregated memory ownership object store data transfer 2026`
- `MoE all-to-all GPU scheduling skew incast 2026`
- `LLM decode CPU scheduling overhead kernel synchronization schedule offloading 2026`
- `dynamic megakernel scheduling data movement ownership 2026`

## Source and collision matrix

| Lead | Observable bottleneck transfer | First-party source evidence | Candidate-shaped residual tested | Collision / decision | Why no Q2-ready proposal remains |
|---|---|---|---|---|---|
| CXL tiering: page placement → object hotness / metadata | Page-tiering leaves hotness fragmentation and remote metadata/reclamation cost. | [OBASE, OSDI 2026](https://www.usenix.org/conference/osdi26/presentation/banakar) reorganizes objects and migrates them safely under concurrency; [MAC, OSDI 2026](https://www.usenix.org/conference/osdi26/presentation/lee) accelerates CXL metadata management near memory; [NEMO, OSDI 2026](https://www.usenix.org/conference/osdi26/technical-sessions) supplies policy-specific memory telemetry. | A planner selecting object ownership/placement/metadata actions from access phases. | `DIRECT_FATAL` / `DIRECT_SUBTRACT`. OBASE is already the object-aware frontend that reorganizes and migrates objects for current page-tier backends; MAC covers the metadata-side action; NEMO covers the missing observability route. | The remainder is merely selecting or combining these mechanisms. A universal union is forbidden; a new hardware/telemetry object would not be same-object and has no independently bounded natural residual. |
| Shared disaggregated-memory shuffle: copies → coherence/ownership coordination | Eliminating per-node object copies shifts the limiting concern to shared-object ownership and weak-coherence coordination. | [Duhu, OSDI 2026](https://www.usenix.org/conference/osdi26/presentation/men) creates an SDM object store integrated with Ray, explicitly addressing weak-coherence coordination and copy avoidance on a CXL-attached pool. | A dataflow-aware ownership-transfer scheduler for DDF shuffle objects. | `DIRECT_FATAL` for the frozen object-store/coordinated ownership direction. | Turning Duhu's coordination knobs into a scheduler would be a controller/wrapper unless a new same-object invariant or objective is established. No such finite residual was found. |
| MoE all-to-all: transfer schedule → GPU/host execution scheduling | After network scheduling/rebalancing, delayed communication can create pipeline bubbles and GPU head-of-line blocking. | [FAST, NSDI 2026](https://www.usenix.org/conference/nsdi26/presentation/lei-yiran) schedules all-to-all(v) under skew, topology and incast; [Attack of the Bubbles / PIPEMORPH, NSDI 2026](https://www.usenix.org/conference/nsdi26/presentation/wu-tianyuan) adapts pipeline schedules and moves communication to CPU-side RDMA on stragglers; [Resource-aware Computation-Communication Overlap](https://arxiv.org/abs/2606.09200) controls occupancy and priority for overlap. | A unified schedule that assigns network transfer, host offload and GPU-residency resources. | `DIRECT_FATAL` for a generic optimization objective; the proposed action set is covered by the three systems. | Any narrowed version would either be a single issue (a specific overlap knob) or an unfair union across different platform/control assumptions. A credible natural trace plus fair same-stack baseline was not located. |
| LLM decode: compute/memory optimization → CPU scheduling and launch/synchronization gaps | Even with bandwidth-bound decode, CPU scheduling, synchronization, and lack of overlap can limit utilization. | [Dataflow Is All You Need, MLSys 2026](https://proceedings.mlsys.org/paper_files/paper/2026/hash/f502981cbe221d857ad409450a7917c3-Abstract-Conference.html) gives schedule offloading and streaming on SN40; [Event Tensor, MLSys 2026](https://proceedings.mlsys.org/paper_files/paper/2026/hash/53d3f45797970d323bd8a0d379c525aa-Abstract-Conference.html) compiles dynamic megakernels; [DynaFlow, MLSys 2026](https://proceedings.mlsys.org/paper_files/paper/2026/hash/bbd7d8bd780fcf7143add2317ba04638-Abstract-Conference.html) provides programmable intra-device operator scheduling. | A generic ownership-aware request/buffer schedule that removes CPU launch gaps. | `DIRECT_SUBTRACT`, not a proposal. | The plausible formulation is already a transparent scheduler/compiler abstraction. Restricting to one backend would be a rename; widening it loses same-object fairness. |

## Negative selection audit

- **No proposal quota:** 0 of maximum 2. No brief was manufactured from a limitation sentence or a component union.
- **No STOP revival:** `COH-REGION-LIFECYCLE` was not reconsidered; registry records a terminal same-information selector-absorption failure.
- **Structural potential vs. evidence readiness:** no candidate reaches a structural `TIER_B_Q2_VIABLE`; therefore current evidence readiness is not scored as a substitute. The inference is not “low readiness,” but direct mechanism absorption or no finite same-object residual.
- **Natural inputs / full cost:** the inspected systems use natural production traces, Ray shuffle, large-model training, or LLM workloads, but no new candidate had a pre-registered same-function contract, full-cost ledger, and strong fair baseline that survived collision.
- **Reproducibility:** all retained citations expose an official proceedings/project source. No claims are based on vendor blogs, secondary summaries, or unverified code execution.

## What would permit a future, new-object search

A later assignment could revisit only upon a new first-party artifact that fixes a distinct exact object and makes at least one non-absorbed decision variable observable—for example, a public trace proving an ownership decision unavailable to Duhu/OBASE, along with a same-stack baseline and full-cost contract. Such an artifact would require a new ID and fresh collision audit; it would not revive any dropped direction above.

## Lane completion

This assignment ends `COMPLETE_ZERO_PROPOSALS`. It created no Stage 0/A/B directory and requests no state transition. The lane now returns to `IDLE_REUSABLE_AWAITING_MAINLINE`.
