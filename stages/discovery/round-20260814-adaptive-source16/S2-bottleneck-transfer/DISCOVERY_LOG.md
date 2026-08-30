# Source16 semantic-residual triage

assignment: DISCOVERY-S2-20260814-ADAPTIVE-SOURCE16-SEMANTIC-RESIDUAL-V1; canonical v8.7; V9 OFF.

## Pre-outcome triad cards

| anchor | current native union | strongest subtractor | carrier / oracle | D1 |
|---|---|---|---|---|
| AMDGPU availability/visibility model | LLVM intrinsics/metadata, atomic/fence mapping, backend codegen | current AMDGPU memory model + backend guide | fixed LLVM IR kernel / LLVM memory-model behavior | complete; Source15 identity, excluded |
| PTX atomics ABI | legal acquire/release/relaxed mappings and strengthening | NVIDIA Atomics ABI | fixed C++ atomic program / C++ observable behavior | complete; Source15 identity, excluded |
| AMDGPU execution barriers | formal barrier model plus memory-model interaction | LLVM execution-sync documentation | fixed kernel / barrier semantics | complete; current union absorption |
| AMDGPU async completion | async operation/intrinsic completion semantics | LLVM user-guide async-operation path | stock compiler object not fully pinned | one source-only closure exhausted; UNFROZEN |
| GPU DWARF heterogeneous memory spaces | source-memory-space mapping/ABI | LLVM AMDGPU backend guide | stock debugger/reader | historical debug family excluded |
| public NPU ordering ABI | no frozen current first-party object | none | no stock oracle closed | UNFROZEN |

The required triad was frozen before depth selection. Three D1 cards were role-complete, but only two non-excluded candidate-grade cards were admissible; the optional third depth was not used for outcome replacement.

## Deep review

### D01 — AMDGPU execution barrier / memory ordering

Same object: fixed kernel, output and AMDGPU memory-model guarantee. Two legal plans (barrier/fence instruction sequences) are already covered by the current formal execution synchronization and memory-model union. Any weaker sequence risks changed semantics; any legal stronger sequence is current composition. No union-external atomic action or target-specific guarantee remains. DROP.

### D02 — AMDGPU asynchronous completion lowering

Same-object hypothesis remained plausible, but source-only closure could not freeze a complete stock ABI-equivalent two-plan witness and natural carrier in the allotted single current-source pass. It is NOT_ADMITTED_UNFROZEN, not a scientific negative. Repeating the same missing facet is disallowed by this pilot.

## Result

COMPLETE_ZERO_PROPOSALS. No security/vulnerability/exploit/protocol family entered screening; no experiment/build/download took place.
