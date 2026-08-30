# Current-source / union matrix

| Family | Official current source triad | Fair strongest union | Outcome |
|---|---|---|---|
| Wasmtime async ABI | Component async design; Wasmtime 43+ runtime guide; current Config/API/source docs | component-model + component-model-async feature/config, CLI flags and `*_async` APIs | STRUCTURAL_DROP |
| LLVM segmented stacks | SegmentedStacks docs; target frame-lowering source; libgcc ABI contract | split-stack prologue + `__morestack` ABI/runtime | STRUCTURAL_DROP |
| RISC-V atomic ABI | LLVM RISCVUsage; psABI mapping reference linked therein; compiler/linker configuration | A6S default plus A6/A7 compatibility settings | STRUCTURAL_DROP |
| ASan UAR | current AddressSanitizer docs; compiler/runtime modes | `never/runtime/always` and runtime option union | STRUCTURAL_DROP |
| AArch64 volatile register | LLVM LangRef; target-specific register support | IR intrinsic plus FAKE_USE/RA semantics | STRUCTURAL_DROP |
| stacksave/restore | LLVM LangRef; normal EH cleanup rules | intrinsic plus standard cleanup/CFG union | STRUCTURAL_DROP |

No current-absence claim was used. No `SEARCH_BOUNDED_OPEN` residual survived this source-only pass.
