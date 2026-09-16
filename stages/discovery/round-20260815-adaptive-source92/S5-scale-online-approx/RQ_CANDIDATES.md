# Source92 S5 RQ

## S5-92-RQ01

- Anchor: Mix v1.20.2 mix compile and Mix.Task.Compiler official docs, accessed 2026-08-15.
- Fixed object: Mix project compilers, compiler manifest files, dependency checks, and emitted compilation artifacts under unchanged Elixir/Erlang compilation semantics.
- Primary RQ: does a non-policy target-native bounded-recourse constructor exist for exact Mix manifest-driven incremental compilation outside the current compiler/manifest/configuration union?
- Out of scope: different compilers, custom generic compiler plugins, build path/cache configuration, force flags, or changed emitted artifact semantics.
- Earliest falsifier: the current union already provides compiler manifests, selective stale-file/dependency recompilation, compiler selection, and force/config controls.
- Primary/fallback: https://mix.hexdocs.pm/Mix.Tasks.Compile.html ; https://hexdocs.pm/mix/main/Mix.Task.Compiler.html.
- Disposition: RQ_READY_FOR_ORDINARY_CLOSURE.
