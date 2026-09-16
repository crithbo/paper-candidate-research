# PATCHYIELD-CALL revision-1 closing — final independent confirmation

## Verdict

`CONFIRM_STOP`

The frozen same-object state is legal, and the all-legal-state requirement
`bypass_i <= 16` is impossible for 25 simultaneously ready admitted calls when
one dispatch batch contains at most eight complete non-preemptive calls. The
sole revision gate therefore remains unclosed and no `TIER_B_Q2_VIABLE`
progress-incremental residual survives under the unchanged contract.

This confirmation does **not** adopt the PRIMARY closing's proof verbatim. Its
universal lower bound of 24 is too strong under the frozen rule that batchmates
are simultaneous. The tight policy-independent lower bound is 17. Because
`17 > 16`, the corrected proof reaches the same scientific STOP conclusion.

## Independence and provenance

- Assignment SHA256 matched the frozen value
  `3342C1F7E865B88179A4862B182C71C4DB4B302B38B7DFDAB47D8AAA61326FA8`.
- `ROLE_STAGE0_REVIEW.md` matched
  `BC58D2A365AFF6A0F82290CC3CC4E16177DBFDA69D1B28260084E9BE6B56E48C`.
- Revision handoff and manifest matched the assignment, and the revision
  manifest verified `17/17`.
- PRIMARY closing handoff and manifest matched the assignment, and its manifest
  verified `4/4`.
- The revision and PRIMARY closing dispositions were treated only as submitted
  claims. The legal-state test and counting proof below were reconstructed from
  the frozen grammar and definitions.
- No sibling-topic material, network route, download, implementation, replay,
  simulation, build, benchmark, hardware run, or Stage A/B action was used.

There is no provenance failure. The identified issue is mathematical, not
transport- or resource-related.

## 1. Legal-state reconstruction

At one scheduler epoch, let

`Q = {c_1, ..., c_25}`

contain one ready call from each of 25 distinct admitted sessions. All calls
have the same public arrival and ready time, no call is in flight, and no sealed
completion label or future event is observed. Each call is the session's next
complete non-preemptive LLM call.

The frozen grammar permits `Q_t` to be an arbitrary finite set of admitted,
simultaneously ready sessions. It imposes no ready-set cardinality bound. A
legal dispatch action is one batch `D_t subseteq Q_t` with
`1 <= |D_t| <= B`, where `B = 8`. Therefore the 25-call state is legal without
changing admission, workload, reader, routing, preemption, or action semantics.

For a call `i`, frozen bypass counts calls from other sessions dispatched after
`i` became ready and before the batch containing `i` is dispatched. Calls in
the same batch are simultaneous and do not count as earlier bypasses. Because
the witness uses distinct sessions, every call in an earlier batch contributes
one bypass to every still-ready call.

## 2. Independent 25/8/16 counting proof

Consider any policy trace that eventually dispatches all 25 calls in nonempty
batches `D_1, ..., D_m`. The batches are disjoint, cover `Q`, and each has size
at most eight. Hence `m >= ceil(25/8) = 4`.

Choose any call `i` in the final batch `D_m`. Since all 25 calls were ready at
the initial epoch,

`bypass_i = sum_{j < m} |D_j| = 25 - |D_m| >= 25 - 8 = 17`.

Thus every complete legal schedule has at least one call with
`bypass_i >= 17`, contradicting the required cap 16. This lower bound is tight:
batch sizes `1, 8, 8, 8` give every final-batch call exactly 17 bypasses. A
policy that never dispatches a remaining call does not satisfy the per-ready-call
progress/fairness guarantee and therefore is not an escape.

### Correction to the submitted 24-count claim

The sequence `8, 8, 8, 1` gives the last call 24 bypasses, but it is only one
legal batching trace. Because smaller early batches are permitted, 24 is not a
policy-independent lower bound: `1, 8, 8, 8` is a counterexample to that
intermediate assertion. The valid universal contradiction is `17 > 16`.

This correction does not weaken the terminal scientific result. It removes an
unnecessary work-conserving/full-prefix assumption and proves infeasibility for
the entire frozen variable-batch action space.

## 3. Escape audit

| Proposed escape | Effect on the corrected proof | Contract status |
|---|---|---|
| FCFS, priority, aging, tie changes | Changes identities/order only; the final batch still has at most eight calls. | Legal but ineffective. |
| Public progress state or reservation | Changes membership and batch sizes only; `25-|D_m| >= 17` remains. | Legal but ineffective. |
| Custom scheduler implementation | Can express a different partition, not dispatch more than eight calls in the final batch. | Legal substrate, not a rescue or N2 by itself. |
| Underfill early batches | Reduces the submitted 24 value but cannot reduce the tight lower bound below 17. | Covered by the proof. |
| Bound ready/admitted calls to at most 24 | Removes the legal 25-call state. | Forbidden admission/queue change. |
| Reject or delay recognition of ready calls | Changes admission/readiness semantics. | Forbidden object change. |
| Raise batch capacity to at least nine | Could make `25-B <= 16`. | Forbidden capacity change. |
| Count batches rather than other-session calls, or count only an active subset | Changes bypass/fairness semantics. | Forbidden guarantee change. |
| Pause, preempt, split, route, or issue multiple effective batches simultaneously | Changes the complete-call action or effective capacity/resource object. | Forbidden action change. |
| Raise the cap to 17 | Makes this witness feasible but changes the frozen guarantee. | Forbidden guarantee change. |

No frozen native action, progress state, tie rule, or reservation defeats the
corrected lower bound. Every apparent repair either remains a generic ordering
choice or changes an explicitly frozen object/action/guarantee component.

## 4. N2 and quality disposition

The proposed N2 required a target-specific, progress-incremental policy with an
all-legal-state bypass guarantee. The guarantee is infeasible before predictor,
ranking, or online-state design matters. Consequently:

1. a score, priority, aging rule, or scheduler hook is only generic/current fair
   scheduling application and does not provide the frozen residual;
2. a non-scalar reservation automaton cannot satisfy the cap in the legal
   25-call state; and
3. every feasible-looking repair changes admission, capacity, action, bypass,
   routing/preemption, or guarantee scope.

The sole revision has been consumed and did not close its atomic gate. Under
the frozen topic ID, the paper shape is therefore `BELOW_Q2_STOP`. This is a
same-object formal feasibility failure, which is a valid scientific STOP basis.

## 5. Evidence ceiling and resource independence

The evidence ceiling is
`STATIC_SAME_OBJECT_CONTRACT_INFEASIBILITY__CORRECTED_TIGHT_LOWER_BOUND_17`.
No claim is made about live deadline success, prediction quality, scheduler
speed, natural performance gain, or production behavior.

Absence of hardware, implementation, experiments, downloads, positive results,
or natural gains played no role in the decision. The contradiction follows only
from four frozen facts: 25 distinct calls are simultaneously ready and admitted;
all must be covered by the guarantee; each batch contains at most eight complete
calls; and bypass counts other-session calls in earlier batches with cap 16.

## Packaging note

The assignment lists both `HANDOFF.yaml` and `handoff.yaml`. On the Windows
workspace these names resolve to the same case-insensitive path, so the canonical
lowercase `handoff.yaml` satisfies both path spellings and is hashed once.

## Mainline handoff

Mainline may apply the terminal STOP recommendation, but the canonical rationale
should use the tight universal lower bound 17 rather than repeat the submitted
universal lower bound 24. No second revision, Stage A/B transition, or shared-file
change is authorized by this confirmation.

