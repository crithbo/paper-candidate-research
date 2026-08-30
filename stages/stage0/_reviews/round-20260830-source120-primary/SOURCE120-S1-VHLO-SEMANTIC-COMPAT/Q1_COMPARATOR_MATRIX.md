# SOURCE120-S1-VHLO-SEMANTIC-COMPAT Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: `TOSEM / TSE / JSS or equivalent compiler-testing/empirical software-engineering venue`
- Calibration status: `PARITY_CONDITIONAL`
- Quality tier: `TIER_B_Q2_VIABLE`
- Search/cutoff date: `2026-08-30`

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | NNSmith: Generating Diverse and Valid Test Cases for Deep Learning Compilers | ASPLOS 2023, published | top systems/architecture conference equivalent | 2023; <https://arxiv.org/abs/2207.13066> and artifact | abstract, method/evaluation summary, artifact scope | Shows that a compiler-testing tool needs nontrivial valid-input construction, fair baselines, bug yield and a reusable artifact. |
| EVALUATION_ANCHOR | Fuzzing Deep Learning Compilers with HirGen | ISSTA 2023, published, DOI 10.1145/3597926.3598053 | top software-testing conference equivalent | 2023; <https://research.monash.edu/en/publications/fuzzing-deep-learning-compilers-with-hirgen/> | abstract, methods, baselines and reported evaluation | Calibrates coverage criteria, multiple oracles, baseline construction and confirmed-bug evidence. |
| DOMAIN_NEIGHBOR | DESIL: Detecting Silent Bugs in MLIR Compiler Infrastructure | PACMPL 9/OOPSLA2, DOI 10.1145/3763161 | top PL/compiler journal-conference equivalent | 2025; <https://2025.splashcon.org/details/OOPSLA/184/DESIL-Detecting-Silent-Bugs-in-MLIR-Compiler-Infrastructure> | abstract, contribution, evaluation summary and publication metadata | Closest MLIR-specific semantic/differential-testing shape; sets a high bar for legality, executable lowering and real bugs. |
| BOUNDARY_OR_NEGATIVE_ANCHOR | OpenXLA Benchmark / current StableHLO testdata | official current artifacts, not novelty papers | deployment/current-union baseline | current; <https://github.com/iree-org/iree-comparative-benchmark/blob/main/README.md> and <https://github.com/openxla/stablehlo/tree/main/stablehlo/testdata> | README/source structure and representative test | Demonstrates that cross-runtime artifacts, saved I/O and input-bearing semantic checks already exist; the candidate must exceed their union. |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | Long-lived StableHLO portable-artifact compatibility across consumers | StableHLO is a public compiler boundary; anchors address compiler correctness | narrower than general DL/MLIR compiler testing | Q2 plausible |
| Contribution type | Versioned semantic benchmark + N3 compatibility taxonomy | NNSmith/HirGen/DESIL provide algorithms/tools and bug findings | candidate cannot claim generic witness/oracle novelty | conditionally acceptable as measurement/benchmark |
| Nearest-prior delta | Unified version-window × typed-oracle × multi-consumer matrix | first-party assets cover each component separately | conjunction and decision value unobserved | Stage A killer required |
| Algorithm/mechanism substance | Spec-typed outcome classification and support-intersection protocol | anchors have nontrivial generation/oracle/lowering methods | risk of being glue; no N2 claim accepted | bounded Q2 ceiling |
| Baseline strength/fairness | VHLO suite, StableHLO testdata/interpreter, IREE/XLA native tests, OpenXLA benchmark, NNSmith/HirGen/DESIL | strong current union named | must implement identical inputs/support/exclusions | finite |
| Natural workload/platform | Official VHLO/testdata corpora; CPU-first public consumers | anchors use generated models or broad MLIR programs | corpus representativeness across real model artifacts may be limited | canonical benchmark claim only |
| Full-cost coverage | generation through triage, exclusions and replay | anchor artifacts report generation/execution evaluation | no candidate cost observed | mandatory Stage A ledger |
| Main result/statistics | none at Stage 0 | anchors report bugs, coverage and comparisons | largest current gap | conditional only |
| Ablation/mechanism evidence | remove version dimension, typed taxonomy or second consumer | anchors ablate generators/oracles/coverage | not run | predeclared |
| Scale/generalization | supported versions × ops × consumers | anchors span compilers and many tests | one IR ecosystem narrows impact | Tier B, not Tier A |
| Failure boundary | implementation-defined, unsupported, out-of-contract and interpreter gap | StableHLO spec/docs explicitly expose boundaries | taxonomy must be independently auditable | plausible strength |
| Artifact/reproducibility | exact commits, witnesses, results and costs | all three research anchors release or describe artifacts | not yet implemented | finite route |

## Reviewer-shape assessment

- Editor/venue-fit view: viable as a focused Q2 benchmark/measurement paper only if the versioned cross-consumer matrix produces stable decision-changing findings and a reusable artifact. A wrapper around existing tests is reject-level.
- Methodology view: exact support intersection, typed oracle rules, predeclared denominator and full-cost are mandatory because raw numerical disagreement is not a StableHLO semantic violation.
- Domain-contribution view: valuable for StableHLO/OpenXLA governance and consumer integration, but the single-IR scope caps present Q1 potential.
- Devil's-advocate view: the first-party union already has most ingredients; absence of a single repository command is not novelty. The paper must expose a previously unmeasured compatibility structure, not just execute existing suites together.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE`
- Status: `PARITY_CONDITIONAL`
- Closed gaps: exact object, canonical carriers, public execution paths, named current union, finite oracle classes and falsifier.
- Executable next gaps: freeze commits/support matrix; validate four witness classes; enumerate denominator; run the minimal cross-version/consumer matrix; compare decision coverage and cost.
- Human/resource-dependent gaps: none decisive at Stage 0; maintainer interpretation may be sought later for ambiguous spec cases.
- Bounded near-Q1 gaps: multi-framework natural artifacts, wider consumer/version coverage, confirmed upstream issues and evidence that the taxonomy generalizes beyond StableHLO.
- Gap that would invalidate the paper: no stable decision delta beyond the current union, or a taxonomy that conflates unsupported/implementation-defined behavior with semantic incompatibility.
- Why this is calibration rather than novelty or baseline evidence: the papers define expected contribution/evaluation depth; they do not prove the StableHLO residual is new.
- Why Tier B still closes the hard gates conditionally: the exact portable-artifact object, current union, strong baselines, official corpora, complete cost dimensions and reproducibility route are frozen; empirical success remains for Stage A and is not assumed.
