# Discovery Question Card: SC92-01

- Exact identity: Mix v1.20.2 compile documentation and current Mix.Task.Compiler documentation; carrier IMPLEMENTATION_CARRIER_ONLY; security exclusion PASS.
- Historical five-field preflight: no exact or terminal match; related compiler-cache overlap only. NO_MATCH is not novelty evidence.
- Fixed contract: same Mix project compiler manifest and exact compiled outputs/diagnostics for the same source/dependency/configuration state.
- Full cost: manifest read/write, dependency checks, compiler work, diagnostics, emitted artifacts, rebuild work, memory and I/O.

## Current union

- Mix compile performs dependency/up-to-date checks, runs registered compilers, exposes compiler/configuration/path controls, and refers to compiler manifests.
- Mix.Task.Compiler defines compiler behavior, compiler manifest enumeration, and clean behavior for disk output; historical/current compile.elixir behavior selectively recompiles changed source files and their dependencies.
- Checked controls include compilers, protocol consolidation, build path, prune code paths, force, no-compile, dependency/config validation switches, manifest enumeration, and custom compiler behavior.
- Known direct fatal: FOUND. The only concrete action is ordinary stale-source/dependency recompilation, manifest management, or configuration/plugin selection.

## Disposition

- RQ_COMPLETE; RAW_REQUIRED INCOMPLETE; no valid non-generic atomic action.
- EXCLUDED_BEFORE_RAW. 当前 official Mix union 已表达 manifest、增量依赖重编译与 compiler/configuration hooks；把其外部 generic scheduler 或 manifest policy 改名不能构成 N2。
- No queue or closure debt; eligible for C0: NO.
