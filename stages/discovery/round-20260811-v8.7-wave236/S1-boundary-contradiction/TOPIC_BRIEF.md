# Topic brief — RVV-GMSP

## Proposed Stage0 ID

`S1-W236-RVV-GMSP`

## Core contribution

RVV Group-Mask Spill Pareto DP jointly selects existing legal RVV LMUL-group placement, `v0` mask reservation, whole-register versus typed spill/reload representation, and compatible `vset*` transitions for a bounded hot trace. It returns an exact local Pareto frontier rather than using a scalar register-pressure heuristic or local spill rewrite.

## Same-object fairness contract

Same LLVM RVV MachineIR/liveness, ABI, VLEN, target, vtype, results and exceptions. Fair baseline is the entire current LLVM RVV pipeline: vector RA, register classes/hints/spills, `RISCVInsertVSETVLI`, scalar RA, pseudo expansion and MC. GCC and other RVV work are external subtractors. No modified VLEN/ABI/ISA, wrapper, custom scheduler, or generic solver is allowed.

## N1/N2/N3

- N1: none.
- N2: exact/FPT, RVV-specific bounded-trace Pareto algorithm with alignment/mask/vtype state and a no-gain boundary.
- N3: none.

## Static witness

An LMUL=8 live group plus a `v0` mask window and a fractional temporary creates two legal same-semantics spill representations: whole-register spill with no extra vtype setup, or typed partial spill with possible `vset*`. Current vector-first RA cannot include a later inserted vset cost when assigning the groups; GMSP chooses both jointly under a declared budget.

## Natural route / oracle / full cost

Natural carriers are public LLVM RVV test-suite/vectorized loops and RISC-V ratified high-register-pressure examples. Oracles are compiler verifier, RVV assembler and disassembly, vtype/ABI checks and deterministic output; CPU/simulator is a later execution route. Full cost: compile CPU/RSS, text bytes, vset count, spills/reloads and their bytes, mask moves, scalable frame, static uops, runtime/memory.

## StageA killer

Validate the finite action table and prototype only on 10–20 public traces. Stop if illegality occurs, every GMSP point matches complete current LLVM, or an identical direct algorithm/guarantee collision appears.

## Potential/readiness

`structural_paper_potential: TIER_B_Q2_VIABLE`.

`current_evidence_readiness: READY_TO_CLOSE_IN_STAGEA`.
