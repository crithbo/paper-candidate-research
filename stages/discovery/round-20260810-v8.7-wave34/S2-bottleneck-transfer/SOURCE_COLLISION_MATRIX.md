# Algorithmic residual / collision matrix — WAVE34

| Line | Decision rule | Information | Complexity/resource | Quality / guarantee | Full-cost and no-gain | Result |
|---|---|---|---|---|---|---|
| CloudTS | global metadata dictionary + mapping + grouped objects | tags, time partition, series group | representation-dependent metadata/object construction | CloudTS query semantics | query/data metadata costs; dynamic substitute changes format | DROP: direct core-action collision / changed object |
| Knative default/configured | readiness and burst/capacity predicates | probes, demand, config | native control plane | native readiness/request semantics | probe, routing, queue, warm resources; no gain under ample capacity | strong baseline only |
| MPC / PREEMPT-FaaS | forecast/prewarm/dispatch or criticality priority | future model or declared priority | controller/model overhead | latency/priority objectives | warm resource and orchestration cost | direct subtractors, not equivalent to drain credit |
| DRAIN-CREDIT | bounded joint admit–withdraw–migrate action | active/queued counts, grace, duration quantile; no future/priority | O(1) counters/quantile update | conservative no-credit-negative-admission invariant, same native request semantics | includes queue/retry/routing/control/warm cost; no gain for homogeneous short calls/no transition | PROPOSE_STAGE0, `SEARCH_BOUNDED_OPEN` |
| MedFS / F2FS | delta-inline maintenance vs native compression | incompatible file layouts | different filesystem semantics | different on-disk contract | no fair common denominator | DROP: same-object failure |

## Current-source reality

- Knative: `knative-v1.23.0` / `7ed4aa2`, released 2026-07-29 and checked
  2026-08-10.  Official docs confirm Queue-Proxy readiness aggregation,
  aggressive/default/custom probes, Activator buffering, direct routing, and
  burst/concurrency conditions.  Release notes show active queue metrics and
  graceful shutdown work.  These are contrary evidence against an absence
  claim and are all in the baseline union.
- The candidate’s structural gap is instead a falsifiable algorithmic claim:
  no checked source expresses the stated transition-local credit invariant with
  the same information and full-cost boundary.  Stage 0 must independently
  verify this `SEARCH_BOUNDED_OPEN` classification.
- CloudTS and MedFS are dropped on direct core action/object mismatch; neither
  relies on an unverified current-implementation absence.
