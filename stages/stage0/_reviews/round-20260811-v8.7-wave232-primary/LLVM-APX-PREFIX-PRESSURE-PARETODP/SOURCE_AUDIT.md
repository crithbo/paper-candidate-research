# LLVM-APX-PREFIX-PRESSURE-PARETODP Source and Collision Audit

- Audit role: independent Stage 0 PRIMARY
- Cutoff: `2026-08-11`
- Search disposition: `SEARCH_BOUNDED_OPEN`
- Evidence policy: official upstream source/docs, standards/vendor documentation and original papers only for decision-bearing claims. Transport/cache misses were not treated as evidence of absence.

## Mechanical provenance

- Discovery `HASH_MANIFEST.sha256` self SHA-256: `8B32C1C90DD5BC918EA62E606443A3F230F2576D42841569402EE2AEF3B8125B`.
- All eight manifest entries independently recomputed: `8/8 OK`.
- Key input hashes:
  - `TOPIC_BRIEF.md`: `D5B7892E1CA528C8AA0BEF83EA3A61FF5835233EDCD00081B18679041D234B0A`
  - `SOURCE_COLLISION_MATRIX.md`: `AC80E1281262E39CFB0BB2BB14CB3F461B5EFF949E23CDDDAD806E0CD65F7F28`
  - `CANDIDATE_GRADE_DEEP_REVIEWS.md`: `113910CCCA4FDE9827B54975EAE25BCFD42E646F401021CE6F34D1872D8E957B`
  - `RULE_FREEZE.md`: `FAD291A9A90C9DC619A1468C1A7215F2C4498448CE1A469F9852DDB1F7AA4A00`
  - `handoff.yaml`: `F4006B0D6816DE380AB0477A3E6D8F2A3B845C407CF67A14E3B3764A35B2AC32`

## Current LLVM pin and source files

Discovery short pin `de8cb59` was resolved to LLVM monorepo commit [`a1194be1baefa99d20a09bd04b16056be0ab7225`](https://github.com/llvm/llvm-project/commit/a1194be1baefa99d20a09bd04b16056be0ab7225), dated 2026-07-28. Decision-bearing files were fetched at that full commit, not from moving `main`:

| File | Blob SHA | Relevant observation |
|---|---|---|
| [`X86CompressEVEX.cpp`](https://github.com/llvm/llvm-project/blob/a1194be1baefa99d20a09bd04b16056be0ab7225/llvm/lib/Target/X86/X86CompressEVEX.cpp) | `be02c6375c0b50e872b2a96fbff4a0d380ab6a58` | post-RA redundant NDD compression; non-redundant `ADD32/64*_ND` converts to LEA when no EGPR is used and EFLAGS is dead; relocation interaction and partial-write restrictions are explicit |
| [`X86TargetMachine.cpp`](https://github.com/llvm/llvm-project/blob/a1194be1baefa99d20a09bd04b16056be0ab7225/llvm/lib/Target/X86/X86TargetMachine.cpp) | `932669b5cbac687d98dd46e812507e79501fb741` | relocation-suppression pre-RA pass, ordinary target RA pipeline, post-RA/pre-emit `X86CompressEVEX` and CFI/unwind-sensitive late passes |
| [`X86.td`](https://github.com/llvm/llvm-project/blob/a1194be1baefa99d20a09bd04b16056be0ab7225/llvm/lib/Target/X86/X86.td) | `ab27fb0b6aa10cd4638d44248743af6c3bb1f24c` | EGPR, NDD and related APX feature/tuning definitions are separate; a single “APX on” assumption is insufficient |
| [`X86InstrArithmetic.td`](https://github.com/llvm/llvm-project/blob/a1194be1baefa99d20a09bd04b16056be0ab7225/llvm/lib/Target/X86/X86InstrArithmetic.td) | `c91600525d1eb7204f4469c9edecb5dec16fa0e5` | native arithmetic form grammar and NDD/destructive forms |
| [`X86InstrInfo.cpp`](https://github.com/llvm/llvm-project/blob/a1194be1baefa99d20a09bd04b16056be0ab7225/llvm/lib/Target/X86/X86InstrInfo.cpp) | `f41a68d7d17e0360560c4a428cd84443c8059320` | operand commutation/coalescing and target instruction constraints are part of the comparator boundary |
| [`X86Subtarget.cpp`](https://github.com/llvm/llvm-project/blob/a1194be1baefa99d20a09bd04b16056be0ab7225/llvm/lib/Target/X86/X86Subtarget.cpp) | `ed2da3128b44af9a4c04144f05b81c947868f633` | APX components are 64-bit-only features and parsed separately |

Official LLVM doxygen independently exposes the decisive source condition: [`X86CompressEVEX.cpp` lines around 506–530](https://www.llvm.org/doxygen/X86CompressEVEX_8cpp_source.html) state that non-redundant NDD ADD can be compressed to LEA when no EGPR is used and EFLAGS is dead. This directly contradicts the Discovery witness as written; it does not prove the research residual absent.

## Default/non-default surface

- The official [LLVM APX RFC](https://discourse.llvm.org/t/rfc-design-for-apx-feature-egpr-and-ndd-support/73031) documents NDD-preferred instruction selection, RA hints and post-RA compression.
- LLVM source exposes default-off APX use for relocation through `x86-enable-apx-for-relocation`; the official [doxygen source](https://llvm.org/docs/doxygen/X86SuppressAPXForReloc_8cpp_source.html) records the default and affected EGPR/NDD/NF features.
- Current Clang/LLVM APX controls include positive/negative component feature controls, not just a monolithic target switch; the upstream [CFE commit record](https://lists.llvm.org/pipermail/cfe-commits/Week-of-Mon-20231127/523018.html) gives the ordering semantics.
- GCC 16.1 official [x86 options](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/x86-Options.html) state that `-mapxf` enables EGPR, PUSH2POP2, NDD, PPX, NF, CCMP and ZU, while `-mapx-inline-asm-use-gpr32` separately opts inline assembly into EGPR constraints.
- GNU binutils [APX EGPR RFC](https://sourceware.org/pipermail/binutils/2023-September/129536.html) records REX2, extended EVEX, NDD and legality-test coverage. It is an independent encoding oracle, not a same-LLVM optimization baseline.

## Static witness audit

Discovery froze: low-GPR 32-bit `t = add(a,b)` with `a` live after the add, then asserted that current NDD-first selection remains an approximately six-byte EVEX-NDD form. That assertion is incomplete because EFLAGS liveness was not frozen.

Current source implements:

1. redundant NDD → tied destructive form when destination equals or can commute to a source, subject to partial-write constraints;
2. non-redundant `ADD32/64{ri,rr}_ND` → LEA when no EGPR is present and EFLAGS is dead;
3. relocation suppression before RA and additional post-RA compression behavior.

Therefore the old witness is `INVALID_AS_DECISIVE`. A finite corrected witness is plausible but unproven: make EFLAGS live after the ADD, keep `a` live after it, forbid EGPR by the frozen placement, and compare native EVEX-NDD with a low-register `mov32 + destructive add32` that preserves the same flags. The revision must confirm all native forms, sizes, boundary liveness, partial-register and ABI/CFI conditions. No experiment result is required at Stage 0.

## Algorithm/state audit

The proposed quotient identifies placements by permutations inside low-GPR and EGPR banks. Current x86 constraints invalidate this as a general equivalence without refinement:

- fixed operands and reserved/fixed registers;
- 8/16/32/64-bit subregister aliasing and partial writes;
- byte-register and legacy/REX/REX2 encodability distinctions;
- instruction-specific EGPR exclusions and relocation handling;
- caller/callee-saved and calling-convention distinctions;
- stack/frame/PEI/CFI/unwind obligations;
- inline-assembly constraints and trace boundary live-ins/live-outs.

An admissible revision may quotient only by automorphisms preserving every legal transition and every declared cost. It must give the actual state parameterization and bound. The Discovery `3^w` claim is `NOT_ESTABLISHED`, not disproved as a research direction.

## Paper and implementation collision log

| Source | First-party/original evidence | Boundary finding | Classification |
|---|---|---|---|
| LLVM APX design/current source | official RFC, exact pinned files, developer meeting [slides](https://www.llvm.org/devmtg/2023-10/slides/quicktalks/Maslov-APXandAVX10.pdf) | directly covers known legal actions and sequential production composition, including LEA fallback; no exact Pareto trace guarantee observed | strongest `METHOD_COMPONENT_COLLISION` |
| Castañeda Lozano et al., Unison | original paper DOI [10.1145/3332373](https://doi.org/10.1145/3332373), open preprint [arXiv:1804.02452](https://arxiv.org/abs/1804.02452) | integrates register allocation and scheduling using combinatorial optimization; absorbs a generic CP/solver formulation, but not automatically an APX-specific quotient theorem | `METHOD_KERNEL_COLLISION` |
| LLVM Greedy/PBQP and PBQP genealogy | official LLVM codegen docs; Buchwald et al. DOI [10.1007/978-3-642-19861-8_4](https://doi.org/10.1007/978-3-642-19861-8_4) | covers mature allocation/coalescing optimization; requires a new formal state/guarantee rather than retuned costs | `GENERIC_KERNEL_SUBTRACTOR` |
| GCC APX | official GCC options and upstream NDD [patch series](https://gcc.gnu.org/pipermail/gcc-patches/2023-November/636604.html) | independent compiler implementation and missed-optimization boundary; not the same LLVM object | `INDEPENDENT_METHOD_SUBTRACTOR` |
| Intel APX | official [assembly syntax](https://cdrdv2-public.intel.com/817241/817241-apx-asm-syntax.pdf) and [software-enabling introduction](https://cdrdv2-public.intel.com/784265/356112-intel-apx-sw-enabling.pdf) | defines ISA, flags and ABI-facing action legality; not an optimization algorithm | `OBJECT_AUTHORITY` |

Bounded searches covered APX + NDD + compiler/register allocation/code size, LLVM APX + Pareto/DP, and direct exact-object terms across ACM/arXiv/LLVM/GCC. No source found in that bounded set meets all `DIRECT_FATAL` facets: same pinned MachineIR trace, APX action grammar, Pareto target, quotient-state method, formal guarantee, and full-cost claim. This is `SEARCH_BOUNDED_OPEN`; later direct evidence can still stop the topic.

## Fair comparator/action catalog

The complete comparator catalog must include:

- legacy destructive, REX2/EGPR, EVEX NDD/NF and compatible LEA forms;
- copy-plus-destructive, commute/coalesce, spill/reload/rematerialization where legal;
- fixed/alias register restrictions, caller/callee-save and trace-boundary obligations;
- PEI/frame/CFI/unwind and relocation suppression;
- current Greedy and PBQP RA, current post-RA compression and a finite declared LLVM tuning/feature grid;
- generic same-grammar CP/Unison subtractor and an exhaustive small-trace oracle.

Omitting any of the above can create a false residual. Conversely, the existence of these known actions does not by itself absorb a new sound quotient algorithm/guarantee.

## Source-integrity conclusion

- Direct fatal collision: `NOT_ESTABLISHED`.
- Discovery current-source claim: `MATERIALLY_CORRECTED`.
- Same object: `DEFINABLE_WITH_EXPLICIT_TRACE_BOUNDARY`.
- Structural residual: `CONDITIONAL_ON_SOUND_APX_TRACE_QUOTIENT_CERTIFICATE`.
- Resource blocker: none.
- Recommended decision contribution: `REVISE_ONCE`, not PASS and not scientific STOP.
