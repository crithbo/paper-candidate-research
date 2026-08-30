# Source83 S5 RQ candidates

## Primary RQ — S83-01

**Exact anchor.** Ninja's current manual documents command-change tracking in .ninja_log, internal compact storage of generated dependencies in .ninja_deps, dynamic dependencies, and the recompact operation.

**Same-object question.** For a fixed Ninja build graph, update sequence and stock dirty-target/output semantics, can a target-native dependency-state constructor give a nontrivial bounded-recourse or amortized guarantee beyond the current native action union?

**Counterfactual consequence.** A valid result would change maintenance of Ninja's dependency state while preserving exact rebuild decisions and build outputs.

**Minimum falsifier.** The current native union already covers capture, compact storage, dynamic dependencies and recompact, leaving only generic graph scheduling or generic log compression.

**Disposition.** RQ_BACKLOG__CURRENT_UNION_ANCHOR_NO_NONGENERIC_ACTION. Current primary documentation establishes multiple relevant native state actions, but no union-external target-specific action or versioned natural carrier is frozen. No absence claim is made.
