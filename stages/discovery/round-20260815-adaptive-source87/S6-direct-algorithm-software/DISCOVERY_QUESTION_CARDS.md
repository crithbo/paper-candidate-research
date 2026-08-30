# Evidence-qualified question-card audit — Source87 S6

## QC-S87-01 — GNU `find` expression optimization

**Exact object and endpoint.** The object freezes a directory-tree snapshot, a GNU Findutils 4.10.0 `find` expression, roots and options. Same-object behavior includes selected files, output order, side effects (`-print`, `-delete`, `-exec`, `-prune`, etc.), diagnostics and exit status; it is not merely an unordered set of matching paths. Carrier: a versioned public source tree. Stock oracle: command trace/output, filesystem after-state, diagnostics and exit status.

**Candidate N2 action.** Construct a whole execution plan jointly choosing predicate evaluation order, `stat` timing and short-circuit branches to improve traversal CPU/RSS/system-call/I/O/output cost under the same endpoint.

**Current union and contrary evidence.** Official Findutils documentation sets default `-O1`, exposes `-O0..-O3`, and states that `-O3` enables the full cost-based query optimizer: cheap predicates run earlier, with success/failure likelihood controlling `-o`/`-a` ordering. It states side-effect predicates are not reordered relative to one another, and supplies a concrete reordering that changes user-visible diagnostics. Expression documentation defines left-to-right short-circuit evaluation, action side effects and `-prune` dependence.

**Minimal action-survival witness.** In `-empty -readable` versus `-readable -empty`, the manual observes different diagnostics on unreadable directories. Thus an action/order divergence changes the frozen endpoint. Restricting all predicates to pure tests with no ordering-sensitive diagnostics/actions enables ordinary Boolean short-circuit/cost-based query planning, already expressed at `-O3`; it has no GNU-find-specific atomic mechanism or guarantee.

**Falsifier, full cost and finite route.** A two-directory readable/unreadable fixture is the smallest static counterexample (not executed). A 72-hour StageA plan would pin 4.10.0, classify expression primaries as pure/effectful, compare `-O1`/`-O3` traces, and reject any candidate whose plan changes output/action/diagnostic semantics or collapses to generic Boolean reordering. Full cost includes traversal CPU/RSS, `stat`/filesystem I/O, output bytes, action subprocess time and filesystem after-state.

**Raw decision.** The required non-generic target-specific discriminator does not survive. Effectful reordering violates the endpoint; pure reordering is current and generic. The locator is therefore not evidence-qualified raw.

**Disposition.** `EXCLUDED_BEFORE_RAW__SAME_OBJECT_EFFECTFUL_REORDERING_CHANGES_OUTPUT_ACTION_OR_DIAGNOSTIC_ENDPOINT_PLUS_CURRENT_GENERIC_BOOLEAN_COST_OPTIMIZER_KERNEL`. Structural only; no inference from unimplemented work, results, resources or AI readiness.
