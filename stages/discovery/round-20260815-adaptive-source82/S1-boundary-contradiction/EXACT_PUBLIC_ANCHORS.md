# Exact public anchor

## A01 — OpenMP detachable-task completion

- Exact identity: OpenMP 5.2 `task detach(event)` plus `omp_fulfill_event(event)` for one fixed task graph, dependences, structured block, and observable completion order.
- Immutable endpoint: same task output, happens-before/dependence behavior, task completion, and event lifetime semantics.
- Official specification: <https://www.openmp.org/spec-html/5.2/openmpse73.html> and <https://www.openmp.org/spec-html/5.1/openmpsu187.html>.
- Current implementation locus: LLVM OpenMP runtime `kmp_tasking.cpp`, documented at <https://openmp.llvm.org/doxygen/kmp__tasking_8cpp_source.html>.
- Natural carrier: asynchronous I/O, MPI, and GPU-stream asynchronous routines used from OpenMP detachable tasks; the official 5.2 examples explicitly use these carriers.

This anchor freezes a task-completion semantic object. It is not evidence that a new runtime algorithm exists.
