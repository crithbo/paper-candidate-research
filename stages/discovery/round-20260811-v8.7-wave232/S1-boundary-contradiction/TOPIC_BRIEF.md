# Topic brief — APX-P3

## Proposed Stage0 ID

`S1-W232-APX-P3`

## Thesis

APX Prefix-Pressure Pareto Dynamic Programming (APX-P3) is a trace-level, encoding-aware register/form constructor for LLVM’s APX backend. It computes the nondominated tradeoff among EGPR residency, REX2/EVEX-NDD forms, copies, spills and ABI saves under a declared byte/uop/spill budget, instead of applying the current NDD-first → RA-hint → opportunistic-compression chain.

## Exact object and fairness contract

Same LLVM `de8cb59` MachineIR/liveness, APX target/subfeatures, x86-64 ABI/frame/unwind semantics, source-program values and exceptions. The strongest executable baseline is the complete current LLVM APX chain: ISel/form choice, greedy/PBQP allocation, coalescing/spills, PEI, post-RA and MC emission. GCC APX is a method subtractor; binutils is the independent encoding legality oracle. No changed calling convention, postprocessor, custom assembler or target toggle is allowed.

## N1/N2/N3

- N1: none claimed.
- N2: APX-P3’s quotient-state dynamic program and exact bounded-trace Pareto guarantee over known legal actions.
- N3: none claimed.

## Static certificate

For a 32-bit low-GPR live-source addition, current NDD-first selection chooses an EVEX-NDD form that cannot be compressed when the source remains live; a same-semantics `mov32 + destructive add32` uses the 4-byte legacy encoding class. The candidate maintains both as Pareto points and selects by an explicit budget, whereas the baseline sequence has already committed to NDD before RA.

## Natural route, oracle and full cost

Natural carrier: LLVM test-suite and public compiler-regression integer-pressure functions. Oracles: compiler verifier, LLVM assembly acceptance, binutils objdump encoding, unwind metadata and deterministic output. Denominator: compile CPU/RSS, text/object/prefix bytes, move/spill/reload/callee-save/frame work, static uop/frontend estimate, then cycles/memory where APX hardware is available.

## Finite StageA killer

Within 72 hours, pin LLVM, validate W, implement trace prototype, and inspect 10–20 public functions. Stop if legality/unwind fails or every candidate frontier point exactly matches current LLVM in bytes/uops/spills. Hardware absence is not a scientific stop.

## Potential and readiness

`structural_paper_potential: TIER_B_Q2_VIABLE`.

`current_evidence_readiness: READY_TO_CLOSE_IN_STAGEA`.

The potential is conditional: no positive performance claim, implementation claim, or complete novelty result is made in Discovery.
