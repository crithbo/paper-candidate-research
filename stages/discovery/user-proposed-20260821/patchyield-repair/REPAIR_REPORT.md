# PatchYield replay, fairness, and path repair

## Decision

`READY_FOR_INDEPENDENT_STAGE0`

This is packaging readiness only. It does not decide Stage 0, authorize Stage A,
or claim a scientific result.

## Repair table

| Defect in supplied material | Repair | Why it matters |
|---|---|---|
| Fixed-service-time replay was labelled primary causal evidence. | Live re-execution is primary; replay is debugging/sensitivity-only and needs live calibration plus held-out schedule validation. | Service time changes with scheduler-induced batching, cache and queue state. |
| Deadline tiers did not explicitly anchor every request at arrival. | `deadline_i = arrival_i + tier_i × 60s`; readiness/dispatch/completion cannot reset the clock. | Prevents a scheduler from moving the denominator. |
| Fairness was qualitative. | Every ready call has at most 16 cross-session bypasses; zero violations in every pre-registered cell is required. | Makes non-starvation auditable and separate from performance. |
| Bootstrap dry run executed `mkdir -p` and defaulted cache below the current directory. | Repaired dry run exits before mutations; future Stage-A acquisition is authorization-gated and local to `resources/`. | Removes hidden path mutation and global/default cache ambiguity. |
| vLLM launch defaulted parser cache through `$HOME`. | Repaired launcher uses only assignment-local model/parser/cache/tmp paths, requires verified local assets and Stage-A authorization before launch. | Prevents silent HOME/global-cache use and implicit model acquisition. |

## Static verification scope

The repaired scripts were not executed. Text inspection is sufficient here because
the assignment forbids H100, vLLM, agents, containers, simulations, installations,
and model/dataset downloads. Official vLLM documentation was consulted only to
confirm that parser/plugin and explicit download-directory options exist; frozen
v0.26.0 CLI compatibility remains a finite Stage-A static preflight item.

## Remaining bounded reason

The only remaining readiness dependency is finite and external to Discovery: the
Stage-A resource/bootstrap gate must validate bookable H100 capacity and the frozen
artifact/parser/container identities before any live evidence. This is not a
scientific negative conclusion.
