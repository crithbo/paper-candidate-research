# Source62 S5 RQ candidate

## S62-RQ-01

- Anchor: TypeScript current TSConfig incremental / project-references documentation, accessed 2026-08-15.
- Object: TypeScript composite-project incremental build state and emitted JS/declaration outputs.
- Stable semantic contract: same source/config/project-reference inputs; exact emitted outputs and diagnostic boundary of a clean tsc -b run.
- Primary RQ: Can a target-native constructor use prior tsbuildinfo plus an output-liveness witness to restore only missing TypeScript build outputs with bounded recourse, while preserving clean-build outputs and diagnostics?
- Excludes: a generic filesystem watcher, generic build-cache wrapper, scheduling policy, changed project graph, or weaker diagnostic/output guarantee.
- Minimum falsifier: stock tsc -b already performs same-object output repair under unchanged sources, or the only construction is a generic output manifest/rebuild abstraction.
- Primary route: official TypeScript TSConfig/project-reference docs and current compiler option source. Fallback: official TypeScript repository issue history only for transport failure.
- FINER-lite: feasible CONDITIONAL; novelty threat HIGH; scope PASS; relevance CONDITIONAL.
