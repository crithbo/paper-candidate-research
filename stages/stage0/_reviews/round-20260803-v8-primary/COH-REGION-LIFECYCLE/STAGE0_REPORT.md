# Stage 0 PRIMARY report — COH-REGION-LIFECYCLE

**Decision:** `REVISE_ONCE` — **AWAITING_CONFIRMATION**  
**Confidence:** 0.78 | **Route:** N2 | **Score:** academic 52/70 + AI 15/30 = **67/100**

## Frozen object, objective, and cost

For a CUDA C++ program on a fixed coherent CPU–GPU platform and driver mode, select per immutable-after-initialization region: allocation representation, initialization executor/location, and finite pre-phase materialization. The function, synchronization/alias semantics, precision, region DAG, HBM capacity, and transition costs (allocate/init/PTE/fault/migrate/copy/C2C/sync/steady compute) are all charged. This is neither a generic online migration policy nor page-size tuning.

## Evidence and current collision

Schieffer et al. (ICPP 2024) verifies an integrated system page table, coherent C2C, and sensitivity to first touch/PTE initialization/page migration on GH200. NVIDIA's current documentation confirms that managed/system/explicit modes have materially different semantics. TPP, SuperInfer, and SCILIB-Accel are finite subtractors, not a universal union. No reviewed source solves the same finite region-DAG joint representation–initializer–materialization problem; therefore no direct fatal collision is established.

## Facets, headroom, and baselines

| Facet | Candidate | Existing work | PRIMARY status |
|---|---|---|---|
| decision | representation + initializer + phase action | placement/migration or app-specific advice | N2 residual plausible |
| information | fixed region/phase lifecycle | dynamic access/online signals | must freeze mode/contract |
| natural object | GH200 immutable regions | six-app GH200 study | inputs not yet bound |
| result | total lifecycle cost | manual policy comparisons | unmeasured |

Fair baselines: B0 system GPU-first use; B1 current UVM; B2 UVM advice/prefetch; B3 explicit allocation/copies. A recorded-trace optimum is a ceiling only. Schieffer establishes a natural sensitivity but not the candidate's B1/B2-to-oracle gap. Lack of local GH200 lowers performance evidence ceiling only.

## Competing mechanisms, killer, and Q1 shape

Mechanism A is a finite dynamic-program/cost-flow lifecycle optimizer; mechanism B is a bounded local region-state search with explicit representation transition constraints. They must be separately compared to fixed UVM advice and explicit-copy policies. The 72-hour killer is a static provenance/baseline binding: fix GH200/driver memory mode, a public program commit, region contract, and B0–B3 configurations; then compute the fully charged lifecycle ledger on two natural inputs and show B1/B2 leave a nonzero gap to a finite trace ceiling. If modes cause object drift or no gap remains, stop.

| Calibrator | Shape | Finding |
|---|---|---|
| [Schieffer et al., ICPP 2024](https://arxiv.org/abs/2407.07850) | empirical coherent-memory study | grounds the bottleneck, not the solver |
| [TPP, ASPLOS 2023](https://arxiv.org/abs/2206.02878) | system placement policy | adjacent memory-tier mechanism |
| [SuperInfer, MLSys 2026](https://proceedings.mlsys.org/paper_files/paper/2026/hash/07fd64f9316f40193c6a4d87d8afa011-Abstract-Conference.html) | same-platform serving system | narrower workload/deployment subtractor |

Q1 shape is conditionally adequate: it needs a reproducible mode-specific corpus and a nontrivial solver result, not merely a lifecycle annotation. AI core fraction is **0.55** (model/extractor/solver); platform semantics and claim calibration remain human-owned.

## Atomic revision gate

`SAME_GH200_MODE_REGION_CONTRACT_AND_NATURAL_GAP`: bind platform/driver/memory-management mode, two public input commits, region–phase contract and B0–B3 ledger, then demonstrate an unclosed B1/B2 lifecycle gap. No Stage A/B authorization follows from this report.
