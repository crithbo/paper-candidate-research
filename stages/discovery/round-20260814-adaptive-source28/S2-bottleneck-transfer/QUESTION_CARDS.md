# Source28 S2 question cards

## QC-01 — ROCm DME/LDS joint constructor

- Exact identity: HIP 7.15 current hardware model, fixed CDNA/RDNA GPU generation, a fixed HIP kernel's global input/output values and workgroup semantics; carrier `IMPLEMENTATION_CARRIER_ONLY` pending a versioned public kernel suite.
- Problem and endpoint: DME can overlap copies with arithmetic while LDS bank conflicts serialize accesses. The hypothesized N2 endpoint is a compiler constructor for legal DME segment descriptors plus an LDS permutation, not a runtime selector.
- Current locus: [HIP hardware implementation](https://rocm.docs.amd.com/projects/HIP/en/develop/understand/hardware_implementation.html), section “DME” and “LDS”; it documents `__builtin_amdgcn_async_work_group_copy`, synchronization/cache-placement control, and LDS banking.
- Same-object/falsifier/full cost: preserve HIP results and workgroup synchronization; a smallest witness is one tiled producer/consumer kernel checked against the ordinary HIP output. Count compilation, descriptor/setup, copy wait, LDS conflict stalls, runtime, code size, device memory and occupancy. Falsify if current ROCm/LLVM already exposes the same complete compiler constructor, or if legal DME segmentation cannot be varied without changing the kernel contract.
- Closure debt: complete default/non-default compiler union and natural corpus are `OPEN_BOUNDED` (three questions: exact AMDGPU lowering locus; whether a layout pass composes DME segmentation; versioned public kernel carrier). Owner `DISCOVERY_C0_DEEP`; finite route is current docs+source and ROCm examples. Claim ceiling: no absence claim and no brief while open.
- Disposition: `EVIDENCE_QUALIFIED_RAW`; no known direct fatal within the bounded official doc locus.

## QC-02 — SYCL image split/runtime metadata plan

- Exact identity: fixed SYCL source/module set, target triple set, executable semantics and runtime kernel availability; carrier `IMPLEMENTATION_CARRIER_ONLY` with LLVM/SYCL test-suite route.
- Problem and endpoint: linked device code is processed by `sycl-post-link`, which can split per source/per kernel/off and produces symbol metadata consumed by the runtime. N2 hypothesis: a target-specific partition-and-metadata algorithm with a compile/link/load Pareto guarantee.
- Current locus: [DPC++ compiler/runtime design](https://intel.github.io/llvm/design/CompilerAndRuntimeDesign.html) and [dynamic linking design](https://intel.github.io/llvm/design/SharedLibraries.html).
- Falsifier/full cost: a two-kernel program with stock runtime load/dispatch is the oracle; count thin link/post-link/AOT/JIT/load bytes, peak RSS, compile CPU and cold-start latency. Falsify if the entire proposed action reduces to the documented split-mode choice or generic graph partitioning.
- Closure debt: current source implementation and direct-paper collision are bounded; owner `DISCOVERY_C0_DEEP`; three questions concern available split actions, runtime metadata semantics, and a target-specific guarantee. 
- Disposition: `EVIDENCE_QUALIFIED_RAW`.

## QC-03 — UPMEM transfer/tasklet constructor

- Exact identity: fixed UPMEM DPU program, host input bytes, DPU-visible output and tasklet synchronization semantics. Current official material confirms SDK/examples but the selected bounded route did not freeze a versioned SDK source/action union.
- Required locator fields are otherwise drafted (native DPU output oracle, transfer/compute/memory full-cost, and a finite public example route), but the current-source locus is not closed.
- Disposition: `LOCATOR_ONLY`; queued for the unique missing item only. This is not a scientific DROP.
