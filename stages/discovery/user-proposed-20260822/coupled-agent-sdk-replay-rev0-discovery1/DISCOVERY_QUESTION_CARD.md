# Discovery Question Card

## Exact identity

- SDK: OpenHands Software Agent SDK commit `ddac55697c5d15cf8a34495b5ed6d46c86db092a`, tree `ee9887e03ede5fb4b8fba7c6f65f228afe99c51f`.
- Model/tokenizer: `Qwen/Qwen2.5-Coder-7B-Instruct@c03e6d358207e414f1eca0bb1891e29f1db0e242`.
- Tasks: the frozen 16-item SWE-bench Verified list, SHA-256 `32729224C6BA9EF3A2D47AD86FBB7E7993350D3C0B0A88D0F684A015A0EC240D`.
- State boundary: after the first completed native SDK tool action and its observation has entered conversation state, before the next model call.
- I0/I1, decoding, and absorbing native terminal semantics are exactly those in the assignment; the evaluator is not visible online.

## Claim endpoint and estimator

The estimand is the expected native terminal-outcome difference between I1 and I0 from the same complete state under shared exogenous randomness. The endpoint is the native terminal evaluator outcome. The claim is conditional marginal correctness plus a possible variance/sample-complexity advantage—not a new terminal outcome, agent success rate, or performance result.

## Source loci and current facts

OpenHands' public SDK example documents `Conversation.fork()` as a deep copy of the conversation with full event memory, and its state source identifies persisted agent state, workspace and event log as distinct state components. This supports a concrete branching locus, but does not certify full workspace/process isolation at the frozen commit. The finite Stage-A gate must verify that exact isolation route.

The fixed public Qwen artifact is a Transformers causal-LM model. Official Transformers documentation exposes sampled generation and optional logits/scores, making a finite public token-coupling adapter route possible; no model weights or code were acquired or run here.

## Falsifier and full cost

Fail the mechanism if the complete current union already implements the coupling action and guarantee, if coupled tokens compose directly to tool/workspace branching, if a snapshot cannot yield two copy-isolated branch states, or if fallback reduces to generic paired statistics. Full cost includes both branch token/inference costs, logit/coupling computation, cloning/reset/serialization, tools/tests/processes, evaluator time, uncomparable/aborted pairs, recoupling, CPU/GPU/RSS/storage/wall and samples for fixed error/power.

## Admission

`EVIDENCE_QUALIFIED_RAW__FINITE_FIDELITY_GAP`: exact object, estimand, non-generic discriminator, source loci, falsifier and finite closure route are frozen. Current-union/collision completeness and isolation implementation remain bounded Stage-0/Stage-A debts, not success claims.
