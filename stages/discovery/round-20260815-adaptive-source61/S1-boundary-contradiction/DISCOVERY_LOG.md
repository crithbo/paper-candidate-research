# Discovery log

2026-08-15 — Ordinary R40 screened the detached-task event completion seam. OpenMP 5.2 defines completion as the conjunction of block completion and event fulfillment; libomp source/test material exposes detach, early/late fulfill and the runtime state transition.

With those semantics frozen, no target-specific construction survives: only a generic scheduler/controller decision remains. This is a structural exclusion, not an inference from missing benchmark, hardware, implementation or result. No terminal GCC genautomata record or held queue was read.
