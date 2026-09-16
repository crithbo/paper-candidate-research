# Pre-evidence RQ candidates — Source71

## RQ-S71-01 — JDK runtime-image joint constructor

For a fixed Java module set, target runtime, resources and stock image/class-loader observations, can a target-specific joint directory/image constructor alter build plus cold/warm lookup cost without changing `jimage`/class-loader semantics or merely choosing `jlink` options?

## RQ-S71-02 — Rust crate-metadata constructor

For a fixed Rust crate graph, compiler version/target and output semantics, can a target-specific metadata constructor improve emit/import/full-build cost beyond current metadata encoding, incremental/cache policy, or general serialization?

## RQ-S71-03 — HSA/HIP code-object materialization constructor

For fixed host program, target GPU/code objects and stock HIP module execution, can a reader-equivalent joint code-object/materialization constructor improve load plus first-use full cost beyond module API, eager/lazy loading or generic image packing?

All are primary RQs selected before evidence. Ordinary closure only; no selective nomination.
