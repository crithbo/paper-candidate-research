# Source101 S6 primary research-question candidates

## RQ-S101-01 — Skyframe

For a fixed Bazel workspace, target request, toolchain, and edit trace, can a whole-object incremental-update constructor preserve the stock clean-rebuild output while improving rebuild cost beyond Skyframe's current invalidation/re-evaluation composition?

Endpoint: identical build outputs and dependency semantics; numerator would be update work; denominator includes graph mutation, evaluation, I/O, memory, and clean-build verification. Falsifier: a target-specific action is only generic dynamic-dependency-graph update/invalidations, or the present union/direct literature absorbs it.

## RQ-S101-02 — GHC nonmoving GC

For a fixed executable, RTS options, heap/allocator trace, and observable program behavior, is there a target-specific joint construction of old-generation collection phases that gives a non-generic certified latency/space frontier beyond GHC's copying/nonmoving collector choices?

Endpoint: identical language and runtime semantics; denominator includes mutator time, collector CPU, pause behavior, peak residency, and event-log overhead. Falsifier: the proposal is only collector selection/heap-parameter control or ordinary concurrent mark-sweep scheduling.

## RQ-S101-03 — SpiderMonkey Warp JIT

For a fixed script, inputs, type/shape feedback, and JavaScript semantics, can a native joint specialization/deoptimization construction yield a target-specific certified code-quality/compilation-cost frontier beyond Warp's current builder/oracle/bailout composition?

Endpoint: stock JS observable behavior and deoptimization correctness; denominator includes compile CPU, code bytes, cache/memory, execution latency, and bailout recovery. Falsifier: the proposal is a generic compiler pass selector, trace controller, or generic optimization scheduling problem.
