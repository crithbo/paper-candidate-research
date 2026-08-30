# DISCOVERY-S3-20260809-V8.4-WAVE7 — Discovery log

## Scope, method, and source boundaries

- Assignment: `DISCOVERY-S3-20260809-V8.4-WAVE7`; O3 natural structure, with a CUDA/GPU compiler share of discovery effort.
- Method: accepted/calibrated production Discovery `v2/v8.1` only (`O3_CALIBRATED`).  TLS-blocked two-axis `v8.2r2` was not used or claimed.
- Cutoff: 2026-08-09.  Evidence is restricted to original papers/author artifacts and official LLVM, ROCm, and project documentation.
- Carrier boundary: LLVM test-suite/AMDGPU regression inputs and public Triton/MLIR compiler artifacts.  They establish reproducible natural compiler inputs, not performance evidence.
- Architecture boundary: `gfx1250` is not treated as CDNA5.  AMD Tensor Data Mover/Tensor DMA is not renamed, equated, or compared as NVIDIA TMA.  No claim crosses these official-object boundaries.
- Exclusions: target mapping, wrapper, controller, selector, routine parameter tuning, S5 occupancy/regalloc, terminal e-graph extraction, and the completed AMD-CDNA5 zero-proposal line.

## Baseline-residual-first screening

The initial union was frozen as: upstream LLVM code generation (instruction selection, register allocation, machine scheduling, encoding) plus the current unified-backend and multi-level GPU-language mechanisms below.  A route could survive only by supplying a same-object atomic representation, data-movement, or scheduling action outside that union while preserving semantics and full cost.

| Route | Stable natural structure | Candidate union-external action tested conceptually | Strongest action-space subtractor | Structural paper potential if successful | Current evidence readiness | Result |
|---|---|---|---|---|---|---|
| W7-LLVM-01 | Whole programs and AMGPU regression inputs contain recurring SSA/MIR region shapes and operand patterns. | Single-pass region representation that jointly commits instruction selection, register allocation, and encoding. | [TPDE](https://arxiv.org/abs/2505.22610) already performs one analysis pass then combines selection, allocation, and encoding on SSA IR. | Could be Tier B only if a distinct action/guarantee survived. | High carrier availability; no residual action. | `DROP__DIRECT_SUBTRACT_NO_ATOMIC_N2_RESIDUAL` |
| W7-TRITON-01 | Blocked tensor programs repeatedly express compute/data-movement/synchronization at warp-group granularity. | New compiler representation for explicit multi-warp data movement and synchronization. | [TLX](https://arxiv.org/abs/2605.10905) exposes MIMW orchestration while retaining Triton blocked programming; [ML-Triton](https://arxiv.org/abs/2503.14985) is a multi-level representation and lowering route. | Potentially Tier B only with a different semantic action or guarantee, not a new spelling of orchestration. | Public papers/artifacts exist; the required union-external primitive was not identified. | `DROP__DIRECT_SUBTRACT_NO_FROZEN_SAME_OBJECT_ACTION` |
| W7-LLVM-02 | Natural LLVM IR features repeat across whole-program test-suite inputs. | Choose/fuse pass schedules from the structural fingerprint. | Current predictive and unified-backend compiler lines, including TPDE; compiler pass pipelines are deployment practice. | Not admissible: any gain would be a selector outcome, not a structural N2. | The LLVM suite supports a CPU-only 20–50-program probe, but that cannot repair the prohibited action class. | `DROP__PROHIBITED_SELECTOR` |
| W7-AMDGPU-01 | AMDGPU machine tests expose register-bank/dual-issue constraints on specified GFX targets. | Architecture-specific bank-aware pairing or data-movement schedule. | Official LLVM AMDGPU target-specific scheduler/RA machinery; a 2026 public bank-allocation report is only a single issue. | Not admissible under this assignment: it would be single-issue/target mapping unless a cross-corpus, architecture-frozen action were demonstrated. | Static tests are available, but no GPU-free same-object full-cost killer or lawful cross-architecture mapping was found. | `DROP__SINGLE_ISSUE_AND_OFFICIAL_OBJECT_BOUNDARY` |

## Finite-killer check

For the only potentially CPU-static carriers, the conceivable bounded killer would compile 20–50 LLVM test-suite whole programs or LLVM AMDGPU regression inputs, check exact code-generation semantics/assembly legality, and charge compile time, IR/MIR memory, and any inserted scheduling metadata.  This was **not run**.  It cannot rescue W7-LLVM-01/W7-TRITON-01 because their candidate action is already inside the strongest known union, nor W7-LLVM-02 because it is a selector.

## Bounded conclusion

`grounded briefs = 0`; `PROPOSE_STAGE0 = 0`.

No route was rejected for missing implementation, absent current result, unavailable GPU, unavailable data, or low AI readiness.  All rejections arise before execution from direct action-space subtraction, a prohibited selector, a single-issue shape, or an official-object boundary.  No experiment or benchmark was run.

## First-party sources used

1. [LLVM Testing Infrastructure Guide](https://llvm.org/docs/TestingGuide.html) and [LLVM test-suite guide](https://llvm.org/docs/TestSuiteGuide.html).
2. [LLVM AMDGPU developer guideline](https://llvm.org/docs/AMDGPU/DeveloperGuideline.html), [AMDGPU backend usage guide](https://llvm.org/docs/AMDGPUUsage.html), and [ROCm compiler reference](https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html).
3. [HIP compiler documentation](https://rocm.docs.amd.com/projects/HIP/en/latest/understand/compilers.html), which states that output is targeted to a specific GFX architecture.
4. [TPDE author manuscript](https://arxiv.org/abs/2505.22610), [TLX author manuscript](https://arxiv.org/abs/2605.10905), and [ML-Triton author manuscript](https://arxiv.org/abs/2503.14985).

The search boundary does not assert global novelty or a performance result.
