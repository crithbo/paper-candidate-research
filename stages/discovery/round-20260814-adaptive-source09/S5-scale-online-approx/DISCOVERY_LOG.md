# Discovery log — Source09

## Frozen envelope

- Assignment: `DISCOVERY-S5-20260814-ADAPTIVE-SOURCE09`
- Lane: `S5_SCALE_ONLINE_APPROX`; cutoff 2026-08-14.
- Canonical method: `V8_7_POTENTIAL_READINESS_SEPARATED`; V9 / claim-pack mode is `OFF`.
- Gate: every raw row names target state, a target-specific guarantee promise and a stock/formal checker route. A clean brief still requires two same-object legal actions, a union-external atomic action, fair union, full-cost and a finite falsifier.

## Raw screening

| Signature | Exact object and guarantee promise | Checker-backed finite falsifier | Raw result |
|---|---|---|---|
| `OPENJML_JAVA_JML__STATIC_CONTRACT_VERDICT__VERSIONED_VC_FRONTIER_RECONSTRUCTION__VERIFY_CPU_RSS_COST` | Fixed Java/JML program, selected JML clauses and static-deductive verification boundary. Promise: bounded-recourse reconstruction of a target-specific VC/proof frontier preserving the clause verdict. | Versioned tutorial/example program; stock ESC verdict or reported verification failure. | `RAW_TARGETED_GUARANTEE_GAP__DEPTH_SELECTED` |
| `MOVE_PROVER_PACKAGE__MODULE_SPECIFICATION_SEMANTICS__OPAQUE_CONCRETE_STATE_ABSTRACTION_FRONTIER__PROVE_CPU_RSS_COST` | Fixed Move package, storage semantics and specified module property. Promise: a certified Pareto/frontier construction across implementation- and specification-based summaries while preserving the exact prover contract. | Public package, `aptos move prove` verdict and diagnostic. | `RAW_TARGETED_GUARANTEE_GAP__DEPTH_SELECTED` |
| `VERIFAST_RUST_UNSAFE_MODULE__SEPARATION_LOGIC_CONTRACT__BOUNDED_OWNERSHIP_SUMMARY_RECONSTRUCTION__VERIFY_CPU_RSS_COST` | Fixed unsafe Rust module, RustBelt-style contract and UB-safety/functional postcondition. Promise: bounded-recourse update of a modular ownership-summary construction. | Official Rust reference example and verifier success/failure. | `RAW_TARGETED_GUARANTEE_GAP__ACTION_NOT_CLOSED` |
| `SAW_LLVM_JAVA_RUST__EQUIVALENCE_OR_SPEC_VERDICT__CERTIFIED_SYMBOLIC_SUMMARY_FRONTIER__SOLVER_MEMORY_COST` | Fixed LLVM/Java/Rust artifact, SAWScript property/equivalence and its stated semantics. Promise: an error-bounded/certified summary frontier without changing the verified artifact or property. | Official SAW example/property and stock verifier result. | `RAW_TARGETED_GUARANTEE_GAP__ACTION_NOT_CLOSED` |
| `CREUSOT_RUST_COMA_WHY3__CONTRACT_SAFETY_VERDICT__INCREMENTAL_COMA_OBLIGATION_CONSTRUCTION__VERIFY_CPU_RSS_COST` | Fixed Rust contracts and Creusot's Coma/Why3 translation boundary. Promise: target-specific incremental obligation construction preserving panic/overflow/assertion freedom plus contract verdict. | Official test-suite example and stock verifier verdict. | `RAW_TARGETED_GUARANTEE_GAP__ACTION_NOT_CLOSED` |
| `PRUSTI_RUST_VIPER__CONTRACT_VERDICT__BOUNDED_RECOURSE_VERIFICATION_OBLIGATION_FRONTIER__VERIFY_CPU_RSS_COST` | Fixed Rust program/contracts and Prusti verification semantics. Promise: a bounded-recourse obligation frontier preserving its contract/panic/overflow conclusion. | Official guide example and reported counterexample/verdict. | `RAW_TARGETED_GUARANTEE_GAP__ACTION_NOT_CLOSED` |

## Depth closure

### D01 — OpenJML

OpenJML officially distinguishes static deductive verification from runtime assertion checking, enumerates the JML checks, and documents current feature support. This fixes the same-object boundary: Java program, JML specification, selected static checker and a static-check verdict—not a RAC run, whose guarantee covers only a particular execution. A finite falsifier is a versioned source/spec pair for which static checking reports a listed JML obligation failure.

The attempted incremental VC-frontier action was not closed. The bounded snapshot exposes a compiler-like tool, bundled SMT solvers and method/file targeting, but does not establish a legal, target-specific whole-state update action distinct from proof selection, timeout/configuration or generic solver scheduling. A RAC substitution would weaken the guarantee. Disposition: `NOT_ADMITTED_UNFROZEN__WHOLE_ACTION_AND_CURRENT_UNION_NOT_CLOSED`.

### D02 — Move Prover

The official specification language and Aptos guide pin a Move package/property and `aptos move prove` checker. They also explicitly expose `opaque`, `[abstract]` and `[concrete]` specification modes: caller-side abstraction and implementation-side checking are already native semantic actions, subject to documented soundness boundaries. Any proposed frontier merely choosing these modes is therefore directly absorbed; treating an unsound abstraction as equivalent would change the guarantee.

Disposition: `DROP__CURRENT_NATIVE_ABSTRACTION_ACTION_UNION_OR_CHANGED_GUARANTEE`. This is a source-based structural result, not an assertion that incremental Move verification is impossible.

## Final decision

`COMPLETE_ZERO_PROPOSALS`. The four remaining raw rows retain formal/checker routes but did not receive depth because the contract caps depth at two and neither had a closed target-specific whole action. No item is rejected due to missing implementation, result, resources or AI readiness. No brief is created.

## Prohibited work

No experiment, benchmark, E2 smoke, build, installation, large download, V9 output, Stage0/A/B creation, automation, or shared-control write was performed.
