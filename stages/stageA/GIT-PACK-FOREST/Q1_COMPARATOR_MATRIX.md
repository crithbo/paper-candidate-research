# GIT-PACK-FOREST Stage A Q1/Q2 Comparator Matrix

## Decision

- Current status: `PARITY_NOT_PLAUSIBLE`
- Quality tier: `BELOW_Q2_STOP`
- Reason: the defining Git-specific residual is 0/832 in both claim-bearing runs and there is no reproducible primary benefit. No executable Stage B gap can repair that without a new object/question/ID.

## Reference calibration

| Role | Work | Object and contribution shape | Stage A semantic treatment | Resulting gap |
|---|---|---|---|---|
| Deployment baseline | Git 2.55 `pack-objects`, tagged source and pack format | One self-contained Git pack/index; window/depth/memory, reuse, name/path walk, islands and family write order | Exact same-object union and checker authority | Candidate useful actions were fully absorbed. |
| Contribution-shape anchor | Antonio Boffa et al., *On the Compressibility of Large-scale Source Code Datasets*, JSS 2025, DOI 10.1016/j.jss.2025.112429 | Software Heritage/source collections; Git calibration plus PPC/MinHash/graph genealogy | Direct subtractor for generic graph/PPC/MinHash; not an equal-object Git pack baseline | Candidate does not reach its evidence/contribution breadth. |
| Algorithm subtractor | Ouyang et al., *Cluster-Based Delta Compression of a Collection of Files*, WISE 2002 | Maximum-weight branching and clustered graph pruning | Classic branching comparator and generic-graph subtractor | Global branching alone is unavailable as novelty. |
| Evaluation anchor | Zhang et al., *Finesse*, FAST 2019 | Feature-locality resemblance detection on post-dedup chunks | Adjacent mechanism/evaluation anchor only | Different collection/encoding contract. |
| Domain neighbor | Zhang et al., *LoopDelta*, USENIX ATC 2023 | Locality, base access and restore cost for backup chunks | Adjacent full-cost/access anchor only | Different object and deployment contract. |

Primary sources:

- Git 2.55 pack-objects: https://git-scm.com/docs/git-pack-objects/2.55.0
- Git v2.55.0 source: https://github.com/git/git/tree/v2.55.0
- Git pack format: https://git-scm.com/docs/pack-format
- Boffa et al.: https://upsilon.cc/~zack/research/publications/jss-2025-swh-compression.pdf
- Ouyang et al.: https://research.engineering.nyu.edu/~suel/papers/cluster.pdf
- Finesse: https://www.usenix.org/conference/fast19/presentation/zhang
- LoopDelta: https://www.usenix.org/conference/atc23/presentation/zhang-yucheng

## Evidence comparison

| Dimension | Required paper shape | Stage A evidence | Status |
|---|---|---|---|
| Distinct N2 | Coupled bounded-depth forest/layout outside current Git actions | Real coupled constructor; forest differs from classic on 18/20 | Mechanism exists, novelty residual fails. |
| Same-object baseline | Current Git with equal object/codec/format and full strict checks | 10 individually realizable Git 2.55 configurations plus simple/classic/exact controls | Passed. |
| Natural evidence | Multiple pinned public natural histories | 20 repositories, three strata, 7,016 objects | Passed for bounded Stage A. |
| Primary effect | Repeatable pack-size or access benefit | Size p50 -55.30%, p90 -6.84%; access p50 negative; benefit count 0 | Failed. |
| Action residual | At least 10% useful actions beyond full union | 0/832 in initial and replay | Decisive failure. |
| Full cost | Pack+index, construction/index, graph/optimization, CPU/wall/RSS, verify, access, failures | Complete ledger under budget | Passed. |
| Reproducibility | Decision-stable replay with explained nondeterminism | Decision fully reproduced; candidate 20/20 hashes; overall 224/280 | Passed with partial byte-hash caveat. |

## Q1 evidence-gap review

The Stage 0 Tier-B hypothesis required a genuine Git-specific residual. Stage A falsified that premise. Broader workload coverage, a stronger theoretical bound or additional engineering cannot upgrade the same stopped N2 because the core action/benefit gap is absent. A new research question or action would require a new ID; it must not be presented as a Stage B gap for this candidate.
