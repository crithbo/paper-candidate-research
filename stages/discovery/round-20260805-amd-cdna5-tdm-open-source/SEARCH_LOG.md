# Search Log

**Executed:** 2026-08-05 (Asia/Shanghai). **Boundary:** first-party technical sources only; no secondary blogs or unverified reports were used as evidence. Search is bounded, not a claim of global literature completeness.

| Query / route | Sources inspected | Result and role |
|---|---|---|
| AMD CDNA5 architecture, white paper, ISA | [AMD CDNA architecture](https://www.amd.com/en/technologies/cdna.html) | Confirms CDNA5, MI455X, TDM, L2 multicast, split-named barriers, WGP clustering. The page links a CDNA5 white paper and ISA, but the rendered source did not expose a stable direct PDF URL; no uninspected PDF page claim is made. |
| Official object mapping for `gfx1250` | [LLVM AMDGPU Usage](https://llvm.org/docs/AMDGPUUsage.html); [AMD RDNA4 ISA doc 70651](https://docs.amd.com/v/u/en-US/rdna4-instruction-set-architecture) | `gfx1250` is listed as `amdgpu12.50` under GFX12/RDNA4. No identity link to CDNA5 found. |
| AMD DMA / tensor / async synchronization | [LLVM AMDGPU Usage](https://llvm.org/docs/AMDGPUUsage.html); [Clang AMDGPU builtins](https://clang.llvm.org/docs/AMDGPUBuiltinReference.html); [MLIR AMDGPU dialect](https://mlir.llvm.org/docs/Dialects/AMDGPU/) | Confirms DMA and tensor intrinsics, async global↔LDS semantics, descriptor chunks, tensor completion, and async barrier behaviour. |
| Triton official release and source history | [Triton releases](https://github.com/triton-lang/triton/releases); [#8586](https://github.com/triton-lang/triton/pull/8586); [#8947](https://github.com/triton-lang/triton/pull/8947); [#9342](https://github.com/triton-lang/triton/pull/9342) | Direct collision artifacts: AMD warp-pipeline, `gfx1250` warp specialization, and multi-CTA multicast GEMM are already public upstream. Release notes also enumerate TDM, WMMA, async copy/wait, cluster/multicast related work. |
| NVIDIA terminology control | [CUDA async copies](https://docs.nvidia.com/cuda/archive/13.1.0/cuda-programming-guide/04-special-topics/async-copies.html); [Hopper tuning guide](https://docs.nvidia.com/cuda/archive/12.3.0/hopper-tuning-guide/index.html) | Establishes that TMA is NVIDIA’s Hopper+ mechanism with tensor-map-specific rules; prevents AMD term substitution. |

## Collision-search outcome

- **Direct source-code collision:** confirmed for the naive “joint TDM + WMMA scheduling/warp specialization,” `gfx1250` multi-CTA/multicast GEMM, and warp-pipeline implementation directions.
- **Search-bounded open only:** a new, formally specified cross-backend *semantic model* could be a distinct future question, but no exact object, natural workload corpus, or evidence path sufficient for a Q2 proposal is present here.
- **Not found within permitted search:** a first-party source establishing `gfx1250 = CDNA5`; public, same-object CDNA5 hardware access/reproducible benchmark contract; an evidenced real TDM fault. These absences are recorded as bounded-search results, never as proof of nonexistence.

