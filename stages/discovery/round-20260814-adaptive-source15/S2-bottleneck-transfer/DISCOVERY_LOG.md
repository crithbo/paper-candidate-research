# Discovery log — Source15

assignment: DISCOVERY-S2-20260814-ADAPTIVE-SOURCE15; canonical v8.7; V9 OFF; cutoff 2026-08-14.

| raw family | outcome | decisive boundary |
|---|---|---|
| AMDGPU availability/visibility + fence lowering | DEEP_DIVE_REQUIRED | fixed kernel/LLVM IR/output and memory-model guarantee possible |
| PTX atomic ABI mapping + compiler lowering | DEEP_DIVE_REQUIRED | fixed C++ atomic program / ABI acceptance possible |
| AMDGPU execution-barrier / LDS ordering | DROP | native formal barrier and memory-model union covers proposed action |
| AMDGPU async operations completion lowering | NOT_ADMITTED_UNFROZEN | exact ABI-equivalent two-plan witness not frozen |
| GPU heterogeneous DWARF memory-space lowering | EXCLUDED | historical debug/metadata family boundary |
| NPU ISA ABI / tensor-memory ordering | NOT_ADMITTED_UNFROZEN | no current first-party fixed object and stock oracle closed in bounded search |

## Deep D01: AMDGPU availability/visibility placement

The exact object was a fixed AMDGPU kernel and LLVM IR semantics. Current LLVM documentation exposes `load-visible`, `store-available`, availability/visibility metadata, atomic/fence behavior, target address spaces and safe-by-default lowering. The proposed action—jointly relocating or choosing these annotations and fences—was not frozen as a target-specific bounded-state algorithm with an exact/FPT/certified frontier; it remains compiler transformation/legality analysis, and the semantic contract changes if a weaker ordering is unjustified. DROP, not because of absent implementation.

## Deep D02: PTX atomic ABI mapping

The exact object was a fixed C++ atomic program, C++ observable behavior and PTX ABI. NVIDIA's current ABI guide states that multiple PTX mappings are acceptable and that strengthening is valid. Thus selecting among these mappings is already ABI-legal current composition. No union-external coupled action with a distinct target-specific guarantee was frozen; a generic fence-minimization search is prohibited. DROP.

## Final

COMPLETE_ZERO_PROPOSALS. Security, protocol-security, vulnerability and exploit subjects were excluded. No experiment, build, installation, download or readiness-based scientific inference occurred.
