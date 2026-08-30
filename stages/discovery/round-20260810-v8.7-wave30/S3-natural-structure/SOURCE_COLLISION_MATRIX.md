# SOURCE / COLLISION MATRIX — WAVE30

## Exclusion and reality protocol

S2 Wave29’s twelve lines were excluded: HyCache, IRHash, ByteCheckpoint, ODRP, Juneberry, FlacIO, GogetaFS, GraCE, Syncopate, VTC, MPK, and Obscura. Active/blocked/paused/terminal objects recorded in the registry are also excluded. Audit date is `2026-08-10`.

No retained proposal depends on an absence claim, so no mutable-HEAD SHA is invented. Current official documentation, release/source loci, and configuration/action surfaces are recorded to avoid false residuals. The local Schannel `SEC_E_NO_CREDENTIALS` limitation is transport-only and provides no negative technical inference.

| Cluster | Current official fact / source checked | Current union / configuration surface | Collision verdict |
|---|---|---|---|
| Sparse format ecosystem | NVIDIA UST documentation describes compile- or runtime format inspection and choice between handwritten library and sparse code generation. | Operand format, metadata, format-polymorphic dispatch/codegen and sparse operation choice. | Any alleged action chooses format/path: `DROP__SELECTOR`. |
| Sparse kernel layout | Insum and sparse MTTKRP original papers; cuSPARSELt/CUTLASS sparse APIs. | Indirect-index lowering, sparse operand format/compression, layout/alignment and operation/algorithm choices. | Specialized layout is already the cited construction; generic extension lacks same native object: `DROP__DIRECT_SUBTRACTOR_OR_SAME_OBJECT_FAILURE`. |
| Tile/layout compiler | CUDA Tile IR `v13.2.0` official release; CUTLASS `4.5.2`; current Triton repository/backend configuration. | Tile IR verification/translation/JIT or AOT paths; CuTe layout algebra; copy/MMA/stage/schedule actions; Triton `num_warps`, `num_ctas`, `num_stages`, `maxnreg`, IR override. | Existing native action union; external global plan is wrapper/selector: `DROP__CURRENT_UNION_ABSORPTION`. |
| Hierarchical accelerator compilation | ML-Triton, MLIR-AIR and NeuronMM original papers. | Native workgroup/warp/intrinsic or spatial mapping/data-movement actions. | Objects are backend/accelerator-specific; generic residual changes target semantics or maps targets: `DROP__SAME_OBJECT_FAILURE`. |
| Sparse attention | ROCm’s current 2026 sparse-attention technical material. | Pipeline depth, matrix instruction, cache hints and separate autotuning spaces. | Ordinary tuning/controller explicitly exposed: `DROP__PROHIBITED_TUNING`. |
| Collectives/topology | NCCL current `master` source, NCCL 2.30.7 official download, 2.23/2.26/2025 tuning documentation. | Topology detection, PAT, cost model, dynamic scheduler, protocol/algorithm/chunk/CTA choices, tuner plugins; flags such as OOB network and launch-order controls. | New residual is a topology tuner/plugin/controller: `DROP__CURRENT_UNION_CONTROLLER`. |

## Candidate-grade action-gap check

| Natural object | Strongest fair baseline union | Candidate complete union-external action | Fidelity closure plan / finite natural killer | Outcome |
|---|---|---|---|---|
| UST sparse tensors | Native UST format inspection, library/codegen dispatch, format metadata | None; any action is format/path selection | Not freezeable without selector | Drop |
| Tile/CuTe/Triton kernels | Native layouts, copy/MMA, scheduling, register/stage/CTA controls and compiler legality | None; external global plan wraps/chooses native actions | Not freezeable same-object | Drop |
| AIR/Trainium spatial programs | Native spatial data-movement/scheduling and target semantics | None portable across listed backends | Would require target remapping | Drop |
| NCCL collectives | Native topology, cost/dynamic scheduler, protocol/algorithm/chunk/CTA and plugin interface | None beyond a tuner | Prohibited controller | Drop |

## Primary sources

- NVIDIA UST: https://developer.nvidia.com/blog/establishing-a-scalable-sparse-ecosystem-with-the-universal-sparse-tensor/
- Insum: https://arxiv.org/abs/2510.17505 ; sparse MTTKRP: https://arxiv.org/abs/2503.18198
- CUDA Tile IR: https://github.com/NVIDIA/cuda-tile ; CUTLASS: https://github.com/NVIDIA/cutlass
- ML-Triton: https://arxiv.org/abs/2503.14985 ; Nautilus: https://arxiv.org/abs/2604.14825 ; MLIR-AIR: https://arxiv.org/abs/2510.14871 ; NeuronMM: https://arxiv.org/abs/2510.25977
- ROCm sparse attention: https://rocm.blogs.amd.com/artificial-intelligence/rocm-vsa/README.html
- NCCL current source and releases: https://github.com/NVIDIA/nccl/blob/master/src/init.cc and https://developer.nvidia.com/nccl/nccl-download
- NCCL tuning and PAT: https://developer.nvidia.com/blog/understanding-nccl-tuning-to-accelerate-gpu-to-gpu-communication/ and https://developer.nvidia.com/blog/new-scaling-algorithm-and-initialization-with-nvidia-collective-communications-library-2-23/
