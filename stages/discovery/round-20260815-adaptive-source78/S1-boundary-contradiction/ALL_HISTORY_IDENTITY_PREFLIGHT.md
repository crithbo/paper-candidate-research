# All-history five-field identity preflight

Bounded lookup of `registry.yaml`, `plan.md`, and Discovery text for `runtime.KeepAlive`, `SetFinalizer`, and Go finalizer returned no exact frozen identity. This is `NO_MATCH__NOT_NOVELTY_EVIDENCE`.

Five fields: object = fixed Go finalizable wrapper plus external call; action = liveness frontier; endpoint = same external resource availability/finalizer observation; guarantee = Go reachability/finalizer contract; full-cost = compiler CPU/RSS, stack-map/liveness metadata, runtime GC retention, external-call and release latency. Related Go GC/metadata work does not exclude it.
