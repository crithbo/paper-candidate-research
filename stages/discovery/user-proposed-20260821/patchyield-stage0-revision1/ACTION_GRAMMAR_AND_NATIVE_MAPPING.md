# Frozen action grammar and native mapping

## Same-object grammar

At scheduler decision epoch `t`, the public state is

`S_t = (Q_t, e_t, K_t, C_t, M_t)`.

`Q_t` is an arbitrary finite set of admitted, simultaneously ready OpenHands sessions.  A ready call is

`c = (session_id, call_index, ready_time, arrival_time, public_history, kv_state, deadline)`.

Successive calls of one session become ready only after the preceding tool/LLM boundary completes.  Every selected item is the session's complete, nonpreemptive next LLM call.  The action is a batch

`D_t subseteq Q_t`, with `1 <= |D_t| <= B` and frozen `B = max_num_seqs = 8`.

For equal-ready ties, a reproducible candidate would need a public fixed ordering `(ready_time, arrival_time, session_id, call_index)`.  `K_t` records extant KV/cache state, `C_t` records all prior dispatches and tool returns, and `M_t` would record any policy state.  None permits admission, rejection, early termination, routing to another model, precision switching, KV eviction, token-level preemption, tool reordering, or pause/resume.

For a call `i`, frozen bypass is the number of calls from other sessions dispatched after `i` becomes ready and before a batch containing `i` is dispatched.  Batch mates are simultaneous rather than earlier dispatches.

## Native-control mapping

| Frozen object element | Current native control / evidence locus from frozen Stage 0 materials | Contract consequence |
| --- | --- | --- |
| Batch capacity | vLLM scheduler configuration, frozen `max_num_seqs=8` | A batch cannot contain more than eight complete calls. |
| FCFS / priority ordering | Native scheduler queue and priority path | Baseline supports ordinary queue order or scalar priority only. |
| Scheduler extension | vLLM `scheduler_cls` / custom scheduler hook | It is an implementation expressivity baseline, not evidence that a new scheduling guarantee already exists. |
| Chunked prefill, token budget, KV controls | Native scheduler configuration | These may change token work or batching, but do not alter the frozen complete-call/bypass semantics. |
| Session/tool state | OpenHands runner and call boundary | A policy may observe only the frozen public pre-dispatch state; it cannot consume sealed completion labels. |

The assignment permits an N2 algorithm implemented through a scheduler extension, but prohibits calling that extension itself an action gap.  A proposal therefore needed a complete, non-scalar online algorithm and a guarantee that survives the current union.  The feasibility theorem below is independent of whether that implementation route is native or custom.

## Minimal legal counterexample state

Let `Q_t` contain 25 distinct admitted sessions, each with exactly one ready complete call, identical public arrival/ready time, no in-flight work, and no policy-relevant difference.  This state obeys the frozen grammar: `Q_t` is finite, every item is admitted and ready, and batch membership is limited only by `B=8`.  It neither changes the workload nor adds a new reader, agent, data source, or scheduler action.
