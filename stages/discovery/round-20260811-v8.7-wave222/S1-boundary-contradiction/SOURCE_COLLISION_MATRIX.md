# SOURCE_COLLISION_MATRIX

| role | first-party source | current-source / collision finding |
|---|---|---|
| ISA and ABI/software boundary | [Intel APX introduction](https://www.intel.com/content/www/us/en/developer/articles/technical/advanced-performance-extensions-apx.html) and [Intel APX Software Enabling Introduction](https://cdrdv2-public.intel.com/784265/356112-intel-apx-sw-enabling.pdf) | APX explicitly supplies 16 EGPRs, REX2 and NDD/three-operand forms; APX software/ABI enabling is in scope. |
| LLVM target reality | [LLVM X86 target definition, main](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/X86/X86.td) and [LLVM CodeGen passes, main](https://github.com/llvm/llvm-project/blob/main/llvm/include/llvm/CodeGen/Passes.h) | Current source has APX feature bits; standard global allocator, PEI and post-RA pathways exist. This is positive evidence against an implementation-absence premise. |
| GCC target reality | [GCC x86 options](https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html) and [GCC x86 attributes](https://gcc.gnu.org/onlinedocs/gcc/x86-Attributes.html) | `-mapxf` and per-function `apxf` are documented current enablement. |
| binutils encoding reality | [binutils APX EGPR implementation discussion](https://sourceware.org/pipermail/binutils/2023-September/129536.html) and [REX2 restriction discussion](https://sourceware.org/pipermail/binutils/2025-January/138988.html) | REX2/extended-EVEX encoding, assembler/linker support, and legal-encoding restrictions are first-party upstream facts. |

## Latest-collision conclusion

No paper or old issue is used to infer a missing feature. The direct current collision is incomplete rather than negative: the tools demonstrably expose APX and ordinary allocation/encoding mechanisms, but the full joint decision union has not been source-enumerated. `SEARCH_BOUNDED_OPEN` is not presented as a novelty result.
