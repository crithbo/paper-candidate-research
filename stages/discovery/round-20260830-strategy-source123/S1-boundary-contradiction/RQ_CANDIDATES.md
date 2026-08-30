# Source123 S1 Frozen Primary RQs

- Freeze: before first source call.
- Object/semantic contract cannot change after lookup.
- No result-aware family backfill or replacement RQ.

## RQ01 — local support versus global split cost

Can the current `ggml_backend_sched` source and official graph fixtures define a same-graph decision where locally supported node placement is dominated once scheduler-inserted splits/copies and memory are fully charged?

## RQ02 — equivalent-form backend support stability

Do precommitted semantics-equivalent ggml op/view/layout forms change `ggml_backend_supports_op` and realized backend placement enough to alter a fixed executable-placement decision under identical outputs?

## RQ03 — layer-offload accounting validity

For one frozen llama.cpp model and backend, does `--n-gpu-layers` correspond to the actual tensor/compute placement and complete VRAM/host-transfer cost strongly enough to support deployment decisions?

## RQ04 — multi-GPU tensor-split validity

Can official `--split-mode`/`--tensor-split` carriers support a nontrivial full-cost validity study of requested memory ratios versus realized tensor placement, copy boundaries and throughput under fixed model semantics?

## RQ05 — MoE expert-offload boundary cost

Can current llama.cpp MoE CPU-offload source/options define an exact public carrier where saved VRAM transfers the bottleneck to repeated expert host-device traffic, changing an admission or placement decision beyond ordinary layer offload?

## RQ06 — buffer-type placement feasibility

Can official buffer-type allocation and backend-support paths define a target-specific algorithm or formal checker that selects globally executable placements while minimizing copies, rather than relying on locally allocatable buffers?

## RQ07 — backend-op conformance mutation panel

Can `test-backend-ops` fixtures support a canonical same-output mutation panel that measures backend support/placement robustness without duplicating ordinary operator coverage or generic differential testing?

## RQ08 — llama-bench ranking explanation

Can `llama-bench` plus scheduler split/copy observability define a same-model estimator that changes backend/offload ranking relative to parameter-only or aggregate timing baselines, without reproducing the excluded ORT/ExecuTorch ranking families?

## Precommitted roles and stop conditions

| RQ | ANCHOR/CURRENT | CONTRARY | Early stop |
|---|---|---|---|
| RQ01-02 | scheduler/support APIs and tests | native scheduler heuristics and current tests | current union already optimizes/exposes the same action or only generic mutation remains |
| RQ03-04 | loader/offload CLI/source/bench | current memory-report/tensor-split semantics | ordinary accounting/configuration study only |
| RQ05 | MoE CPU-offload source/options | current hybrid/offload papers and llama.cpp implementation | feature already fully costed or no public natural model route |
| RQ06 | buffer allocation/support source | current scheduler/planner implementation | generic placement solver or changed semantics |
| RQ07 | backend-op tests | generic compiler/metamorphic testing | operator coverage only |
| RQ08 | llama-bench + scheduler observability | native benchmark/current predecessor families | five-field contained or no llama.cpp-specific decision endpoint |
