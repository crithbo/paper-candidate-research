# Source65 RQ

## S65-RQ-01

- Anchor: Scala Center Zinc 1.0 documentation, plus current sbt/Zinc source locator, accessed 2026-08-15.
- Object/contract: Zinc incremental Scala compilation; generated code identical to a clean compile.
- Primary RQ: Can a Zinc-native bounded-recourse constructor reduce compilation after class-level API changes while retaining exact Scala compiler outputs?
- Excludes generic graph maintenance, external cache wrappers, scheduling, and changed compiler semantics.
- Falsifier: Zinc's current class-based invalidation/analysis union already expresses the action, or residue is generic dynamic graph maintenance.
