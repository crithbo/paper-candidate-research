# COUPLED-AGENT-SDK-REPLAY-REV0 Independent Stage 0 Confirmation

## Verdict

- Assignment: `STAGE0-C4-20260822-COUPLED-AGENT-SDK-REPLAY-CONFIRMATION`
- Unique confirmation decision: **`CONFIRM`**
- Confirmed PRIMARY disposition: **`REVISE_ONCE`**
- Conditional quality if and only if the sole gate closes: **`TIER_B_Q2_VIABLE`**
- Sole atomic gate: `NATIVE_SDK_COUPLED_BRANCH_TRANSITION__NONPRODUCT_MARGINAL_CORRECTNESS_AND_CONSERVATIVE_FRONTIER_CERTIFICATE`
- Confidence: `0.78`
- Evidence ceiling: `E1_STATIC_CONFIRMATION__NO_IMPLEMENTATION_NO_ROLLOUT_NO_POSITIVE_RESULT`
- Stage A/B authorized or started: `false / false`
- Scientific revision executed here: `false`

The PRIMARY decision is confirmed, but with one material catalog correction: frozen `LocalConversation` contains not only `fork()` but also native `rerun_actions()`. The revision must subtract both. This does not directly absorb the candidate because `fork()` aliases the workspace and `rerun_actions()` explicitly warns that tool operations are often non-idempotent and may differ on changed state. It does make any claim based merely on “native replay is absent” invalid.

## Independence and provenance

This sentry did not participate in the frozen Discovery or PRIMARY. I verified the assignment SHA-256, the frozen control files, and both upstream manifests, then independently inspected the decisive pinned SDK source and primary papers. No prior CoupledAgentReplay review was read or used. No agent, model, rollout, evaluator, dataset, benchmark, build, or experiment was run.

The frozen object remains a new topic with no inherited status or evidence: OpenHands software-agent-sdk commit `ddac55697c5d15cf8a34495b5ed6d46c86db092a`, Qwen2.5-Coder-7B-Instruct revision `c03e6d358207e414f1eca0bb1891e29f1db0e242`, fixed generation controls, the stated 16-task SWE-bench Verified slice, fixed two prompt interventions, stock task semantics and hidden evaluator.

## Decisive recheck

### 1. SDK fork and isolation are a finite gate, not yet a structural same-object failure

Pinned `local_conversation_ddac556.py` (`98D24C…A42FF`) establishes:

- `fork()` deep-copies the agent object and copied event history, and deep-copies `agent_state`;
- the fork is constructed with `workspace=self.workspace`, so the workspace is aliased;
- the persisted `ConversationState` also contains security/confirmation, secret, hook, branch-head and private event/view state that cannot be replaced by “copy events plus one dict” without an explicit sufficiency argument;
- `rerun_actions()` re-executes recorded actions, but its own contract says file, terminal, API and browser operations may be non-idempotent and results may differ; it recommends resetting the workspace.

Therefore current native fork/replay is a strong subtractor, not a proof of complete two-arm isolation. A finite static catalog can still close the gap: enumerate every state component and external mutable resource, classify it as immutable-shareable, independently clonable/resettable, or unclassifiable, and send the last class to a predeclared independent restart/fallback. The object is preserved only if both arms start from the same frozen base snapshot and each arm implements the same stock transition kernel it would have under an independent run. A shared live workspace, shared process/client/plugin state, or post-hoc reuse of an observation without proving latent-state equality fails the gate.

### 2. The Qwen sampling route is auditable, with a necessary equivalence qualification

The pinned model config identifies `Qwen2ForCausalLM`, vocabulary size 152,064 and Transformers `4.44.0`. Official Transformers 4.44.0 documentation exposes processed prediction scores and unprocessed logits, and identifies `temperature`, `top_k`, `top_p`, `do_sample`, stopping controls and returned logits/scores. Its pinned source orders `logits_processor`, then the sampling warpers, then softmax and `torch.multinomial`.

Thus a finite adapter route exists. But shared indexed Gumbels are not the same bitwise RNG path as the stock `torch.multinomial` call. The revision must state and prove the correct contract: after applying exactly the pinned native processors/warpers and stop logic, Gumbel-Max samples the same categorical distribution for each arm. The claim may be distributional marginal preservation; it may not claim identical native RNG traces or exact floating-point identity. If the adapter omits a processor, warper, EOS/stop rule, cache update, tool-call serialization rule, or finite-precision convention, marginal correctness is unclosed.

### 3. Current strongest literature union is partial, not a direct fatal collision

- Causal Agent Replay models a tool-using agent trajectory as an SCM, intervenes at a step, and re-executes downstream under a stochastic policy. It directly subtracts generic intervention/replay and attribution claims.
- Evaluation of Large Language Models via Coupled Token Generation supplies a causal coupled-autoregressive construction, shared randomness and sample-efficiency/variance results for benchmark evaluation. It directly subtracts token-only shared-randomness and ordinary coupled-output evaluation claims.
- Frozen SDK `fork()`/branching plus `rerun_actions()` subtracts claims of merely adding fork or replay support.

The union does not, in the checked material, give a complete OpenHands state-isolation catalog, a keep-shared/split/fallback transition system over actual SDK/tool/workspace states, or a full-cost frontier for two prompt-intervention arms. The latest direct-collision search remains `SEARCH_BOUNDED_OPEN`; transport or bounded-search limits are not absence evidence.

### 4. The sole gate is one finite falsifiable certificate

The PRIMARY gate is appropriately atomic if revision1 freezes all of the following in one certificate rather than distributing them across future empirical work:

1. **Complete current action catalog.** Include native fork, branch/navigation and persistence/restore behavior, native `rerun_actions`, direct tool execution, terminal/failure states, model/cache state, plugin/client/process state, hooks/security/secrets, workspace/filesystem state and all external side effects relevant to the frozen 16-task route.
2. **Branch transition relation.** For every token, action, observation and terminal transition, define `KEEP_SHARED`, `SPLIT`, or `STOP_AND_INDEPENDENT_FALLBACK`. Sharing is legal only under a predeclared immutable-state equivalence predicate, not merely because two realized byte strings happen to match.
3. **Pinned sampler induction.** Preserve the full Transformers 4.44.0 processed categorical law, including processors, warpers and stopping. Prove each arm's marginal by induction across model and environment transitions, including adaptive divergence and fallback.
4. **Isolation firewall.** Show that one arm cannot read, overwrite, schedule, confirm, cache or otherwise condition on the other arm's private state. Every unclassifiable or unrestorable side effect must trigger the declared independent fallback before a contaminated pair is retained.
5. **Nonproduct target-specific residual.** Give an SDK-state recurrence/certificate whose state labels and actions are necessary for native tool/workspace transitions. Merely composing generic token Gumbels, generic paired-mean variance algebra and an independent restart controller fails the gate.
6. **Conservative frontier and full cost.** Bound or certify the retained-pair correctness and a no-gain region using two-arm inference, copying/reset, tool/workspace/process execution, failed/uncomparable pairs, fallback/restart, evaluator, wall time, CPU/GPU, RSS and storage. No universal variance-reduction claim is allowed; positive covariance or a certified cost/error improvement is a later empirical condition.
7. **Tiny exhaustive oracle and falsifiers.** On a finite transition system containing immutable observation, mutable workspace, non-idempotent tool and fallback cases, enumerate independent and coupled paths and verify both marginals and cost accounting. Any marginal mismatch, uncataloged mutable state, or frontier reducible to generic paired statistics triggers the frozen sentinel.

This is finite, static and falsifiable. It does not require Stage 0 to supply a working adapter, rollout result, hidden score or positive natural gain.

### 5. Failure sentinels and paper tier

The PRIMARY sentinel `STOP__GENERIC_TOKEN_COUPLING_OR_NONISOLATED_SDK_BRANCH` correctly covers the two most likely scientific failures. Revision1 should mechanically distinguish three evidentiary branches inside that sentinel without creating another gate:

- `DIRECT_ABSORPTION`: the current SDK + CAR + coupled-token union already expresses the complete candidate action and guarantee;
- `MARGINAL_INVALID_OR_NONISOLATED`: a retained arm depends on shared mutable/latent state or does not have the frozen independent-run marginal;
- `GENERIC_PRODUCT_ONLY`: the only surviving theorem is ordinary token coupling plus paired statistics/restart bookkeeping, with no SDK-specific action/state frontier.

Any of those is a scientific `BELOW_Q2_STOP`. By contrast, lack of implementation, natural positive gain or benchmark output is not a STOP reason at Stage 0.

If the gate closes, a conditional Tier B measurement/algorithm paper remains plausible: the exact object and intervention are fixed; current strongest partial subtractors are named; a target-specific correctness/frontier contribution and full-cost natural route are finite; and Stage A can kill the idea before a main-result claim. Nothing in the static packet supports Tier A/Q1 yet.

## Minimum Stage A route if a later independent closing accepts revision1

This review does not authorize Stage A. The first later preclaim fidelity gate would need to verify: (i) exhaustive tiny-state marginal equality against independent execution; (ii) complete SDK state/action catalog coverage including `rerun_actions`; (iii) byte/semantic parity of the pinned Qwen processed distribution; (iv) hard branch-state isolation; and (v) full-cost comparison against independent rollouts, CAR, token-only coupling, native fork/replay and external copy/reset. A natural run may then test covariance and cost; a no-gain result remains admissible and must not be hidden.

## Final disposition

**`CONFIRM`**: retain the PRIMARY decision `REVISE_ONCE`, consume no revision in this assignment, and allow exactly the already frozen atomic certificate to be attempted by the authorized owner. The confirmation does not grant a second gate, a replacement topic, Stage A/B, or any empirical execution.
