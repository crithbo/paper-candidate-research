# DEX-DELTA-PARETODP Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: `IEEE Transactions on Mobile Computing / ACM Transactions on Software Engineering and Methodology`; compiler/systems Q2-equivalent minimum.
- Calibration status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Quality tier: `TIER_B_Q2_VIABLE__CONDITIONAL_ON_UNIQUE_STATIC_REVISION_GATE`
- Search/cutoff date: `2026-08-11`

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Ellis Hoag, Kyungwoo Lee, Julián Mestre, Sergey Pupyrev, “Optimizing Function Layout for Mobile Applications” | ACM LCTES, peer reviewed, DOI 10.1145/3589610.3596277 | Strong compiler/embedded-systems conference contribution anchor | 2023, [official program](https://pldi23.sigplan.org/details/LCTES-2023/6/Optimizing-Function-Layout-for-Mobile-Applications), [author manuscript](https://arxiv.org/abs/2211.09285) | Abstract, formal objective/algorithm/evaluation summary | Shows the expected shape for a principled mobile layout objective, nontrivial algorithm, open compiler integration, strong baseline, and commercial natural evaluation. |
| EVALUATION_ANCHOR | Tong Sun et al., “Understanding Differencing Algorithms for Mobile Application Updates” | IEEE Transactions on Mobile Computing 23(12), DOI 10.1109/TMC.2024.3407867 | Q1/equivalent mobile-systems journal anchor | 2024, [author page and manuscript](https://www.emnets.cn/en/publication/tmc-ota/) | Abstract, comparator set, metrics, dataset and stated contributions | Establishes that patch ratio alone is insufficient: generation/reconstruction time and memory, 200 mobile apps, and current strong differencers are expected. |
| DOMAIN_NEIGHBOR | Lewei Jin et al., “Exploiting Multiple Similarity Spaces for Efficient and Flexible Incremental Update of Mobile Apps” | IEEE INFOCOM, DOI 10.1109/INFOCOM52122.2024.10621326 | Top networking conference/equivalent anchor | 2024, [author manuscript](https://suntong30.github.io/assets/pdf/INFOCOM24_MDiffPatch.pdf) | Abstract, mechanism and evaluation summary | Directly raises the mobile-update baseline with decoded/partial-decoded similarity spaces and an explicit compression/recompression tradeoff. |
| BOUNDARY_OR_NEGATIVE_ANCHOR | Wei Dong et al., “R2: Incremental Reprogramming Using Relocatable Code in Networked Embedded Systems” and R3 follow-on | IEEE Transactions on Computers 62(9); IEEE INFOCOM 2013; TOSN follow-on | Q1/equivalent systems genealogy | 2013–2014, [primary manuscript](https://citeseerx.ist.psu.edu/document?doi=448601da82b7d52d6b7a6c184fd274fe0c579e1b&repid=rep1&type=pdf), [author bibliography](https://dongw.emnets.cn/pub.html) | Abstract, mechanism and reported evaluation | Prevents claiming the broad idea of relocatable/update-conscious code layout; forces the residual to be current DEX-native action completeness plus a new formal solver. |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | Android DEX updates jointly affect delivery, build cost and runtime locality. | TMC/INFOCOM anchors treat mobile update traffic and full update cost as important; LCTES treats mobile layout as a first-class compiler problem. | Need show ordinary DEX remains a material denominator after packaging and modern patchers. | Plausible for Tier B; Q1 requires broad natural evidence. |
| Contribution type | DEX-specific exact Pareto construction over current legal writer actions. | LCTES offers a formal mobile-layout model and new algorithm; R3 has update-aware executable representation and exact delta component. | Current state/grammar is asserted, not certified. | `REVISE_ONCE`. |
| Nearest-prior delta | Joint fixed-IR DEX layout, predecessor bytes, profile locality and exact bounded patch cost. | R8/ReDex cover profile layout; R2/R3 and Courgette cover update-aware executable handling; mobile patchers cover fixed-byte differencing. | Must prove the conjunction is not only generic sequencing or direct current-union composition. | Conditional residual; search remains bounded-open. |
| Algorithm/mechanism substance | Exact/FPT Pareto DP with a DEX/differencer quotient. | LCTES has a target-motivated balanced-partitioning algorithm; R3 has holistic similarity/delta mechanisms. | No future-action/cost-preserving state theorem or honest parameter bound yet. | Unique static certificate required. |
| Baseline strength/fairness | R8 default/startup grid, ReDex same-object subset, strongest mobile patcher portfolio. | TMC compares xdelta3, bsdiff, archive-patcher and HDiffPatch and proposes sdiff; INFOCOM proposes MDiffPatch. | Discovery used one generic VCDIFF arm and misclassified dex2oat/dexpreopt. | Repair is finite and mandatory. |
| Natural workload/platform | Adjacent official AOSP module/product ordinary single-DEX pairs on stock ART. | TMC uses 200 mobile apps; LCTES uses large commercial mobile apps; R2 uses TinyOS/GreenOrbs. | No exact artifact pair, recurrence, or stock execution yet. | StageA killer first; scale later. |
| Full-cost coverage | Planner/writer, patch generation/reconstruction, memory/temp, package costs, verify/open/startup. | TMC explicitly uses five patch metrics; INFOCOM exposes recompression tradeoff. | Discovery omitted strongest portfolio and did not type package/deployment costs cleanly. | Static ledger now frozen; execution pending. |
| Main result/statistics | None at Stage0. | Anchors report natural-scale results and comparisons. | Entire empirical result and paired statistical analysis remain. | Acceptable at Stage0; evidence ceiling explicit. |
| Ablation/mechanism evidence | Planned ablations: predecessor term, encoder state, profile term, DEX quotient, exact vs heuristic. | LCTES and mobile-update anchors isolate algorithmic techniques. | No ablation exists. | StageB-quality gap, not admission fatal. |
| Scale/generalization | Ordinary non-container single DEX across modules, versions and churn strata. | Anchors use commercial/200-app or deployed embedded scopes. | Need 20–50 natural pairs and version/product stratification if killer survives. | Conditional. |
| Failure boundary | Container/compact/multidex, high churn, packaging-dominant, patcher-insensitive, current-union absorption. | Anchors expose format, compression and platform boundaries. | Must quantify, not merely list. | Finite StageB requirement. |
| Artifact/reproducibility | Planned pinned R8/ART/ReDex/patcher source, manifest, commands, raw pairs and oracle. | Open compiler/patcher artifacts are available for most anchors. | R8 peeled commit and exact natural pair provenance are not frozen yet. | Revision/StageA gate. |

## Reviewer-shape assessment

- Editor/venue-fit view: the problem crosses mobile systems and compiler layout cleanly, but the paper must lead with a DEX-native algorithm and a consequential full-cost result. A VCDIFF tuning study is below the threshold.
- Methodology view: the exact claim is credible only with a complete writer grammar, deterministic encoder semantics, exhaustive tiny oracle, paired natural comparisons, and separation of layout actions from producer/deployment controls.
- Domain-contribution view: current R8 already performs startup-driven mixed-section placement and ReDex performs InterDex ordering. The candidate must beat their complete same-object union on the same frozen DEX IR.
- Devil's-advocate view: without the certificate, the proposal is “topologically order some blobs, call xdelta, keep a Pareto set.” R2/R3 already own the broad update-aware relocation idea, and 2024 patchers may dominate the practical benefit.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE__CONDITIONAL_ON_UNIQUE_STATIC_REVISION_GATE`
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Closed gaps: same-object can be defined; public current writer/reader and strong patchers exist; a finite natural killer and full-cost ledger can be named; no direct fatal collision was found in bounded search.
- Executable next gaps: close `CURRENT_NATIVE_WRITER_ACTION_COMPLETE__BOUNDED_DELTA_TRANSDUCER_BIJECTION_CERTIFICATE`, then the tiny native oracle and two natural-pair StageA fidelity gate.
- Human/resource-dependent gaps: none claim-critical at the first gate.
- Bounded near-Q1 gaps: a larger cross-module corpus, strong natural effect, exact/heuristic scaling, paired statistics, ablations, and artifact quality.
- Gap that would invalidate the paper: failure to establish a current-union residual and target-specific exact quotient, or no natural residual under strongest patchers/full cost.
- Why this is calibration rather than novelty or baseline evidence: these papers define the contribution/evaluation bar; the separate current-source and collision audit determines novelty and fair baselines.
- Why Tier B, if applicable, still closes same-object, latest-collision, fair-baseline, natural-evidence, full-cost and reproducibility gates: Tier B is conditional, not relaxed. The unique revision must close static same-object/action/guarantee gates; later StageA/B must still supply latest-collision completion, natural evidence, strongest full-cost baselines and reproducible artifacts.
