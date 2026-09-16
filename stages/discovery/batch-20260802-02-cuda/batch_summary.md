# Discovery batch 20260802-02-cuda

- Scope: CUDA/GPU compiler, runtime, memory, and communication.
- Briefs: 5 non-synonymous objects; `PROPOSE_STAGE0`: 4; `DROP`: 1.
- Evidence ceiling: documentation, papers, source code, CPU/static models only. No GPU experiment, performance number, or formal-stage action was performed.

| ID | Decision | Exact object | Primary Stage 0 gate |
|---|---|---|---|
| GPU-L2LEASE | PROPOSE_STAGE0 | Concurrent graph-node persisting-L2 leases | Does an accessible prior system already jointly allocate windows/hit-ratios/expiry, and do public graph traces exhibit conflict-sensitive reuse? |
| GPU-NCCLGROUPCUT | PROPOSE_STAGE0 | Partitioning eligible NCCL aggregation groups | Can a validator preserve communicator order and can a cut beat grouped/ungrouped/greedy baselines after overhead? |
| GPU-MXSCALEFLOW | PROPOSE_STAGE0 | Cross-operator block-scale payload/metadata flow | Does the planner give bit-exact Pareto improvements beyond ordinary fusion, and is it already implemented equivalently? |
| GPU-CONDGRAPH | PROPOSE_STAGE0 | Conditional CUDA-Graph body/lifetime specialization | Is there a nontrivial safe subset not already covered by GraCE or other compiler work? |
| GPU-GRAPHCAPTURE | DROP | Generic CUDA-Graph coverage maximization | GraCE is `DIRECT_FATAL`. |

Scores rank the retained set: GPU-MXSCALEFLOW 81, GPU-NCCLGROUPCUT 80, GPU-L2LEASE 79, GPU-CONDGRAPH 73. They do not change formal status. GPU-CONDGRAPH is explicitly collision-sensitive and should receive a focused Stage 0 subtraction before implementation.

All retained objects exclude `CGPU-RPIV`, `CGPU-DECSLICE`, and `GPU-TMAPHASE`; none recreates automatic warp specialization or the historical stopped kernels. The current workspace lacks a full public group-paper inventory, so ownership beyond the registry boundary remains for mainline/researcher confirmation.
