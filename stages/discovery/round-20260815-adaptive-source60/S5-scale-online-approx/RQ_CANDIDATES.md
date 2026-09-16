# Source60 S5 RQ candidate

## S60-RQ-01

- Seed: S60-01; exact public anchor: OpenJDK/Oracle current Class Data Sharing documentation, accessed 2026-08-15.
- Tentative object: a HotSpot Application CDS dynamic archive layered on the base archive, with standard class-loading output and reader acceptance unchanged.
- Primary RQ: Can a target-native, bounded-recourse construction retain exact AppCDS archive semantics under versioned application-class churn while improving the complete archive construction/reuse cost over stock static-plus-one-dynamic archive generation?
- Immutable boundary: no changed JVM class loading, class path, archive validation, or stock reader format; excludes external caches, policy-only triggers, and multi-layer formats beyond stock reader acceptance.
- Counterfactual: a valid construction would make archive maintenance usable across versioned application releases without exchanging startup correctness for a different reader protocol.
- Minimum falsifier: current official union already creates/recreates the same archive layers automatically, or any purported residual needs a third reader-visible archive layer.
- Primary route: current Oracle Java command/CDS documentation plus OpenJDK JEP/source locus. Fallback: other current official OpenJDK documentation only.
- FINER-lite: feasible CONDITIONAL; novelty threat HIGH; scope fit PASS; relevance CONDITIONAL.
- Selected for ordinary closure: YES. No optional RQ: all alternatives either change stock reader semantics or reduce to a generic rebuild schedule.
