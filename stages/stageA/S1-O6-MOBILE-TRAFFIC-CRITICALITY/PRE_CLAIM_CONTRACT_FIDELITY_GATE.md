# Pre-claim contract fidelity gate

- Gate: `FAIL_CLOSED`
- Reason class: `HUMAN_CORE_MAPPING_UNCLOSED`
- Claim-bearing run started: `false`
- Claim-bearing observation obtained: `false`
- Proxy/control run started: `false`
- Scientific revision consumed: `false`
- Resource blocker: `false`
- Required route: `RESERVE_RECOMMENDED_WITH_USER_RESEARCH_REQUEST`

## Closure matrix

| Required closure | Public-source result | Status |
|---|---|---|
| Complete source-to-first-shared-arbiter action | Sereno supplies a natural phone workload and topology-level `nsp_noc`/`SLAVE_EBI1` attribution, but reports opaque binaries, no per-operator memory behavior, no fine-grained shaping hook, and aggregate profiler data. It does not publish a complete per-request route/action stream. | FAIL |
| Native QoS comparator semantics and actual parameters | Arm defines 4-bit per-transaction AxQOS fields but explicitly does not define exact use. No frozen mobile-SoC source gives the comparator, priority/weight/urgency/starvation rules, queue state, or parameters used at the named first arbiter. | FAIL |
| Same source/budget/quality denominators | The contract is specified, but no natural request stream exists on which candidate and B4 can be replayed with identical per-request arrivals, source labels, QoS alphabet, completion set, output quality, power/thermal and starvation budgets. | FAIL |
| Unit-bearing full-cost collection paths | Public sources cover some end-to-end jank, throughput, bandwidth and software overheads. They do not close per-request classification/tag cost, arbiter cycles/state, row-buffer effect, fairness enforcement, energy/thermal attribution, or mapping error on the frozen object. | FAIL |
| Natural small witness | No public record simultaneously supplies immutable natural request IDs, source semantics, route, first-arbiter action, native QoS values, output/quality denominator and both candidate/B4 action coverage. | FAIL |

## Object and action audit

The candidate's atomic action is not “assign a priority” in isolation. It is the full, source-and-budget-preserving transformation from a natural mobile request, through an auditable source/operation label and a no-richer-than-native metadata encoding, to a choice made at the first arbiter shared by the protected foreground traffic and the on-device LLM traffic. The matched B4 action must use the same request stream and information alphabet through the platform's actual native transaction-QoS comparator.

Neither a synthetic queue, an inferred topology label, an aggregate bandwidth trace, an application-level yield experiment, nor a command-queue priority experiment covers that action. Running one would change the frozen object or action and is therefore non-claim-bearing.

## Fail-closed implication

This gate failure is not evidence that the candidate works or fails, and it does not establish native-QoS absorption. It shows that the decisive causal observation requires human-owned trace access, platform interpretation and attestation. Under the frozen assignment, the only valid disposition is human research reserve.
