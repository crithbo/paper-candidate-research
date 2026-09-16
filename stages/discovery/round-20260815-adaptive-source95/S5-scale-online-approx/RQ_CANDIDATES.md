# Source95 S5 research-question candidates

## S5-95-RQ01 — selected

- Exact object: a fixed Rebar3 project, its rebar.config and rebar.lock, resolved dependency versions, and the dependency's compiled .app module list plus .beam outputs in _build.
- Same-object endpoint: Rebar3's normal compile result for that fixed dependency resolution; no reader, language, lock semantics, or compilation correctness change.
- Question: after an insert/delete/update in the project dependency graph or source set, can a native exact constructor maintain the same accepted compile artifact state with a bounded-recourse, target-specific rule and a stated amortized/worst-case bound beyond the current Rebar3 compile-provider union?
- Comparator hypothesis: the current union includes dependency resolution/locks, compile-provider execution, compilation only for needed dependencies, and skipping a dependency when its .app module list matches its .beam artifacts.
- Falsifier: current official documentation/source semantics already expose the asserted action as the built-dependency check, provider/hook configuration, or ordinary build scheduling; then no residual remains.
- Natural carrier if later admitted: a versioned public Erlang/Elixir project history with lock-file commits. This was not promoted because the action gate failed first.

No secondary RQ was needed: the selected RQ has a single current official project and deterministic documentation route.
