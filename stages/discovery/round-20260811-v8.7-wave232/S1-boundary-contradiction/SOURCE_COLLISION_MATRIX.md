# SOURCE_COLLISION_MATRIX

| role | first-party source | finding |
|---|---|---|
| APX legal action table | [Intel APX introduction](https://www.intel.com/content/www/us/en/developer/articles/technical/advanced-performance-extensions-apx.html) | APX provides EGPR/REX2 and EVEX NDD; Intel notes prefix length versus fewer instructions/code density. |
| direct current LLVM APX subtractor | [LLVM APX developer-meeting material](https://www.llvm.org/devmtg/2023-10/slides/quicktalks/Maslov-APXandAVX10.pdf) | Documents current NDD-first selection, RA coalescing hint, and compression to non-NDD when possible for code size. This establishes the sequential strongest composition. |
| pinned LLVM target | [LLVM X86 target source](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/X86/X86.td) | APX feature definitions and non-default CF handling at pinned-main provenance. |
| allocator composition | [LLVM Code Generator](https://llvm.org/docs/CodeGenerator.html) | Greedy RA minimizes spill cost; PBQP represents RA as PBQP; PEI/post-RA interfaces are documented. |
| direct algorithmic subtractor | [Combinatorial Register Allocation and Instruction Scheduling](https://arxiv.org/abs/1804.02452) | Generic combinatorial integrated RA/scheduling is a required comparator, but is not an APX-specific LLVM trace Pareto algorithm or guarantee. |
| GCC and encoding legality | [GCC APX options](https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html) and [binutils APX discussion](https://sourceware.org/pipermail/binutils/2023-September/129536.html) | Independent APX generation and legal REX2/extended-EVEX constraints must be checked in StageA. |

No future-work or missing-source claim supports this proposal. Latest direct collision is treated as a baseline and static divergence source, not as evidence of absence.
