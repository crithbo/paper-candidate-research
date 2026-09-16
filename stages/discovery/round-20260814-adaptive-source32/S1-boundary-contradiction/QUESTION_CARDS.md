# Evidence-qualified Question Cards

## RQ-S01-2 — RISC-V Zicond form/RA/scheduling

| Field | Finding |
|---|---|
| Exact identity | Fixed RISC-V program/MachineIR, psABI, visible values/exceptions, and Zicond target. |
| Atomic action | Select branchless Zicond sequences with register and schedule choices. |
| Current locus | RISC-V Zicond v1.0; current LLVM RISCVUsage enables Zicond with `-march` extensions. |
| Carrier / full cost | Public compiler tests; compile CPU/RSS, text bytes, moves/spills, static throughput, runtime. |
| Minimum falsifier | The construction is ordinary instruction selection/RA/scheduling without a target-specific guarantee. |
| Decision | **EXCLUDED_BEFORE_RAW__GENERIC_WRAPPER_OR_SOLVER.** The current ISA exposes simple conditional sequences; the proposed joint form does not supply a non-generic discriminator. |

## RQ-S02-2 — Vulkan shader-object layout commitment

| Field | Finding |
|---|---|
| Exact identity | Fixed Vulkan shader-object workload, SPIR-V output, descriptor/push-constant interface, and device-visible behavior. |
| Atomic action | Construct timing/placement of legal shader-object/pipeline-layout commitments. |
| Current locus | Current Vulkan 1.4 specification and Khronos Vulkan-Docs upstream. |
| Carrier / full cost | Public shader-object workloads after implementation pin; compile CPU/RSS, binary/cache bytes, resource binding overhead, runtime latency/RSS. |
| Minimum falsifier | Existing implementation owns all legal commitments or the candidate changes API configuration/semantics. |
| Closure route | Pin a public compiler/runtime revision and all relevant default/nondefault configuration paths; then derive a minimal legal carrier. |
| Decision | **LOCATOR_ONLY__PUBLIC_EVIDENCE_UNCLOSED.** Public API semantics alone do not freeze the required current union/fair comparator. |

`evidence_qualified_raw_count: 0`
