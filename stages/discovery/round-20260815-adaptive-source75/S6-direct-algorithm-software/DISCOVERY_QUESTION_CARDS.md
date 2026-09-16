# Discovery question cards

## QC-S75-01 — GNU grep fixed-string matcher construction

- Exact public identity: GNU Grep 3.12 fixed-string (`-F`) matching; GNU Project manual last updated 2025, checked 2026-08-15.
- Carrier: `IMPLEMENTATION_CARRIER_ONLY`; a versioned GNU grep test text/pattern fixture would be needed for later execution.
- Same-object contract: fixed inputs/patterns/locale/options, identical matching lines and exit status. Reordering queries, replacing the engine externally or changing byte/locale semantics is excluded.
- Hypothesis: METHOD_ALGORITHM/N2, a joint prefilter/automaton construction with exact output plus construction/search-cost guarantee.
- Full-cost boundary: pattern preprocessing, automaton/prefilter memory, input bytes read, CPU/RSS, output latency and locale-dependent processing; no measurements run.

### Five-field identity preflight

Bounded `registry.yaml`/`plan.md` search for `gnu grep`, `kwset`, `literal matcher`, `commentz` returned no exact all-five-field registered family. This is `NO_MATCH__NOT_NOVELTY_INFERENCE`; Source75 held/terminal names do not match this object.

### Current union and decisive falsifier

- Official GNU Grep 3.12 documentation freezes `-F/--fixed-strings` semantics and states: when feasible, Boyer–Moore is used for one fixed pattern and Aho–Corasick for multiple fixed patterns.
- The current documented native union also includes regex modes, locale effects, binary-data and output controls; none supplies a target-specific new primitive for the fixed `-F` object.
- Candidate two-action witness fails: changing a finite-state prefilter while preserving fixed-pattern matching is exactly the standard multiple-pattern-matching construction; selecting an engine/threshold/cache changes no target-specific algorithmic contract. Coupling sparse I/O or locale policy changes the object/cost information and is not a native constructor claim.
- Strongest contrary is the directly named Aho–Corasick multi-pattern algorithm plus the generic finite-automaton/string-matching kernel. No source or implementation absence is asserted.
- Cheapest falsifier: compare the claimed two-stage action against a fixed finite automaton recognizing the same pattern union. If it preserves output, it is generic matcher construction; if it uses output/locale/I/O policy differences, same-object fails.

### Disposition

- RAW_REQUIRED audit: INCOMPLETE; target-specific non-generic discriminator is false.
- Front-end: `EXCLUDED_BEFORE_RAW__GENERIC_STRING_MATCHING_KERNEL`.
- It is a structural exclusion, not a result/resource/implementation/AI-readiness inference. No candidate-grade deep review or source closure queue is warranted.
