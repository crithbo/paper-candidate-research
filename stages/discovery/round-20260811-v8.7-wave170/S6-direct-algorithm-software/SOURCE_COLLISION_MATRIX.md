# Source and collision matrix

| primary/official source | frozen support | implication |
|---|---|---|
| [glibc current `dl-lookup.c`](https://codebrowser.dev/glibc/glibc/elf/dl-lookup.c.html) | Dynamic lookup reaches GNU bucket/chain state and handles versioned lookup. | Defines stock reader/oracle semantics. |
| [GNU hash format announcement/specification](https://sourceware.org/pipermail/binutils/2006-October/049450.html) | Defines bloom shift, bucket and chain relation to `.dynsym`. | Defines legal action interface. |
| [GNU ld manual](https://sourceware.org/binutils/docs/ld.pdf) | Documents `--hash-style` choices. | Freezes declared linker format union only. |
| [LLD official documentation](https://lld.llvm.org/) | LLD is a drop-in replacement for GNU linkers. | Identifies second current producer requiring independent source closure. |
| [ELF gABI dynamic linking](https://refspecs.linuxfoundation.org/elf/gabi4+/ch5.dynamic.html) | Standard dynamic symbol hash-table context. | Keeps reader/relocation semantics in-scope. |

Latest collision/current-source cutoff: 2026-08-11. No issue, future work or unverified implementation-absence claim is used.
