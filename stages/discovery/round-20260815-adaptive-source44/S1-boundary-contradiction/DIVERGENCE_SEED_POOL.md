# Source44 — offline divergence seed pool

No source was consulted while generating these seeds.  They are hypotheses, not opportunity-family claims or evidence.

| ID | Engine / perspective | Boundary tension and cautious conclusion-first test | Pre-evidence status |
|---|---|---|---|
| S01 | `JANUSIAN_TENSION` / compiler-backend engineer | RVV fixed-point instructions make rounding/saturation state explicit in `vxrm`/`vxsat`, while calls may split code-generation regions.  If successful, a same-result construction could reduce state-save/set and spill cost without changing ABI-visible numeric results. | selected for RQ01 |
| S02 | `CONSTRAINT_MANIPULATION` / linker/runtime engineer | ELF IFUNC resolution chooses an implementation at relocation time, but compiler and linker forms commit relocation/call cost earlier.  A valid result would retain resolver/ELF semantics, not become a loader policy. | selected for RQ02 |
| S03 | `ABSTRACTION_LADDER` / managed-runtime engineer | LLVM GC-transition operand bundles express strategy boundaries at a call site, whereas lowering must preserve operands on each side.  A contribution would need a fixed public collector contract, not a generic statepoint rewrite. | locator control |
| S04 | `NEGATION_OR_INVERSION` / compiler engineer | C++ coroutine final suspension fixes destruction/unwind behavior while a symmetric transfer changes continuation shape.  A viable claim must be more than ordinary coroutine lowering. | locator control |
| S05 | `ADJACENT_POSSIBLE_OR_BOUNDARY` / runtime engineer | Wasm multi-memory retains module semantics while embedder lift/lower chooses memory-index representation.  It is only viable with a fixed engine and canonical host boundary. | locator control |
| S06 | `COMPOSE_DECOMPOSE_SIMPLIFY` / ISA engineer | A RISC-V wait-on-reservation hint changes a retry-loop’s waiting form but not the memory result.  It only survives if a non-generic program-level action exists beyond feature selection. | locator control |

Coverage: six engines and five perspectives.  No outcome-based replacement was made.
