# Source28 S2 divergence seed pool

Assignment: `DISCOVERY-S2-20260814-ADAPTIVE-SOURCE28-RQ-PRODUCTION-V1`  
Mode: `RQ_REFINEMENT_STAGED_EVIDENCE_V1 / PRODUCTION`; claim-pack `OFF`.  
Generation was completed offline before source lookup. Seeds are non-evidence.

| Seed | Engine / perspective | Sketch and conclusion-first test | Pre-evidence disposition |
|---|---|---|---|
| S28-01 | BISOCIATION_STRUCTURAL_TRANSFER / compiler engineer | Map a DMA descriptor plus LDS permutation to a typed producer-consumer contract, rather than separately choosing copy and layout. If feasible, the claim would only be that a CDNA-targeted joint constructor can preserve a HIP kernel while reducing copy-to-LDS stalls. | selected |
| S28-02 | COMPOSE_DECOMPOSE_SIMPLIFY / runtime engineer | Treat SYCL device-image splitting and runtime selection as one compilation artifact rather than a flag choice. The cautious claim is a same-binary image-partition plan with an explicit compile/load Pareto guarantee. | selected |
| S28-03 | CONSTRAINT_MANIPULATION / hardware architect | Fix a UPMEM DPU program and host-visible data, then ask whether host transfer batches and DPU tasklet ownership admit a joint data-movement constructor. The claim would concern transfer/compute makespan, not a launch policy. | selected |
| S28-04 | ADJACENT_POSSIBLE_OR_BOUNDARY / accelerator architect | Hopper TMA exposes descriptor/swizzle actions; perhaps descriptor creation and shared layout have a coupled residual. | excluded: historical Source13 CUDA async-copy/TMA family |
| S28-05 | PROBLEM_REFRAMING / operator | CXL demotion may make metadata and migration cost dominant; perhaps allocation and placement should be jointly constructed. | excluded: OS page-tier controller/configuration surface |
| S28-06 | JANUSIAN_TENSION / backend engineer | NPU command buffers need fixed ABI yet workload-specific memory placement; seek a compiler/runtime joint action. | RQ backlog: no bounded public native action locus selected |

Coverage: six engines, five perspectives; network-security exclusion `PASS`. No seed asserts novelty, absence, quality, or a candidate disposition.

## Convergence

| Cluster | seeds | representative | reason |
|---|---|---|---|
| native accelerator transfer/layout | 01, 04 | 01 | AMD GPU object differs from already-screened CUDA TMA identity |
| compiler-runtime image construction | 02 | 02 | exact SYCL image object and stock runtime oracle |
| PIM host/DPU transfer construction | 03 | 03 | public DPU programming carrier but source closure needed |

Selected before evidence outcomes: S28-01, S28-02, S28-03. S28-04/05 are excluded identities; S28-06 remains an append-only RQ backlog item.
