# Candidate-grade deep review — QC99-01

## HotSpot C2 partial escape analysis

- Same object: Java behavior, C2 compilation and deoptimization semantics remain fixed.
- Candidate mechanism: a bounded partial-escape construction that scalar-replaces objects in cases missed by flow-insensitive EA.
- Current source and direct subtractor: current `escape.cpp` is the active C2 locus; OpenJDK's status material records the flow-insensitive boundary, and its Partial Escape Analysis RFC explicitly introduces a C2 phase to enable scalar replacement beyond that boundary.
- Strongest fair comparator: current C2 EA/SRA plus the first-party partial-EA construction, under the same compiler/semantic contract.
- Full-cost that a valid study would need: compile CPU/wall/RSS, generated-code size, runtime allocation/lock traffic, application runtime and deoptimization behavior.
- Natural route/oracle: versioned OpenJDK regression/application inputs; JVM functional tests and deoptimization-sensitive behavior as oracle.
- 72-hour falsifier: compare the exact action and guaranteed C2 cases in the RFC/status materials against any proposed construction. A same action/endpoint makes it direct subtraction.
- Disposition: `DROP__DIRECT_SUBTRACT_ABSORPTION`. The current bounded evidence already identifies the same target-specific construction family; a remaining story is generic EA refinement, not an independent S6 opportunity.
