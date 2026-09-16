# Two targeted current-union closures

## D1 — Paralegal policy-dependence graph construction

- **Exact object / oracle:** fixed Rust source, marker annotations, policy, Rust version, and privacy/security policy answer. `cargo paralegal-flow` / rustc-integrated analysis is the native oracle.
- **Current-source reality:** the current official repository describes a cargo/rustc plugin; the OSDI artifact identifies `crates/paralegal-flow` as PDG constructor, `paralegal-policy` as policy API, and marker annotations. The artifact says the standalone analyzer repository is the latest-use route. Public materials do not freeze a complete retention/summarization mode and non-default-control enumeration.
- **Strongest fair union:** Paralegal PDG construction, policy compiler, marker contract, cargo/rustc integration, and available analyzer configuration. Source, annotations, policy language, and answers stay fixed.
- **Action promise / finite falsifier:** a bounded policy-dependence partition jointly selects summaries and retained MIR bodies. The smallest falsifier is two policy queries sharing one upstream MIR body but requiring incompatible dependency facts: if exact answers cannot be recovered from every legal shared summary, the action is invalid.
- **Disposition:** `NOT_ADMITTED_UNFROZEN`, not an absence claim or DROP. A finite closure route would pin one commit and enumerate PDG storage, cache/summarization, policy compiler, and all controls before testing the witness.
- **Natural/full-cost/72h killer:** OSDI artifact's versioned Rust cases; policy-answer equivalence; PDG construction plus policy-check CPU/RSS/temp/retained-MIR bytes and compilation overhead. Killer: the two-query witness fails exact equivalence, or complete current union expresses the same bounded constructor.

## D2 — Type-Constrained Code Generation incremental completability-state construction

- **Exact object / oracle:** fixed TypeScript prefix, type environment, grammar/language version, and requirement that every admitted prefix has a type-safe completion. The authors' incremental parser is the stock state oracle.
- **Current-source reality:** current official package exposes `typesafe_llm.sampling.sample_constrained`, `typesafe_llm.parser.parser_ts.parse_ts_program`, constrained/unconstrained sampling and trace; it limits implementation to TypeScript and says implementation must be manual per language. Parser state generation already couples to constrained sampling.
- **Strongest fair union:** public incremental parser, constrained sampler, partial states, parser trace, and supported TypeScript configuration with same model information.
- **Action promise / finite falsifier:** a bounded context-interface DP would equate two prefixes while retaining every accepted completion. Minimal falsifier: two prefixes with equal interface summaries but different valid completion sets; any pair breaks the quotient.
- **Disposition:** `STRUCTURAL_DROP__SAME_OBJECT_GUARANTEE_NOT_PRESERVED`. The proposed state merging changes the exact completion-set guarantee or reduces to generic automaton/state minimization; no target-specific non-generic constructor/guarantee closed. This concerns the proposed residual only, not source availability, implementation effort, or resources.
- **Natural/full-cost/72h killer:** public TypeScript/MBPP route; completion-set oracle; parsing/sampling CPU-RSS, state count, tokens and latency. Killer: same-summary prefixes have different accepted completion sets.

## No-brief decision

Neither depth review meets unchanged v8.7 admission: D1 is source/union/collision unfrozen; D2 fails same-object target-specific guarantee. No `TOPIC_BRIEF.md` was created.
