# CASE-B — executor result

Assignment: `BACKTEST-EXECUTOR-L1-20260814-DIVERGENCE-SEED-FRONTEND-V1-R1`  
Cutoff: `2022-01-13`  
Disposition: **PROPOSE_STAGE0**

## Divergence seed pool (non-evidentiary)

| ID | Engine / rotated perspective | Cautious conclusion if true |
|---|---|---|
| S1 | Combination / systems | Pipeline cuts, intra-layer shards, and optimizer-state placement may be co-dependent rather than separable choices. |
| S2 | Constraint manipulation / cost | A feasible plan may change when bubble time, activation recomputation, communication, and optimizer-state traffic are jointly charged. |
| S3 | Problem reframing / solver | The action could be a dependency-graph partition-and-placement solver, not a new model or a data-parallel wrapper. |
| S4 | Inversion / robustness | A configuration that maximizes raw throughput may be infeasible once the per-device peak-memory trace is included. |
| S5 | Adjacent possible / representation | Layer sequence and tensor-shape information may permit a finite plan certificate for a fixed workload and device count. |
| S6 | Reversal / falsification | If the joint optimum decomposes into supplied pipeline, tensor-parallel, and state-sharding actions, no residual remains. |

## Evidence-gated coverage locators

| Locator | Supplied evidence | What it establishes | Seed disposition |
|---|---|---|---|
| L1 | `sources/E01.pdf`, abstract and §1 | A layer-sequence pipeline action partitions a model across accelerators and uses micro-batches; memory and communication are limiting constraints. | Grounds pipeline/bubble terms, but prevents relabeling basic pipeline parallelism as new. |
| L2 | `sources/E02.pdf`, abstract and §1 | Intra-layer partitioning is a concrete communication-insertion action and is presented as complementary to pipeline parallelism. | Grounds S1’s interaction question and fixes a strong tensor-parallel comparator. |
| L3 | `sources/E03.pdf`, abstract and §1 | Optimizer-state redundancy can be removed while retaining low communication volume; memory, communication, and compute efficiency are jointly relevant. | Fixes state sharding as a direct comparator and excludes a simple state-only proposal. |

## Question Card

| Field | Frozen executor formulation |
|---|---|
| Exact object / natural scenario | Training one fixed large layered learning workload whose quality objective, update rule, global batch, and device count are held constant. |
| Opportunity | The supplied coverage gives separate pipeline, intra-layer, and optimizer-state actions. It does not itself establish a direct, full-cost joint decision action for their coupled choices on one dependency graph. |
| Atomic action and mechanism | Solve for pipeline cuts, micro-batch count, tensor-shard placements, activation-recompute choices, and optimizer-state placements together, using a dependency/peak-memory model and emitting one executable plan certificate. |
| Information condition / comparator | Input is the frozen layer graph, tensor/activation/state sizes, link topology, device memory, and workload batch. Compare against each supplied action and their stated feasible compositions, preserving model, optimizer, update semantics, and quality target. |
| Endpoint and full cost | Feasibility plus predicted/observed step cost, with compute, communication, pipeline bubbles, activation recomputation, optimizer-state traffic, peak memory, and any conversion/collective cost charged. |
| Boundary / contrary evidence | No new model, reduced quality, changed optimizer, or hidden offload is permitted. The residual vanishes if a supplied composition already makes the same joint decisions under the same full-cost model. |
| Minimal falsifier | A small 4-layer, 2-device graph where exhaustive legal plans show either no feasible non-dominated joint plan or equivalence to a direct supplied composition after all costs are charged. |
| Finite closure path | `FINITE`: enumerate legal placements/cuts for the witness; validate memory and dependency legality; calculate a complete step-cost ledger; compare with same-workload direct actions. No experiments or candidate execution were run. |
| Contribution type / dependencies | `N2`; later Stage 0 must independently check current union coverage and freeze the solver/cost-model contract. |

## Decision and accounting

This keeps the workload, model-quality target, and optimizer semantics fixed. The proposed joint solver is an action that constructs placements and schedules, rather than a wrapper over supplied systems. L1–L3 are adverse coverage and rule out pipeline-only, tensor-only, and state-only relabeling. The remaining coupled planning action has a finite, auditable witness route; S1–S6 are accounted for by L1–L3 and the Question Card. This supports a conditional Stage 0 proposal only.
