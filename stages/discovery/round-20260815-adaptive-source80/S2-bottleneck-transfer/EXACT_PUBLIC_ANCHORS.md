# Exact public anchor

| Field | Frozen value |
|---|---|
| Anchor | LLVM ORC v2 official documentation |
| URL | https://llvm.org/docs/ORCv2.html |
| Access date | 2026-08-15 |
| Exact object | Fixed LLVM IR module set, target/toolchain, symbol lookup sequence, and resulting executable behavior under stock ORCv2 |
| Natural/canonical carrier | LLVM project test-suite or a versioned public LLVM IR corpus, selected deterministically at Stage 0 if needed |
| Stock oracle | ORCv2 symbol lookup plus executable observable behavior |
| Source-supported shift | ORCv2 exposes eager compilation by default while also supporting lazy compilation and lazy reexports; lookup-time materialization is therefore a legitimate cost boundary to examine, not proof of a residual |

This is an anchor only. It does not claim a measured bottleneck transfer or novelty.
