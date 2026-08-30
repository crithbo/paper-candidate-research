# WEBGRAPH-REFERENCE-FOREST Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: graph algorithms/data structures, compressed graph systems
- Calibration status: `PARITY_CONDITIONAL`
- Quality tier: `TIER_B_Q2_VIABLE` conditional on revision
- Search/cutoff date: `2026-08-10`

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Boldi & Vigna, *The WebGraph Framework I: Compression Techniques* | WWW 2004, peer reviewed | top-tier web/data-systems conference equivalent | 2004; official author PDF/project record | algorithm, format, access and evaluation sections | canonical same-object contribution shape |
| EVALUATION_ANCHOR / DIRECT_SUBTRACT | Versari et al., *Zuckerli: A New Compressed Representation for Graphs* | IEEE Access 8, peer reviewed, DOI `10.1109/ACCESS.2020.3040673` | Q1/Q2-caliber journal benchmark for this niche; quartile not used as novelty evidence | 2020; Google Research/IEEE metadata and paper | abstract, reference-choice section, list-access and dataset/evaluation scope | directly covers global reference-chain heuristic and natural full-cost comparison |
| DOMAIN_NEIGHBOR | Xu et al., *Improving Graph Compression for Efficient Resource-Constrained Graph Analytics* (Laconic) | PVLDB 17(9), DOI `10.14778/3665844.3665852` | top data-management venue | 2024; official PVLDB PDF | abstract, representation mechanism, costs, datasets/artifact scope | calibrates modern graph-compression paper breadth and full-cost evidence |
| BOUNDARY_OR_NEGATIVE_ANCHOR | Fontana, Vigna & Zacchiroli, *WebGraph: The Next Generation (Is in Rust)* | The Web Conference 2024 Companion, DOI `10.1145/3589335.3651581` | peer-reviewed system implementation boundary, not used as Q1 parity anchor | 2024; official author/project record | system scope and implementation positioning | establishes first-party Rust WebGraph status; not an equal paper-shape anchor |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | exact/random-access web graph compression remains relevant | all three anchors target massive graph footprint/access | narrow if only tiny bit savings | plausible Q2 |
| Contribution type | complete-edge bounded-depth optimizer/approximation | WebGraph introduces format; Zuckerli adds heuristic system; Laconic adds rule-based system | must exceed released BvCompZ | revision hard gate |
| Nearest-prior delta | retain second-choice parent edges discarded before BvCompZ depth DP | BvCompZ/Zuckerli already globalize best-edge forest | no realizable witness yet | open |
| Algorithm/mechanism substance | exact/FPT/approx property on full legal-parent DAG | anchors provide explicit construction algorithms | current brief only names generic DP/min-cost forest | open |
| Baseline strength/fairness | Java BVGraph + Rust BvComp + BvCompZ + small oracle | Zuckerli compares WebGraph and other graph compressors | Discovery omitted BvCompZ | revision required |
| Natural workload/platform | 20–50 fixed public ordered graphs, CPU | Zuckerli uses very large real graphs; Laconic uses standard graph suites | candidate-specific residual unmeasured | Stage A/B gap |
| Full-cost coverage | build CPU/RSS, stream+offset bytes, sequential/random decode | Zuckerli and Laconic both report compression/decompression/resource costs | must charge all parent scoring/optimization | finite plan |
| Main result/statistics | no result required at Stage 0 | anchors show broad, quantified benefits | final paper needs stratified effect sizes/no-gain | later evidence |
| Ablation/mechanism evidence | BvCompZ restriction, alternative-edge coverage, W/D sensitivity | anchors isolate mechanisms/parameters | requires realizable witness and oracle | revision + Stage A |
| Scale/generalization | predeclared web/social/software-history strata | anchors span large natural graphs | 20–50 identity/hash set not frozen | later evidence |
| Failure boundary | no gain when best forest feasible or alternative edges weak | strong papers report trade-offs | clear and testable | pass |
| Artifact/reproducibility | public Rust/Java sources and CPU route | Laconic and current WebGraph have artifacts | candidate code/results absent, not Stage0-fatal | readiness gap |

## Reviewer-shape assessment

- Editor/venue-fit view: a new complete-edge algorithm with a formal property and broad native evaluation could be a focused Q2 paper; a reimplementation of `BvCompZ` is editorially dead.
- Methodology view: exact graph equality and offset/random-access parity are straightforward, but the comparator must use the full released `BvCompZ` action and flag grid.
- Domain-contribution view: current-source collision is much closer than the Discovery genealogy indicated; the residual is algorithmic completeness, not existence of a global forest.
- Devil's-advocate view: the strongest counterargument is that the candidate merely discovers a known Zuckerli/BvCompZ heuristic and substitutes another cost function. Only a realizable second-choice-edge divergence plus a formal algorithmic result defeats it.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE` conditional on revision
- Status: `PARITY_CONDITIONAL`
- Closed gaps: fixed object, native semantics, natural corpus ecosystem, finite full-cost route.
- Executable next gaps: atomic current-native residual, realizable witness and algorithmic property.
- Human/resource-dependent gaps: none decisive at Stage 0.
- Bounded near-Q1 gaps: broader graph diversity, formal approximation/FPT result, robust statistics and artifact quality.
- Gap that would invalidate the paper: current `BvCompZ` can reproduce the refrozen action/guarantee, or the residual is only parameter/access-weight tuning.
- Why this is calibration rather than novelty or baseline evidence: anchors set the expected contribution/evaluation shape; novelty is separately decided by current source and facet analysis.
- Why Tier B still closes hard gates if revision succeeds: same native object, current strongest comparator, natural graph route, complete cost ledger and reproducibility plan are finite; the only unclosed hard gate is the named atomic mechanism residual.

