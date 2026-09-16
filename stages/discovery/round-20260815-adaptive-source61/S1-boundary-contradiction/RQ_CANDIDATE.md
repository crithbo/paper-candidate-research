# RQ candidate RQ01

- Exact anchor: OpenMP 5.2 detachable task/event semantics, observed 2026-08-15.
- Primary RQ before current evidence: For a fixed detached-task event/dependence graph, is there a libomp-specific non-generic construction over early/late fulfill state transitions that preserves the same completion and callback semantics with a formal or full-cost guarantee?
- Same-object guarantee: task only completes after body and event; `omp_fulfill_event` destroys its event; no weaker dependence or callback contract.
- Contribution hypothesis: N2/system runtime, conditional only.
- Ordinary closure result: `EARLY_FATAL` — current sources implement the required event states and the surviving intervention is only generic task scheduling.
