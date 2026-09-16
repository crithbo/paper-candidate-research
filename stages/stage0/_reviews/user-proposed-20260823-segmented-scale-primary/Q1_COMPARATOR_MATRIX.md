# SEGMENTED-SCALE-W4A16-REV0 Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: ML systems/compiler, GPU code generation
- Calibration status: `PARITY_NOT_PLAUSIBLE`
- Quality tier: `BELOW_Q2_STOP`
- Search/cutoff date: 2026-08-23

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | TVM: An Automated End-to-End Optimizing Compiler for Deep Learning | OSDI, published | Top systems venue equivalent | 2018, USENIX official page | abstract/metadata | Algorithmic compilation construction plus cross-backend evidence shape |
| EVALUATION_ANCHOR | Ansor: Generating High-Performance Tensor Programs for Deep Learning | OSDI, published | Top systems venue equivalent | 2020, USENIX official page | abstract/metadata | Explicit search-space, learned cost model, broad comparison and reproducible end-to-end framing |
| DOMAIN_NEIGHBOR | MARLIN: Mixed-Precision Auto-Regressive Parallel Inference on Large Language Models | public primary manuscript | Domain neighbor; not used as quartile proof | 2024, arXiv primary record | abstract/metadata | Same low-bit GEMM serving neighborhood; requires substantive kernel design and serving evidence |
| BOUNDARY_OR_NEGATIVE_ANCHOR | Triton block-scaled matrix multiplication tutorial | current official implementation/tutorial | Not a paper calibration anchor | 2026, official Triton docs | relevant scale-layout sections | Shows multi-scale K tiles are established implementation material, not a contribution by name alone |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | practical W4A16 serving path | TVM/Ansor target broad ML compilation; MARLIN practical LLM inference | narrower but legitimate | acceptable |
| Contribution type | fixed q=2/4 tile fusion | anchors provide compiler construction/search or substantial kernel system | missing research algorithm | fatal |
| Nearest-prior delta | source-local scale staging | block-scaled scale tiling is known | conceptual delta thin | fatal |
| Algorithm/mechanism substance | no selector/proof/guarantee | search/model/architecture mechanisms | missing | fatal |
| Baseline strength/fairness | current route identified | anchors compare strong alternatives | future plan credible | conditional |
| Natural workload/platform | four source-recognized shapes, one AMD target | broad hardware/model coverage | evidence may be narrower at Q2 | conditional |
| Full-cost coverage | ledger only | measured compilation/runtime cost | future evidence needed, not fatal alone | conditional |
| Main result/statistics | none | empirical results | Stage 0 does not require this | non-decisive |
| Ablation/mechanism evidence | none | anchors expose why methods work | cannot repair missing mechanism | fatal |
| Scale/generalization | one G/target/four shapes | broader | would need a true construction first | fatal |
| Failure boundary | q live state/no-gain listed | anchors document scope | good planning but not contribution | insufficient |
| Artifact/reproducibility | frozen source blobs | open implementation/artifact | feasible | conditional |

## Reviewer-shape assessment

- Editor/venue-fit view: source-local manual fusion is normally a patch unless accompanied by a transferable compiler construction.
- Methodology view: exact semantics and full-cost plan are sound; no formal connection turns the schedule choice into a method.
- Domain-contribution view: low-bit group scaling matters, but known multi-scale tile abstractions subtract generic novelty.
- Devil's-advocate view: any performance gain could be ordinary unrolling, pipeline change, and benchmark-specific tuning; current candidate cannot disambiguate it.

## Decision

- Quality tier: `BELOW_Q2_STOP`
- Status: `PARITY_NOT_PLAUSIBLE`
- Closed gaps: exact source baseline, semantic invariant, finite carrier and ledger.
- Executable next gaps: none within this stopped Topic ID.
- Human/resource-dependent gaps: GPU execution is not decisive for the structural verdict.
- Bounded near-Q1 gaps: not applicable.
- Gap that would invalidate the paper: no target-specific non-product N1/N2/N3 contribution beyond manual scale-loop fusion.
- Why this is calibration rather than novelty or baseline evidence: venue anchors calibrate expected contribution/evidence shape only; direct collision is separately audited.
- Why Tier B, if applicable, still closes same-object, latest-collision, fair-baseline, natural-evidence, full-cost and reproducibility gates: not applicable; the contribution-type hard gate fails.
