# RAW_SCREEN_ROW_EVENTS

| row | unique family | first-party entry | initial same-object witness | disposition |
|---|---|---|---|---|
| R01 | AArch64 SVE scalable-register call preservation | Arm AAPCS64 / ABI-AA | A scalable-vector routine calls an opaque separately compiled helper and then consumes its live vector value. | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R02 | x86 PKRU protection-key state across call/signal transitions | Intel PKRU documentation | A caller changes PKRU before an opaque helper and accesses the same keyed allocation after return. | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R03 | AArch64 Guarded Control Stack (GCS) call/unwind transition | Arm architecture and ABI material | A program crosses a call and an exceptional-transfer boundary while retaining ordinary return semantics. | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R04 | WebAssembly stack-switching continuation transition | WebAssembly component-model / stack-switching material | A component suspends and resumes a continuation across a host boundary with the same result values. | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R05 | RISC-V `fcsr` rounding-state call transition | RISC-V psABI | A floating-point caller crosses an opaque call and resumes a computation governed by a fixed rounding contract. | `STRUCTURAL_DROP` |
| R06 | WebAssembly exception tag/control-stack transition | WebAssembly core validation / EH proposal | A validated module throws to a typed handler and resumes the specified handler result. | `STRUCTURAL_DROP` |

All six were newly screened for this assignment. R01–R04 are not a claim that a union gap exists; they were selected only because a legal same-object witness can be stated before source-union closure.
