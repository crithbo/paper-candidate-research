# Bounded source log

| Source | Role | Observation used | Ceiling |
|---|---|---|---|
| OpenHands Software Agent SDK official source/example | current source | conversation fork/event-memory and state/workspace separation provide a concrete branching locus | does not certify frozen-commit mutable-state isolation |
| CAR, arXiv:2606.08275 | primary comparator | SCM step interventions and stochastic downstream re-execution | no full agent-level shared-randomness coupling observed in reviewed material |
| Coupled Token Generation, ICLR 2026/OpenReview | primary comparator | shared SCM token randomness and conditional variance analysis | token-level only for this review |
| Qwen fixed model card | official frozen-model route | open causal-LM artifact at the frozen revision | no execution performed |
| Transformers generation docs/source | official feasibility route | sampled generation plus scores/logits output hooks | finite adapter route, not an installed implementation |

Searches were bounded to five primary/current-source routes (within the cap of 24 routes and six primary searches). No earlier CoupledAgentReplay observations were read. No source was downloaded or persisted.
