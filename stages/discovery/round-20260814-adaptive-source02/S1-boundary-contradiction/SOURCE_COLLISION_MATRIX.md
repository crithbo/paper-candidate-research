# Current-source and collision matrix

| Family | Primary current evidence | Current union / strongest subtractor | Disposition |
|---|---|---|---|
| Coroutine rescreen | LLVM Coroutines; `CoroFrame.cpp`; `CoroSplit.cpp` | Current frame construction, spilling/rematerialization/layout optimization and allocation elision paths | STRUCTURAL_DROP (absorbed/generic) |
| Stackmap / patchpoint | LLVM StackMaps; `StackMaps.h/.cpp` | Stack-map location forms, patchpoint shadow contract, runtime reconstruction and current serialization | STRUCTURAL_DROP (generic allocation/compaction) |
| glibc IFUNC | glibc current Indirect Functions manual; GNU ld manual | all lazy/non-lazy mode entries (`-z now`, `LD_BIND_NOW`, relocation and constructor timing) | STRUCTURAL_DROP (configuration or changed guarantee) |
| Wasm component async | official component-model concurrency design; official spec/proposals repositories | no frozen engine implementation union | NOT_ADMITTED_UNFROZEN |
| Clang musttail | current Clang AttributeReference and `CGCall.cpp` | direct diagnostic for skipping cleanups, ordinary tail-call lowering/merging | STRUCTURAL_DROP |
| LLVM GC statepoint | LLVM Statepoints; StackMaps docs/source | statepoint relocation/stack-map production; client-specific insertion remains unfrozen | NOT_ADMITTED_UNFROZEN |

`SEARCH_BOUNDED_OPEN` is confined to the two unfrozen rows and is not a firstness claim. No missing implementation/result/resource observation is a disposition premise.
