# PATCHVALUE-COUNTERFACTUAL-REV0 Confirmation Source Log

- Assignment: `STAGE0-C2-20260822-PATCHVALUE-COUNTERFACTUAL-CONFIRMATION`
- Search date/cutoff check: `2026-08-22`
- Search status: `SEARCH_BOUNDED_OPEN`
- Persisted source bytes: `0`
- Retrieval mode: transient web connector plus frozen local package; no download, clone, model, dataset, agent, rollout, build, or experiment.
- Decisive source routes used: `9 / 12`.

## Frozen local inputs

| # | Source | Scope used | Integrity/result |
|---|---|---|---|
| L1 | Frozen PRIMARY directory | report, identifiability audit, current-source audit, comparator matrix, source log, handoff, pinned source excerpts | manifest `11/11 PASS`; handoff and manifest hashes match assignment |
| L2 | Frozen Discovery directory | brief, RQ, identifiability audit, collision matrix, fidelity plan, search log, handoff | manifest `10/10 PASS`; handoff and manifest hashes match assignment |
| L3 | OpenHands SDK `conversation/state.py` at `43376f1868ffd702746080714a59c16d3f69ec12` | persisted state/event surface | local frozen file SHA-256 `6C477B...E4826`; supports state schema, not whole-environment clone |
| L4 | OpenHands SDK `workspace/base.py` at same pin | workspace operation surface | local frozen file SHA-256 `02A75B...42F5`; no conclusion about repository-wide fork support |

## Independently rechecked decisive sources

| # | First-party/primary source | Decisive facet | Independent result |
|---|---|---|---|
| S1 | [OpenHands: Fork a Conversation](https://docs.openhands.dev/sdk/guides/convo-fork) | current official fork semantics | Events, agent and agent state are copied; workspace is explicitly shared. This is a current-union feature omitted by PRIMARY and a direct SUTVA boundary. |
| S2 | [OpenHands `LocalConversation.fork()` source](https://github.com/OpenHands/software-agent-sdk/blob/main/openhands-sdk/openhands/sdk/conversation/impl/local_conversation.py) | native implementation | Fork constructs the new conversation with `workspace=self.workspace`; the source confirms workspace aliasing rather than an isolated mutable environment. |
| S3 | [Causal Agent Replay](https://arxiv.org/abs/2606.08275) | strongest causal replay/action-attribution subtractor | Covers exact agent state interventions, forward stochastic replay, contrastive estimators, point-of-commitment and budgeted Shapley. It makes simple branch-and-difference a direct collision; it does not by itself establish the full fixed-h coding continuation/SUTVA/full-cost certificate. |
| S4 | [SWE-Router](https://arxiv.org/abs/2607.00053) | partial-trajectory routing comparator | Selects cheap versus expensive model using partial trajectory and a routing theorem. Different treatment; required strong baseline against routing relabel. |
| S5 | [FailFast-RestartSmart](https://arxiv.org/abs/2608.03222) | failure/stop/restart comparator | Early termination plus fresh restart/overlay is distinct from same-state exact-h continuation, but absorbs generic fail-fast framing. |
| S6 | [Scaling Test-Time Compute for Agentic Coding](https://arxiv.org/abs/2604.16529) | rollout selection/reuse comparator | Multi-rollout summaries/selection/reuse form a strong full-budget comparator; no direct same-state continuation-effect certificate found in the reviewed scope. |
| S7 | [BAGEN](https://arxiv.org/abs/2606.00198) | remaining-budget/early-stop boundary | Adjacent budget/progress estimator; directly excludes remaining-time prediction as the candidate kernel. |

## Provenance correction

The PRIMARY `SOURCE_LOG.md` points the FailFast and agentic-coding scaling titles to `arXiv:2502.13847` and `arXiv:2504.15277`. Independent title/source resolution used `arXiv:2608.03222` and `arXiv:2604.16529` respectively. This is a bounded locator correction, not `PROVENANCE_FAIL`, because the decisive papers were independently resolved and their boundary roles do not change the decision. The revision should use verified title–identifier pairs.

## Search-boundary statement

No reviewed source jointly covers the fixed OpenHands coding state, absorbing stop versus exact `h` complete calls, whole mutable-environment isolation, offline evaluator nonleakage, a target-specific non-attribution estimator/guarantee, strongest-union fairness and full-cost accounting. This statement is only `SEARCH_BOUNDED_OPEN`; transport success or failure is not used to infer literature absence.

