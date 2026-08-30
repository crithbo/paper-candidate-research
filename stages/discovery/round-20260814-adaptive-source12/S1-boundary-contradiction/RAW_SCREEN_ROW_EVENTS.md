# Raw screen row events

| ID | Family / fixed object | Neutral primary snapshot | Initial two-plan thought | Disposition |
|---|---|---|---|---|
| R01 | Rust FFI panic/unwind boundary | Rust Reference, current ABI + panic chapters | caller may expose `C` or `C-unwind` declaration | DEEP_D1 |
| R02 | Itanium C++ exception catch/rethrow lifetime | Itanium C++ ABI EH | catch entry may combine / separate ABI calls | RAW_ONLY |
| R03 | Windows x64 SEH unwind metadata | Microsoft x64 EH specification | equivalent prolog effects can be encoded in different unwind forms | DEEP_D1 |
| R04 | Go cgo callback panic/defer transition | Go cgo documentation and current runtime source | Go/C transition and panic/defer state | RAW_ONLY |
| R05 | glibc pthread cancellation versus C++ cleanup | glibc manual/current source lineage | cancellation state and forced unwind order | RAW_ONLY |
| R06 | Wasmtime host externref ownership boundary | Bytecode Alliance current repository | host/guest reference lifetime actions | EXCLUDED_HISTORICAL_REPEAT |

Rows are discovery leads, not absence claims or candidate conclusions.
