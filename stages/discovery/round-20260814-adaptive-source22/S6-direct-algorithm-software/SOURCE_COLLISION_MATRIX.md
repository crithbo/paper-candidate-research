# Collision and source-union matrix

| Family | Current union source | Action surviving the V6 trace | Direct subtraction | Result |
|---|---|---|---|---|
| Ginkgo block-Jacobi | [current parameter source](https://ginkgo-project.github.io/ginkgo-generated-documentation/doc/master/structgko_1_1batch_1_1preconditioner_1_1Jacobi_1_1parameters__type.html) | Legal bounded contiguous block partitions | General partition/preconditioner methods; no target-specific residual | Generic structural drop |
| LLVM MBP | [current source](https://www.llvm.org/docs/doxygen/MachineBlockPlacement_8cpp_source.html) | Legal CFG-preserving probability-informed block orders | [Codestitcher](https://arxiv.org/abs/1810.00905); [ExtTSP paper](https://arxiv.org/abs/1809.04676) | Direct same-object collision |
| MIOpen Find | [official docs](https://rocm.docs.amd.com/projects/MIOpen/en/latest/) | Not traced | Existing-point solution selection | Excluded |
| OpenVINO NPU compiler | [official NPU docs](https://docs.openvino.ai/2026/openvino-workflow/running-inference/inference-devices-and-modes/npu-device.html) | Not traced | Config/driver compatibility union | Excluded |

Search is bounded; no absence or priority claim is made.
