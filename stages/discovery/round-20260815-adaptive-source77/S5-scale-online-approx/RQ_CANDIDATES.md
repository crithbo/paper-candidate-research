# Source77 S5 research-question candidates

## Selected primary RQ: S77-01

**Exact anchor.** Dart SDK current main changelog records Dart 3.11.1 analysis-server performance fixes and Dart 3.11.0 use of an AOT-compiled analysis-server snapshot. The official analyzer-performance page identifies the analyzer as the source of static diagnostics. Sources are listed in ORDINARY_SOURCE_SCREEN.md.

**Same-object RQ.** For a fixed Dart workspace, source-file edit sequence, analyzer options, and stock diagnostic/LSP response semantics, is there a target-native online analysis-state constructor whose edit transition has a nontrivial bounded-recourse, amortized, or approximation guarantee relative to the current native update/rebuild union?

**Counterfactual consequence.** If such a constructor existed, it could reduce online analysis-state work without changing the diagnostic object or reader/client semantics.

**Minimum falsifier.** A current Dart-native source contract showing the complete relevant update action already expresses the proposed state transition, or a finite natural edit trace on which the action cannot retain stock diagnostic semantics.

**RQ disposition.** RQ_BACKLOG__ACTION_AND_CARRIER_UNFROZEN. The retrieved materials establish a startup/AOT boundary, not a source-supported workspace-update state action, an exact current action locus, or a versioned public natural edit carrier. This is not an absence claim.
