# GIT-PACK-FOREST Independent Q1/Q2 Calibration

- Stage: STAGE0_CONFIRMATION
- Candidate venue family: software engineering, storage systems, data-management systems
- Calibration status: independent conditional paper-shape review
- Quality tier: TIER_B_Q2_VIABLE
- Cutoff: 2026-08-09

## Reference set

| Role | Source | Read scope | Calibration and object boundary |
|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Boffa et al., On the Compressibility of Large-scale Source Code Datasets, JSS 2025, DOI 10.1016/j.jss.2025.112429 | author final manuscript: abstract, background, contribution and Git/PPC graph sections | Focused source-code compression paper; its SWH/PPC/general-codec object is not one Git-native self-contained pack |
| ALGORITHM_SUBTRACTOR | Ouyang et al., Cluster-Based Delta Compression of a Collection of Files, WISE 2002 | author/institution paper: abstract and optimum-branching/clustering formulation | Absorbs classic global graph and clustering; no frozen Git pack/index contract |
| EVALUATION_ANCHOR | Zhang et al., Finesse, FAST 2019 | official USENIX abstract/evaluation summary | Mechanism isolation and compression/throughput evidence; post-dedup chunks |
| DOMAIN_NEIGHBOR | Zhang et al., LoopDelta, USENIX ATC 2023 | official paper: abstract, motivation and mechanisms | Locality/base-access/restore costs; inline backup chunks, not Git format |
| DEPLOYMENT_BOUNDARY | Git v2.55.0 pack-objects docs and tagged source | options, find_deltas/try_delta, path-walk, compute_write_order | Strongest current same-object action family |

## Independent paper-shape matrix

| Dimension | Conditional candidate | Comparator lesson | Remaining risk | Disposition |
|---|---|---|---|---|
| Problem | format-preserving Git pack construction | JSS and Git establish a real compression/cost object | narrower than broad storage systems | credible Tier-B scope |
| N2 | coupled bounded-depth forest and locality-aware legal layout | Ouyang absorbs global branching; Git absorbs local search/family order | may collapse to known-part product | highest scientific risk |
| Baseline | finite compatible Git 2.55 family | default-only comparison is invalid | budget grid not pinned | finite readiness task |
| Natural target | 20 pinned public histories | anchors use natural data | corpus not frozen | readiness, not STOP |
| Guarantee | exact objects, self-containment, strict Git checks | Git supplies format/validators | semantic-mode audit needed | finite public route |
| Full cost | bytes, CPU, RSS, I/O, access, precompute, optimization | systems anchors require tradeoff breadth | no measurements | readiness, not STOP |
| Main evidence | residual certificate plus p50/p90 frontier extension | distinguishes novelty from tuning | residual may be zero | decisive risk |
| Generality | characterized repository subset and no-gain regions | narrow work can publish with clean boundaries | no universal claim | Tier-B ceiling |
| Reproducibility | pinned Git/repositories/manifests/scripts | public CPU stack | artifact absent | finite route |

## Reviewer assessment

- Venue fit: a successful Git-native constrained constructor with strict compatibility and full-cost natural evidence can form a focused Q2 paper.
- Methodology: the exact object, finite compatible baseline family, strict validators, residual tracing and cost ledger are auditable.
- Novelty: neither “global forest” nor “legal write order” is independently new. Git-specific constraints must induce a genuinely coupled constructor and observable action residual.
- Devil's advocate: classic branching plus content clustering may supply the forest while Git already supplies family ordering; an external composition is a wrapper, not N2.
- Tier-A ceiling: unsupported. A broader algorithmic principle/guarantee and wider evidence would be needed.

## Decision

- Quality tier: TIER_B_Q2_VIABLE
- Status: PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP
- Closed at Stage 0: exact object, conditional N2 boundary, finite fair baseline family, natural public target, full-cost schema, reproducibility route, direct-fatal screen.
- Not closed: residual-edge existence, implementation, theorem/approximation quality, natural frontier extension, final artifact.
- Structural invalidator: exact direct collision, insufficient residual, product/wrapper collapse, or full-cost domination by current Git.
- Stage semantics: successful-paper-shape calibration only; no result or downstream authorization.
