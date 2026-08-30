# Source log — GPU-MXSCALEFLOW

| Source | Type | What it supports | Collision reading |
|---|---|---|---|
| https://github.com/NVIDIA/cutlass | official source | public CUTLASS layouts, epilogues, block-scaled format support | strongest deployment baseline |
| https://github.com/NVIDIA/cutlass/blob/main/CHANGELOG.md | official release notes | block-scaled input/output, generated scale factors, EFC remaps, reference/profiler support | subtracts single-kernel/epilogue claims |
| https://github.com/NVIDIA/cutlass/tree/main/examples/79_blackwell_geforce_gemm | official example directory | NVFP4 input/output and generated-scale examples | executable input source |
| https://rocm.blogs.amd.com/software-tools-optimization/kimi-k25-mxfp4-atom/README.html | vendor implementation note | block scale is an explicit compute/data contract | cross-vendor contextual evidence only |

Search-bounded on 2026-08-02. Stage 0 must audit TensorRT, Triton, and low-precision graph compilers before retaining the residual.
