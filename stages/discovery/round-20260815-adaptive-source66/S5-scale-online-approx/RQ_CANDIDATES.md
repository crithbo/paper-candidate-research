# Source66 RQ

## S66-RQ-01

- Anchor: current Microsoft MSBuild incremental-build and static-graph documentation, accessed 2026-08-15.
- Object/contract: MSBuild target/project outputs under unchanged target Inputs/Outputs semantics.
- Primary RQ: Can a native bounded-recourse static-graph constructor eliminate avoidable full project evaluation while retaining exact MSBuild target outputs and output inference?
- Excludes external caches, generic scheduling, changed target contracts, and weaker output guarantees.
- Falsifier: current static-graph/cache union already expresses the action, or only generic build-graph scheduling remains.
