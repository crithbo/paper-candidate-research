# WEBGRAPH-REFERENCE-FOREST Revision1 Q1/Q2 Paper Calibration

- Stage: `STAGEA_REVISION1`
- Candidate venue family: compressed data structures, graph algorithms and graph systems
- Calibration status: `PARITY_NOT_PLAUSIBLE`
- Quality tier: `BELOW_Q2_STOP` for the frozen mechanism
- Search/cutoff date: `2026-08-10`

## Reference set

No new search was permitted. This revision reuses the parent frozen primary-source set.

| Role | Paper | Venue/status | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Boldi & Vigna, “The WebGraph Framework I: Compression Techniques” | WWW 2004 | 2004; official project/author record | native compression and random access | canonical same-object shape |
| EVALUATION_ANCHOR / DIRECT_SUBTRACT | Versari et al., “Zuckerli: A New Compressed Representation for Graphs” | IEEE Access 8, DOI `10.1109/ACCESS.2020.3040673` | 2020; Google Research/IEEE | reference selection, construction, access | closest heuristic genealogy |
| DOMAIN_NEIGHBOR | Xu et al., “Improving Graph Compression for Efficient Resource-Constrained Graph Analytics” | PVLDB 17(9), DOI `10.14778/3665844.3665852` | 2024; official PVLDB PDF | representation, full costs, datasets | modern evidence breadth |
| IMPLEMENTATION_BOUNDARY | Fontana, Vigna & Zacchiroli, “WebGraph: The Next Generation (Is in Rust)” | Web Conference 2024 Companion, DOI `10.1145/3589335.3651581` | 2024; official project record | Rust implementation scope | current first-party boundary |

## Comparator matrix

| Dimension | Revision evidence | Anchor expectation | Remaining gap | Disposition |
|---|---|---|---|---|
| Problem importance | native graph size/access | material graph-system tradeoff | only two graphs | insufficient alone |
| Contribution type | exact complete-action FPT DP | concrete algorithmic delta | valid | closed |
| Nearest-prior delta | exact optimum beyond final BvCompZ | strongest current construction | latest-paper search still bounded-open | no absorption observed |
| Algorithm substance | dense base-4 states, rolling arrays, compact backpointers, exact guarantee | nontrivial general algorithm | fixed small W/D | substantive but narrow |
| Baseline fairness | released final BvCompZ, same native object/information | deployed/strongest comparator | none in Stage A | PASS |
| Natural workload | LAW CNR + SNAP Wiki-Vote | diverse and large suites | two graphs | Stage A limited |
| Full-cost | 11 matched pairs, elapsed/CPU/RSS/seq/random/bytes | broad performance accounting | decisive regression | FAIL |
| Main result | size residual but 1.84–8.33× construction ratios and CNR access failure | useful end-to-end tradeoff | no accepted frontier | fatal |
| Mechanism evidence | exact parity, 2,048 domain, depth metric | causal explanation | complete for gate | strong negative evidence |
| Scale | 325k and 7k nodes | broader/larger | not authorized after failure | no rescue |
| Failure boundary | fixed W4/D3 no-regression gate falsified | explicit boundary | none | closed narrow STOP |
| Artifact | source, raw matched data, hashes, validators, manifest | reproducibility | independent closing pending | strong |

## Reviewer-shape assessment

- Editor/venue-fit: a real size residual remains, but the only authorized full-cost gate is decisively negative after the unique revision; a size-only paper does not meet Q2.
- Methodology: same-object fidelity, matched ordering, output hashes and claim boundary are strong. The preregistered ceiling must control the decision.
- Domain contribution: the dense exact solver is a meaningful implementation improvement, but final BvCompZ remains substantially cheaper and CNR random access remains worse.
- Devil's advocate: further pruning/approximation/configuration would be a new mechanism or objective, not a permissible reinterpretation of this result.

## Decision

- Quality tier: `BELOW_Q2_STOP` for the frozen candidate.
- Status: `PARITY_NOT_PLAUSIBLE`.
- Closed gaps: fidelity, exactness, compact implementation, natural residual, full-cost measurement, access-aware equal-bit tie-break and reproducibility.
- Fatal gap: no full-cost non-dominated point under the frozen no-regression rule; elapsed/CPU fail on both corpora and random access fails on CNR.
- Executable next gaps: none within this assignment; the unique scientific revision is consumed.
- Human/resource-dependent gaps: independent closing judgment only.
- Why calibration is not a general impossibility claim: it grades one fixed mechanism and evidence shape against paper standards; it does not evaluate approximate or differently constrained research questions.

