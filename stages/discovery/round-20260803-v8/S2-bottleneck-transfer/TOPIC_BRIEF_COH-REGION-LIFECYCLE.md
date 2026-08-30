# TOPIC_BRIEF — COH-REGION-LIFECYCLE

## 0. Status and scope

- **Status:** `PROPOSE_STAGE0` (recommendation only; this file neither creates nor authorizes Stage 0).
- **Origin / lens:** `O2_BOTTLENECK_TRANSFER`; RO-S2-01 after the v2 method backtest became `CALIBRATED`.
- **Domain:** coherent CPU–GPU memory / runtime and compiler-assisted memory planning.
- **Contribution route:** `N2` — a constrained offline optimization algorithm over region lifecycles; the accompanying lifecycle contract is only the representation needed to expose its inputs, not a wrapper/controller.
- **Frozen exact object:** a CUDA C++ program on a cache-coherent CPU–GPU node whose large regions are initialized once (or by a bounded initialization phase), then consumed by known CPU/GPU phases. The planner chooses, per region, (i) memory representation (`system-allocated`, CUDA managed, or explicit device allocation), (ii) initialization executor/location, and (iii) a finite pre-phase residency/materialization action. It does **not** invent a generic online migration policy, change the algorithm, change numerical precision, or tune physical page size.

## 1. Research question and decision structure

**RQ.** Given a region–phase DAG and a fixed coherence/synchronization semantics, can a static lifecycle plan avoid the post-optimization bottleneck in which first GPU use of system memory makes CPU-side page-table population, fault replay, and later C2C access/migration dominate, while preserving the program's exact observable result?

The new decision structure is a finite-horizon, region-level plan:

`x[r, phase] = {representation, initializer, materialize-before-phase action}`

subject to valid region lifetimes; write/synchronization/alias semantics; producer-before-materialize order; HBM and transfer-engine capacity; and fully charged initialization work. Outputs, precision, and function remain unchanged. The objective charges allocation/deallocation, CPU/GPU initialization, page-table population/fault replay, migration or explicit copies, C2C traffic, synchronization, and steady-state compute. This is not “put hot pages on GPU”: representation and initializer decisions can eliminate a migration, while system allocation remains a valid choice.

## 2. Paper genealogy and seed distance

| Role | Primary source and what it establishes | Distance to this proposal |
|---|---|---|
| Anchor | Schieffer et al., [*Harnessing Integrated CPU-GPU System Memory for HPC*](https://arxiv.org/abs/2407.07850), ICPP 2024, characterizes GH200 system/managed/device allocation choices; reports GPU-first-touch CPU page-table initialization and page-size/initialization sensitivity. | Measurement and manual comparison, not a general region-lifecycle solver with a full transition cost. |
| Predecessor / deployment baseline | NVIDIA, [CUDA C++ Programming Guide: Heterogeneous Memory Management](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#heterogeneous-memory-management), current documentation. | Driver-managed access-counter migration is a required deployment baseline, not a substitute for a program-visible allocation/initialization plan. |
| Adjacent mechanism | Kannan et al., [*TPP: Transparent Page Placement for CXL-Enabled Tiered-Memory*](https://arxiv.org/abs/2206.02878), ASPLOS 2023. | OS-level hot/cold placement in CXL tiered memory; it does not choose CUDA allocation representation or initialization executor. |
| Same-platform, narrower object | Wang et al., [*SuperInfer*](https://proceedings.mlsys.org/paper_files/paper/2026/hash/07fd64f9316f40193c6a4d87d8afa011-Abstract-Conference.html), MLSys 2026. | GH200 LLM KV serving, SLO-aware rotation and transfer overlap; not arbitrary immutable-after-init application regions or PTE-initialization-aware representation choice. |
| Specialized predecessor | [*SCILIB-Accel*](https://arxiv.org/abs/2501.00279), 2025. | BLAS-specific Device First-Use; cannot establish a general multi-region, multi-phase plan. |

**Seed-distance test.** Delete the proposed solver and retain only “use managed memory / prefetch / initialize on the device”: the distinctive claim disappears. Delete the lifecycle graph but retain a solver: it reduces to an ungrounded placement heuristic. The irreducible object is the constrained selection of representation, initializer, and phase materialization across a region DAG with all transition costs.

## 3. Competing mechanisms and collisions

| Category | Result of refreshed search (through 2026-08-03) | Consequence |
|---|---|---|
| `DIRECT_FATAL` | `NOT_FOUND_WITHIN_SEARCH` for the frozen object: a same-object solver jointly selecting CUDA representation, initialization executor, and finite lifecycle actions for coherent CPU–GPU application regions. This is not a global novelty conclusion. | Stage 0 must independently repeat the exact-object search. |
| `DIRECT_SUBTRACT` | Generic online page migration, generic placement, LLM KV offload/rotation, and BLAS-only device-first-use have direct established alternatives. | Excluded from the claim and from the action space unless used as fair baselines. |
| Methodological adjacency | TPP, SuperInfer, [Pie](https://arxiv.org/abs/2411.09317), and [SuperOffload](https://arxiv.org/abs/2509.21271) show that coherent-memory placement/offload needs strong deployment comparison. | Cite as boundaries; do not claim first coherent-memory placement system. |
| Deployment baseline | CUDA Unified Memory access-counter migration and `cudaMemPrefetchAsync`/advice APIs. | Measure under current driver/toolkit; no comparison only to an untuned first-touch program. |
| Bounded-open residue | Search used GH200/GH/Grace-Hopper plus allocation, first-touch, initializer, phase-graph, lifecycle, compiler, and runtime synonyms. Coverage excludes closed-source compiler/runtime implementations and is not systematic-review coverage. | `SEARCH_BOUNDED_OPEN` is evidence scope only, never a novelty result. |

**Counterevidence that collapses the idea.** If current managed-memory plus a disclosed prefetch/advice policy matches the lifecycle-plan oracle within 5% on both a Rodinia and a Qiskit natural workload after cold-start costs are included, the proposed decision structure has no demonstrated headroom and should be `STOP`, not renamed.

## 4. Same function/quality and fair baselines

Inputs, output bytes, precision, synchronization points, and kernel algorithm are held fixed. A plan may only relocate allocation and initialization work permitted by the declared region contract. Bitwise equality is required where the unplanned program is deterministic; otherwise its documented tolerance is frozen before measurement.

| Baseline | Fairness condition |
|---|---|
| B0: current default system allocation with GPU first use | Establishes bottleneck; never the only baseline. |
| B1: `cudaMallocManaged` plus current driver access-counter migration | Identical data, kernel, cold/warm protocol. |
| B2: managed memory with legal advice/prefetch | Tests whether static hints remove gain; equal-budget tuning only. |
| B3: explicit `cudaMalloc` plus copies | Strong same-function reference; all copy/initialization cost charged. |
| B4: oracle with complete recorded region–phase trace | Ceiling only; proposal must be compared to it. |
| B5: SCILIB-Accel Device First-Use where API applies | Specialized adjacent result; separately reported. |

## 5. Evidence, natural inputs, and artifact path

- **Natural workloads/traces:** public Rodinia workloads and Qiskit Quantum Volume from the anchor are initial inputs. Stage 0 must freeze revisions, command lines, region annotations, sizes, and cold/warm protocol before tuning. Synthetic phase graphs are diagnostic only.
- **Artifact status:** `NOT_DOWNLOADED_NOT_EXECUTED`; public availability/compatibility is not verified here.
- **Hardware ceiling:** primary PTE/fault/C2C causal evidence requires an authorized GH200-class coherent CPU–GPU node with pinned CUDA/toolkit/driver. This branch requested and used none.
- **Full-cost ledger:** allocation, initialization, first GPU phase, later phases, transfer/migration, synchronization, teardown, plus user-visible setup; report cold and amortized multi-iteration separately.

## 6. Fastest killer and executable path

**72-hour killer (only after Stage 0 acceptance and hardware authorization).** Instrument one CPU-initialized region and one GPU-first-used region in one Rodinia workload plus one Qiskit workload. Compare B0–B4 under a published trace protocol. Kill if (a) B1/B2 eliminates oracle gap as specified, (b) region contracts do not predict better representation/initializer choice across both workloads, or (c) semantics require rewriting beyond the frozen contract.

**AI execution category:** `AI_CORE_CONDITIONAL`. AI can implement graph extraction, constrained solver, trace parser, and harness; central causal evidence remains GH200-conditional. This is an execution score, not a research stop.

## 7. Claim shape, Q1 calibration, and score

**Permissible claim if validated.** For immutable-after-initialization regions on a specified coherent CPU–GPU platform, a lifecycle plan can select allocation/initialization/materialization actions that reduce end-to-end cold-path cost versus tuned UVM and explicit-copy baselines, while holding semantics and full cost fixed. It may not claim universal transparent memory management or driver replacement.

**Calibration references (not a venue guarantee).** TPP (ASPLOS 2023) is the bar for principled placement and deployment cost; SuperInfer (MLSys 2026) is current GH200 system comparison; Schieffer et al. (ICPP 2024) is direct bottleneck/workload evidence. A Q1/near-Q1 route is plausible only if tuned same-object baselines are cleared on multiple natural workloads and failures are explained.

| Dimension | Score / rationale |
|---|---|
| Academic potential | 52 / 70 — concrete transferred bottleneck and finite-horizon optimizer, but vulnerable to tuned UVM/prefetch subtraction. |
| AI execution | 14 / 30 — software core is AI-executable; validation is hardware-conditional. |
| Total | 66 / 100 — proposal-level only, not Stage 0 evidence. |

## 8. Stage 0 handoff boundary

Recommended mainline action: accept or reject the **recommendation** `PROPOSE_STAGE0` for `COH-REGION-LIFECYCLE`; if accepted, assign an independent Stage 0 novelty/baseline review. This branch created no Stage 0/A/B directory, performed no experiment, and made no self-upgrade decision.
