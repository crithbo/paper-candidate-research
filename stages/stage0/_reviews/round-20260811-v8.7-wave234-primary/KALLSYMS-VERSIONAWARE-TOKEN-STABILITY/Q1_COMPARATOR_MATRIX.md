# KALLSYMS-VERSIONAWARE-TOKEN-STABILITY Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: software systems, systems compression, reproducible systems optimization
- Calibration status: `PARITY_NOT_PLAUSIBLE` for Q1 now; conditional Q2 shape
- Quality tier: `TIER_B_Q2_VIABLE` conditional on the atomic revision gate
- Search/cutoff date: `2026-08-11`

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Boncz et al., “FSST: Fast Random Access String Compression” | PVLDB, peer reviewed | top data-management venue / Q1-equivalent research shape | 2020, [PVLDB PDF](https://www.vldb.org/pvldb/vol13/p2649-boncz.pdf) | abstract, format, symbol-table construction, algorithm/evaluation | Shows the algorithmic and artifact depth expected when a static symbol-table constructor is the main contribution. Different decoder/format, so not a same-object baseline. |
| EVALUATION_ANCHOR | Kulkarni et al., “Redundancy Elimination at the Block Level” | USENIX ATC, refereed | top systems-conference-equivalent evaluation shape | 2004, [USENIX paper](https://www.usenix.org/legacy/event/usenix04/tech/general/full_papers/kulkarni/kulkarni_html/) | mechanism, union of dedup/compression/delta, scale/cost | Calibrates end-to-end data-reduction evaluation and why full composition costs matter. |
| DOMAIN_NEIGHBOR | Korn and Vo, “Engineering a Differencing and Compression Data Format” | USENIX ATC, refereed | top systems-conference-equivalent methodological anchor | 2002, [USENIX paper](https://www.usenix.org/legacy/event/usenix02/full_papers/korn/korn_html/) | format, source/target windows, optimal fixed-table encoding, performance | Defines the VCDIFF family that must be a fair deployment comparator and shows algorithm/format separation. |
| BOUNDARY_OR_NEGATIVE_ANCHOR | Chromium Courgette design | official deployed design, not a peer-reviewed paper | deployment boundary only | official Chromium design, [source](https://www.chromium.org/developers/design-documents/software-updates-courgette/) | executable normalization, label adjustment, bsdiff composition | Demonstrates representation-aware delta co-design, but changes executable representation and is not the same native kallsyms object. |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | smaller/stabler kernel release artifacts without changing crash/lookup semantics | FSST and REBL address broadly recurring data reduction | kallsyms is narrower than columns/storage systems | Q2 plausible, Q1 breadth weak |
| Contribution type | target-specific bounded frontier and predecessor-conditioned constructor | FSST contributes a concrete symbol-table algorithm; VCDIFF separates encoder algorithm from decoder | candidate frontier not yet defined | `REVISE_ONCE` |
| Nearest-prior delta | stock current-only greedy + generic binary delta -> native joint construction | Courgette shows representation normalization can aid deltas | must prove native fixed-point action divergence, not analogy | atomic gate |
| Algorithm/mechanism substance | exact/certified DP over deterministic legal frontier | FSST gives an explicit construction; VCDIFF gives dynamic encoding under fixed code table | current proposal names DP but not state/frontier construction | insufficient for PASS |
| Baseline strength/fairness | stock, VCDIFF, second delta engine, predecessor-stability heuristic | REBL evaluates a union rather than a weak isolated baseline | versions/configs/parameters need pinning in Stage A | route is finite |
| Natural workload/platform | 20--50 adjacent official Linux tags | REBL/FSST use real corpora | no acquired corpus/results yet | readiness gap only |
| Full-cost coverage | image+delta+all link/generator/delta/verify CPU/RSS+boot/lookup | VCDIFF and REBL expose encoder/decoder cost trade-offs | link fixed-point must be charged and verified | explicitly required |
| Main result/statistics | chronological held-out Pareto results | anchors report scale and trade-offs | no results at Stage 0 | not a STOP condition |
| Ablation/mechanism evidence | local-only, delta-only, no predecessor, stability heuristic | FSST isolates construction effects | must distinguish DP from weight tuning | atomic gate + Stage A |
| Scale/generalization | one pinned architecture/config across many tags, then optional second config | anchors span broader datasets | deliberately narrow initial claim | supports Q2 ceiling |
| Failure boundary | no legal fixed-point alternatives, no headroom, or overhead dominates | anchors discuss format/decoder constraints | needs measured prevalence later | pre-registered |
| Artifact/reproducibility | official tags, manifests, pinned toolchain and delta engines | all anchors provide stable specifications/sources to varying degrees | candidate package not implemented | finite readiness gap |

## Reviewer-shape assessment

- Editor/venue-fit view: a publishable Q2 paper is plausible only if the Linux-specific constructor is explicit and natural release chains show a full-cost residual. The current proposal is too underdefined for acceptance but is not structurally dead.
- Methodology view: the decisive issue is the native link fixed point. A detached symbol-map encoder would invalidate same-object semantics. A fixed-point-preserving frontier and static witness are finite to audit.
- Domain-contribution view: current Linux provides a per-version greedy compressor and an unchanged reader. This leaves a real conditional action gap, but configuration flags merely change the input/offset mode and are not candidate actions.
- Devil's-advocate view: “DP over an enumerated frontier” can hide a generic meta-selector. If the revision cannot expose state sufficiency, complexity, and a legal divergence beyond scalar stability weights, the topic is below Q2.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE` conditional
- Status: `PARITY_NOT_PLAUSIBLE` for Q1; Q2 remains conditionally viable
- Closed gaps: natural carrier, current reader/generator/link surface, finite comparator family, full-cost dimensions, and finite evidence route.
- Executable next gaps: the one static revision gate `NATIVE_LINK_FIXED_POINT_PRESERVING_FRONTIER_DIVERGENCE`.
- Human/resource-dependent gaps: none presently decisive.
- Bounded near-Q1 gaps: broader configuration/architecture replication and stronger theoretical guarantee would be needed after Q2 viability is demonstrated.
- Gap that would invalidate the paper: no native legal same-semantics action divergence after link fixed-point constraints, or collapse to generic delta/weight tuning.
- Why this is calibration rather than novelty or baseline evidence: the reference set is used only to judge contribution and evaluation shape; novelty is assessed separately against same-object current Linux and bounded collision search.
- Why Tier B, if applicable, still closes same-object, latest-collision, fair-baseline, natural-evidence, full-cost and reproducibility gates: it does not yet close them for stage advancement; the conditional label expresses structural potential, while `REVISE_ONCE` requires the one same-object algorithm certificate before a PASS can be recommended.
