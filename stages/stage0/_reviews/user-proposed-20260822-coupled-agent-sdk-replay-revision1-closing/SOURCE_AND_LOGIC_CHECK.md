# Decisive Source and Logic Check

- Assignment: `STAGE0-C4R1-20260822-COUPLED-AGENT-SDK-REPLAY-CLOSING`
- Check date: `2026-08-22` (Asia/Shanghai)
- Result: `CONFIRM_STOP__BELOW_Q2_STOP`
- Latest-collision status: `SEARCH_BOUNDED_OPEN`
- External payload persisted: `none`
- Decisive route envelope: `6/8`

## Frozen integrity

| Item | Expected SHA-256 | Result |
|---|---|---|
| Closing assignment | `57B6AB4155A726506E765C41C8BBC8BB1AF79F50C3EA1257F2884E67585A40E1` | PASS |
| PRIMARY handoff | `28D0E35FE0B2E9DF06FE0E5E15ED6EA97F68D56F829126F8179F6FBB426F73DA` | PASS |
| Confirmation handoff | `752CAB59987E668D40F3F6A7770A6913DBAD767A5417710C12F0664379B6A6E0` | PASS |
| Revision1 handoff | `C8A8BECBFA604D323BC5DFAAE3990EDE59478E5738B1D0538AAE5D48704A7B9E` | PASS |
| Revision1 manifest | `E31E5BE6D77A05764347006EE49B009D04CC1E720F204641D9EE2A1EC0661538` | PASS; 8 canonical entries verified (two comment lines excluded) |

## Decisive sources

| # | Source | Read scope | Logic supported |
|---:|---|---|---|
| 1 | Frozen revision1 package: `REVISION_REPORT.md`, three certificates, union delta and handoff | Complete | Whether a target-specific action/frontier exists inside the consumed revision |
| 2 | Frozen OpenHands `local_conversation_ddac556.py`, SHA `98D24C2E482E906807B6ADD26DF7D2044CDB9770A00683FBEE9C71315BBA42FF` | `fork()` lines 759–889; `rerun_actions()` lines 2925–3028 | Native fork/workspace alias; native replay and non-idempotence warning |
| 3 | Frozen OpenHands `conversation_state_ddac556.py`, SHA `AC4074B439A5F97D31CC4CDB0170992582DFA9BFC7E6C75B9690699CC3B3D615` | State fields/private event-view machinery | Concrete-state obligations omitted by the broad isolation tuple |
| 4 | Transformers 4.44.0 pinned generation source, https://raw.githubusercontent.com/huggingface/transformers/v4.44.0/src/transformers/generation/utils.py | Lines 2748–2793 and corresponding sample path | Processor/warper/softmax/multinomial order; distributional-not-bitwise boundary |
| 5 | Benz et al., *Evaluation of Large Language Models via Coupled Token Generation*, https://arxiv.org/html/2502.01754 | Coupled randomness, sample-reduction claims, zero-correlation boundary | Generic token-coupling subtraction and no-gain regime |
| 6 | Shah, *Causal Agent Replay*, https://arxiv.org/html/2606.08275 | SCM trajectory, interventions, faithful replay and run-forward estimators | Generic agent intervention/replay subtraction |

No transport failure or bounded-search limit was used to infer absence.

## Mechanical logic checks

### C3: categorical marginal

For processed categorical probabilities `p_a(j)` and i.i.d. standard Gumbels `G_j`,

`argmax_j(log p_a(j) + G_j)`

has marginal `p_a`. Sharing `G_j` between arms changes the joint law, not either marginal. This accepts revision1's distributional claim and rejects only a bitwise stock-RNG claim, which revision1 expressly disclaims. The argument remains conditional on faithfully matching all native processors, warpers and terminal rules.

### C4: uncomparable-pair interval

Let `n` admitted pairs include `m` missing/uncomparable terminal differences and let every difference lie in `[-1,1]`. If `S_obs` is the sum of the observed `n-m` differences, then the full-sample mean lies in

`[(S_obs-m)/n, (S_obs+m)/n]`.

The revision formula is arithmetically correct. It is a missingness bound, not a variance/sample-cost gain.

### C5: decomposition test

Removing named existing/general components leaves no packet-internal residual:

| Revision component | Fair subtractor | Residual inside revision1 |
|---|---|---|
| Shared Gumbel token noise | Coupled Token Generation / common random numbers | none |
| Step intervention and forward stochastic replay | CAR | none |
| Conversation branch/replay | native SDK `fork()` and `rerun_actions()` | none |
| Workspace/process/tool separation | copy/reset/COW safety hygiene | no selection objective or guarantee |
| Independent fallback | independent rollout baseline | none |
| Missing-pair bound and covariance identity | generic paired/missing-data statistics | none |
| Full-cost list | accounting requirement | no recurrence, bound or frontier |

### Strongest disagreement test

The label automaton is not itself a demonstrated nonproduct algorithm. Revision1 contains no mapping from observable frozen SDK states to a cost/quality-optimal or approximation-certified label sequence, and no theorem connects those labels to covariance, retained-pair rate, sample complexity or cost. Disagreement with STOP would require that concrete action and guarantee already be present in revision1; it is not.

## Scientific versus non-scientific reasons

- Scientific and decisive: absent N1/N2/N3 residual after fair subtraction; C5 formal failure; incomplete concrete isolation/transition certificate.
- Not used: missing implementation, missing positive result, missing natural benchmark output, resource availability, or transport failure.
- Therefore: `CONFIRM_STOP__BELOW_Q2_STOP`, not a policy hold or resource blocker.
