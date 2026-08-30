# AIGER-DELTA-SCHEDULE Q1/Q2 Paper Calibration

- Stage: `STAGEA`
- Candidate venue family: logic synthesis / EDA / formal methods
- Calibration status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP__RESOURCE_BLOCKED`
- Quality tier: `TIER_B_Q2_VIABLE` retained from Stage0, not scientifically reassessed
- Search/cutoff date: `2026-08-10`

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Read scope | Current use |
|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Kabiljo/Dhulipala et al., recursive graph bisection | KDD 2016 | top-tier conference equivalent | frozen Stage0 review | algorithmic/compression shape only |
| EVALUATION_ANCHOR | Gagrani et al., neural topological ordering | NeurIPS 2022 | top-tier conference equivalent | frozen Stage0 review | topological-order evaluation shape |
| DOMAIN_NEIGHBOR | Mishchenko et al., DAG-aware AIG rewriting | DAC 2006 | top-tier EDA equivalent | frozen Stage0 review | domain substance; object-changing boundary |
| BOUNDARY_OR_NEGATIVE_ANCHOR | Biere, AIGER format | official specification | authoritative format boundary | frozen Stage0 review | exact codec/reader contract |

No new literature conclusion was drawn during the blocked Stage A attempt.

## Comparator matrix

| Dimension | Candidate status | Required parity | Current gap | Disposition |
|---|---|---|---|---|
| Problem/object | fixed AIG, standard binary AIGER | same | contract frozen | retained |
| Contribution type | proposed N2 | nontrivial whole-DAG algorithm/formal property | generic exact control only | not established |
| Native baseline | not run | AIGER + Yosys incl. `-no-sort` + ABC conditional `-u` | exact tools absent | resource blocker |
| Natural workload | none | public HWMCC, family-stratified | preclaim failed | zero objects |
| Full cost | control only | candidate and complete native union | unmeasured | cannot compare |
| Main result | none | natural same-object residual | absent by construction | no inference |
| Scale/generalization | none | threshold/action coverage and null regions | not run | no inference |
| Artifact/reproducibility | blocker/control package | exact native replay | portable toolchain missing | resumable |

## Reviewer-shape assessment

- Editor/venue-fit: unchanged from Stage0; no Stage A evidence can update it.
- Methodology: fail-closed behavior is correct because a non-native parser cannot stand in for the current-native union.
- Domain contribution: the 12B/13B control remains action divergence only.
- Devil's advocate: the unresolved strongest possibility is still that native orders/simple heuristics absorb natural headroom or that no nontrivial algorithm survives.

## Decision

- Quality tier: retained `TIER_B_Q2_VIABLE` without reassessment.
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP__RESOURCE_BLOCKED`.
- Closed gaps: deterministic contract and non-native small-control reproducibility only.
- Executable next gaps: native parity, scalable candidate/formal substance, HWMCC action coverage, current-union full-cost residual.
- Human/resource-dependent gap: provide exact pinned portable native tools/build environment.
- Bounded near-Q1 gaps: no update.
- Gap that would invalidate the paper: native absorption, same-object failure, only generic/local engineering, or scientific no-residual evidence after a valid run.
- Calibration note: this file does not constitute novelty, baseline, or natural evidence.
