# LLVM-PPC-PREFIX-PRESSURE-PARETODP — Stage 0 revision 1

## Decision

`RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW` — conditional `TIER_B_Q2_VIABLE`.  Revision **1/1 is consumed** by the integrated static certificate below.  It establishes a same-object algorithmic research design only; it does not claim a compiled output, a measured gain, a natural occurrence, or a completed theorem.  Stage A/B remain unauthorized.

## Atomic proposition and fail-closed boundary

**PPCREL34 ELFv2 trace proposition.**  On the pinned Power10/ppc64le Linux ELFv2 medium-code-model contract, there is a finite native action algebra that jointly selects direct non-GOT PCREL34 values or materialized addresses, then preserves all PowerPC register/ABI/spill/frame/relocation/link actions.  `PPC-TPD` computes the exact Pareto frontier on a declared bounded native action interface, or emits a certified interface-cap failure.  Its state does not identify arbitrary physical registers or call a generic RA solver.

**Falsifier.**  The proposition fails if the direct path is a GOT `PLDpc` relaxation; if either form changes binding, ABI, code model, ELF or semantics; if a quotient loses a legal future native action/cost; or if the recurrence reduces to generic trace DP, ILP/CP/Unison, identity enumeration or scalar prefix weighting.  Any of these triggers `BELOW_Q2_STOP__CURRENT_PCREL_ACTION_OR_GENERIC_RA_SOLVER_COLLAPSE`.

## Frozen object

The object is one pre-form MachineIR trace with fixed program semantics, alias facts, Power10 features, ppc64le Linux ELFv2 ABI, medium code model, `dso_local`/hidden symbol binding, fixed call clobbers, frame/unwind requirements and linker input.  Only form/address/RA/coalescing/spill choices for fixed addressable operations may change.  The output must be accepted by the ordinary assembler and `ld.lld`, retain matching typed relocation semantics, unwind/DWARF legality and observable program behavior.

The candidate does **not** change source/CFG, visibility, relocation model, linker, ABI, program object, profile, or access ordinary LLVM configuration controls.  `ppc-pcrel-linker-opt=true` and `ppc-late-peephole=true` are in the strongest current union; disabled variants are only finite negative controls.

## Native action divergence witness

Let `L` be a defined, non-preemptible local or hidden 64-bit object in the same link unit: no GOT target flag, no PLT/TLS access and no interposition.  Its two fixed fields are at `L+0` and `L+8`.  At pre-form MachineIR level the trace has two loads separated by a call that clobbers caller-saved general registers:

```
  ; D: direct loaded values, one typed PCREL34 relocation per use
  %v0:g8rc = PLDpc target-flags(ppc-pcrel) @L
  BL8_NOP @opaque_call                 ; normal ELFv2 call/clobber contract
  %v1:g8rc = PLDpc target-flags(ppc-pcrel) @L+8

  ; M: address value plus normal loads, same semantic result
  %a:g8rc  = PADDI8 $r0, target-flags(ppc-pcrel) @L
  %v0:g8rc = LD 0, %a
  BL8_NOP @opaque_call
  %v1:g8rc = LD 8, %a
```

`D` has two direct `R_PPC64_PCREL34` value accesses and has no address temporary live across the call.  `M` creates an address-typed `%a`; keeping it across the call requires a legal callee-saved assignment with save/restore or a typed spill/reload.  The alternatives are semantically equal only for the frozen nonvolatile load/alias contract, but they create different native liveness, frame and relocation action sets.

This is deliberately outside the current GOT linker optimization: current `PPCPreEmitPeephole::isGOTPLDpc` requires opcode `PLDpc`, a global symbol and a **GOT** target flag.  `L` is non-GOT/local/hidden.  The `ld.lld` distinction is likewise material: a `pld` can denote a loaded value while `paddi` produces an address, so the materialized sequence cannot be silently replaced by the GOT load optimization.  Ordinary PCREL34 relocation application remains in the current link semantics and is modelled as a typed terminal action, not claimed absent.

The witness establishes action divergence, not an improvement.  Stage A must compile this exact target/relocation contract, inspect relocation records and unwind, and reject the entire mechanism if the specified non-GOT forms are not accepted or a current union action produces the same trace/guarantee.

## Complete current action union

The comparator composition comprises: current LLVM instruction/form selection; greedy and PBQP register allocation; coalescing, spilling, frame/prologue/epilogue and unwind; default-on PPC pre-emit/PCREL linker optimization; MC typed relocation emission; `ld.lld` PCREL34 and GOT-PCREL34 processing; and the finite legal configuration grid.  Form-fixed/current-RA and form-aware/fixed-RA are mandatory ablations.  GCC/binutils are deployment subtractors, while Unison/CP/ILP are model/audit subtractors only.

The candidate action catalog maps each stage explicitly: `D/M` form kind; value-kind (`loaded` versus `address`); symbol/binding/relocation pair; allowed PowerPC register-role transition; coalesce/copy; native spill/frame action; MC emission; and link action.  A GOT `PLDpc` pair is present as a current-union action but excluded from the witness and cannot be relabelled as `D`.

## PPC-TPD future-action quotient and guarantee

Build the complete trace interaction graph whose edges include def/use, memory/alias, call clobber, frame/unwind, relocation-pair and linker-label constraints.  For a fixed nice path decomposition with live native interface width `w`, a state is:

`(i, boundary values with kind {loaded,address}, symbol-binding/relocation status, fixed operand/register-class constraints, explicit ABI role and caller/callee status, live interference and remaining use ports, spill/frame/unwind obligations, current PPC pre-emit/link-label status, declared Pareto costs)`.

Registers are not arbitrarily renamed.  Each retained register resource is represented by its native action signature: physical identity where it has reserved, `r0`, `r1` stack, `r2` ELFv2 TOC, call-clobber, callee-save, subregister or instruction-implicit behavior; only resources with identical complete signatures in the frozen trace may share a counted multiplicity.  A future use that distinguishes a resource keeps it explicit in the boundary.  Thus no unbounded physical assignment or hidden identity set is smuggled into the quotient.

State equality requires identical labelled future ports, typed relocation/link status, ABI/frame obligations and complete Pareto vector.  It consequently preserves every legal future `D/M`, RA, copy/coalesce, spill/reload, call, prologue/epilogue, MC and lld transition, plus the declared cost.  The recurrence introduces/forgets values at complete boundaries, applies one typed native transition, and removes only exact componentwise-dominated equal-interface states.  It returns a checkable action predecessor trace.

For the displayed interface width `w`, number of explicit native register-role resources `r`, and fixed PPC action alphabet, the recurrence is exact in `O(N·f(w,r))`, exponential in those visible parameters.  No general polynomial or unrestricted register-allocation claim is made.  If a trace exceeds its frozen interface cap it returns `INTERFACE_CAP_EXCEEDED` with its full live-interface transcript, rather than a beam/heuristic result.  Text bytes, typed relocation records, spill/copy/frame bytes, static uop proxy, compiler/link work and optimizer/model work are declared costs; runtime remains Stage-A measured.

This is target-specific N2 because the future equivalence depends jointly on PowerPC direct-value/address distinction, PCREL relocation/link labels and ELFv2 ABI register/frame actions.  Removing those terms reduces it to the rejected generic RA/scheduling kernel.

## Finite Stage-A fidelity and no-gain killer

Before any claim-bearing execution, Stage A must pin the LLVM/LLD source, CPU features, triple, ELFv2, code model, binding, assembler and linker.  It first compiles the witness, checks `llvm-mc`/assembler acceptance, `llvm-readobj` relocation type/addend, `objdump` instruction form, linker output, DWARF/unwind and semantic test oracle.  It then runs 10–50 public LLVM PPC tests/Test-Suite functions against the complete union and records optimizer/model, compile/link CPU/RSS, text, relocation, spill/copy/frame, verification and runtime costs.

The pre-registered killer is: no valid direct/non-GOT pair; any object/relocation/unwind/semantic failure; current composition/grid reproducing the candidate action or guarantee; cap-only/non-action frontier; or no p50/p90 full-cost Pareto residual.  Missing implementation or a current positive result is not a Stage-0 inference.

## Conclusion

The unique gate is closed at the research-design level: a direct non-GOT PCREL34 witness, full current union map, future-native-action preserving quotient, honest exact bounded-interface guarantee and finite falsifier are supplied together.  Route only to an independent closing review; do not authorize Stage A/B.
