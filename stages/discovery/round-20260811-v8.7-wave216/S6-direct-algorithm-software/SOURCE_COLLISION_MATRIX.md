# Source and collision matrix

| Source | Status | Supports |
|---|---|---|
| [GNU hash format description](https://sourceware.org/pipermail/binutils/2006-October/049450.html) | Binutils primary technical record | dynsym suffix/bucket order, bloom, bucket and chain coupling. |
| [GNU ld options](https://www.sourceware.org/binutils/docs/ld/Options.html) | Official GNU documentation | current `--hash-style` action union surface. |
| [glibc loader lookup source record](https://sourceware.org/pipermail/glibc-cvs/2019-q4/msg00482.html) | glibc primary source record | bloom/bucket/chain consumption by dynamic lookup. |
| [LLVM project source](https://github.com/llvm/llvm-project) | Current upstream project | lld is a required same-object comparator, but its full source union remains unclosed here. |

Collision status: `COLLISION_NOT_CLOSED`; no novelty conclusion is made.
