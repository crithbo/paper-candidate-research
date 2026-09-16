# R21 candidate-grade deep reviews

## D1 — LLVM stackmap/deoptimization state

- Role-complete anchor: one deoptimizing compiled function, fixed IR/deopt continuation semantics and exact reconstructed values.
- Native union/subtractor: [LLVM stackmap documentation](https://llvm.org/docs/StackMaps.html) and [LLVM statepoint documentation](https://llvm.org/docs/Statepoints.html) define current state recording/lowering; those paths are the strongest same-object union.
- Legal two-plan skeleton: legal stackmap encodings/lowerings can record the same live state, but the residual is not a target-specific algorithm—encoding and register reconstruction are already owned by lowering/runtime composition.
- Noncontroller check: choosing a map format or pass ordering is a compiler configuration/lowering choice; a generic state minimizer is not an admissible N2. No distinct guarantee remains.
- Falsifier/full cost: public LLVM tests plus a stackmap parser would verify reconstructed values and map legality; compile CPU/RSS, code/map bytes and deopt reconstruction overhead are the denominator. Not executed.
- Disposition: `DROP__CURRENT_LOWERING_RUNTIME_UNION_OR_GENERIC_ENCODING`.

## D2 — CUDA stream memory operations

- Role-complete anchor: one fixed stream-visible memory value/order contract and a producer/consumer kernel sequence.
- Current union/subtractor: the [CUDA stream-ordered allocator/API model](https://docs.nvidia.com/cuda/cuda-programming-guide/04-special-topics/stream-ordered-memory-allocation.html) and CUDA stream dependency machinery provide write/wait/dependency operations; runtime scheduler is the fair subtractor.
- Legal two-plan skeleton: direct value write/wait and an equivalent event/dependency sequence can preserve order. Their selection is a runtime scheduling/controller decision, not a target-specific algorithmic action.
- Falsifier/full cost: a stock CUDA sample/API status and completion-order oracle, with host launch CPU, synchronization latency, GPU time, memory and code cost; an ordering violation or no cost residual kills. Not executed.
- Disposition: `DROP__STREAM_SCHEDULER_CONTROLLER_OR_CURRENT_RUNTIME_UNION`.

No proposal is produced. The two decisions do not depend on hardware, implementation or outcome availability.
