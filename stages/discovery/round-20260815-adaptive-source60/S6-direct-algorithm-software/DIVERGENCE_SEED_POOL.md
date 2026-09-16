# Source60 S6 — non-evidence divergence seed pool

- Assignment / lane: `DISCOVERY-S6-20260815-ADAPTIVE-SOURCE60-R40-ORDINARY-BREADTH-V1 / S6`
- Frozen profile: ordinary R40 breadth; anchor-first and selective depth `OFF`.
- Network-security exclusion check: `PASS`.
- Generation completed before evidence lookup: `YES`.

| Seed | Engine / lens | Two-sentence sketch and cautious conclusion | Anchor candidate | Pre-evidence identity / disposition |
|---|---|---|---|---|
| S01 | `COMPOSE_DECOMPOSE_SIMPLIFY`; compiler engineer | GCC shrink-wrapping has to choose prologue/epilogue placement together with unwind/CFI-visible frame-state regions.  If successful, the cautious conclusion is a target-ABI-specific bounded constructor for legal frame-state placement, not a new scheduler. | GCC shrink-wrap documentation and source | `KEEP_FOR_CONVERGENCE` |
| S02 | `CONSTRAINT_MANIPULATION`; backend engineer | OpenJDK C2 SuperWord must jointly select vector packs, alignment and dependence cuts under Java memory semantics.  A useful result would need to exceed generic SLP packing with a bounded target-specific guarantee. | OpenJDK HotSpot SuperWord source | `KEEP_FOR_CONVERGENCE` |
| S03 | `BISOCIATION_STRUCTURAL_TRANSFER`; compiler engineer | LLVM MachineOutliner has a global candidate-conflict selection problem, but the bounded registry hit may already cover it.  It is retained only as a historical identity check. | LLVM MachineOutliner source | `ACTIVE_OR_STOP_IDENTITY` |
| S04 | `PROBLEM_REFRAMING`; systems algorithm | Souffle relation-index selection could be framed as a query-semantic constructor rather than a configuration choice.  Existing Source03 wording signals a likely absorbed or unclosed family, so it is not selected without evidence delta. | Souffle source | `ACTIVE_OR_STOP_IDENTITY` |
| S05 | `ADJACENT_POSSIBLE_OR_BOUNDARY`; language implementation | GHC pattern-match compilation can couple decision-tree tests with strictness/coverage obligations.  A paper would need a guarantee beyond normal decision-tree compilation. | GHC compiler source | `KEEP_FOR_CONVERGENCE` |
| S06 | `NEGATION_OR_INVERSION`; compiler engineer | GCC interprocedural mod/ref summaries trade bounded precision for compile memory.  The candidate would be a target-program-specific abstract-summary constructor, but generic static-analysis abstraction is an immediate risk. | GCC IPA mod/ref source | `KEEP_FOR_CONVERGENCE` |
| S07 | `JANUSIAN_TENSION`; runtime engineer | JVM class hierarchy analysis is both aggressively speculative and deoptimization constrained; a whole constructor could jointly choose dependency summaries and invalidation certificates.  This risks becoming a controller or generic analysis. | OpenJDK CHA/dependency source | `KEEP_FOR_CONVERGENCE` |
| S08 | `ABSTRACTION_LADDER`; theory/tool engineer | Clang static-analysis graph merging can trade path precision for space with a semantic oracle.  The likely security adjacency and generic abstraction kernel make it a high-risk non-selected seed. | Clang Static Analyzer source | `KEEP_FOR_CONVERGENCE` |

## Clustering and convergence

| Cluster | Seeds | Representative | Reason |
|---|---|---|---|
| Frame and ABI construction | S01 | S01 | distinct target-ABI semantics and stock unwind oracle |
| Vector/code selection | S02 | S02 | strongest generic-kernel risk; reserve only |
| Historical containment checks | S03, S04 | none | prior registry evidence is not reopened |
| Program-analysis construction | S05–S08 | S05 | GHC decision-tree object has a clear language-semantic carrier |

Selected before source lookup: S01 and S05.  S02 remains a precommitted reserve only for literal/repetition failure, not scientific-result replacement.  S03/S04 are excluded as already reviewed identities; S06–S08 remain non-evidence backlog.

`DIVERGENCE_COVERAGE_ADVISORY: PASS` — six ideation engines and compiler/runtime/theory perspectives were represented; no seed is a scientific denominator.
