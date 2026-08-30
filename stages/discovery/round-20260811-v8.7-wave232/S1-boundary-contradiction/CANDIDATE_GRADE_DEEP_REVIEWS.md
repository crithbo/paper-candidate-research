# Candidate-grade deep review — D01

## Current composition and divergence certificate

Intel APX supplies EGPRs, REX2, and EVEX NDD forms. The current LLVM APX design material says to prefer NDD during instruction selection, give RA a coalescing hint when profitable, then compress NDD to destructive form when possible for code size. The direct source/documented strategy is sequential.

Let W be a low-register 32-bit trace:

```
a, b, c are live in r0–r7 class; a is used after I
I: t = add(a, b)       // a must remain available after I
```

At `I`, current NDD-first selection has `t = ADD_NDD a,b`; source `a` is not killed, so coalescing `t` with `a` would change W and the documented compression condition cannot apply. Its APX EVEX form has the four-byte EVEX prefix plus opcode/ModRM class (about 6 bytes). A same-information alternative is `u=mov32 a; u=add32 u,b`; for low 32-bit GPRs, both legacy encodings are two-byte class, totaling 4 bytes. It has two arithmetic/frontend instructions rather than one. Neither alternative changes values, ABI, frame/unwind or target.

Thus the current sequential heuristic and a code-size-constrained joint decision provably diverge on W. The certificate does not claim the 4-byte path wins a throughput objective; it proves a real Pareto conflict requiring an explicit objective.

## Proposed N2: APX Prefix-Pressure Pareto Dynamic Programming (APX-P3)

**Input.** A hot trace of MachineIR instructions, its fixed liveness, legal APX encoding table, fixed APX subfeatures and ABI constraints, and budgets `(B_bytes, B_uops, B_spill)`.

**State at instruction i.** `(P, L, H, S, q)` where `P` is the partition of currently live virtual values into equivalence classes of interchangeable low-GPR placements, `L/H` identify low-register versus EGPR residency, `S` records pending spill/callee-save obligations, and `q` is the bounded Pareto cost vector. The state is quotient-reduced by permutations inside the low and EGPR register banks; it does not enumerate arbitrary physical-register names.

**Transition.** For the next MachineInstr, enumerate only its finite legal APX form classes: legacy destructive, REX2, EVEX-NDD, copy-plus-destructive, spill/reload, and ABI-required save/restore. Update liveness, coalescing feasibility, prefix bytes, uops and spill/frame cost; reject illegal operand/register/ABI/unwind states. Pareto-dominate equal `(P,L,H,S)` states.

**Output.** The Pareto frontier of legal trace realizations, with a deterministic selector only after the user chooses a declared primary objective/budget. A selected realization is emitted through the existing LLVM backend—no custom assembler or wrapper.

**Guarantee.** For a single acyclic trace whose maximum simultaneously live allocatable values is `w`, APX-P3 returns every nondominated realization under the supplied local encoding table and budgets. With `F` finite form classes, the quotient-state DP is fixed-parameter in `w`, bounded by `O(n · F · poly(w) · 3^w · Q)` time and `O(3^w · Q)` retained states, where `Q` is the retained bounded Pareto frontier. The exact constants and table will be verified at StageA.

**No-gain boundary.** If `w ≤ 16` and no instruction has a legal NDD/REX2 alternative, or if every NDD source is killed so current post-RA compression yields the destructive form, APX-P3 returns the current-form class; no claim of improvement is made. General cyclic CFGs, interprocedural allocation, unknown inline assembly and any changed ABI are outside the initial theorem/claim.

This is not generic ILP: the state space is a finite APX encoding grammar with low/EGPR bank symmetry, source-liveness condition for NDD compression, and ABI save obligations. It expressly retains the byte/uop/spill Pareto structure that scalar register costs discard.

## Latest collision and fairness

The direct current collision is LLVM’s own APX policy: NDD-first, RA hint, and conditional compression. It does not offer a stated bounded trace algorithm preserving an encoding/front-end Pareto frontier. Generic combinatorial RA/scheduling (Unison) is a necessary subtractor, but it is neither a current LLVM APX backend realization nor the APX-specific quotient DP/guarantee above; StageA must compare against it where available or state its resource boundary. A scalar target cost adjustment, PBQP/greedy choice, or generic solver alone does not reproduce the declared state/guarantee.

## Finite fidelity closure / 72-hour killer

1. Materialize LLVM `de8cb59`; confirm each W encoding using LLVM assembly and binutils objdump, including default/non-default APX subfeatures.
2. Implement only the trace-level APX-P3 prototype at the LLVM MachineIR boundary; verify original output and DWARF/unwind metadata on 10–20 public LLVM test-suite integer-pressure functions.
3. Killer K1: any W action selected by APX-P3 fails assembler/objdump or ABI/unwind oracle — stop.
4. Killer K2: on the predeclared corpus, every APX-P3 frontier point is identical to the full current LLVM composition in `(bytes,uops,spills)` — stop for no residual.
5. Fair comparison records compile CPU/RSS, object bytes, prefixes, spill/frame work and static throughput before any hardware claim. llvm-mca and APX hardware are evidence routes only; missing hardware caps the ceiling, not admission.

## Verdict

`PROPOSE_STAGE0` — `TIER_B_Q2_VIABLE` conditional on the finite closure. Structural paper potential is Tier B: a target-specific exact/FPT algorithm, static divergence certificate, no-gain theorem boundary and full-cost evaluation route. Current evidence readiness is `READY_TO_CLOSE_IN_STAGEA`; no implementation or positive result is claimed.
