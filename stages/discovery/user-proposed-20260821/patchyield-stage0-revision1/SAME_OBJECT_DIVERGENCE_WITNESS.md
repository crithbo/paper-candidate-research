# Same-object divergence and infeasibility witness

## Witness state

Use the exact frozen object: a single H100, fixed OpenHands/SWE-bench-Verified session semantics, and the next complete nonpreemptive LLM call action.  At epoch zero, 25 admitted sessions have their first call ready, all with equal arrival time, equal deadline tier, empty effective KV distinction, and no earlier dispatch.  No sealed result, future test output, admission choice, routing, pause, or resume is involved.

The native batch limit is eight calls.  Every deterministic tie rule therefore produces a trace of four batches with sizes at most `8, 8, 8, 1` (or another partition with the same final-call lower bound).

| Policy family | Possible first batch | Necessary last-call bypass | Meets frozen cap? |
| --- | --- | ---: | --- |
| FCFS | Any eight under its tie order | 24 | No |
| Static/dynamic priority or aging | Any eight selected by score | 24 | No |
| vLLM custom scheduler | Any legal eight chosen by arbitrary state | 24 | No |
| Progress-triggered reservation automaton | Any legal eight plus internal reservation state | 24 | No |
| VTC, DLPM/D2LPM, Justitia, SAGA, SMetric-style adaptation | Any legal eight after their own ordering | 24 | No |

## Why this is not a positive action-divergence witness

The required positive witness would have shown a complete policy action whose behavior cannot be reduced to a parameter rename, feature substitution, aging, routing, admission, pause/resume, or legal composition.  This state proves a prior fact: **no** policy action remaining in the frozen action space can meet the requested guarantee.  Internal progress state can change an ordering and can reserve a later slot, but cannot cause the fourth batch's call to have fewer than 24 preceding other-session calls.

Adding a queue-cardinality guard, admitting only a fair active subset, widening batch capacity, treating the first 16 bypasses differently, or dispatching a fractional/preempted call would make the witness disappear only by changing a frozen object/action/guarantee.  Those are prohibited repairs.  Hence the witness is a same-object negative certificate, and no clean action-divergence claim is available.
