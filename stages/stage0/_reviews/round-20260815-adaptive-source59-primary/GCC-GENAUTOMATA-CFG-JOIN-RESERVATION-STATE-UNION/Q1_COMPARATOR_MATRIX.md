# GCC-GENAUTOMATA-CFG-JOIN-RESERVATION-STATE-UNION Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: compiler backend / code generation / architecture-aware compilation
- Calibration status: `PARITY_NOT_PLAUSIBLE`
- Quality tier: `BELOW_Q2_STOP`
- Search/cutoff date: 2026-08-15

## Reference set

| Role | Paper/source | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Makarov, *The Finite State Automaton Based Pipeline Hazard Recognizer and Instruction Scheduler in GCC* | GCC Summit primary paper | domain primary anchor, not a quartile claim | 2003 | relevant union-state/state-explosion discussion | Same artifact genealogy and adverse feasibility anchor |
| EVALUATION_ANCHOR | Current GCC main `genautomata.cc` + GCC Internals pipeline description | official implementation/docs | native comparator authority | commit `af0cf36...` | relevant source symbols/options | Defines current action union and native semantics |
| DOMAIN_NEIGHBOR | 2006 GCC User Summit VLIW/interblock scheduling proceedings | primary adjacent | adjacent systems/compiler evidence | 2006 | bounded relevant section via Discovery ledger | Interblock scheduling adjacency, not exact action coverage |
| BOUNDARY_OR_NEGATIVE_ANCHOR | Standard DFA powerset/collecting semantics and abstract-domain coarsening | formal boundary | generic algorithmic subtractor | classical | mechanism-level reduction | Deletes GCC labels without changing recurrence/guarantee |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | join-point pipeline precision | GCC source and 2003 paper identify motivation | useful but narrow | insufficient alone |
| Contribution type | target-specific N2 exact/FPT/frontier | generic powerset/abstract domain | target specificity absent | fatal |
| Nearest-prior delta | generated CFG join state sets | 2003 already names union states | implementation gap remains, conceptual delta thin | adverse |
| Algorithm/mechanism substance | set creation, pointwise lift, coarsening | standard collecting semantics | no invariant/recurrence unique to reservation automata | fatal |
| Baseline strength/fairness | current flag union + generic exact/coarsened | source/docs support union | can be made fair | closed statically |
| Natural workload/platform | public target `.md` + two-predecessor regression | selected AArch64 scheduler test lacks required join | carrier not closed | bounded-open |
| Full-cost coverage | generator/bytes/compile/runtime/quality | state explosion explicitly known | no measured frontier | readiness gap, not STOP cause |
| Main result/statistics | none at E1 | Stage0 does not require | absent | ceiling only |
| Ablation/mechanism evidence | none | Stage0 does not require | absent | ceiling only |
| Scale/generalization | bounded join width proposed | generic powerset scaling | no target-specific bound | fatal |
| Failure boundary | state explosion/cap/no-gain | 2003 + generic complexity | honest boundary possible | cannot restore novelty |
| Artifact/reproducibility | commit/source/options pinned | official source/docs | no build/replay | E1 honest |

## Reviewer-shape assessment

- Editor/venue-fit view: source gap is real, but paper kernel reads as an application of standard state-set propagation rather than a publishable compiler algorithm.
- Methodology view: exactness is inherited from powerset collecting semantics; certified coarsening is inherited from ordinary abstract interpretation unless a new reservation-specific invariant is supplied.
- Domain-contribution view: current GCC plumbing could be useful engineering, but frozen route excludes an implementation/system contribution and requires N2 substance that is absent.
- Devil's-advocate view: even a positive code-quality result would not by itself cure the label-stripping failure; it would show utility of a generic technique in GCC.

## Decision

- Quality tier: `BELOW_Q2_STOP`
- Status: `PARITY_NOT_PLAUSIBLE`
- Closed gaps: current commit, source absence narrowing, flag/action union, formal reduction, full-cost dimensions.
- Executable next gaps: none under this frozen assignment.
- Human/resource-dependent gaps: exhaustive latest collision and exact natural join carrier remain bounded-open but are not decision-critical.
- Bounded near-Q1 gaps: none; contribution-shape failure precedes venue calibration.
- Gap that would invalidate the paper: already present—no GCC/target-specific algorithmic residual after label stripping.
- Why this is calibration rather than novelty or baseline evidence: the matrix measures paper shape; novelty/current-native claims are supported separately in `SOURCE_AUDIT.md` and the report.
- Why Tier B is not met: same-object can be frozen, but the contribution is formally absorbed by generic machinery before natural evidence/full-cost execution matters.
