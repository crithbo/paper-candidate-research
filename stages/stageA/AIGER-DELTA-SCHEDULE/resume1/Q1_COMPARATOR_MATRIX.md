# AIGER-DELTA-SCHEDULE Q1/Q2 Paper Calibration — Resume1

- Stage: `STAGEA_RESOURCE_RESUME`
- Candidate venue family: logic synthesis / EDA / formal methods
- Calibration status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP__RESOURCE_BLOCKED`
- Quality tier: `TIER_B_Q2_VIABLE` inherited from confirmed Stage0, not rescored
- Search/cutoff date: no new literature search; frozen Stage0 set retained

## Reference set

| Role | Source | Resume1 use |
|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Kabiljo/Dhulipala et al., KDD 2016 | inherited calibration only |
| EVALUATION_ANCHOR | Gagrani et al., NeurIPS 2022 | inherited calibration only |
| DOMAIN_NEIGHBOR | Mishchenko et al., DAC 2006 | inherited object-changing boundary |
| FORMAT_BOUNDARY | AIGER format report and exact source | resource/native fidelity boundary |

## Comparator status

| Dimension | Required | Resume1 status |
|---|---|---|
| Same fixed AIG and standard reader | exact native AIGER identity contract | blocked by stock Windows binary smoke |
| Complete native union | AIGER + Yosys option grid + ABC default/conditional `-u` | unavailable |
| Algorithmic substance | nontrivial formal/algorithmic property beyond enumeration | untested |
| Natural workload | family-stratified HWMCC | not acquired |
| Full cost | planner/writer/reader/check/RSS/I/O/fallback | not claim-measured |
| Reproducibility | exact tools, artifacts and replay | resource attempts reproducible; scientific path unavailable |

No paper-shape gap was scientifically closed or enlarged. Resource failure cannot change the Stage0 potential assessment.

