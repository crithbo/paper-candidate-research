# Primary RQ

For a fixed Go function holding a finalizable resource wrapper across a syscall/foreign boundary, fixed Go result and finalizer-visible resource endpoint, can a compiler/runtime construction automatically choose a minimal finalizer-safe liveness frontier with a Go-specific guarantee beyond explicit `runtime.KeepAlive` and ordinary pointer liveness?

The possible N2 hypothesis is an interprocedural extension of object liveness only where an external-resource use requires the wrapper to remain reachable. The counterfactual would be a different legal keep-alive frontier under the same source and finalizer resource observation, not a user policy annotation.
