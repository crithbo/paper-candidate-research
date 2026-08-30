# Source78 S5 RQ candidates

## Primary RQ — S78-01

**Exact anchor.** The current Eclipse JDT.LS repository changelog identifies release 1.53.0 (19 November 2025) changes intended to avoid unnecessary Maven project rebuilds on a window reload and reports performance work around build/configuration behavior.

**Same-object question.** For a fixed Java workspace, source/configuration update sequence, JDT.LS configuration, and stock diagnostics/LSP responses, can a target-native online workspace-state constructor provide a bounded-recourse or amortized update guarantee that is outside the current native rebuild/update union?

**Counterfactual.** A positive result would change only maintenance of language-server workspace state, while retaining the Java project and client-observed diagnostic semantics.

**Minimum falsifier.** A current JDT.LS/JDT source-and-config contract that directly expresses the purported transition, or a finite public edit stream where the construction cannot preserve stock diagnostics/LSP behavior.

**Disposition.** RQ_BACKLOG__CURRENT_ACTION_UNFROZEN. The current release record gives an exact problem anchor but not a complete current native action union, a concrete source locus, or a versioned public natural edit carrier. It is not evidence-qualified raw.
