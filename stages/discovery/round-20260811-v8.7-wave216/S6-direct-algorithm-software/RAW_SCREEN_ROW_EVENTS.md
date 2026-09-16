# Raw screen row events

| Row | First-party material | Finding |
|---|---|---|
| R1 | GNU hash format record | Hashable dynsym suffix is constrained to nondecreasing `hash % nbuckets`; bucket/chain encode that contiguous ordering. |
| R2 | GNU hash format record | Bloom, buckets and chains are not separable postprocessing: all are functions of the dynsym layout and symbol names. |
| R3 | GNU ld options | `--hash-style=sysv|gnu|both` is a current native action choice. |
| R4 | glibc loader source record | Loader GNU lookup consumes bloom/bucket/chain structures. |
| R5 | lld/binutils source closure request | Current full writer union across GNU ld, lld, backends, version/export/relocation paths and flags was not fully source-pinned in the bounded pass. |
