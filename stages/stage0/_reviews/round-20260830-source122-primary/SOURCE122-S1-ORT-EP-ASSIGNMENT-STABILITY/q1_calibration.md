# SOURCE122-S1-ORT-EP-ASSIGNMENT-STABILITY Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: software testing / ML systems / compiler-runtime measurement
- Calibration status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Quality tier: `TIER_B_Q2_VIABLE` only after the bounded revision
- Search/cutoff date: `2026-08-30`

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Improving Deep Learning Framework Testing with Model-Level Metamorphic Testing (ModelMeta) | ISSTA 2025 Research Papers / Proc. ACM Softw. Eng. | premier software-engineering venue / Q1-equivalent | 2025, DOI 10.1145/3728972 and author full text | four model-structure MRs, runtime metrics, 17 models/10 tasks, bugs and ablations | closest equivalence-generation and resource/efficiency-measurement shape |
| EVALUATION_ANCHOR | Optimization-Aware Test Generation for Deep Learning Compilers (OATest) | ICSE 2026 | premier software-engineering venue / Q1-equivalent | 2026, DOI 10.1145/3744916.3773216 | ORT/TVM patterns, 12-hour repetitions, coverage, 56 bugs, artifact | anchors scale, strong baselines, statistical repetition and current ORT testing depth |
| DOMAIN_NEIGHBOR | NNSmith: Generating Diverse and Valid Test Cases for Deep Learning Compilers | ASPLOS 2023 | premier architecture/systems venue / Q1-equivalent | 2023, DOI 10.1145/3575693.3575707 | valid graph generation, floating-exception control, differential testing, artifacts | anchors compiler/runtime test validity and reproducibility |
| BOUNDARY_OR_NEGATIVE_ANCHOR | OODTE/DiTOX; current ORT/Mobius/QNN tooling | CC 2026 + first-party current artifacts | not used to inflate quartile status | 2025–2026, primary paper and official repositories | 130-model differential scale, EP-aware rewrites, assignment and provenance tools | defines what is already infrastructure or generic testing rather than residual novelty |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | deployment decisions may depend on serialized ONNX representation | anchors establish compiler/runtime correctness and performance importance | decision impact is unobserved | conditionally important |
| Contribution type | benchmark validity + measurement characterization | ModelMeta/OATest introduce concrete testing methods and artifacts | current packet names two decision endpoints | revision required |
| Nearest-prior delta | held-out regret of one representation's ORT optimizer decision | ModelMeta equivalent variants; Mobius EP rewrites; QNN provenance | only conjunction remains | narrow but testable |
| Algorithm/mechanism substance | semantic-region quotient and assignment-aware decision validity | anchors have QR-DQN, pattern synthesis or valid graph generation | no frozen estimator/endpoint yet | conditional N3; N2 unproven |
| Baseline strength/fairness | native ORT union + output/timing/structure + Mobius/QNN | anchors compare multiple state-of-the-art tools | packet initially omitted current controls | repair specified |
| Natural workload/platform | canonical official models and public CPU/CUDA | anchors use 17/130 models or thousands of patterns | 3–5-model plan is too small; no natural exporter-frequency evidence | Q2 breadth repair required |
| Full-cost coverage | compile/cache/transfer/observer/failure/decision regret | ModelMeta measures time/memory; Mobius separates build metrics | no result and incomplete original ledger | finite plan |
| Main result/statistics | none | anchors report repeated evaluations and confirmed bugs | complete gap | Stage A only attacks premise |
| Ablation/mechanism evidence | normalized-away negatives and fusion/capability strata planned | anchors ablate MRs/components and report coverage | no evidence | open |
| Scale/generalization | planned ≥12 models, ≥4 relations, ≥2 version/EP strata | anchors range from 17 to 130 models and thousands of patterns | original plan below parity | bounded revision |
| Failure boundary | normalization, decision-neutral changes, ambiguous lineage | anchors report invalid inputs and threats | must be measured | explicit |
| Artifact/reproducibility | planned panel, manifests, quotient, raw traces | all three anchors have public artifacts | no candidate artifact | open |

## Reviewer-shape assessment

- Editor/venue-fit view: a Q2 paper is plausible only as a decision-validity benchmark with broad evidence; a small dashboard of assignment differences is below Q2.
- Methodology view: checker success is not equivalence. Relation proof/tolerance/NaN policy and the all-cell denominator are central validity requirements.
- Domain-contribution view: current ORT 1.24+ APIs make the study practical, while Mobius/QNN tooling forces a narrower cross-variant decision claim.
- Devil's-advocate view: assignment differences are expected when graphs differ; unless they change a precommitted choice and assignment features beat raw timing/structure, the work is descriptive trivia or ordinary metamorphic testing.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE` after repair; no Q1 label.
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Closed gaps: exact runtime family, public metadata API, public CPU/CUDA route, no direct fatal, finite falsifier.
- Executable next gaps: one decision endpoint, exact version/EP stack, legality relations, lineage quotient, breadth and full-cost denominator.
- Human/resource-dependent gaps: QNN/NPU evidence is optional; no human blocker for the public route.
- Bounded near-Q1 gaps: multiple current EPs/platforms, natural exporter prevalence, cross-version mechanism and independent reproduction. These are not currently bounded enough for Tier A.
- Gap that would invalidate the paper: no decision-changing variation or no advantage over output/timing/structure baselines.
- Why this is calibration rather than novelty or baseline evidence: venue anchors define contribution/evaluation depth; current-union audit independently defines novelty and experiment baselines.
- Why Tier B can still close the hard gates: one same-object revision can freeze the endpoint and panel; public artifacts can supply strong baselines, canonical evidence, full cost and reproducibility without changing the research object.

