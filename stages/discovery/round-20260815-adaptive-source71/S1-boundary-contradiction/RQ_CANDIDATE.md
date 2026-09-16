# Primary research-question candidate

`RQ-S71-01`: For a fixed LLVM IR function/call graph with `musttail` calls, fixed calling convention/ABI attributes, and fixed return/unwind semantics, can a target-specific whole-function construction reduce stack/frame or code-generation cost while retaining the mandatory tail-call guarantee beyond LLVM's current tail-recursion elimination?

- Tentative contribution: N2 / `COMPILER_TOOL`.
- Counterfactual consequence: a backend would select a different legal call-frame construction, not a flag or generic cleanup motion.
- Non-generic discriminator sought: a target-specific legal action under exact `musttail` rules, with a formal non-worse stack/ABI guarantee.
- FINER-lite: the specification makes legality answerable, current LLVM pass gives the direct subtractor, and a negative result prevents an artificial compiler paper.

The RQ was frozen before the current subtractor was read. It did not enter raw: the specification fixes the required tail-call form, while LLVM already performs the only generic semantics-preserving recursion transformation; making ineligible sites eligible changes the return/ABI/side-effect contract.
