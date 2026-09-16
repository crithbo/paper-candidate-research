# Raw-screen row events

| event | primary finding | status |
|---|---|---|
| loader semantics | Current glibc lookup uses `DT_GNU_HASH`, bucket and chain state in version-aware symbol lookup. | FROZEN |
| format semantics | GNU-hash format defines `symoffset`, bloom shift/filter, buckets and per-symbol chain entries; QRP-like arbitrary proof semantics do not apply. | FROZEN |
| linker interface | GNU ld documents `--hash-style={sysv,gnu,both}`; lld is a GNU-linker-compatible current implementation. | PARTIAL_UNION |
| joint action witness | Permuting two internal non-export-order-constrained symbols changes bucket/chain/dynsym indices while all relocation/version references can in principle be updated. | LEGALITY_ONLY |
| final | Current lld and GNU ld source/config union for dynsym sorting, bloom sizing/shift, bucket count/chain construction and all version/relocation interactions was not completely enumerated. | NOT_ADMITTED_UNFROZEN |
