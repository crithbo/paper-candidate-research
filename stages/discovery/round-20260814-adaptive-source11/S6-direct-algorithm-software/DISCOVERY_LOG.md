# S6 adaptive-source11 — backend/frame/ISA cross-layer screen

Assignment: `DISCOVERY-S6-20260814-ADAPTIVE-SOURCE11`; canonical `V8_7_POTENTIAL_READINESS_SEPARATED`; claim-pack `OFF`; cutoff 2026-08-14. Read-only official/current-source and primary-material work only.

| ID | Locator/current anchor | Exact fixed semantics and oracle | Prospective joint algorithm | Result |
|---|---|---|---|---|
| `SFRAME_COMPILER_FRAME_LAYOUT_UNWIND_METADATA_CONSTRUCTION` | 2025 Linux `unwind_user` / SFrame upstream patch series; Linux/kernel and compiler SFrame routes | fixed ELF program, ABI, frame-unwind traces; stock SFrame user-unwind / frame-pointer oracle | joint frame-layout plus SFrame row/metadata planner | `RAW -> DEPTH` |
| `GCC_AARCH64_IRA_CALLEE_SAVE_FRAME_CONSTRUCTION` | 2025 GCC current `ira` target-hook patch and AArch64 frame-cost source | fixed GCC GIMPLE/RTL, AArch64 ABI and assembly behavior; assembler/linker ABI oracle | joint register allocation, callee-save and frame-allocation constructor | `RAW -> DEPTH` |
| `ARM_TV_AARCH64_BACKEND_TRANSLATION_VALIDATION` | OOPSLA 2025 arm-tv primary paper/artifact | fixed LLVM IR/AArch64 output behavior; arm-tv authoritative semantics validator | verification-aware backend construction | `RAW_DROP__PAPER_OWN_COMPLETE_VALIDATOR` |
| `TPDE_SINGLE_PASS_BACKEND_CONSTRUCTION` | TPDE 2025 primary source | fixed SSA IR and x86-64/AArch64 output; executable semantics | selection/RA/encoding joint backend | `RAW_DROP__PAPER_OWN_COMPLETE_BACKEND` |
| `COSSJIT_SPECULATION_ANALYSIS_CODE_CONSTRUCTION` | OOPSLA 2025 CoSSJIT artifact | fixed VM program and semantics; runtime behavior oracle | static-analysis and speculation joint JIT code constructor | `RAW_DROP__RUNTIME_CONTROLLER_OR_PAPER_OWN_CONSTRUCTION` |
| `RYUJIT_TIERED_FRAME_CODEGEN_CONSTRUCTION` | current dotnet/runtime JIT design/source | fixed IL/runtime behavior; CoreCLR execution oracle | tier/profile/frame/code-layout joint constructor | `RAW_DROP__TIERING_CONTROLLER_AND_UNFROZEN_RESIDUAL` |

Funnel: six raw families; two targeted depth reviews; zero clean brief or `PROPOSE_STAGE0`.  No implementation/result/resource fact supplied a scientific negative inference.

