# Source114 S4 offline divergence seed pool

- Assignment/lane: `DISCOVERY-S4-20260824-SOURCE114-PERFORMANCE-MODEL-THEORY-V1` / `DISCOVERY_S4`
- Generation completed before evidence lookup: `YES`
- Frozen focus: `MODEL_PREDICTED_SYSTEM_RANKING_VALIDITY`
- Denylist precheck: every seed is `DISTINCT` from the Source109 base and Source109–113 addenda; no seed reuses trace-schema/ranking-without-artifact identities, VLA routes, kernel-corpus routes, or previous simulator-calibration identities.

| Seed | Denylist before lookup | Offline model-validity question | Provisional public anchor | Disposition |
|---|---|---|---|---|
| S4-114-SEED01 | `DISTINCT` | Does a model ranking remain stable when estimator units are converted consistently across configurations? | `LLMCOMPASS_VERSIONED_RESULTS` | keep |
| S4-114-SEED02 | `DISTINCT` | Can a performance model certify an ordering of two serving configurations at a fixed tail-SLO endpoint? | `LLMCOMPASS_VERSIONED_RESULTS` | keep |
| S4-114-SEED03 | `DISTINCT` | Does an analytical model's batching abstraction preserve a fixed capacity ranking under a stated request-length distribution? | `LLMCOMPASS_VERSIONED_RESULTS` | keep |
| S4-114-SEED04 | `DISTINCT` | Can model error be decomposed into compute, memory, and queue cost while retaining a decision-relevant ranking endpoint? | `LLMCOMPASS_VERSIONED_RESULTS` | keep |
| S4-114-SEED05 | `DISTINCT` | Is a roofline-derived configuration ordering stable under a fixed memory-capacity denominator? | `ROOFLINE_VERSIONED_RESULTS` | keep |
| S4-114-SEED06 | `DISTINCT` | Can a queueing model predict admission-policy ranking with the same arrival and service units as the reported system? | `QUEUEING_CONTROL_VERSIONED_RESULTS` | keep |
| S4-114-SEED07 | `DISTINCT` | Does model-calibration sampling change the selected deployment configuration under a frozen cost objective? | `VIDUR_VERSIONED_RESULTS` | keep |
| S4-114-SEED08 | `DISTINCT` | Can a benchmark expose ranking reversal between model-predicted and observed configuration orderings? | `LLMCOMPASS_VERSIONED_RESULTS` | keep |
| S4-114-SEED09 | `DISTINCT` | Can a fixed contrary baseline falsify a performance model’s ordering without changing hardware or model semantics? | `LLMCOMPASS_VERSIONED_RESULTS` | keep |
| S4-114-SEED10 | `DISTINCT` | Is a cost-per-request objective compatible with a latency-SLO decision when all queue and host terms are retained? | `QUEUEING_CONTROL_VERSIONED_RESULTS` | keep |
| S4-114-SEED11 | `DISTINCT` | Can a formal error bound for model ranking translate into a defined system selection rule? | `FORMAL_PERFORMANCE_MODEL_VERSIONED_RESULTS` | keep |
| S4-114-SEED12 | `DISTINCT` | Can a held-out hardware/model tuple be an exact falsifier for a predictor’s configuration ranking? | `LLMCOMPASS_VERSIONED_RESULTS` | keep |

These are non-evidence seeds only: no novelty, accuracy, ranking, realism, or deployment conclusion is claimed.
