# Conditional Stage 0 brief — LLVM MachineOutliner global candidate selection

**Recommendation:** `PROPOSE_STAGE0` with `FINITE_FIDELITY_GAP`, subject to independent collision and source-path closure.

## Research claim package

For a fixed MachineIR module and fixed target ABI/unwind/relocation semantics, construct a target-cost-aware globally compatible set of native machine-outlining replacements.  The proposed N2 is an exact/FPT Pareto algorithm over bounded conflict components, using only candidate/frame/call actions accepted by the existing target hooks.  It aims to certify a code-size/runtime frontier that the current repeated suffix-tree selection need not enumerate.

This is not pass ordering, a flag selector, a generic interval solver, or a new machine-code semantics.  Its decision variables are complete outline-candidate groups, conflict constraints, target frame/call costs and metadata coupling.  Its comparator is the full current MachineOutliner union, including current local/global code-generation-data modes and target backend hooks.

## Evidence, boundary and cost

- Current source: [MachineOutliner implementation](https://llvm.org/doxygen/MachineOutliner_8cpp.html) and [native legality/candidate interface](https://www.llvm.org/doxygen/MachineOutliner_8h_source.html).
- Historical direct subtractor: [LLVM's original outlining material](https://llvm.org/devmtg/2016-11/Slides/Paquette-Outliner.pdf).  Current external collision is bounded open, not a novelty conclusion.
- Natural route: versioned LLVM Test-Suite/Clang MachineIR; native verifier, object inspection and regression execution.
- Full-cost denominator: selection and compile CPU/RSS/temp; code bytes; relocation/unwind metadata; and any runtime/code-size effect.  No gain is claimed for modules with no legal repeated candidates, a conflict graph with one feasible choice, or target hooks that make every candidate non-profitable.

## Finite fidelity closure plan

1. Pin a target backend and enumerate target `getOutliningCandidateInfo`/frame/call legality paths plus global CGData options.
2. Create a tiny supported-target MIR witness with two mutually incompatible candidate groups and regenerate all calls/frames through native hooks.
3. Exhaustively enumerate legal sets on that witness and compare the target-cost Pareto set against the current outliner output.
4. Search same-object global code outlining literature/tools and current target backends.  Drop if an equivalent frontier constructor exists.
5. Before claims, verify MachineInstr legality, object/unwind/relocations, regression behaviour and the full denominator.

**Fast killer:** any failure of native legality/equivalence, direct current-union absorption, or no non-dominated point on the finite witness terminates this exact mechanism.
