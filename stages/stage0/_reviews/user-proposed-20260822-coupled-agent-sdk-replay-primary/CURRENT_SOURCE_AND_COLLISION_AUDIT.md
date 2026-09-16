# Current source and collision audit

## Independently inspected frozen sources

| Source | Pin / file | Finding |
|---|---|---|
| OpenHands SDK | `ddac55697…092a`, `conversation/impl/local_conversation.py` | `fork()` JSON-round-trips the agent, copies event branch, deep-copies `agent_state`, permits metrics reset/copy, and passes `workspace=self.workspace` to the fork. |
| OpenHands SDK | same pin, `conversation/state.py` | state has workspace, event log, persistent agent state, execution status, persistence/file-store and active-branch machinery. |
| Qwen | `c03e6d…e242`, `config.json` | exact artifact config declares `Qwen2ForCausalLM`, 152064 vocabulary and Transformers 4.44.0 compatibility. |
| Transformers official docs | current generation documentation | sampled generation and score/logit interfaces supply a finite public adapter route; no adapter is treated as implemented. |

## Collision outcome

CAR subtracts generic agent SCM intervention/replay. Coupled Token Generation / Counterfactual Token Generation subtract shared-randomness categorical token coupling. Current SDK fork subtracts conversation copying. None of the bounded read set supplies all of frozen SDK mutable-state coupling, tool/workspace transition actions, conditional marginal-correctness induction, conservative fallback and full-cost contract. Hence `DIRECT_FATAL=false`, `SEARCH_BOUNDED_OPEN=true`.

## Material narrowing

The branch model cannot say SDK fork is a fully copy-isolated environment. Its workspace alias means a candidate must add an external, auditably isolated worktree/filesystem/process/tool layer while retaining the same SDK, state boundary, intervention and evaluator. If this requires changing those frozen semantics, the future gate must stop rather than pivot.
