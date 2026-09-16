# Source99 S5 RQ candidate

## S5-99-RQ01

- Exact anchor candidate: OpenJDK Class Data Sharing dynamic archive documentation.
- Stable boundary: fixed JVM class-loading/verification semantics and stock archive acceptance for an application class path.
- Primary RQ: Can a target-native CDS archive constructor maintain the same accepted class metadata set through bounded-recourse online deltas, rather than a whole-application dynamic archive write?
- In scope: archive representation/constructor and explicit exactness/recourse guarantee. Out: JVM launch configuration selection, generic file deltas, packaging policy, or a changed class-loading contract.
- Counterfactual: deployment updates could bound archive write/state movement while retaining startup-compatible archive semantics.
- Contribution hypothesis: METHOD_ALGORITHM/N2.
- Null hypothesis: current static/dynamic archive layering and ArchiveClassesAtExit path already express the complete legal constructor; remaining variation is a trigger/controller.
- Precommitted primary source: official OpenJDK Java SE CDS documentation. Fallback: official JDK tool documentation only for transport failure.
- Disposition: RQ_READY_FOR_ORDINARY_CLOSURE.
