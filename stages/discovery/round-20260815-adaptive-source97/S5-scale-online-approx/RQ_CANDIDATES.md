# Source97 S5 RQ candidate

## S5-97-RQ01

- Exact anchor candidate: Erlang/OTP `code` module API, current official ERTS/stdlib documentation.
- Immutable contract: stock loaded-module/current-old-code semantics, including purge outcomes and process-code safety; no change to module readers or error/visibility behavior.
- Primary RQ: Can a BEAM-native old-code reclamation constructor replace the current purge coordination with a bounded-recourse action while preserving exact loaded-module and process-code semantics?
- Counterfactual: an online upgrade could bound reclamation cost and old-code residency without weakening safety.
- In scope: runtime-native state transition and explicit complexity/recourse guarantee. Out: upgrade triggers, controllers, deployment policy, generic garbage collection, or application-level adapters.
- Contribution hypothesis: METHOD_ALGORITHM/N2.
- Primary evidence route: official `code` API documentation and official OTP source documentation; transport-only fallback: alternate official API documentation for the same module/version family.
- Alternative null hypothesis: the native `purge` / `soft_purge` / process-code actions already encompass the complete legal transition, so any remaining idea is a policy wrapper.
- Disposition: RQ_READY_FOR_ORDINARY_CLOSURE.
