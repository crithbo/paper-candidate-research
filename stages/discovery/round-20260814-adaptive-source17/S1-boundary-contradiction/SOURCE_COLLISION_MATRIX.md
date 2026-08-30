# Source / subtractor matrix

| Anchor | Primary evidence | Mature-tool subtractor role | Decision |
|---|---|---|---|
| StableHLO/VHLO | [compatibility guarantee](https://openxla.org/stablehlo/compatibility), [VHLO](https://openxla.org/stablehlo/vhlo), [spec](https://openxla.org/stablehlo/spec) | current conversion + compatibility tests | direct absorption. |
| CUDA grid constant | [CUDA language extensions](https://docs.nvidia.com/cuda/cuda-programming-guide/05-appendices/cpp-language-extensions.html) | compiler ABI/materialization implementation | raw only; contract changes under apparent plan switch. |
| ROCR AQL queue | [ROCR current API](https://rocm.docs.amd.com/projects/ROCR-Runtime/en/develop/api-reference/api.html) | native queue/signal implementation | raw only; complete current union not closed. |
| CUDA Tile constant | [CUDA Tile constants](https://docs.nvidia.com/cuda/cuda-programming-guide/02-basics/writing-tile-kernels.html) | tile compiler specialization | raw only; changed specialization boundary likely. |

Search bounded as of 2026-08-14; no issue, future-work or prohibited security material supports any absence claim.
