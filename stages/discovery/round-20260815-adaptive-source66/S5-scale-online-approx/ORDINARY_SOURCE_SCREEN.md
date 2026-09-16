# Source66 ordinary source screen

| Role | First-party source | Result |
|---|---|---|
| ANCHOR/CURRENT | https://learn.microsoft.com/sr-cyrl-rs/visualstudio/msbuild/incremental-builds | MSBuild uses target Inputs/Outputs, skips up-to-date targets, and performs output inference. |
| CURRENT/CONTRARY | https://github.com/dotnet/msbuild/blob/main/documentation/specs/static-graph.md | Current static graph describes graph-aware scheduling, input/output result caches, project isolation and the known target-level evaluation boundary. |
| CURRENT | https://github.com/dotnet/msbuild/blob/main/src/Tasks/Microsoft.Common.CurrentVersion.targets | Current implementation includes incremental-clean and up-to-date markers. |

The official union already exposes static graph, graph-aware scheduling, target incrementality, output inference and cache interfaces. The documented remaining cost is a general build-graph/evaluation problem; no target-native atomic action, natural carrier, or target-specific approximation/recourse guarantee was frozen. S66-RQ-01 is LOCATOR_ONLY, not raw or STOP.
