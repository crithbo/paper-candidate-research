# Exact public anchor

Anchor: current Go runtime finalizer and `KeepAlive` contract, observed 2026-08-15.

- <https://pkg.go.dev/runtime>
- <https://go.dev/src/runtime/mfinal.go>
- <https://go.dev/src/cmd/compile/internal/liveness/>

The runtime documents that an object can become unreachable at its last use; `KeepAlive` marks it reachable through the call. The current source describes it as a use the compiler cannot eliminate. The compiler has a liveness package, but this does not establish an automatic finalizer-policy mechanism.
