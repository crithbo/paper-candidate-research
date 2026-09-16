# Source-bounded coefficient and semantic audit

## Primary-source facts retained

- NVIDIA's GH200 product page specifies a coherent NVLink-C2C CPU+GPU memory model and a 900 GB/s aggregate coherent interface.
- CUDA 12.4 release notes identify Linux driver `550.54.14` for CUDA 12.4 GA and state that access-counter migration on Grace Hopper is enabled by default.
- Schieffer et al.'s author preprint reports, on its GH200 setup, 3.4 TB/s HBM3 STREAM bandwidth, 486 GB/s LPDDR5X bandwidth, 375 GB/s H2D and 297 GB/s D2H Comm|Scope bandwidth against a 450 GB/s per-direction theoretical interconnect. It also identifies 64 KiB system pages, 2 MiB managed-memory GPU pages, cacheline-granular coherent remote access, and a default access-counter threshold of 256.

## What the sources do not bound

The primary sources do not provide a complete coefficient box for allocation/deallocation, PTE creation and replay, page amplification for the two frozen inputs, overlap, metadata, synchronization, planner time, or a universal conversion from access-counter threshold to four program passes. Those quantities stay `UNIDENTIFIED`; they are not set to zero and the original arbitrary grid is not interpreted as platform evidence.

## Revision-domain rule

`SOURCE_BOUNDED_DOMAIN.json` therefore retains exact source-reported transfer observations and semantic constraints but treats the full-cost model as partially identified. The substantive test is universal: for every finite nonnegative shared completion of the unknown terms, the frozen candidate and the same-information selector invoke the same cost function and the same per-region `argmin`. With equal extraction/decision charge, their full costs are identical. No choice of source-bounded coefficients can create a strictly positive candidate-only residual.

## Integrity correction

The TPP DOI is recorded here as `10.1145/3582016.3582063`; the initial Stage A matrix's `10.1145/3575693.3575755` is not propagated. The frozen initial file is not modified.

## Source links

- NVIDIA GH200: https://www.nvidia.com/en-us/data-center/grace-hopper-superchip/
- CUDA 12.4 release notes: https://docs.nvidia.com/cuda/archive/12.4.0/cuda-toolkit-release-notes/index.html
- Schieffer et al. author preprint: https://arxiv.org/html/2407.07850v1
- Correct TPP DOI: https://doi.org/10.1145/3582016.3582063

