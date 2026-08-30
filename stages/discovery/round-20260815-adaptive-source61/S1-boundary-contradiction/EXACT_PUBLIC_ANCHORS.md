# Exact public anchor

## A01 — OpenMP 5.2 detached task / `omp_fulfill_event`

- Exact anchor/version: OpenMP API Specification Version 5.2, Git revision `95b2e3a44`, observed 2026-08-15.
- URL: https://www.openmp.org/spec-html/5.2/openmpse73.html
- Fixed object: a detached explicit task and its allow-completion event, with the same task completion, dependence, event-destruction, and OMPT-visible semantics.
- Primary current route: current LLVM libomp tasking source and its early/late fulfill tests.
- Boundary: body completion and event fulfillment may occur in either order, but completion requires both.
