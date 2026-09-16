# Evidence-qualified question cards

## QC51-01 — TensorRT streaming engine

Exact object: a fixed strongly typed, weight-streamable engine, weights, tensor outputs and GPU. Official [Weight Streaming](https://docs.nvidia.com/deeplearning/tensorrt/latest/inference-library/weight-streaming.html) exposes build flag `kWEIGHT_STREAMING`, `setWeightStreamingBudgetV2`, automatic budget, streamable-weight/scratch-size queries, and automatic retained-weight selection for compute/fetch overlap. Carrier: official TensorRT engine/examples; oracle: engine output/serialization acceptance. Full cost: build, deserialization host buffer, device/scratch memory, transfer and execution latency. Minimum falsifier: if the proposed action only chooses retained weights/budget under this API, current union absorbs it.

## QC51-02 — NCCL collective tuner

Exact object: a fixed NCCL communicator, ranks/topology and collective output. Current [NCCL environment documentation](https://docs.nvidia.com/deeplearning/nccl/archives/nccl_2303/user-guide/docs/env.html) exposes `NCCL_TUNER_PLUGIN`, external plugin loading paths and internal-tuner fallback. Carrier: official NCCL tests/docs; oracle: collective output and communicator contract. Full cost: plugin/load/tuning overhead, communication bytes, latency and resource use. Minimum falsifier: an external tuner selects path/protocol rather than supplying a same-object whole constructor.
