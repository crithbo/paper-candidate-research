# Full cost and finite Stage A falsifier (not executed)

## Preserved full-cost ledger

Any later authorized claim-bearing evaluation must account for wall-clock deadline success, H100 GPU time, vLLM scheduler CPU overhead, OpenHands/tool time, model/token work, KV/cache memory and traffic, batch padding/idle time, per-call queue delay, repository/task reset and warm-up, policy-state memory, and failed/aborted attempt cost.  It must report every repository fold × deadline tier × offered-load cell, the frozen `bypass_i` distribution, and a zero-violation audit at the frozen cap.

The primary evidence remains deterministic live reexecution; replay is sensitivity/debug only.  Fixed versions, reset protocol, policy-order blocking/counterbalancing, and replicated seeds are necessary to avoid attributing nondeterministic agent/tool trajectories to an ordering policy.

## Finite falsifier

No H100 run is authorized by this assignment.  If an independent Stage 0 reviewer nevertheless considered the gate closed, the first finite Stage A killer would be:

1. construct the 25-ready-call state within the frozen object, retaining `max_num_seqs=8` and the original bypass definition;
2. run the policy's deterministic checker over its first four dispatched batches;
3. reject the policy if any call has more than sixteen preceding other-session dispatches; and
4. reject if the setup avoids the state through admission, queue truncation, action splitting, preemption, routing, or changed fairness semantics.

This static certificate already proves the killer will reject every policy in the frozen action space.  Consequently a Stage A plan must not be initiated on the basis of this revision, and this document makes no performance, deadline-success, fairness-improvement, or quality claim.
