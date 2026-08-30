# Source and collision matrix

| Family | Official / primary current source | Current-upstream / flags check | Collision / subtractor conclusion |
|---|---|---|---|
| Rust FFI unwind | [Rust Reference: extern functions](https://doc.rust-lang.org/reference/items/functions.html#extern-function-qualifier); [Panic](https://doc.rust-lang.org/stable/reference/panic.html) | ABI string and `panic=unwind`/`panic=abort` semantics are explicit; no absence premise | Direct semantic absorption by declared ABI contract. |
| Itanium EH | [Itanium C++ ABI EH](https://itanium-cxx-abi.github.io/cxx-abi/abi-eh.html) | ABI prescribes object/header, two-phase unwind and catch/rethrow lifecycle | Existing ABI actions leave no independently fixed target-specific constructor. |
| Win64 SEH | [Microsoft x64 exception handling](https://learn.microsoft.com/en-us/cpp/build/exception-handling-x64?view=msvc-170) | `.pdata/.xdata`, handler and chained metadata are current documented producer/consumer paths | Metadata encoding is current lowering territory; direct N2 not identified. |
| Go cgo | [Go cgo source documentation](https://github.com/golang/go/blob/master/src/cmd/cgo/doc.go); [runtime state](https://github.com/golang/go/blob/master/src/runtime/runtime2.go) | `runtime.cgocall`, callback and `incgo`/stack state exist; all flags/action paths not bounded | `NOT_ADMITTED_UNFROZEN`; not promoted. |
| pthread cancellation | [glibc manual](https://sourceware.org/glibc/manual/2.40/pdf/libc.pdf); [Itanium forced-unwind distinction](https://itanium-cxx-abi.github.io/cxx-abi/abi-eh.html) | cancellation-state configurations and language cleanup composition were not fully source-pinned | `NOT_ADMITTED_UNFROZEN`; no absence claim. |
| Wasmtime externref | [Wasmtime official repository](https://github.com/bytecodealliance/wasmtime) | Not re-closed because it matches a prior Wasm-engine/ABI near-miss family | Historical repeat, excluded before deep review. |

The search was bounded as of 2026-08-14. No old issue or future-work statement is used as evidence that a current action is absent.
