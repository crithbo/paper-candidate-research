# Source80 S5 RQ candidates

## Primary RQ — S80-01

**Exact anchor.** The first-party rust-analyzer 2026-07-20 release records reduced in-memory representation sizes and reduced cache-priming scope. Its repository describes the project as a Rust compiler front-end for IDEs, including diagnostics, navigation and completion.

**Same-object question.** For a fixed Rust workspace, update sequence, rust-analyzer configuration and stock diagnostic/navigation/completion semantics, can a target-native online analysis-state constructor provide a bounded-recourse or amortized guarantee beyond the current update union?

**Counterfactual consequence.** A positive result would alter only online maintenance of rust-analyzer state, without changing Rust language or editor-visible analysis semantics.

**Minimum falsifier.** A current source/config union that already expresses the candidate transition, or a finite versioned workspace edit carrier on which all stock outputs cannot be retained.

**Disposition.** RQ_BACKLOG__TARGET_NATIVE_ACTION_UNFROZEN. The release gives a memory/caching anchor, but it does not make a complete target-native action, a versioned natural workspace-update carrier, or a non-generic discriminator available. No current-absence claim is made.
