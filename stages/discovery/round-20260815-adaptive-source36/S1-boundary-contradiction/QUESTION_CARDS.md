# Question cards

## Q36-01: Zfa FLI form cost

- Exact object: fixed floating-point program result, RISC-V target including Zfa, ABI and observable FP behavior.
- Claim endpoint: target-specific construction with an explicit code-size/front-end cost guarantee.
- Current loci: ratified Zfa description of `FLI.S`; LLVM main `RISCVUsage.rst`, which lists Zfa as supported.
- Falsifier: a candidate is only a local literal/form selection or target cost-table adjustment.
- Finite closure route: Stage0 could pin LLVM source and assess ISel/constant lowering, compiler tests and assembler/disassembler legality. Full cost: compile CPU/RSS, bytes, static instruction/uop mix and FP conformance.
- C0 result: `LOCATOR_ONLY__ORDINARY_FORM_SELECTION`. The minimum action is choosing a standard constant form; no target-specific joint algorithm or nontrivial guarantee is frozen.

## Q36-02: CUDA device-graph commitment

- Exact object: fixed CUDA graph nodes/dependencies, device-graph legality, graph result and launch semantics.
- Claim endpoint: non-controller same-object constructor/guarantee for upload/update/launch commitment.
- Current loci: CUDA Programming Guide device graph creation, upload, update and device launch; Runtime API graph surface.
- Falsifier: the only proposed decision is when/which thread launches or schedules the graph.
- Finite closure route: Stage0 could pin CUDA docs/sample source, graph API legality and a public graph carrier; full cost: host CPU/RSS, graph instantiation/upload/update cost, graph memory and GPU runtime under fixed semantics.
- C0 result: `STRUCTURAL_DROP__CONTROLLER_OWNED`. NVIDIA defines device graph launch specifically as device-side dynamic control flow/work scheduling, with fixed structure at instantiation and host-only update. A placement/relaunch policy is the forbidden controller shape, not N1/N2.
