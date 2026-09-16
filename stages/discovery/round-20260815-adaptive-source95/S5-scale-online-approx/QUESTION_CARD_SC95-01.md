# DISCOVERY_QUESTION_CARD — SC95-01

| Field | Frozen value |
|---|---|
| Exact identity | REBAR3_BUILT_DEPENDENCY_EXACT_BEAM_APP_ARTIFACT_STATE__BOUNDED_RECOURSE_CONSTRUCTOR |
| Current source anchor | Rebar3 official Basic Usage, Commands, Configuration, and Dependencies documentation, accessed 2026-08-15. |
| Same-object problem | Maintain the exact Rebar3 compile artifact state for fixed project/config/lock semantics after an update. |
| Endpoint / guarantee | Stock Rebar3 compilation correctness and dependency-resolution semantics; proposed bounded-recourse/amortized guarantee would have to preserve them exactly. |
| Atomic candidate action | Jointly retain/rebuild a dependency's .app module list and .beam artifact state after a project mutation. |
| Current union | Compile fetches/compiles dependencies; only needed dependencies are compiled; already-built dependencies whose .app module list matches .beam files and artifacts exist skip the compile provider/hooks; configuration and lock files supply native controls. |
| Fair subtractor | The full current Rebar3 compile-provider/configuration/lock/artifact-check union under identical project information, not a clean rebuild alone. |
| Natural/canonical route | Versioned public Erlang/Elixir project histories with rebar.lock; stock rebar3 compile result is the oracle. |
| Full-cost denominator | Dependency resolution, update/rebuild work, CPU, peak RSS, _build bytes, temporary bytes, and resulting artifact/query usability. |
| Minimum falsifier | A current documented built-artifact check or configured provider/hook already realizes the alleged action, or all remaining variation is a generic scheduling policy. |
| Identity preflight | No exact identity match used as an exclusion. Broad build-cache similarity is RELATED_ONLY and does not establish novelty. |
| Decision | EXCLUDED_BEFORE_RAW__CURRENT_UNION_AND_NON_GENERIC_ACTION_NOT_SURVIVING |

## Why it cannot enter evidence-qualified raw

The only concrete state-maintenance operation exposed by the frozen object is already the native built-dependency test (module list, beam files, and existing artifacts), followed by existing provider/hook behavior. Recasting when to invoke those actions as bounded recourse would be a scheduling/controller proposal, not a new same-object atomic constructor. No union-external target-specific action survived the single bounded current-source check. This is a structural pre-raw exclusion, not an inference from missing implementation, result, resource, or AI readiness.

Official sources:

- https://rebar3.org/docs/basic_usage/
- https://rebar3.org/docs/commands/
- https://rebar3.org/docs/configuration/configuration/
- https://rebar3.org/docs/configuration/dependencies/
