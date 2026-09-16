# Source59 S5 RQ candidates

## S59-RQ-01

- Seed: S59-SEED-01.
- Tentative public object: SWI-Prolog dynamic predicate just-in-time clause index.
- Exact public anchor candidate: SWI-Prolog reference manual, “Just-in-time clause indexing,” current documentation accessed 2026-08-15.
- Stable semantics: the answer set and clause-order semantics of a declared dynamic predicate are unchanged.
- Contribution hypothesis: METHOD_ALGORITHM / N2.
- Primary RQ: For a fixed SWI-Prolog dynamic-predicate answer contract, can a target-native bounded-recourse index-evolution construction improve exact lookup/update cost versus the stock discard-and-recreate lifecycle?
- Scope: index maintenance after assert/retract and later bound-argument calls; excludes changing clauses, query answers, Prolog semantics, external databases, or a generic controller.
- Minimum falsifier: current documented native union already exposes a complete same-object construction that covers the proposed action, or the only remaining action is a generic hash/rebuild policy.
- Precommitted primary route: official current JITI documentation and the official `prolog_jiti` source documentation. Fallback only for transport failure: official stable/devel manual.
- FINER-lite: feasible CONDITIONAL; interesting CONDITIONAL; novelty threat HIGH; scope fit PASS; relevant CONDITIONAL.
- Disposition after pre-evidence convergence: RQ_READY_FOR_ORDINARY_CLOSURE.

No alternative RQ was retained: alternatives either changed from dynamic predicates to tabled reasoning or converted the construction into a generic rebuilding policy.
