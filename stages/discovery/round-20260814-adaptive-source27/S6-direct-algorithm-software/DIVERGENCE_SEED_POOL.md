# Source27 Offline Divergence Seed Pool

- Assignment / lane: `DISCOVERY-S6-20260814-ADAPTIVE-SOURCE27-ORIGIN-GROUNDED-V1` / S6.
- Source capsules: `S6_AMDGPU_GFX12_ROCWMMA_NATIVE_ACTIONS`; `S6_LOONGARCH_OPENBLAS_NATIVE_KERNEL_ACTIONS`.
- External lookup before generation: `NO`.
- Network-security scope: `PASS`.

| Engine | Seed IDs |
|---|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | A01, L01 |
| `PROBLEM_REFRAMING` | A02 |
| `CONSTRAINT_MANIPULATION` | A03, L02 |
| `NEGATION_OR_INVERSION` | A04 |
| `ABSTRACTION_LADDER` | L03 |
| `COMPOSE_DECOMPOSE_SIMPLIFY` | L04 |

## AMDGPU / rocWMMA sketches

### A01

- Perspective / engine: GPU backend engineer / structural transfer.
- Sketch: Freeze one GFX12 WMMA kernel and ABI. Compare two stock-native legal fragment lowering paths that differ in wave-matrix instruction form, then ask whether a finite legality state yields a target-specific certified resource frontier rather than a layout selector.
- Conclusion-first test: At most an N2 constructor could certify a fixed kernel’s legal instruction-resource frontier; if the actions are just target flags or the package already selects them, reject.
- Disposition: `KEEP_FOR_CONVERGENCE`.

### A02

- Perspective / engine: hardware architect / problem reframing.
- Sketch: Reframe “matrix layout” as the semantic coupling of element type, wave size, accumulator form and ABI-visible code object rather than generic tiling.
- Conclusion-first test: Any contribution must preserve the same wave-matrix program and code-object semantics.
- Disposition: `KEEP_FOR_CONVERGENCE`.

### A03

- Perspective / engine: compiler maintainer / constraint manipulation.
- Sketch: Bound the number of live fragments and ask whether instruction selection plus conversion placement admits a target-specific FPT construction.
- Conclusion-first test: Generic register allocation or a compiler scheduling wrapper would invalidate it.
- Disposition: `KEEP_FOR_CONVERGENCE`.

### A04

- Perspective / engine: measurement reviewer / negation.
- Sketch: Invert the expected throughput question: seek a verifier-backed equivalence plus code-size/register bound, not a hardware performance claim.
- Conclusion-first test: It needs a stock static code-object/oracle and natural official kernel carrier.
- Disposition: `SEED_BACKLOG`.

## LoongArch / OpenBLAS sketches

### L01

- Perspective / engine: numerical-kernel maintainer / structural transfer.
- Sketch: For a fixed LoongArch OpenBLAS GEMM microkernel ABI, LSX and LASX actions may be individually legal. Ask whether a bounded packing/unroll conversion construction provides a target-specific exact frontier without changing numerical output.
- Conclusion-first test: A result must not be a generic blocking/tuning exercise or a new kernel implementation presented as a paper residual.
- Disposition: `KEEP_FOR_CONVERGENCE`.

### L02

- Perspective / engine: compiler engineer / constraint manipulation.
- Sketch: Hold matrix shape and BLAS semantics fixed while imposing a bounded vector-register/packing state; test whether two native code paths lead to a non-generic LoongArch construction problem.
- Conclusion-first test: If one route is simply runtime dispatch, no residual survives.
- Disposition: `KEEP_FOR_CONVERGENCE`.

### L03

- Perspective / engine: end user / abstraction ladder.
- Sketch: Lift from one GEMM call to a versioned OpenBLAS kernel family only if the same native test/ABI gives a common oracle across vector actions.
- Conclusion-first test: A cross-kernel aggregation cannot replace a fixed same-object claim.
- Disposition: `SEED_BACKLOG`.

### L04

- Perspective / engine: theorist / compose-decompose.
- Sketch: Decompose macro-kernel packing, micro-kernel ISA form and remainder handling, then search for a bounded state interface that recomposes them with a formal full-cost guarantee.
- Conclusion-first test: Generic packing or a paper-owned kernel is disqualifying.
- Disposition: `KEEP_FOR_CONVERGENCE`.

## Convergence

| Selected locator | Capsule | Exact intended object | Atomic two-action premise | Why selected |
|---|---|---|---|---|
| QC01 | AMDGPU | fixed GFX12 rocWMMA kernel / code-object ABI | two stock legal wave-matrix lowering actions | distinct architecture/ABI state surface |
| QC02 | LoongArch | fixed OpenBLAS LoongArch GEMM kernel / ABI | LSX-versus-LASX/scalar native kernel actions | distinct CPU numerical-kernel surface |

Unselected seeds remain non-evidentiary backlog. This convergence selected two orthogonal exact-object/contribution/action/carrier/falsifier surfaces; it does not force a count or outcome-aware replacement.
