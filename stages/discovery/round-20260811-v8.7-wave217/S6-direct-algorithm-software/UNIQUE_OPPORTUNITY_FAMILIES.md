# Unique opportunity families

## F1 — joint coverage counter-expression DAG, reference-ID, and stream constructor

**Exact same-object contract.** Given the same instrumented program, source regions/files, and profile-counter meanings, emit a standard LLVM coverage-mapping stream that stock `llvm-cov` parses and whose reported region/branch coverage agrees with the fixed profile. No source change, counter-semantic change, profile change, reader change, external compression, or post-write transformation is allowed.

**Candidate complete action (hypothesis, not established residual).** Select a semantically equivalent shared binary add/subtract DAG; assign every expression index; regenerate every counter/region reference; serialize the file, expression, and region streams. This is materially larger than choosing one emission order, but it only becomes N2 if a nontrivial factoring/size-or-cost guarantee can be stated beyond native builder reuse and local CSE.

**Minimal legal action-divergence witness.** Let two mapping regions each refer to the same derived count `E = C0 - C1`. A legal producer may place `E` at one expression-array index and rewrite both region references; if the array contains enough earlier expressions to cross a ULEB width threshold, a different legal index assignment changes the bytes while preserving the decoded expression graph. This witnesses representation freedom, **not** a union-external algorithm: plain renumbering/frequency ordering is expressly insufficient.

**Why it is not admitted.** The current native expression-builder/writer union, all coverage-generation options, and direct same-object DAG-construction literature were not closed at source level. The witness has not separated a proposed global factorization from existing expression construction/CSE. Therefore F1 is not a grounded opportunity or Stage0 proposal.

**Natural carrier and finite route.** LLVM Test-Suite and LLVM/Clang coverage tests provide public, versioned carriers; a later fidelity gate would use a small branch/loop corpus and stock `llvm-cov show/export` equivalence. They were not downloaded or run here.
