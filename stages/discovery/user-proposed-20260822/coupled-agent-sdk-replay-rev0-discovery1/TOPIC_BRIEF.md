# CoupledAgentReplay: shared-randomness counterfactual branching for tool-using coding agents

## Conditional thesis

For the frozen OpenHands/Qwen/SWE-bench object, a divergence-aware coupling that remains valid across token, tool and workspace transitions may estimate the I1–I0 native terminal-outcome effect with correct marginals and sometimes lower sample cost than independent real branch rollouts. The proposed contribution is an agent-level algorithm with explicit state semantics and conservative fallback—not a same-seed trick, static-log splice or budget controller.

## Exact object and same-function contract

The object fixes SDK commit/tree, Qwen revision, all 16 tasks, first-post-tool state boundary, I0/I1, decoding and absorbing terminals. Both arms use the native SDK policy and terminal evaluator; I1 adds only the frozen instruction. The estimand remains the expected native terminal-outcome difference.

## Contribution and current union

`N2/METHOD_ALGORITHM`: CoARSE couples divergent logits with a shared Gumbel SCM, then gives target-specific keep-shared/split/fallback semantics for agent transitions. CAR is the strongest agent-level comparator; Coupled Token Generation and Counterfactual Token Generation are strongest token-level comparators. Bounded review found overlapping components but no source that expresses their complete combination and conditional marginal-correctness guarantee for this object. This is `SEARCH_BOUNDED_OPEN`, not a novelty conclusion.

## Full-cost and natural route

The public natural carrier is the fixed 16-task SWE-bench set and the native SDK state after its first tool action. Full cost must include two-branch inference/token/logit computation; copying, serialization/reset, workspace/process/tool/test and evaluator time; failure/fallback, memory/storage/wall and samples for fixed error. Any positive speed/sample claim must compare against independent real rollout, CAR-style forward replay, ordinary same seed and coupled-token-only baselines under the same object.

## Finite Stage-A killer and readiness

The lowest-cost killer is a static/legality witness at the fixed SDK boundary: if two copy-isolated mutable states cannot be restored, or a current method already supplies the complete action/guarantee, stop without substituting another object. Otherwise the 72-hour gate first proves coupling legality, not a scientific outcome. The proposal is `TIER_B_Q2_VIABLE` only conditionally: `READY_FOR_INDEPENDENT_STAGE0`, evidence readiness `E1_STATIC_PREFLIGHT`, and no Stage 0, proof, rollout or performance result is claimed.
