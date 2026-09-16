# Candidate-grade natural-law closure

## D1 — Kotlin/Native KLIB: `NOT_ADMITTED_UNFROZEN`

**Immutable carrier.** Freeze one public Kotlin/Native library project at three consecutive immutable upstream release tags, each Kotlin compiler distribution/version, target triple, compiler invocation, source/lockfile hash and produced `.klib` SHA-256. The stock oracle is the same target’s Kotlin/Native linker plus `klib info`, `dump-abi` and `dump-ir`; ABI and linked executable behavior must agree.

**Layout-independent law schema.** Define a declaration/IR identity by its ABI snapshot line and IR declaration key, not byte offset or ZIP entry order. Train on `(V0,V1)` and `(V1,V2)` and hold out `(V2,V3)`. After controlling source declaration changes, compiler version, target triple, dependency lock, absolute/relative source-path mode and packed/non-packed KLIB representation, the threshold would be: at least 90% of unchanged identities retain the same content digest and at least 80% of their predecessor adjacency classes persist in each train transition; the held-out lower 95% binomial confidence bound must remain at least 80%. This is a falsifiable plan, **not an observed law**.

**Action / union / killer.** Current union includes `kotlinc-native -produce library`, target options, `-Xklib-relative-path-base`, packed/non-packed KLIB handling, linker inputs and all current KLIB management options. Any constructor must preserve ABI/IR/link behavior and be a target-specific IR/linkdata construction with a declared guarantee, not ZIP order, path normalization, caching or VCDIFF. Full cost: compiler/link CPU/RSS/temp, artifact/delta bytes and downstream link/load/start CPU/RSS. In 72h, acquire four small official tags, run the preregistered law test, enumerate source/flag union, and construct/refute two stock-link-equivalent representations. Since neither law nor a union-external whole constructor is currently frozen, `NOT_ADMITTED_UNFROZEN`.

## D2 — Erlang/OTP BEAM: `NOT_ADMITTED_UNFROZEN`

**Immutable carrier.** Freeze four consecutive official Erlang/OTP release tags and a fixed public OTP application/module cohort, ERTS/OTP compiler version, compile options, source hash and BEAM SHA-256. The stock oracle is matching BEAM code loading plus `beam_lib` exports/imports/atoms/code-chunk results and module behavior.

**Layout-independent law schema.** Identity is `(module, exported function/arity, normalized abstract or code semantic digest)` and chunk type—not IFF byte position. Control changed source, OTP/ERTS version, `debug_info`, compile attributes/options, strip state, atom-table changes and target. Require the same predeclared 90% unchanged-content / 80% adjacency persistence train criterion and 80% held-out lower confidence bound. Again, no measurement is claimed.

**Action / union / killer.** Existing native actions include `compile:file`, compile options, debug-info chunking, `beam_lib` inspection/strip and the BEAM code loader. A valid mechanism would have to be a complete BEAM chunk/code construction preserving loader, exports/imports/atoms and behavior, with an exact/FPT/approximation guarantee beyond compiler output; chunk reordering, strip selection, cache and external delta are excluded. Full cost: compile CPU/RSS/temp, BEAM/delta bytes and stock load/dispatch CPU/RSS/latency. The 72h killer uses four tagged modules/releases, source/option enumeration and two same-loader-equivalent outputs. Current source evidence does not close an action outside the union or the natural law, hence `NOT_ADMITTED_UNFROZEN`.

Neither decision is caused by implementation, result, resource or AI-readiness absence.
