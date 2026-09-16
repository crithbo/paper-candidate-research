# Source56 S6 — evidence-qualified question card

## QC-01: GCC machine-description instruction recognizer

- **Exact public anchor:** GCC target machine-description (`.md`) instruction patterns and the current `genrecog` producer, which emits recognizer code used with the fixed GCC RTL/predicate/constraint semantics.
- **Same-object problem / estimand:** preserve accept/reject and selected instruction-pattern recognition for the same machine description and RTL input; account for producer CPU/RSS/temp, generated recognizer bytes, and recognition CPU/RSS/latency.
- **Contribution type / endpoint:** `COMPILER_TOOL / N2` only if a target-specific whole recognizer constructor gives a non-generic exact, FPT, approximation, or certified Pareto guarantee beyond GCC's current composition.
- **Counterfactual:** a qualifying method would jointly determine pattern-test order, sharing and decision structure using a named target-specific invariant. A changed `.md`, a generic tree solver, a flag selector, or a wrapper is outside the fixed object.
- **Current loci:** official GCC internals pages for machine descriptions and predicates; `gcc/genrecog.cc` current source locus exposed by the upstream mirror query.
- **Minimum falsifier:** current source already performs the proposed decision-tree construction/optimization, or only a generic decision-tree residual remains.
- **Finite closure:** one versioned GCC target MD and GCC test route can compare recognizer decisions under fixed semantics; no build or execution is authorized in Discovery.
- **Raw-gate result:** `STRUCTURAL_DROP__CURRENT_ACTION_COMPOSITION_AND_GENERIC_KERNEL`. The source's stated algorithm builds decision trees, removes redundant tests, CSEs/folds tests, and extracts common subtrees; GCC's official predicate docs further state `genrecog` optimizes based on normal-predicate modes. No target-specific algorithmic/guarantee delta was identified after that subtraction.

No alternate RQ was opened; the object is not ambiguous.
