# Current collision and comparator matrix

Checked 2026-08-21 using first-party current documentation and primary papers.  `SEARCH_BOUNDED_OPEN` below is a bounded-search statement, not an absence or novelty claim.

| Source / role | Frozen object/action/endpoint | Relation to PatchValue | Disposition |
| --- | --- | --- | --- |
| OpenHands current SWE-bench README — CURRENT | Run/evaluate OpenHands agents on SWE-bench instances; instance-specific image/SDK semantics | Defines native evaluation carrier and confirms a fixed agent benchmark is feasible; does not define a causal continuation value | `DEPLOYMENT_BASELINE` |
| SWE-bench current CLI — CURRENT | Evaluate a prediction against a selected versioned dataset/task image | Defines offline evaluator boundary | `DEPLOYMENT_BASELINE` |
| SWE-Router (2026) — CONTRARY | Partial trajectory predicts terminal resolution and routes a task between cheap and strong models | Strong closest subtractor. It changes model/routing action and target to conditional terminal success, not same-model `do(h calls)` value from cloned state | `DIRECT_SUBTRACT`: prohibit any model-routing or terminal-success-classifier claim |
| FailFast-RestartSmart (2026) — CONTRARY | Prefix failure monitor triggers early termination and fresh restart | Same coding benchmark family and partial prefixes, but changed action (stop/restart) and target (failure detection/token saving) | `DIRECT_SUBTRACT`: prohibit stop/restart/early-exit framing |
| BAGEN (2026) — CONTRARY | Progressive interval prediction of remaining internal/external budget | Same resource-awareness theme but estimates cost/finishability, not hidden-test success treatment effect or fixed-pool allocation | `METHODOLOGICAL_ADJACENT` |
| Scaling Test-Time Compute for LLM Agents (2025) — ESCAPE | Parallel/sequential rollout scaling, verifiers and merge methods | Rollout-level scaling/selection; no fixed same-state incremental-call estimand | `METHODOLOGICAL_ADJACENT` |
| Scaling Test-Time Compute for Agentic Coding (2026) — ESCAPE | Rollout-summary representation, tournament selection, sequential reuse | Strong test-time-scaling collision. It selects/reuses whole rollout experience, not independently seeded continuation arms from the same state | `DIRECT_SUBTRACT`: no rollout-summary/reuse contribution claim |
| MARS (2026), SAGA (2026), FairBatching (2025) — CURRENT/CONTRARY | Agent/LLM serving, latency, KV, admission, workflow/fairness/batching | They are strong systems baselines for cost accounting, but optimize serving completion/latency rather than sealed repair success under a fixed total call budget | `DEPLOYMENT_BASELINE` |

## Fair same-information comparator contract

All allocation comparators observe the same public prefix and may not receive hidden-test labels, branch outcomes, or post-decision tool output:

1. uniform minimum-plus-uniform-extra allocation;
2. round-robin extra-call allocation;
3. static issue/repository difficulty allocation;
4. calls/tokens already consumed;
5. remaining-time prediction;
6. token-based SRPT using only public service estimates;
7. outcome-agnostic learned allocation with the same public features but no branch-derived treatment label; and
8. an offline oracle ceiling using held-out branch outcomes, reported only as unattainable upper bound.

The candidate must not compare against a model router, restart controller, or arbitrary offline oracle as if it were a same-information deployable baseline.

## Residual and collision ceiling

The only surviving residual is a measurement-plus-allocation claim: within one fixed agent/model/decoder distribution, public progress predicts the **conditional causal increment** of `h` same-model continuation calls beyond the named public covariates, and lower-confidence allocation improves a fixed total budget without layer-specific harm.  If the label is terminal success, if the action routes/restarts/stops, or if branch lineage is not isolated, the closest sources absorb the claim.  No direct-fatal paper was established within this limited static search, so the current collision state is `SEARCH_BOUNDED_OPEN` with the listed direct-subtract boundaries.

## Sources

- OpenHands/benchmarks SWE-bench README, current main: https://github.com/OpenHands/benchmarks/blob/main/benchmarks/swebench/README.md
- SWE-bench current CLI: https://www.swebench.com/SWE-bench/reference/cli/
- SWE-Router: https://arxiv.org/abs/2607.00053
- FailFast-RestartSmart: https://arxiv.org/abs/2608.03222
- BAGEN: https://arxiv.org/abs/2606.00198
- Scaling Test-Time Compute for LLM Agents: https://arxiv.org/abs/2506.12928
- Scaling Test-Time Compute for Agentic Coding: https://arxiv.org/abs/2604.16529
- MARS: https://arxiv.org/abs/2604.26963
- SAGA: https://arxiv.org/abs/2605.00528
- FairBatching: https://arxiv.org/abs/2510.14392
