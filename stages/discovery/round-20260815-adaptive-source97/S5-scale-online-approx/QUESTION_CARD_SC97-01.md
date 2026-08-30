# DISCOVERY_QUESTION_CARD — SC97-01

- Exact identity: ERLANG_OTP_CODE_OLD_CODE_PURGE__BOUNDED_RECOURSE_RECLAMATION.
- Anchor/current locus: official Erlang/OTP 29.0.3 kernel `code` API, accessed 2026-08-15: https://www.erlang.org/doc/apps/kernel/code.html.
- Same-object contract: stock module current/old-code states, process liveness behavior, external-call availability, and purge/soft_purge outcomes.
- Current union: two concurrent code variants; third load purges old code and terminates lingering processes; `purge/1` removes old code and kills lingering processes; `soft_purge/1` removes it only when no process lingers; `check_process_code` establishes direct-reference liveness.
- Fair subtractor: the complete current code-server union above under the same module/process information, not a simple reload baseline.
- Candidate action tested: version-aware bounded old-code reclamation.
- Minimum falsifier: documented `soft_purge` plus direct-reference checking already provides the only safe non-killing old-code transition; any remainder changes release timing, retry policy, or user-level scheduling.
- Full-cost boundary considered: process inspection, kill/defer work, code residency, update latency, external-call availability, and recovery behavior.
- Five-field preflight: no exact registry match used; broad runtime similarity is RELATED_ONLY and not an exclusion.
- RAW_REQUIRED audit: INCOMPLETE because no union-external non-generic atomic action remains.
- Disposition: EXCLUDED_BEFORE_RAW__CURRENT_UNION_ACTION_ABSORPTION.

This is a structural current-union result, not a conclusion from missing implementation, outcome, resource, or AI readiness. It makes no global novelty claim.
