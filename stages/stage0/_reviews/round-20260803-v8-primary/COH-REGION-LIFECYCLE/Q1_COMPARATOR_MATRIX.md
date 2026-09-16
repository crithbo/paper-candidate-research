# Q1 comparator — COH-REGION-LIFECYCLE

| Anchor | Shape | Candidate delta required |
|---|---|---|
| [Schieffer et al., ICPP 2024](https://arxiv.org/abs/2407.07850) | GH200 memory characterization and manual strategies | general finite lifecycle algorithm with full transition cost |
| [TPP, ASPLOS 2023](https://arxiv.org/abs/2206.02878) | transparent tiered-memory placement | representation/initializer decision under coherent CUDA semantics |
| [SuperInfer, MLSys 2026](https://proceedings.mlsys.org/paper_files/paper/2026/hash/07fd64f9316f40193c6a4d87d8afa011-Abstract-Conference.html) | GH200 serving placement/overlap | multi-region immutable lifecycle beyond KV serving |

**Calibration:** `PARITY_CONDITIONAL`. A solver, natural lifecycle corpus, and full-cost outcome are required; this is not yet a Q1-ready empirical result.
