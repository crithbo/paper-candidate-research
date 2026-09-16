# Source and collision matrix

| source (primary/official) | role | collision/reality conclusion |
|---|---|---|
| [LLVM lld `SyntheticSections.cpp`](https://raw.githubusercontent.com/llvm/llvm-project/main/lld/ELF/SyntheticSections.cpp) | current native GNU-hash writer | Directly shows lld's bloom sizing, `Shift2`, bucket/chain serialization, stable bucket+string-offset ordering and dynsym reordering. Any proposal must subtract this full constructor. |
| [LLVM lld `Driver.cpp`](https://raw.githubusercontent.com/llvm/llvm-project/main/lld/ELF/Driver.cpp) | current flag parser | Confirms `--hash-style=sysv|gnu|both`; no source-supported assertion is made that these are every relevant linker flag. |
| [LLVM lld `Writer.cpp`](https://raw.githubusercontent.com/llvm/llvm-project/main/lld/ELF/Writer.cpp) | dynsym/version/relocation production ordering | The writer adds dynamic symbols after relocation scan and finalizes dynsym before GNU hash/version sections; section-order flags are not evidence of arbitrary dynsym reordering. |
| [GNU binutils ld manual](https://sourceware.org/binutils/docs/ld.pdf) | official option semantics | `--hash-style` admits sysv/gnu/both and has configuration-dependent default. It does not prove complete source action coverage. |
| [GNU binutils source mirror, `bfd/elflink.c`](https://raw.githubusercontent.com/bminor/binutils-gdb/master/bfd/elflink.c) | BFD dynamic-symbol/version/GNU-hash creation path | Supports location of the writer path only. Its retrievable snapshot cannot substitute for a 2026-08-11 immutable official commit pin. |
| [glibc `dl-lookup.c`](https://codebrowser.dev/glibc/glibc/elf/dl-lookup.c.html) | stock-loader oracle | Supports GNU-hash plus version-aware resolution contract. |
| [GNU hash proposal/specification](https://sourceware.org/pipermail/binutils/2006-October/049450.html) | format semantics | Supports bloom/bucket/chain structure, not current writer absence. |

**Latest direct-collision judgment:** lld's native constructor is a direct subtractor; GNU ld/BFD is a second required subtractor. Since GNU ld's frozen current complete union is not closed, a non-absorption conclusion would be unsupported. No scholarly collision claim is made beyond this source-level direct-implementation collision.

