# Decisive Source Log

- Assignment: `STAGE0-C4-20260822-COUPLED-AGENT-SDK-REPLAY-CONFIRMATION`
- Checked on: `2026-08-22` (Asia/Shanghai)
- Search status: `DECISIVE_MINIMUM_CLOSED__LATEST_COLLISION_SEARCH_BOUNDED_OPEN`
- Persisted external source payloads: `none`
- Source-route limit: `12`; decisive routes used: `8`

| # | Source | Identity / locator | Read scope | Decisive use |
|---|---|---|---|---|
| 1 | Frozen confirmation contract and upstream manifests | assignment SHA `8E551B3F…A1BB9`; PRIMARY handoff `28D0E35F…F73DA`, manifest `96A1CCF6…15F13`; Discovery handoff `C6C0B0A5…0022`, manifest `4FE96D0F…9D4` | Complete contract; manifests mechanically checked | Identity, boundary, independence and frozen gate |
| 2 | OpenHands `LocalConversation` pinned source | SDK commit `ddac55697c5d15cf8a34495b5ed6d46c86db092a`; local immutable copy `resources/src/local_conversation_ddac556.py`; SHA `98D24C2E482E906807B6ADD26DF7D2044CDB9770A00683FBEE9C71315BBA42FF`; lines 759–889, 2925–3028 | `fork`, workspace alias, copied agent/event/agent_state, `rerun_actions` contract and implementation | Current native action catalog and isolation gap |
| 3 | OpenHands `ConversationState` pinned source | same SDK pin; local immutable copy `resources/src/conversation_state_ddac556.py`; SHA `AC4074B439A5F97D31CC4CDB0170992582DFA9BFC7E6C75B9690699CC3B3D615`; lines 82–240 | Persisted fields and private event/view state | State-sufficiency/firewall requirements |
| 4 | Frozen Qwen model config | revision `c03e6d358207e414f1eca0bb1891e29f1db0e242`; local immutable `qwen_config_c03e6d.json`; SHA `C0242402AD6A13B331EA320FEEA8C7E3776FFB7A4EFF0757B9CD667E116D9A28` | Architecture, vocabulary and Transformers version | Model/sampler identity ceiling; config alone does not prove adapter fidelity |
| 5 | Hugging Face Transformers 4.44.0 generation documentation | https://huggingface.co/docs/transformers/v4.44.0/en/main_classes/text_generation | GenerationConfig, sampling controls, processed/unprocessed scores, output and stopping controls | Shows finite official logits/sampling surface |
| 6 | Hugging Face Transformers 4.44.0 generation source | https://raw.githubusercontent.com/huggingface/transformers/v4.44.0/src/transformers/generation/utils.py ; especially lines 2657–2676, 2748–2777 | `_sample`: model logits → logits processors → warpers → softmax → `torch.multinomial` | Fixes exact native distribution path and qualification for Gumbel interposition |
| 7 | Benz et al., *Evaluation of Large Language Models via Coupled Token Generation* | arXiv:2502.01754, https://arxiv.org/html/2502.01754 | Abstract, causal coupled generation, Gumbel-Max, sample-efficiency conditions/limitations | Direct token-coupling subtractor; does not close SDK isolation |
| 8 | Shah, *Causal Agent Replay: Counterfactual Attribution for LLM-Agent Failures* | arXiv:2606.08275v1, https://arxiv.org/html/2606.08275 | Abstract and SCM/intervention/action-observation trajectory model | Direct intervention/replay subtractor; does not establish coupled branch-state frontier |

## Contradiction and limitation log

- PRIMARY's action catalog was incomplete unless `rerun_actions()` is included. The native method does not prove safe replay: its first-party contract expressly warns of non-idempotent and state-dependent behavior.
- Transformers 4.44.0 makes the categorical distribution auditable, but a shared-Gumbel adapter is distribution-preserving only after all pinned processors/warpers/stopping rules are matched. It is not automatically a bitwise-native RNG replay.
- Coupled Token Generation already claims coupled autoregressive sampling and conditional sample reduction; generic shared-token noise is therefore not residual novelty.
- CAR already claims SCM intervention and downstream stochastic replay for tool-using agents; generic agent counterfactual replay/attribution is not residual novelty.
- No checked source establishes the complete combined SDK isolation/action/frontier certificate. This is a bounded-open collision result, not an absence claim.

No source download, model access, agent execution, benchmark, build or experiment occurred. Web retrieval remained read-only and no external payload was persisted under the assignment resource root.
