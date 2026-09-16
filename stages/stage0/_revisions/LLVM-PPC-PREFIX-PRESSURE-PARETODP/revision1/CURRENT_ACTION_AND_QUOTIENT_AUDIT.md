# Current action and quotient audit

## First-party reality check

Pinned observation source: LLVM `f127b4c19c63b0492fb924934e37e032c17ea35b`; official Power ISA v3.1 and current LLVM/LLD source surfaces.

| Source/action | Verified boundary | Certificate treatment |
|---|---|---|
| Power ISA prefixed PC-relative form | `R=1` permits CIA plus a signed 34-bit displacement for the appropriate prefixed form. | Existing action only; `D` must retain its exact form/relocation semantics. |
| `PPCPreEmitPeephole.cpp` | `ppc-pcrel-linker-opt` and late peephole are default-on. `isGOTPLDpc` requires `PLDpc`, a global symbol and GOT flag. | Full current action.  GOT `PLDpc` is excluded from witness; non-GOT direct PCREL34 is separately typed. |
| `PPCMCCodeEmitter.cpp` / `PPCELFStreamer.cpp` | MC emits PPC target flags and typed relocation/label structure. | Bare relocation counts are insufficient; typed label/pair state is retained. |
| `lld/ELF/Arch/PPC64.cpp` | PCREL34/GOT-PCREL34 application and relaxations exist; a `pld` loaded value differs from `paddi` address semantics. | Link action is part of state; no claim that link relaxation is absent. |
| ELFv2 ABI / frozen call | `r1` stack, `r2` TOC and call/callee constraints distinguish resources. | No arbitrary register permutation; role-complete signatures define any multiplicity. |

## Quotient proof obligation

An equal `PPC-TPD` state has a label-preserving bijection only over the live **future-equivalent ports**, not over arbitrary registers.  It preserves:

1. value kind and all remaining use/alias ports;
2. symbol binding, relocation, GOT/non-GOT and linker-label state;
3. PPC register class, fixed/implicit operand, ABI/caller/callee and frame/unwind obligations;
4. liveness/interference, coalescing and exact legal spill/reload options; and
5. all declared costs.

Therefore future legal native actions have a one-to-one transition correspondence.  If a physical identity matters later, it remains an explicit port and increases `w`/`r`; it is never silently quotiented.  `INTERFACE_CAP_EXCEEDED` is a certified non-result, not a heuristic positive claim.

## Comparator mapping

| Comparator | Covered action | Candidate difference |
|---|---|---|
| Current form selection → RA → spill/frame → link | Deployment composition | Does not provide the specified joint bounded-interface frontier guarantee |
| GOT `PLDpc` pre-emit/lld relaxation | GOT pointer def/use only | Direct non-GOT `R_PPC64_PCREL34` value access and materialized address trace are outside its eligibility boundary |
| Finite LLVM flags | Existing action/config controls | Negative-control union, not an algorithmic certificate |
| CP/ILP/Unison | Generic global model after re-encoding | Oracle/subtractor; cannot replace native recurrence |

Latest direct collision remains `SEARCH_BOUNDED_OPEN`; no absence claim is made.  A closing reviewer must invalidate the recommendation if current native source already constructs the same complete non-GOT action frontier/guarantee.
