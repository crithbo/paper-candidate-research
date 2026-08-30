# S4-SLO-PAGEPACK Q1/Q2 Paper Calibration

- Stage: `STAGEA`
- Candidate venue family: systems / data-management / memory-management
- Calibration status: `PARITY_NOT_PLAUSIBLE`
- Quality tier: `BELOW_Q2_STOP`
- Search/cutoff date: `2026-08-09`

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | OBASE | OSDI 2026 official paper | top systems / Q1-equivalent | USENIX | frozen full PDF plus upstream targeted review | same pointer-based object layout and relocation envelope |
| EVALUATION_ANCHOR | MDK | OSDI 2026 official paper | top systems / Q1-equivalent | USENIX | frozen full PDF plus upstream targeted review | same SLO-constrained reclaimed-memory objective and policy ceiling |
| DOMAIN_NEIGHBOR | HADES / Tidying Up the Address Space | DIMES 2025 | closest precursor, not Q1 alone | official author PDF | upstream paper-level review | pointer-safe hot/cold object reorganization |
| BOUNDARY_OR_NEGATIVE_ANCHOR | BRUMM | ECRTS 2026, LIPIcs | strong systems neighbor | Dagstuhl | official abstract/metadata | formal reclamation-latency accounting on a different object |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | reclaim fast-tier pages under fixed SLO | OBASE and MDK establish importance | none structurally | still important, but insufficient contribution |
| Contribution type | N2 joint packing hypothesis | OBASE layout + MDK policy | must survive composition | failed |
| Nearest-prior delta | page-slot assignment and migration jointly optimized | current sources separately cover layout and SLO target | empirical residual required | zero/negative residual |
| Algorithm/mechanism substance | exact reduced joint solver | temperature layout and policy target | candidate planning must be affordable | cost exceeds cap in 2/3 epochs |
| Baseline strength/fairness | full causal threshold/target envelope | both current anchors represented | none remaining in Stage A scope | baseline absorbs candidate |
| Natural workload/platform | official MetaKV trace slice | OBASE/CacheLib production lineage | reduced trace ceiling only | adequate for killer, not paper |
| Full-cost coverage | migration, pointer/metadata, trace, page, remote, planning, fragmentation | anchors motivate these costs | hardware cycles absent | enough for negative Stage A result |
| Main result/statistics | 0/3 positive epochs | Q1 work requires robust positive effects | fatal | STOP |
| Ablation/mechanism evidence | planning and persistence explain no-gain | OBASE/MDK mechanisms are cheaper | no positive mechanism region | STOP |
| Scale/generalization | 3 reduced epochs | OBASE spans structures/backends | far short | no Stage B because kernel failed |
| Failure boundary | low persistence; exact planning over cap | consistent with registered no-gain regions | clearly observed | closed negative boundary |
| Artifact/reproducibility | byte-identical dual replay | Q1 expects auditable artifacts | production integration absent | reproducibility strong, contribution absent |

## Reviewer-shape assessment

- Editor/venue-fit view: the problem remains relevant, but a paper cannot be sustained when the mandatory strong composition reaches every frozen point with less work.
- Methodology view: the negative result is credible because the candidate search is exact on the reduced object, the comparator is a complete causal threshold/target envelope, and all costs and semantics replay.
- Domain-contribution view: OBASE plus MDK is not merely adjacent here; its faithful composition is empirically sufficient on all three natural finite epochs.
- Devil's-advocate view: omitting planner work could make the exact optimizer appear feasible in epochs 1/3, but that would violate the preregistered full-cost contract. Epoch 2 independently gives zero residual even when planning is cheap.

## Decision

- Quality tier: `BELOW_Q2_STOP`
- Status: `PARITY_NOT_PLAUSIBLE`
- Closed gaps: same object, natural input, causal information, strong baseline envelope, exact reduced search, full cost, legality, and reproducibility.
- Executable next gaps: none within this frozen mechanism; Stage B is prohibited.
- Human/resource-dependent gaps: production concurrency and multi-trace breadth remain, but cannot repair the failed Stage A kernel.
- Bounded near-Q1 gaps: not applicable.
- Gap that invalidates the paper: the required composition fully absorbs the candidate and leaves no strict full-cost reclaimed-byte residual.
- Why this is calibration rather than novelty or baseline evidence: the reference set calibrates paper shape; the actual Stage A solver/replay supplies the negative baseline evidence.
- Why Tier B no longer closes gates: prior Tier B was conditional on a positive residual. The result closes the condition negatively, so the formal label becomes `BELOW_Q2_STOP`.

