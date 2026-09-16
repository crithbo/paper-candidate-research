# CANDIDATE_GRADE_DEEP_REVIEWS

## D01 — rustc incremental query reuse

- **Frozen object and observable contract:** one Rust crate, exact compiler revision/target/options/environment and edit sequence. Incremental and clean builds must have the same requested artifact and the same successful/failing diagnostic category; cache timing is not a replacement objective.
- **Atomic action / information condition:** decide a query or codegen-unit reuse/invalidation rule from the query dependency graph, fingerprints and inputs already available to rustc. No workload oracle or external selector is allowed.
- **Current reality and strongest union:** the official [rustc development guide](https://rustc-dev-guide.rust-lang.org/queries/incremental-compilation-in-detail.html) documents the red-green query model, query DAG, cached results and explicit codegen-unit dep-node reuse; the [upstream repository](https://github.com/rust-lang/rust) anchors implementation reality. The proposed actions—reuse policy, cache validation and dependency propagation—are already the native algorithmic action space.
- **Residual audit:** a cache controller/retry policy is a wrapper. A rule that reuses when native dependency validation marks invalid fails clean-equivalence. No separately specified recurrence or representation that escapes this union was frozen.
- **Natural carrier/full cost:** public Rust crates and rustc tests; include front-end, query/codegen/link work, cache read/write, peak memory, produced binary/metadata and diagnostic equivalence.
- **72h killer/fidelity closure:** a two-edit crate where one query’s transitive input changes. Compare the dependency/clean-build oracle: a stale reuse violates artifact/diagnostic equivalence; otherwise the action is current-union replay. This finite witness is sufficient to kill the unformed claim.
- **Decision:** `DROP__CURRENT_UNION_OR_GENERIC_CACHE_CONTROL`, not a readiness drop.

## D02 — Bazel incremental action graph

- **Frozen object and observable contract:** one versioned workspace, target, declared inputs/toolchain and edit trace. Incremental and clean builds must agree on declared outputs and success/failure semantics.
- **Atomic action / information condition:** choose invalidation/execution over only the native configured target/action graph and declared metadata.
- **Current reality and strongest union:** [Bazel’s official guidance](https://bazel.build/advanced/performance/iteration-speed) treats incremental work through the native analysis/execution model; the [Bazel upstream](https://github.com/bazelbuild/bazel) is the implementation anchor. Action keys, graph analysis, cache reuse and execution are the existing same-information union.
- **Residual audit:** changing cache policy, remote/local selection, concurrency or retry is controller/configuration, not a complete N2. Reusing an action after an unrepresented dependency change breaks the frozen batch-equivalence guarantee. No union-external state/update algorithm was specified.
- **Natural carrier/full cost:** public Bazel workspaces; analysis time, action execution, local/remote cache transfer, sandboxing, CPU/memory, outputs and error category all belong in the denominator.
- **72h killer/fidelity closure:** one target with a transitive declared input edit. The native action graph and clean build supply a finite oracle: stale reuse fails; native-key-equivalent reuse is absorption.
- **Decision:** `DROP__CURRENT_UNION_OR_CONTROLLER`.

## D03 — TypeScript incremental program build

- **Frozen object and observable contract:** one TypeScript project with fixed `tsconfig`, compiler revision and edit sequence. The clean and incremental builds must emit the same declared files and equivalent diagnostics.
- **Atomic action / information condition:** validate/reuse stored program/build information using only project source, configuration and recorded incremental metadata.
- **Current reality and strongest union:** the official [`incremental` TSConfig reference](https://www.typescriptlang.org/tsconfig/incremental.html) documents incremental compilation and its build-information file; [TypeScript upstream](https://github.com/microsoft/TypeScript) is the current source anchor. Build-info validity, program reuse and clean batch execution already cover the candidate action family.
- **Residual audit:** selecting when to delete/retry `.tsbuildinfo` is postprocessing/control. Reusing stale semantic information changes emitted output or diagnostics; no new complete recurrence/representation under the same interface was frozen.
- **Natural carrier/full cost:** public TypeScript projects; parse/bind/check/emit work, build-info I/O, memory, generated artifacts and diagnostic equivalence.
- **72h killer/fidelity closure:** an edit that changes a transitive exported type. Native clean output/diagnostics are a finite oracle: a stale reuse is a fidelity failure; correct reuse is no more than the current union.
- **Decision:** `DROP__POSTPROCESSOR_OR_CURRENT_UNION`.

## Diagnostic conclusion

Three deep reviews completed (within the requested 3--4 range). All satisfy a static natural route and finite killer, but none yields a complete non-controller N1/N2/N3 outside the strongest current same-object union. No `STAGE0_BRIEF` is produced.
