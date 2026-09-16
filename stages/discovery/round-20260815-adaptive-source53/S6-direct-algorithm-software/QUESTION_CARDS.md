# Discovery Question Card — QC01

## Identity

- Card / RQ: `QC01 / RQ01`; Source53 S6; seed S01.
- Exact public identity: GHC `9.15.20260306` User's Guide call-pattern specialisation page, checked 2026-08-15; current API/source documentation page `GHC.Core.Opt.SpecConstr`.
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY`; a future finite route could use versioned GHC testsuite or nofib-style Haskell programs, but none was acquired or executed.
- Network-security exclusion: `PASS`.
- Global identity: GHC five-field lookup is `NO_MATCH`, hence `RELATED_ONLY_DO_NOT_EXCLUDE`; this is not a novelty claim.

## Problem and contract

- Problem: Fixed GHC Core recursive programs can trade redundant pattern matching/allocation work against specialised-code growth and compiler effort.
- Hypothesised insight: a joint specialisation-set constructor would matter only if it had a source-supported, GHC-specific invariant and certified frontier beyond call-pattern specialisation heuristics.
- Same-object contract: same Core input, compiler flags, Haskell observable behavior, and target output semantics.
- Contribution hypothesis: `COMPILER_TOOL / N2`; endpoint: target-native specialisation/rewrite construction with a code-growth/compile/runtime guarantee.
- Initial full cost: Core analysis and transformation CPU/RSS/temp state, generated code/interface bytes, compile/link work, and fixed-workload runtime/allocation effects.

## Ordinary current and contrary closure

- **Current source/docs:** GHC `-fspec-constr` is enabled at `-O2`; current docs specify `-fspec-constr-keen`, per-function count (default 3) and size threshold (default 2000), and describe recursive call-pattern specialisation including `SPEC`-driven aggressive behavior.  The current source documentation exposes `specConstrProgram`, recursive-specialisation limiting and pattern trimming.
- **Contrary/direct source:** Peyton Jones's original `Call-pattern Specialisation for Haskell Programs` describes the same recursive argument-shape specialisation, implementation in GHC, and the necessity of heuristics that choose functions/patterns.  It is a same-object direct collision, not merely methodological adjacency.
- **Action survival result:** A legal one-general-body versus specialised-recursive-variant pair exists, but current SpecConstr already constructs the recursive specialisation and call rewrite; ordinary count/threshold/keen changes are configuration, while a global selection formulation is generic clone selection absent an independently frozen GHC-specific invariant.
- **Minimum falsifier:** a current source path or primary work showing that the purported specialisation set/rewrite action is already produced, or that no semantic structure remains beyond generic weighted candidate choice.  Both are met within this bounded closure.
- **Front-end disposition:** `EXCLUDED_BEFORE_RAW__FROZEN_DIRECT_CURRENT_COLLISION`.

## Bounded debt and honesty

- Complete union, full source genealogy and executable carrier are `NOT_NEEDED_AFTER_DIRECT_FATAL`; their absence is not used as evidence.
- No implementation, benchmark, build, install, result, resource outcome or AI-readiness datum supports this disposition.
- No source closure queue item is created because the decision is a positive direct-collision finding, not source exhaustion.
