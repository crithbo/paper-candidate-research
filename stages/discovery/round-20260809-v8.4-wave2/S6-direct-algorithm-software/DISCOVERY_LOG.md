# S6 Discovery log — V8.4 Wave 2

- Assignment: `DISCOVERY-S6-20260809-V8.4-WAVE2`
- Lane: `S6-direct-algorithm-software`
- Search completed: 2026-08-09 (Asia/Shanghai)
- Method admitted for this run: production Discovery `v2/v8.1` only.  The O7 v2 backtest is `CALIBRATED` (3/3 positive recovery and abstention on its negative control).  `two-axis v8.2r2` was not used: its TLS-blocked backtest is not production-admissible.
- Result: **zero Stage-0 proposals**.  This is a collision/insufficient-residual outcome, not a claim that the searched spaces are exhausted.

## Scope and admissibility screen

The search was restricted to compiler, runtime, validation, and data-movement objects with an inspectable project artifact and an already-public natural corpus.  The source boundary was peer-reviewed/preprint paper originals plus upstream project or vendor documentation.  No benchmark was executed and no performance/correctness claim is made.

Natural carriers confirmed before screening were LLVM's upstream regression tests plus whole-program `llvm-test-suite`; MLIR's upstream tests; MLIR-AIE's public examples/tests; IREE's public test and benchmark-suites tree; and Meta's upstream TritonBench.  A repository test is a reproducible carrier, not by itself evidence of a publishable residual.

## Search families and decisions

| Family | Queries / primary sources checked | Same-object conclusion | Decision |
|---|---|---|---|
| MLIR transformation verification | `MLIR compiler verification translation validation 2025 2026`; Tucker et al. 2026; Yin et al. 2025; PLDI 2025 verification-dialect paper/artifact; MLIR test tree | The new 2026 verifier already targets transformed MLIR and reports AMD MLIR-AIR, MLIR-AIE, and `mlir-opt` benchmark variants.  An unfrozen “pass-local semantic slicing / regression verifier” changes no verification decision variable beyond its current hybrid equivalence engine or the existing verification-dialect contracts. | `DIRECT_SUBTRACT`; no candidate. |
| Async data movement on spatial MLIR stacks | `MLIR AIR data movement scheduling verification 2026`; MLIR-AIR 2025; mlir-aie upstream; latency-hiding study 2026 | AIR already makes asynchronous/hierarchical operations, placement, overlap, and data movement explicit.  The remaining idea—choose buffering, worker/thread placement, or issue order per workload—is ordinary schedule/tile tuning unless a new constrained optimization problem and a natural headroom partition are first established. | `DROP_INSUFFICIENT_N2_RESIDUAL`; no candidate. |
| Host–accelerator zero-copy lowering | `MLIR data movement compiler 2025 2026`; AXI4MLIR zero-copy paper 2026 | The exact object, redundant heap-to-DMA staging in AXI4MLIR host code, is already the paper's core mechanism and lowering.  Renaming it for IREE/MLIR would change object or become a wrapper. | `DIRECT_FATAL`; no candidate. |
| Triton compiler diagnosis/rewrite | `Triton correctness/compiler optimization 2025 2026`; compiler-grounded Triton diagnosis 2026; TritonBench official repository | A tool that attributes an IR cause then proposes source rewrites is directly occupied by the 2026 compiler-grounded diagnosis system.  A mere regression runner, prompt policy, or source-rewrite selector is a wrapper/controller, not an N2 contribution. | `DIRECT_FATAL`; no candidate. |
| Cross-vendor descriptor abstraction | LLVM/Clang AMDGPU and AMD official material checked against NVIDIA CUDA TMA documentation and the existing S6 official-boundary record | AMD's Tensor Data Mover/Tensor DMA descriptor and NVIDIA Hopper TMA/tensor map are distinct backend objects.  A portability layer that elides descriptor and synchronization differences violates same-object semantics; a native lowering is already a deployment baseline. | `OBJECT_SEMANTICS_BLOCK`; no candidate. |

## Latest-collision boundary

The 2026-08-09 search did **not** carry a prior `SEARCH_BOUNDED_OPEN` label forward as novelty.  Each row was re-screened against the most recent located primary/official source.  A missing source is never treated as a novelty proof.  In particular, the current MLIR verification paper and Triton diagnosis paper are newer direct collisions, and AXI4MLIR's zero-copy paper occupies its exact host-staging object.

## Hardware identity boundary

No candidate maps `gfx1250` to CDNA5.  LLVM documents `gfx1250` in the GFX12/RDNA4 route; the inspected sources do not establish identity with CDNA5.  Likewise, AMD Tensor Data Mover/Tensor DMA and NVIDIA Tensor Memory Accelerator remain separately named and semantically scoped.  This wave makes no cross-vendor performance or correctness comparison.

## Source set

1. Tucker et al., [Practical Formal Verification for MLIR Programs](https://arxiv.org/abs/2605.01124), 2026 — latest same-object verifier collision.
2. Yin et al., [HEC: Equivalence Verification Checking for Code Transformation via Equality Saturation](https://arxiv.org/abs/2506.02290), 2025 — MLIR/e-graph verification baseline.
3. [First-Class Verification Dialects for MLIR](https://pldi25.sigplan.org/details/pldi-2025-papers/60/First-Class-Verification-Dialects-for-MLIR), PLDI 2025, with its linked public artifact — contract/dialect baseline.
4. Wang et al., [From Loop Nests to Silicon: Mapping AI Workloads onto AMD NPUs with MLIR-AIR](https://arxiv.org/abs/2510.14871), 2025 — same-stack explicit asynchronous data-movement/scheduling baseline.
5. Absar et al., [Analyzing Latency Hiding and Parallelism in an MLIR-based AI Kernel Compiler](https://arxiv.org/abs/2602.20204), 2026 — current Vec/MT/double-buffering mechanism study.
6. Cohavi et al., [Defeat the Heap: Zero-Copy Data Movement in AXI4MLIR](https://arxiv.org/abs/2606.11158), 2026 — exact zero-copy lowering collision.
7. Chen et al., [Compiler-Grounded Hierarchical Diagnosis for LLM-Based Triton Kernel Optimization](https://arxiv.org/abs/2607.23089), 2026 — current Triton diagnosis/rewrite collision.
8. [LLVM Testing Infrastructure Guide](https://llvm.org/docs/TestingGuide.html) and [LLVM test-suite guide](https://llvm.org/docs/TestSuiteGuide.html) — official natural whole-program/regression carrier and compile-time/runtime ledger support.
9. [MLIR-AIE / IRON upstream repository](https://github.com/Xilinx/mlir-aie) — public artifact, examples, tests, and pinned-wheel reproducibility boundary.
10. [TritonBench upstream repository](https://github.com/meta-pytorch/tritonbench) — public natural operator/input carrier.
11. [LLVM AMDGPU usage](https://llvm.org/docs/AMDGPUUsage.html), [AMD GPU builtins](https://clang.llvm.org/docs/AMDGPUBuiltinReference.html), and [NVIDIA async-copy/TMA documentation](https://docs.nvidia.com/cuda/archive/13.1.0/cuda-programming-guide/04-special-topics/async-copies.html) — terminology/object boundary only.

## Negative-result integrity

No `PROPOSE_STAGE0` is recommended.  This does not reject unimplemented work for low AI readiness or lack of a Stage-A result.  It rejects the screened directions because their frozen same-object residual is either directly occupied, lacks a nontrivial decision variable/constraint beyond tuning, or fails the backend-identity condition.  Therefore a finite Stage-A killer is not authorized for a non-candidate.
