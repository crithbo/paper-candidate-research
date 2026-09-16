# Source and collision matrix

| Claim/use | First-party source | Supported fact | Constraint / contrary evidence |
|---|---|---|---|
| Linker-script semantics | [GNU ld Scripts manual](https://sourceware.org/binutils/docs/ld/Scripts.html) | Every link is controlled by a script; scripts describe input-section mapping and output memory layout. | A proposed layout cannot silently change fixed script semantics. |
| Default placement and section order | [GNU ld SECTIONS manual](https://sourceware.org/binutils/docs/ld/SECTIONS.html) | Without a `SECTIONS` command, input sections are placed by first encounter. | User scripts can constrain or replace this freedom. |
| Alignment/address legality | [GNU ld Output Section Address](https://sourceware.org/binutils/docs/ld/Output-Section-Address.html) | Addresses are subject to alignment and scripts/memory regions. | Rules can make purported layout moves illegal. |
| Current GNU source provenance | [GNU Binutils official page](https://sourceware.org/binutils/) | Names development git repository and source snapshots. | No immutable BFD source revision/call-path audit retrieved here; `UNFROZEN`. |
| Strong lld subtractor | [LLVM lld ELF source](https://github.com/llvm/llvm-project/tree/main/lld/ELF) and [LLVM lld documentation](https://lld.llvm.org/) | Current lld source/docs provide ELF linking with GC/ICF/target relocation and thunk mechanisms. | Does not prove what current GNU ld/BFD can or cannot express. |
| Direct algorithmic collision | Not closed with a primary-paper/tool matrix. | — | Open collision blocks admission, not a novelty conclusion. |

Cutoff: 2026-08-11. Sources are official GNU/LLVM documentation or source only.
