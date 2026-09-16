# Raw screen row events

| family | event | primary-source finding | disposition |
|---|---|---|---|
| ELF GNU hash + dynsym joint constructor | source-pin attempt | Direct `git ls-remote` of official LLVM and Sourceware endpoints failed before any repository was fetched: Windows Schannel `SEC_E_NO_CREDENTIALS`. It is a source-access failure only, not evidence about the proposed mechanism. | continue with retrieved source snapshots; do not claim an exact commit pin |
| ELF GNU hash + dynsym joint constructor | LLVM lld current-source reading | `lld/ELF/Driver.cpp` parses only `--hash-style={sysv,gnu,both}`; `SyntheticSections.cpp` fixes the GNU-hash construction: 12 bloom bits/symbol rounded to a power of two, bucket count `max(n/4,1)`, and destructive stable ordering by `(bucketIdx,strTabOffset)`. | action family exists, but current `main` ref is not SHA-pinned |
| ELF GNU hash + dynsym joint constructor | BFD/ld source reading | The official binutils source mirror shows creation of `.dynsym`, version tables and `.gnu.hash` conditional on `emit_gnu_hash`; the documented option has `sysv`, `gnu`, and `both`, with configure-dependent default. Historic/current source material identifies GNU-hash dynsym renumbering and bucket-count computation paths. | GNU-ld path partially located, all current source/target/config paths not closed |
| ELF GNU hash + dynsym joint constructor | glibc reader check | glibc lookup takes GNU-hash bucket/chain path and retains versioned lookup. ABI-equivalent candidates must update every dynsym-index reference and preserve binding, visibility, versions and relocation semantics. | frozen same-object contract |

