# LLVM-PPC-PREFIX-PRESSURE-PARETODP — Source and Collision Audit

- Review date: 2026-08-11
- Method: current-upstream reality check plus bounded primary-source/paper search. No experiment, benchmark, source-tree modification, or absence inference from a failed transport was used.
- Status: `SEARCH_BOUNDED_OPEN`; this is explicitly not a novelty proof.

| Source | Type / status | What was checked | Finding and audit effect |
|---|---|---|---|
| [Power ISA v3.1](https://ftp.libre-soc.org/PowerISA_10_public_v3.1.pdf) | Official ISA | Prefixed load semantics | For prefixed load forms, `R=1` uses CIA plus a sign-extended 34-bit displacement. A direct PC-relative access can differ from materializing an address, but legality must be pinned per form. |
| [LLVM main `PPCPreEmitPeephole.cpp`](https://github.com/llvm/llvm-project/blob/f127b4c19c63b0492fb924934e37e032c17ea35b/llvm/lib/Target/PowerPC/PPCPreEmitPeephole.cpp) | Current primary source | `EnablePCRelLinkerOpt`, `RunPreEmitPeephole`, `PLDpc`, GOT def/use pairing | Both flags default true; native code recognizes GOT `PLDpc` and can add PCREL linker optimization. Any GOT-based “no temporary” witness is absorbed/invalid. |
| [LLVM main `PPCMCCodeEmitter.cpp`](https://github.com/llvm/llvm-project/blob/f127b4c19c63b0492fb924934e37e032c17ea35b/llvm/lib/Target/PowerPC/MCTargetDesc/PPCMCCodeEmitter.cpp) | Current primary source | PCREL target flags and relocation emission | Typed relocation/action state is necessary; a bare relocation count is incomplete. |
| [LLVM main `PPCELFStreamer.cpp`](https://github.com/llvm/llvm-project/blob/f127b4c19c63b0492fb924934e37e032c17ea35b/llvm/lib/Target/PowerPC/MCTargetDesc/PPCELFStreamer.cpp) | Current primary source | PPC ELF PCREL emission / optimization labels | Confirms MC-side pairing/label semantics that candidate must preserve. |
| [LLVM main `lld/ELF/Arch/PPC64.cpp`](https://github.com/llvm/llvm-project/blob/f127b4c19c63b0492fb924934e37e032c17ea35b/lld/ELF/Arch/PPC64.cpp) | Current primary source | PCREL34 and GOT-PCREL34 relocation/relaxation | Implements 34-bit relocation encoding and specific relaxations. It notes `paddi` needs an address whereas `pld` may be optimized, so loaded-value versus materialized-address state cannot be conflated. |
| [LLVM PPC pre-emit Doxygen](https://llvm.org/doxygen/PPCPreEmitPeephole_8cpp.html) | Official generated source docs | Default/non-default flags | Independently confirms `ppc-pcrel-linker-opt` and `ppc-late-peephole` default true. |
| [LLVM PPC source API](https://llvm.org/docs/doxygen/classllvm_1_1PPCInstrInfo.html) | Official generated source docs | `isPrefixed`, instruction size | Prefixed classification is existing native machinery, not novel action. |
| [LLVM Triple API](https://llvm.org/docs/doxygen/classllvm_1_1Triple.html) | Official generated source docs | ELFv2 target test | Confirms ABI must be a frozen property. |
| [LLVM lld documentation](https://lld.llvm.org/) | Official documentation | PPC/PPC64 support | lld is a legitimate same-object linker constituent, not an omitted external step. |
| [GCC PowerPC options](https://gcc.gnu.org/onlinedocs/gcc-11.1.0/gcc/RS_002f6000-and-PowerPC-Options.html) | Official documentation | `-mprefixed`, `-mpcrel`, CPU options | GCC exposes prefixed and pcrel as architecture/codegen controls; it is a deployment subtractor. |
| [GCC 14 PowerPC options mirror linking official manual](https://docs.w3cub.com/gcc~14/rs_002f6000-and-powerpc-options) | Documentation mirror of official manual | `-mpcrel` constraints | Records that `-mpcrel` requires medium code model and prefixed addressing; used only as corroboration, not primary evidence. |
| [GNU as PowerPC options](https://www.sourceware.org/binutils/docs/as/PowerPC_002dOpts.html) | Official documentation | Power10 architecture option | Assembler action legality depends on the selected architecture. |
| [Lozano et al., TOPLAS 2019](https://doi.org/10.1145/3332373) | Peer-reviewed research | Integrated combinatorial RA/scheduling | Strong generic solver/subtractor. It does not establish PPC PCREL34/ELFv2 action completeness. |
| [Lozano & Schulte, ACM CSUR 2019](https://doi.org/10.1145/3200920) | Peer-reviewed survey | CP/IP/PBQP/enumeration genealogy | Prevents generic optimization repackaging. |

## Collision conclusion

1. **Direct current-source absorption exists for parts of the action set:** prefixed classification, PCREL GOT `PLDpc` def/use recognition, optimizer annotations, MC relocation emission, and lld PCREL34 relaxation.
2. **No verified direct paper/current-source collision was found for the exact full certificate:** one complete PPC ELFv2 action grammar + future-preserving trace quotient + target-specific exact/FPT Pareto guarantee spanning form, address kind, RA/spills, and relocations.
3. The second statement is not an absence proof. A revision must repeat a focused collision check after the exact grammar is named.

## Source-quality and limitation note

Current source/ISA/docs are authoritative for behavior; research papers are used only for genealogy and paper-shape calibration. Web/source retrieval established an observation pin but did not execute compiler code. All claims are restricted accordingly.
