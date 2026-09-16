# SOURCE_COLLISION_MATRIX

| evidence role | first-party source | fact used |
|---|---|---|
| pinned LLVM provenance | [LLVM upstream main](https://llvm.googlesource.com/llvm-project/llvm/) | `main` observed at `de8cb59` during the frozen-date check. |
| APX target features/current defaults | [LLVM X86 target source at main](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/X86/X86.td) | EGPR/NDD/PPX/NF/CCMP/ZU/CF feature declarations; CF explicitly non-default for APXF. |
| allocation/frame/post-RA union | [LLVM CodeGen passes](https://github.com/llvm/llvm-project/blob/main/llvm/include/llvm/CodeGen/Passes.h) | Current greedy/PBQP allocation and PEI/post-RA pathways are explicit existing mechanisms. |
| ISA/ABI software boundary | [Intel APX introduction](https://www.intel.com/content/www/us/en/developer/articles/technical/advanced-performance-extensions-apx.html) and [Intel software-enabling guide](https://cdrdv2-public.intel.com/784265/356112-intel-apx-sw-enabling.pdf) | EGPR, REX2 and NDD are legal APX primitives, not proposed actions. |
| method subtractor | [GCC x86 options](https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html) | `-mapxf` documents independently implemented APX generation. |
| legality oracle | [binutils APX EGPR source discussion](https://sourceware.org/pipermail/binutils/2023-September/129536.html) | REX2 and extended-EVEX restrictions/assembler support delimit legal encodings. |

## Current-upstream and latest-collision closure

The review positively checked current LLVM upstream state at the pinned revision and direct APX implementation surfaces. No old issue, future-work statement, or missing artifact is used as proof of a gap. The remaining question is internal joint-cost propagation, not current feature absence; it therefore blocks a brief as `UNFROZEN` rather than supporting novelty.
