# LLVM-RVV-GROUP-MASK-SPILL-PARETODP Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: compiler backends, code generation and combinatorial compiler optimization
- Calibration status: `PARITY_CONDITIONAL`
- Quality tier: `TIER_B_Q2_VIABLE` conditional on `SOUND_RVV_TRACE_ACTION_AND_QUOTIENT_CERTIFICATE`
- Search/cutoff date: `2026-08-11`
- Scope note: venue/quartile labels calibrate contribution shape only. They do not establish novelty or serve as experimental results.

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Lozano et al., “Combinatorial Register Allocation and Instruction Scheduling” | ACM TOPLAS, journal article, DOI `10.1145/3332373` | established top compiler journal / Q1-family calibration | 2019; [author repository record](https://www.research-collection.ethz.ch/handle/20.500.11850/371704), [arXiv](https://arxiv.org/abs/1804.02452) | abstract, algorithm/result claims, artifact/generic-method boundary | Shows the substance expected of an exact integrated compiler optimizer: formal model, solver structure, optimality/quality evidence and broad LLVM comparison. It is also the strongest generic-kernel subtractor. |
| EVALUATION_ANCHOR | Adit and Sampson, “Performance Left on the Table: An Evaluation of Compiler Autovectorization for RISC-V” | IEEE Micro 42(5), DOI `10.1109/MM.2022.3184867` | established systems/architecture journal; Q1/Q2-family empirical-shape anchor depending ranking scheme | 2022; [author PDF](https://neiladit.com/papers/Performance_Left_on_the_Table_An_Evaluation_of_Compiler_Autovectorization_for_RISC-V.pdf) | full paper and evaluation setup | Calibrates natural RVV workload breadth, compiler-vs-hand comparison and evidence honesty; it does not address the same bounded post-ISel allocation object. |
| DOMAIN_NEIGHBOR | Fried and Stemmer-Grabow, “Register Allocation for Compressed ISAs in LLVM” | ACM CC 2023 research paper, DOI `10.1145/3578360.3580261` | selective compiler-conference equivalent | 2023; [official conference page](https://conf.researchr.org/details/CC-2023/CC-2023-research-papers/9/Register-Allocation-for-Compressed-ISAs-in-LLVM), [paper PDF](https://pp.ipd.kit.edu/uploads/publikationen/fried23cc.pdf) | full paper claims, mechanisms, SPEC evaluation and failure interpretation | Demonstrates publishable target-aware RA shape: modify a real allocator, compare code size/runtime, and report modest/negative runtime effects honestly. Objective differs from RVV group/mask/vset. |
| BOUNDARY_OR_NEGATIVE_ANCHOR | Shi et al., “Closer in the Gap: Towards Portable Performance on RISC-V Vector Processors” | arXiv preprint `2605.10860` | not used as a quartile anchor | 2026; [primary preprint](https://arxiv.org/abs/2605.10860) | abstract, methods/results relevant to LMUL and compiler comparison | Reports default LMUL often near optimal and supplies current natural-workload evidence; therefore shrinks expected headroom without directly covering the candidate algorithm. |

Additional current boundary sources: LLVM partial-spill PR [#105661](https://github.com/llvm/llvm-project/pull/105661); Xu et al., “Adaptive register grouping and allocation mechanism and compiler optimization for RISC-V vector architectures,” DOI [`10.19734/j.issn.1001-3695.2026.01.0020`](https://www.arocmag.cn/abs/2026.01.0020); Zoozve [arXiv:2504.15678](https://arxiv.org/abs/2504.15678). These are collision/subtractor sources, not Q1 shape anchors.

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | RVV backend quality under aligned groups, masks, spills and vset transitions | Unison and CC'23 show sustained interest in target-aware RA; IEEE Micro shows RVV compiler maturity remains relevant | opportunity frequency under natural high-pressure traces unknown | Q2 plausible if natural carrier is not vanishingly rare |
| Contribution type | target-specific exact/Pareto bounded-trace DP over known legal actions | Unison: exact integrated optimization; CC'23: deployable target-aware RA heuristic | state sufficiency and legal divergence currently incomplete | atomic revision required |
| Nearest-prior delta | joint group/v0/spill/vset future-aware decision | LLVM already contains vector RA, NoV0 handling and vset minimization; PR #105661 covers typed spill/vset tradeoff | only quotient/guarantee residual survives | defensible but narrow N2 |
| Algorithm/mechanism substance | proposed finite quotient DP | Unison provides a strong generic solver/model; CC'23 provides concrete allocator algorithms | `2^32_restricted(w)` is not yet a meaningful FPT result; state may omit identities/futures | below publication shape until revised |
| Baseline strength/fairness | B1 current LLVM; B2 current+typed-spill sequential; B3 same-grammar exact oracle; GCC external subtractor | anchors compare against production LLVM or strong compiler variants | complete finite action mapping not yet written | finite and closable |
| Natural workload/platform | public LLVM/RVV high-pressure traces, later SPEC/RAJAPerf/HPC | IEEE Micro uses synthetic loops plus natural benchmark suites; CC'23 uses SPEC | candidate corpus/frequency/results absent | readiness gap only, not structural STOP |
| Full-cost coverage | compiler CPU/RSS, code/frame/spill bytes, mask/vset/uops, fallback, runtime | CC'23 reports code size and runtime; Unison reports compile budget and code quality | ledger defined but unmeasured | Stage A/B work |
| Main result/statistics | no result claimed | anchors report broad quantitative comparisons and distributions | complete gap | claim ceiling remains conditional potential |
| Ablation/mechanism evidence | planned action-divergence witness and state-field ablations | Unison decomposes solver decisions; CC'23 isolates RA changes | submitted witness does not force pressure | revision then Stage A |
| Scale/generalization | bounded traces; expected target-specific no-gain boundary | Unison scales to medium functions; empirical anchors use multiple suites | tractability/state count unknown | Q2 ceiling until established |
| Failure boundary | no gain without joint pressure/v0/vtype conflict; inline asm may bar typed spill | CC'23 explicitly interprets limited runtime effect; current RFC exposes inline-asm incompatibility | needs formal predicates | finite revision item |
| Artifact/reproducibility | public LLVM source/MIR/MC and independent exact oracle planned | Unison/LLVM-based papers expose repeatable compiler artifacts | no candidate artifact yet | readiness risk only |

## Reviewer-shape assessment

- Editor/venue-fit view: a narrowly target-specific DP can clear Q2 if it has a clean exactness/complexity result, current-source integration and diverse natural evidence. The present design does not yet merit Q1 framing.
- Methodology view: the three-object witness is insufficient and the state equivalence is under-specified. Those are algorithm-definition defects, not missing-result defects.
- Domain-contribution view: current LLVM's vector-first RA and later vset insertion create a real boundary; open partial-spill work makes the cost interaction concrete. The residual is still plausible after subtractors.
- Devil's-advocate view: 32 architectural registers invite a “small generic enumeration with RVV labels” rejection. A target-specific future-equivalence theorem and a nontrivial action-divergence witness are indispensable.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE` conditional
- Status: `PARITY_CONDITIONAL`
- Closed gaps: exact same-object family; current LLVM pipeline/source boundary; fair comparator roles; finite public evidence route; no direct fatal found in bounded search.
- Executable next gaps: one static legal witness, complete action catalog, future-preserving quotient, corrected complexity/guarantee, comparator map.
- Human/resource-dependent gaps: none at Stage 0; physical RVV hardware only affects later runtime evidence ceiling.
- Bounded near-Q1 gaps: broader natural corpus, multiple RVV implementations, robust runtime statistics and evidence that the quotient generalizes beyond a few hot traces.
- Gap that would invalidate the paper: the action frontier is fully reproduced by current LLVM plus the local partial-spill transform, or the proposed DP is only generic fixed-register enumeration.
- Why this is calibration rather than novelty or baseline evidence: the reference set establishes expected paper substance and evidence breadth; collision and baseline conclusions are separately grounded in source/claim facets.
- Why Tier B still requires hard gates: same-object, current collisions, complete finite baselines, natural route, full-cost and reproducibility remain mandatory; the requested revision closes the remaining algorithm-definition gate without requiring Stage A results.
