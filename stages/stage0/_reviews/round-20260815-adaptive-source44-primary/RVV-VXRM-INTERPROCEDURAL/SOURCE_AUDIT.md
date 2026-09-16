# RVV-VXRM-INTERPROCEDURAL — Independent Source Audit

## Frozen inputs

| Input | SHA-256 | Result |
|---|---|---|
| PRIMARY assignment | `BDB49A081E50FB02A40A4E5BF9D2DF2ECCB9199DF6E0C084B4E9451CA1EFBF26` | PASS |
| Discovery brief | `1B070FC735938AEDEAA0A0977021431EB8C68E5D1A51F226A519FFB77041610A` | Read only; treated as non-claim-bearing input. |
| Discovery ownership bridge | `279D95983A2DB42615D3948BF87AAFABE69BB88F51160CDB89B091ECBEBA4E7D` | Read only; no inherited conclusion. |
| Discovery source-collision matrix | `DA81CC10E802D48DC1CAF5F18AD0E0FF9AF1ED8C44C415890A3F6D47A72CDDEF` | Rechecked against current source. |
| Discovery handoff | `DACF5A0AEC02AC3495F33B197B19CB62687158F2ED78F48C2018AF43F058F103` | Read only. |

The discovery directory manifest (`7843A611D91EA0283586B92AAF731E134A8027655C56AB04A811A77988062E30`, 8/8 as supplied by the contract) was used only to identify the supplied packet. No other candidate directory was read.

## Current official source and specification record

1. LLVM official repository, `llvm/llvm-project` HEAD, read 2026-08-15: `10b4fa5b79eb9d27b4928ad82afa3847762bc72f` (read-only `git ls-remote`). Relevant paths: `llvm/lib/Target/RISCV/RISCVInsertWriteVXRM.cpp`, `RISCVInsertVSETVLI.cpp`, RISCV vector lowering and register-info paths.
2. [LLVM `RISCVInsertWriteVXRM.cpp` current source](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/RISCV/RISCVInsertWriteVXRM.cpp): header and source state that it inserts required VXRM writes, uses forward available plus backward anticipated dataflow, and intentionally does not split critical edges. Its call path sets the current VXRM state to unknown. The revision must re-open the pinned blob, not rely on this web rendering.
3. [LLVM RVV documentation](https://llvm.org/docs/RISCV/RISCVVectorExtension.html): lowering, register allocation and later VSETVLI insertion are part of the current codegen union.
4. [RISC-V psABI vector convention](https://riscv-non-isa.github.io/riscv-elf-psabi-doc/): `vxrm` and `vxsat` are not preserved across calls and are unspecified on entry.
5. [RISC-V Vector C Intrinsic Specification](https://docs.riscv.org/reference/vector-c-intrinsics/rvv-intrinsic-spec.html): fixed-point intrinsics take a constant VXRM mode; the four constants are RNU/RNE/RDN/ROD; compiler/system chooses redundant-write reduction.
6. [LLVM RISC-V usage documentation](https://github.com/llvm/llvm-project/blob/main/llvm/docs/RISCVUsage.rst): LLVM's RISC-V target and supported ISA context.

## Current-union disposition

The independent reality check **narrows** rather than confirms the discovery absence statement. LLVM already implements a dedicated VXRM write pass; therefore no claim may state that LLVM lacks VXRM-state optimization. The remaining static question is narrower: whether a same-object, fixed-internal-call transfer action can be certified without becoming generic interprocedural dataflow. Current source gives a direct conservative-call locus, but does not itself establish performance or absence of all equivalent current compositions.

## Collision search boundary

Searches included official LLVM source/docs, psABI/spec material, queries for RVV VXRM interprocedural compiler optimization and nearby RISC-V vector code-generation work. No retrieved first-party or primary paper directly established the identical LLVM stock internal-call VXRM transfer/frontier theorem. This is `SEARCH_BOUNDED_OPEN`, not a novelty/absence assertion; revisions and later stages must repeat a current collision review at their own frozen cutoffs.

## Integrity and reproducibility

No external source was downloaded into the workspace, no compiler was built or run, and no candidate implementation or claim-bearing observation was performed. Source evidence supports a static boundary only.
