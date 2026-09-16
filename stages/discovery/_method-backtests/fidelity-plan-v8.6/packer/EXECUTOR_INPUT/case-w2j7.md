# Case w2j7

Cutoff: 2026-08-09. A blocked parallel program must retain identical kernel
semantics while compiler-managed multi-worker movement and synchronization are
optimized. Two current lowering/orchestration systems already expose the full
multi-worker orchestration action space under the same compiler legality,
output, compile-time, code-size, and synchronization-cost contract.

The contemplated work chooses among those exposed schedules. A scheduling proxy
is explicitly not the full action. Decide whether it has a union-external action
and a finite same-object closure route.
