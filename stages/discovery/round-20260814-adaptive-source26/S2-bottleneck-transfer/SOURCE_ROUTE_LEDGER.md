# Source26 precommitted source routes

| locator | ANCHOR primary/fallback | CURRENT_UNION primary/fallback | CONTRARY primary/fallback | result |
|---|---|---|---|---|
| CUDA workload movement trace | NVIDIA Nsight Systems User Guide / NVTX | CUDA current documentation / MLIR NVGPU docs | current CUDA async-copy/TMA docs / recent primary work | LOCATOR_ONLY |
| NDP/PIM runtime mapping | public simulator repo / official docs | current runtime source / model docs | primary artifact/paper | LOCATOR_ONLY |
| NPU command memory | official trace/API docs / public model | current compiler/runtime source | primary artifact/paper | LOCATOR_ONLY |
| chiplet full-cost | official platform trace/benchmark / public model | current interconnect runtime | primary artifact/paper | LOCATOR_ONLY |

## Retrieved decisive public metadata

| URL | role | version/date | provenance | response bytes | SHA256 | disposition |
|---|---|---|---|---:|---|---|
| https://docs.nvidia.com/nsight-systems/UserGuide/index.html | ANCHOR capability check | current guide, crawled 2026-08 | NVIDIA official docs | UNOBSERVED_BY_RUNTIME__NOT_IMPUTED | UNOBSERVED_BY_RUNTIME__NOT_IMPUTED | shows API/workload/memory/kernel timeline observability, not a versioned natural trace |
| https://github.com/NVIDIA/NVTX | ANCHOR annotation alternative | current repository, crawled 2026-08 | NVIDIA official GitHub | UNOBSERVED_BY_RUNTIME__NOT_IMPUTED | UNOBSERVED_BY_RUNTIME__NOT_IMPUTED | annotation support only; does not close carrier |

No payload download was retained; network search responses did not expose reliable byte/hash accounting, so values are not imputed.
