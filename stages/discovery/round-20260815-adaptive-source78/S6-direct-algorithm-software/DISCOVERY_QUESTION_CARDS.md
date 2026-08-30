# Discovery question cards

## QC-S78-01 — GNU find expression/traversal construction

- Exact public identity: GNU Findutils `find` 4.10 current manual; fixed directory tree, expression/options and emitted-action/exit semantics.
- Carrier: `IMPLEMENTATION_CARRIER_ONLY`; versioned Findutils test tree/expression would be required for later execution.
- Same-object contract: tests may be reordered only if the entire visible expression/action behaviour is preserved; side-effecting predicates remain order constrained. Changed tree, action, predicate or output is out of scope.
- Hypothesis: METHOD_ALGORITHM/N2, a joint test ordering/traversal plan with exact effects plus metadata-I/O/CPU/RSS guarantee.
- Full cost: directory enumeration, stat/readdir calls, predicate/action CPU/RSS, syscalls, output/action work and wall time; no measurements were run.

### Identity preflight

Bounded registry/plan terms `gnu find optimizer`, `findutils optimizer`, `find expression optimization` had no all-five-field match. `NO_MATCH__NOT_NOVELTY_INFERENCE`. R61 and all held/terminal identities named in the Source78 contract, including Mach-O compact-unwind, Go export-data and GCC gcov-data, were not reopened.

### Current union and decisive subtraction

- Official Findutils documentation fixes expression semantics and distinguishes tests, actions and operators; expressions are evaluated per file with short-circuit rules.
- The documented `-Olevel` union includes default level 1 reordering, higher levels and a full cost-based query optimizer. It explicitly preserves overall effect by not reordering side-effect predicates relative to each other.
- A purported same-object two-action witness is already a predicate plan in this union, or is a generic cost-based query/short-circuit planning kernel. Moving a side-effecting action across its legal barrier changes observable semantics; moving a pure test is precisely the native optimizer's domain.
- Cheapest falsifier: one pure name test, one inode-requiring test and one side-effecting action. The official optimizer either legally reorders the pure predicates or retains action order; any extra plan either duplicates this or violates same-object effects.

### Disposition

- RAW_REQUIRED: INCOMPLETE — no target-specific non-generic residual survives the current optimizer union.
- `EXCLUDED_BEFORE_RAW__CURRENT_COST_BASED_FIND_OPTIMIZER_PLUS_GENERIC_QUERY_PLANNING_KERNEL`.
- This structural exclusion has no dependence on absent implementation/results/resources/AI readiness; no closure queue or deep review.
