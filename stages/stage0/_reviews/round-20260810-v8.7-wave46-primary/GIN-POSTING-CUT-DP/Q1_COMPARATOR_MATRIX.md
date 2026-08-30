# GIN-POSTING-CUT-DP Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: `PVLDB / SIGMOD / ICDE / EDBT`
- Calibration status: `PARITY_CONDITIONAL`
- Quality tier: `TIER_B_Q2_VIABLE` conditional on the atomic revision
- Search/cutoff date: `2026-08-10`
- Evidence ceiling: paper-shape calibration only; this matrix does not prove novelty or performance.

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Huynh et al., “Endure: A Robust Tuning Paradigm for LSM Trees Under Workload Uncertainty” | PVLDB 15(8), peer reviewed | top database venue / Q1-equivalent conference series | 2022, [official PVLDB PDF](https://www.vldb.org/pvldb/vol15/p1605-huynh.pdf) | abstract, problem, contributions, formulation and evaluation outline | Shows the expected shape for workload-conditioned data-structure optimization: formal model, algorithm, engine integration, full experiments and artifact. |
| EVALUATION_ANCHOR | Kimura et al., “Compression Aware Physical Database Design” | PVLDB 4, peer reviewed | top database venue / Q1-equivalent conference series | 2011, [official PVLDB PDF](https://www.vldb.org/pvldb/vol4/p657-kimura.pdf) | abstract, architecture, cost/model and evaluation excerpts | Calibrates full-cost physical design against an industrial engine, workload and size-estimation overhead. |
| DOMAIN_NEIGHBOR | Tzoumas, Yiu and Jensen, “Workload-Aware Indexing of Continuously Moving Objects” | PVLDB 2, peer reviewed | top database venue / Q1-equivalent conference series | 2009, [official PVLDB PDF](https://www.vldb.org/pvldb/vol2/vldb09-225.pdf) | abstract, mechanism and evaluation framing | Shows that workload-aware index actions need a precise quality/performance contract and real workload evidence. Different object, not a baseline. |
| BOUNDARY_OR_NEGATIVE_ANCHOR | Ottaviano and Venturini, “Partitioned Elias–Fano Indexes” | SIGIR 2014, peer reviewed | top IR venue | 2014, [publisher DOI](https://dl.acm.org/doi/10.1145/2600428.2609615) | metadata/method-boundary only; publisher full text was transport-unavailable in this review | Prevents claiming generic sorted-integer interval partition DP as new. It is a novelty boundary, not Q1-shape evidence. |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | Native PostgreSQL GIN layout and query/maintenance cost | Anchors address deployed storage/index tuning | Narrower but relevant | Tier B plausible |
| Contribution type | Same-format hierarchical posting-tree constructor | Endure combines formulation, algorithm and integration | Current recurrence incomplete | atomic revision required |
| Nearest-prior delta | GIN reader-event/hierarchy coupling | PEF subtracts generic interval partition; PostgreSQL subtracts local segments | Must isolate native coupling | open, search bounded |
| Algorithm/mechanism substance | exact/bounded DP over legal leaf/internal pages | Endure has a closed formal optimization; PEF has a real partition algorithm | `D[i,h]` lacks frontier/grouping state | revise |
| Baseline strength/fairness | finite PG18 bulk/dynamic/trace-tuned union plus fixed-format partition DP | Evaluation anchors use strong deployed engines | well designed, not executed | Stage A task |
| Natural workload/platform | public PostgreSQL corpora plus auditable query-key traces | all anchors use natural/recognized workloads | trace identities not yet frozen | readiness only |
| Full-cost coverage | optimizer, build, WAL, bytes, query, update, cleanup, vacuum, fallback | Endure and compression-aware design price system costs | no ledger result | Stage A/B |
| Main result/statistics | none claimed | anchors have multi-workload quantitative results | large | not required at Stage 0 |
| Ablation/mechanism evidence | planned trace-event and hierarchy ablations | anchors separate mechanism/model effects | absent | Stage A/B |
| Scale/generalization | posting-tree-heavy multi-key strata; declared no-gain cases | anchors evaluate varying data/workload sizes | currently conceptual | Tier A gap |
| Failure boundary | single-key full scans, inline lists, unstable traces | Endure explicitly studies workload mismatch | strong preregistration | positive |
| Artifact/reproducibility | public PG18 source, deterministic extractor/DP plan | Endure provides artifact | candidate artifact absent | finite readiness gap |

## Reviewer-shape assessment

- Editor/venue-fit view: a closed native algorithm plus credible PostgreSQL integration can support a focused Q2 paper. Q1 would require broader workloads, robustness and a stronger formal result.
- Methodology view: the decisive issue is not missing experiments; it is whether the state space exactly represents GIN scan and hierarchy semantics.
- Domain-contribution view: current GIN already owns compressed sublists, page paths and maintenance. The contribution must be the coupled constructor/guarantee.
- Devil's-advocate view: if the trace reduces to per-key frequencies or if internal pages are deterministic after leaf packing, the paper collapses to generic partition tuning and fails Q2.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE` conditional
- Status: `PARITY_CONDITIONAL`
- Closed gaps: exact PostgreSQL object, finite upstream/config union, same-information fairness design, full-cost dimensions and finite CPU execution route.
- Executable next gaps: the single hierarchical trace-replay DP certificate, then native fidelity and natural killer work.
- Human/resource-dependent gaps: none presently structural.
- Bounded near-Q1 gaps: robust trace drift, two or more workload families, algorithm scalability/approximation and complete artifact.
- Gap that would invalidate the paper: no non-product native hierarchy residual beyond generic page partition/full packing.
- Why this is calibration rather than novelty or baseline evidence: these papers define expected contribution/evaluation breadth; PostgreSQL source and the collision audit determine novelty/baselines.
- Why Tier B remains conditional: same-object and finite routes are credible, but algorithm completeness must close before a PASS recommendation.
