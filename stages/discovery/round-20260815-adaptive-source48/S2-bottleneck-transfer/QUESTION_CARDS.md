# Evidence-qualified question cards

## QC48-01 — cuDNN fixed operation graph

| Field | Frozen value |
|---|---|
| Exact identity | One finalized cuDNN graph with fixed operations, tensor descriptors, numerical output contract, device, and caller-supplied pointers. |
| Current locus | [cuDNN Graphs](https://docs.nvidia.com/deeplearning/cudnn/v1.9.0/developer/graph-api.html), current [Frontend overview](https://docs.nvidia.com/deeplearning/cudnn/v1.20.0/developer/overview.html), and the [NVIDIA frontend source](https://github.com/NVIDIA/cudnn-frontend). |
| Current union / contrary evidence | Graph build, engine/configuration choice, heuristics, filtering/autotuning, plan build and per-plan workspace query are all exposed. Caller supplies workspace for selected plan. |
| Minimum falsifier | If the purported constructor selects an engine configuration or allocates/querys the workspace already associated with that plan, it is in the union. |
| Carrier and oracle | Official cuDNN frontend samples; `validate`/support/execute plus unchanged tensor results. |
| Full-cost denominator | graph/plan build CPU-RSS, workspace bytes, temporary bytes, launch/execution latency, and output equivalence. |
| Bounded closure route | Source check complete for the decision. A future distinct proposal would need a graph-preserving action that is neither plan selection nor workspace policy. |
| Raw disposition | `STRUCTURAL_DROP__CURRENT_GRAPH_ENGINE_WORKSPACE_UNION_ABSORBS_ACTION`. |

## QC48-02 — PyTorch CUDA-graph tree

| Field | Frozen value |
|---|---|
| Exact identity | One graph-safe, static-shape PyTorch callable tree with fixed outputs, CUDA graph capture/replay semantics, and live-tensor safety. |
| Current locus | [PyTorch CUDA notes](https://docs.pytorch.org/docs/stable/notes/cuda.html), [CUDAGraph API](https://docs.pytorch.org/docs/main/generated/torch.cuda.CUDAGraph.html), and current [`cudagraph_trees.py`](https://github.com/pytorch/pytorch/blob/main/torch/_inductor/cudagraph_trees.py). |
| Current union / contrary evidence | The native implementation builds a tree of recordings, shares/checkpoints pools, tracks live storages, and emits a different recording when liveness requires it. |
| Minimum falsifier | A candidate limited to selecting a graph-private pool, checkpointing it, or changing replay/record order reproduces the existing tree action. |
| Carrier and oracle | Versioned PyTorch CUDA-graph tests/documented graph-safe callables; replay output and address-safety/native errors. |
| Full-cost denominator | warm-up/capture CPU, graph-private pool/reserved bytes, live-output retention, replay latency, and output equivalence. |
| Bounded closure route | Complete. A future action must preserve tree/replay semantics while naming a new non-pool construction and target-specific guarantee. |
| Raw disposition | `STRUCTURAL_DROP__CURRENT_CUDAGRAPH_TREE_POOL_LIVENESS_UNION_ABSORBS_ACTION`. |

## QC48-03 — ROCr queue scratch residency

| Field | Frozen value |
|---|---|
| Exact identity | One fixed HSA kernel/queue sequence, output semantics, queue topology and runtime contract. |
| Current locus | Current [ROCR environment-variable reference](https://rocm.docs.amd.com/en/develop/reference/env-variables.html) and official [ROCm source organization](https://github.com/ROCm/ROCm). |
| Current union / contrary evidence | `HSA_NO_SCRATCH_RECLAIM` controls the documented permanent-versus-reclaimable scratch behavior; allocation failure invokes reclamation/retry under the documented behavior. Default is explicitly documented. |
| Minimum falsifier | If the claim switches scratch retention/reclamation or threshold behavior, it is a native configuration decision, not a union-external constructor. |
| Carrier and oracle | ROCr public queue/kernel tests and runtime status/output behavior. |
| Full-cost denominator | dispatch CPU, scratch/resident bytes, allocation/reclamation bytes, queue wait, and kernel output. |
| Bounded closure route | Complete for this configuration-shaped action. An admissible successor needs a fixed non-flag joint state transition with an independently stated guarantee. |
| Raw disposition | `STRUCTURAL_DROP__CURRENT_SCRATCH_RECLAIM_CONFIGURATION_OR_RUNTIME_CONTROLLER`. |
