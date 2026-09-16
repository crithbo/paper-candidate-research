# All-history five-field identity preflight

Bounded local lookup for Rust type layout, `repr(C)`, niche layout, and rustc layout returned related formatting/metadata/layout records but no frozen exact Rust-FFI layout identity. This is `NO_MATCH__NOT_NOVELTY_EVIDENCE`.

The five fields are: object = a fixed Rust exported `repr(C)` value and C reader; action = byte/discriminant/layout realization; endpoint = same FFI decode/call behavior; guarantee = target C ABI plus Rust validity; full-cost = rustc CPU/RSS, object/data bytes, call/memory cost and foreign read correctness. Broad Rust layout work is RELATED_ONLY and does not exclude.
