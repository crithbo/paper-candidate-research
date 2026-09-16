# Source and collision matrix

| Family | First-party source | Current strongest composition / collision status |
|---|---|---|
| F1 BOLT | [LLVM BOLT function-layout review](https://reviews.llvm.org/D153039) | Existing BOLT function-reordering/code-layout algorithm is a direct comparator; current source/options and latest paper closure incomplete. |
| F2 SquashFS | [Linux SquashFS documentation](https://docs.kernel.org/filesystems/squashfs.html) | Native writer/reader and fragment/block action union requires a current source/flag audit. |
| F3 GNU linker | [GNU Binutils source](https://sourceware.org/git/binutils-gdb.git) | Current linker backend/scripts/relaxation action union and direct layout collision incomplete. |
| F4 CPack | [CPack Archive Generator](https://cmake.org/cmake/help/v3.29/cpack_gen/archive.html) | Archive packaging is a wrapper rather than a credible direct-algorithm residual. |
| F5 BTF | [Linux BTF documentation](https://docs.kernel.org/bpf/btf.html) | Existing registry/lane review; excluded as repeat. |
| F6 ORC | [Apache ORC specification](https://orc.apache.org/specification/ORCv0/) | Existing registry/lane review; excluded as repeat. |

The matrix does not claim that unclosed sources lack an action. It identifies the bounded work needed before any N2 residual statement can be made.
