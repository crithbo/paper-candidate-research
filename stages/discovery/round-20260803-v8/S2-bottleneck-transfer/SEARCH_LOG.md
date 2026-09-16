# DISCOVERY-S2 search log

- Date: `2026-08-03` (Asia/Shanghai)
- Lens / method: `O2_BOTTLENECK_TRANSFER`, method v2
- Current production release: O2 independent review `CALIBRATED` (3/3 positive recoveries, negative `ABSTAIN`, no leakage)
- Coverage: primary-source collision and genealogy search, current through this date; not a systematic review.
- Evidence discipline: conference proceedings, official paper pages, and arXiv records support paper claims. Vendor documentation is deployment context only. No code/PDF was downloaded, no artifact executed, and no GPU/NPU experiment run.

## Search protocol

For each raw opportunity, search its anchor, predecessors, direct substitutes,
post-anchor work, counterevidence, and an artifact/natural-workload route before
forming a brief. A miss is recorded as `NOT_FOUND_WITHIN_SEARCH` or
`SEARCH_BOUNDED_OPEN`; it is never treated as proof of global novelty. The raw
scouting label `SEARCH_BOUNDED_OPEN` was not inherited as a production novelty
conclusion after calibration.

## Raw opportunity record

| ID | Query themes | Primary sources retained | Production disposition |
|---|---|---|---|
| RO-S2-01 | GH200 / Grace Hopper, first touch, page-table initialization, allocation, region lifecycle, compiler/runtime planning | Schieffer et al. (ICPP 2024); TPP (ASPLOS 2023); SuperInfer (MLSys 2026); SCILIB-Accel; CUDA Guide | One constrained, same-object residual → `PROPOSE_STAGE0` recommendation only. |
| RO-S2-02 | Blackwell SFU/shared-memory bottleneck, error-bounded lowering, warp specialization, automatic schedule | FlashAttention-4 (MLSys 2026); Nautilus (arXiv 2026); Twill (OSDI 2026) | `DROP_DIRECT_SUBTRACT`; a union would be prohibited repackaging. |
| RO-S2-03 | MoE chunked prefill, expert reload, layer/token schedule | From Tokens to Layers (MLSys 2026); Gimbal; ASAP; ZeRO-Prefill | Retain raw absorbed negative. |
| RO-S2-04 | P/D disaggregation, KV transfer, compression, remote fetch | P/D-Serve; Mooncake (FAST 2025); KVServe; SYMPHONY (NSDI 2026); Bidaw (FAST 2026); SmartGen | Retain `DIRECT_FATAL`. |
| RO-S2-05 | dequantization critical path, compiler/algebra/PE/NM conversion placement | QFactory (ATC 2025); MixPE; Multi-Scale Dequant; StreamDQ | Retain `DIRECT_FATAL`. |
| RO-S2-06 | learned cache eviction overhead, asynchronous learning, low-overhead replacement | CACHEUS (FAST 2021); GL-Cache (FAST 2023); HALP (NSDI 2023); 3L-Cache (FAST 2025); S4-FIFO and Merlin (OSDI 2026) | Retain `DIRECT_SUBTRACT`. |

## Production convergence P1 — coherent CPU–GPU region lifecycle

### Fresh query families

- `"Grace Hopper" automatic memory placement first-touch page migration compiler 2025 2026`
- `GH200 first touch initialization page table application aware placement`
- `coherent CPU GPU region lifecycle allocation initialization planner`
- `GH200 unified memory prefetch access counter migration 2026`
- `GH200 LLM KV placement C2C migration SuperInfer SuperOffload Pie`

### Checked primary sources and role

- Schieffer et al., [Harnessing Integrated CPU-GPU System Memory for HPC](https://arxiv.org/abs/2407.07850), ICPP 2024: direct GH200 anchor for system/managed/device allocation choices, first-touch CPU page-table population, and initialization sensitivity.
- Kannan et al., [TPP](https://arxiv.org/abs/2206.02878), ASPLOS 2023: strong adjacent transparent tiered-memory placement comparator.
- Wang et al., [SuperInfer](https://proceedings.mlsys.org/paper_files/paper/2026/hash/07fd64f9316f40193c6a4d87d8afa011-Abstract-Conference.html), MLSys 2026: current GH200 LLM KV-serving placement/transfer mechanism.
- [SCILIB-Accel](https://arxiv.org/abs/2501.00279): BLAS-specific device-first-use predecessor.
- [Pie](https://arxiv.org/abs/2411.09317) and [SuperOffload](https://arxiv.org/abs/2509.21271): current coherent-memory/LLM collision boundaries, not fair general-application baselines.
- NVIDIA, [CUDA C++ Programming Guide](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#heterogeneous-memory-management): deployment context for UVM access-counter migration and prefetch/advice; not academic novelty evidence.

### Result

No checked work solves the frozen exact object: a finite-horizon region-DAG
optimizer jointly choosing CUDA representation, initialization executor, and
pre-phase materialization while charging initialization, faults, migration/C2C,
and steady-state cost. This is `NOT_FOUND_WITHIN_SEARCH`, not an originality
claim. The resulting brief requires tuned UVM, advice/prefetch, explicit-copy,
and oracle baselines, and a public Rodinia/Qiskit natural-input route.

## Production convergence P2 — Blackwell lowering plus scheduling

### Fresh query families

- `Blackwell tensor core scaling SFU exponential shared memory bottleneck`
- `FlashAttention 4 software emulated exponential conditional rescaling`
- `automatic compiler expression rewrites tiling fusion schedule Blackwell 2026`
- `error bounded tensor compiler warp specialization schedule`

### Direct collision evidence and result

- [FlashAttention-4](https://proceedings.mlsys.org/paper_files/paper/2026/hash/ae8b0b5838ba510daff1198474e7b984-Abstract-Conference.html), MLSys 2026, combines Blackwell non-matmul bottleneck treatment, approximation/stability, tensor-memory use, and CTA scheduling.
- [Nautilus](https://arxiv.org/abs/2604.14825), 2026, combines automatic expression rewrites, fusion, tile/dataflow transformations, and scheduling for tiled GPU kernels.
- [Twill](https://www.usenix.org/conference/osdi26/presentation/soi), OSDI 2026, is a strong automatic software-pipelining / warp-specialization countermechanism.

The remaining proposal is only a broad union of covered lowering, numerical, and
schedule choices. It is `DROP_DIRECT_SUBTRACT`; no grounded brief is issued.

## Limits and follow-up boundary

Coverage excludes exhaustive ACM/IEEE full text, cited-by analysis, patents, and
closed-source compiler/runtime implementations. 2026 preprints are collision
warnings, not maturity evidence. The sole recommendation is for independent
Stage 0 collision/baseline review; this Discovery source has no authority to
create a stage or self-promote it.
