# RQ-S76-01

- Exact anchor: dotnet/roslyn current Incremental Generators Cookbook, accessed 2026-08-15.
- Object: Roslyn incremental generator driver for a fixed generator/input compilation and emitted C# source.
- Contract: same generator outputs, C# compilation, diagnostics and stock compiler acceptance.
- Primary RQ: Is there a Roslyn-native bounded-recourse constructor beyond the driver's existing caching of author-defined equal pipeline states?
- Minimum falsifier: the proposed action is contained in the generator author pipeline or requires a new generator/phase and thus is paper-owned/changed semantics.
- Ordinary closure: PAPER_OWN_CONSTRUCTOR_OR_CURRENT_DRIVER_UNION.

The anchor says incremental generators expose a pipeline; values returned by generator steps must be equatable so the driver can reuse cached output. It also states generators are additive and run as user-specified assemblies. This fixes the target-native versus author-owned boundary.
