# S1-RQ-01

- Discovery lane / assignment: `DISCOVERY_S1_BOUNDARY_CONTRADICTION` / `DMR-V1-PSHADOW-CYCLE-01-S1`
- Divergence seed: `S1-SEED-01`
- Exact public anchor: `microsoft/T-MAC` main README and `python/t_mac/ops/qgemm.py`.
- Stable object / guarantee: T-MAC mixed-precision LUT GEMM under the repository's current quantization and kernel interface.
- Primary RQ: Can a same-quantization, non-tuning LUT decomposition/tiling execution action be stated that is not already a current T-MAC code-generation parameterization?
- Contribution type hypothesis: `COMPILER_TOOL`.
- Counterfactual consequence: a backend engineer would choose a distinct legal code-generation action rather than configure the current LUT kernel.
- Precommitted source route: official repository README → current Python operation source.
- Fallback: none; no additional source calls remain.

## Pre-evidence selection

- Selected for evidence lookup: `YES`
- Strong null: the purported action is a configuration/tuning choice already represented by current `QGeMMLUTBitsCodegen` parameters.
- Result: `RQ_BACKLOG__SCOPE_OR_ANSWERABILITY_UNCLEAR`.
- Reason: the official source exposes `bits`, LUT group `g`, weight `group_size`, `act_group_size`, SIMD widths, `m_groups`, aggregation type, fast aggregation, and zero-point controls. The proposed residual never froze a non-generic action outside that current parameterized surface.
