# Same-object RQ convergence — Source48 S2

Each RQ was formed before the decisive source check. It keeps fixed logical input/output semantics and excludes a changed reader, driver protocol, or external wrapper.

## RQ48-01 — cuDNN graph plan/workspace

For one fixed cuDNN operation graph, tensor descriptors, numerical semantics and device, is there a target-specific joint engine-plan/workspace constructor outside the native graph API that improves plan-build plus workspace plus execution full cost while retaining graph acceptance?

## RQ48-02 — PyTorch CUDA-graph tree pool state

For one fixed graph-safe PyTorch callable sequence, static shapes, outputs and CUDA-graph replay semantics, is there a target-specific construction of graph-tree/pool checkpoints outside the current implementation that improves capture plus pool-residency plus replay cost?

## RQ48-03 — ROCr queue scratch state

For fixed HSA kernels, queue sequence and output semantics, is there a non-configuration joint scratch-residency/dispatch-state constructor with an explicit residency or full-cost guarantee?
