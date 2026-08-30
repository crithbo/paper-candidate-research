# Exact public anchors and primary RQs

| Seed | Exact public anchor | Immutable same-object boundary | Primary RQ | Bounded source-role route |
|---|---|---|---|---|
| S55-01 | WebAssembly Component Model Canonical ABI specification and current Wasmtime component-model documentation, accessed 2026-08-15 | fixed component imports/exports, values and traps; stock canonical-ABI observable behavior | Can a target-specific adapter construction reduce lift/lower+allocation+copy full cost while preserving canonical ABI results and traps? | ANCHOR/CURRENT: Canonical ABI + Wasmtime docs/source. Stop if only standard lowering/configuration or a changed ABI survives. |
| S55-02 | ELF psABI `SHT_RELR` / glibc current dynamic-loader documentation/source locus, accessed 2026-08-15 | same ELF program, relocation targets, ABI and stock dynamic-loader outcome | Can a target-specific RELR construction alter relocation decode/page-locality full cost while preserving stock loader acceptance and relocation result? | ANCHOR/CURRENT: ELF/psABI and glibc loader source/docs. Stop if bit packing/order is current encoding or generic compression. |
| S55-03 | LLVM ORC JITLink current design/API/source documentation, accessed 2026-08-15 | fixed LinkGraph program, symbol/relocation resolution and callable runtime result | Is there a target-specific graph-to-stub/GOT layout constructor that reduces materialization+lookup full cost while preserving JITLink resolution semantics? | ANCHOR/CURRENT: LLVM ORC/JITLink docs/source. Stop if it is native LinkGraph allocation/edge/stub construction or generic graph layout. |

No optional RQ variants: each object/guarantee envelope is singular.
