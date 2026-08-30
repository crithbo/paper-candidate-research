# Native transition and isolation certificate — failed C5 gate attempt

## Native one-step relation

At the fixed boundary, define branch state

`z=(E,A,AS,C,W,P,T,PL,H,S,R,N,Q,V)`

where `E` is active event branch/history, `A` agent, `AS` agent state, `C` context/prompt/cache, `W` workspace/filesystem, `P` process/container, `T` tool/executor state, `PL` plugins/clients, `H` hooks/security/secrets, `S` sampling/RNG, `R` runtime/model configuration, `N` clocks/network/external services, `Q` evaluator state and `V` terminal status.

For arm `a`, one native transition is: processed model distribution → sampled model token(s) → action event → tool execution → observation event → workspace/process/tool/context update → native terminal/nonterminal state. The frozen object keeps `a=I0` or `I1`, the SDK kernel and absorbing terminal semantics fixed.

## Frozen SDK catalog

| Component | native evidence | classification for a legal two-arm protocol |
|---|---|---|
| agent, event log, `agent_state` | `LocalConversation.fork()` JSON-round-trips agent, copies events and deep-copies agent state | copied |
| workspace/filesystem | fork passes `workspace=self.workspace` | forbidden-to-share; branch copy/reset required |
| stats/execution state | fork resets/copies selected state; terminals are native | reset/copy by manifest; terminals absorbing |
| persistence, event/view branch state | `ConversationState` holds file/event/view/persistence machinery | catalog and reconstruct or fallback |
| `rerun_actions()` | native replay, but non-idempotent file/terminal/API/browser warning | strong union baseline; unsafe transition requires reset/fallback |
| process/tool/plugin/client/hook/security/secret/network/clock | external or mutable state not established by `fork()` | independently resettable or uncomparable; never silently shared |
| evaluator | hidden and online-forbidden | sealed external state; fresh/reset only after arm freeze |

## Safe labels

- `KEEP_SHARED`: only a content-addressed immutable observation whose byte identity, immutability and no-latent-side-effect certificate were established before use.
- `SPLIT`: restore branch-local writable `W,P,T,PL,H,N` from the common pre-transition manifest.
- `INDEPENDENT_FALLBACK`: from each already valid branch state, continue under independent native noise; retain cost and outcomes.
- `UNCOMPARABLE`: if a state cannot be classified/restored, retain the event/cost and use a conservative missing-pair bound; do not drop it for an effect estimate.
- `ABORT_PAIR`: only a pre-admission static refusal; it may not be a post-randomization deletion.

## Induction invariant

If an admitted pair begins from two faithful copies of the common manifest and all transitions obey the table, then at each time `t` each arm's individual state law equals its stock native law conditional on its own intervention. Keep-share does not modify a branch law; split restores an independent branch-local state; fallback runs the ordinary native kernel. This establishes a **safety protocol**, not a nonproduct agent-coupling algorithm.
