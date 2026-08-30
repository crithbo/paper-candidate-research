# Same-object RQ convergence — Source50 S2

## RQ50-01 — symmetric-memory rendezvous state and collective endpoint

For fixed PyTorch ranks, symmetric tensor sizes/order, process group, supported topology and collective outputs, can an algorithm jointly construct symmetric-memory rendezvous state and the collective-ready handle to reduce setup-plus-collective full cost without changing handle/collective semantics?

## RQ50-02 — Inductor symmetric-memory argument construction

For a fixed compiled PyTorch operator schema, group name, tensor outputs and distributed execution contract, can a target-specific compiler/runtime constructor jointly decide P2P allocation for symmetric arguments and collective-ready metadata with a stronger full-cost guarantee than current compilation?

Both RQs are precise enough for raw, but neither is selective-depth eligible after current contrary evidence.
