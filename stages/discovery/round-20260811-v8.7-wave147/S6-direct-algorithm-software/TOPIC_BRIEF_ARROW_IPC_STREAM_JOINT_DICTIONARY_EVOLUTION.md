# Topic brief — Arrow IPC stream joint dictionary evolution

**Status:** `PROPOSE_STAGE0` · `TIER_B_Q2_VIABLE` conditional · `FINITE_FIDELITY_GAP`

**Question.** Can a whole-stream, grammar-constrained constructor jointly choose Arrow IPC record-batch boundaries and legal multi-field dictionary delta/replacement events to improve the byte/work Pareto frontier while preserving stock-reader materialization of the identical categorical row sequence?

**Exact object.** Arrow IPC stream, fixed schema and ordered value sequence; standard Arrow stream reader; no external compression or changed reader/file semantics.

**N2.** Finite dynamic program over reader-visible vector dictionary state, legal delta-prefix/replacement transitions, shared record-batch cuts and IPC message ordering/alignment. It returns a feasible cost frontier, not a one-dimensional tuning choice.

**Strong fair baseline.** Current Arrow C++ stream writer with both default replacement and delta-compatible settings, dictionary tracker paths, caller-selected fixed `max_chunksize`, metadata/compression/thread options, and all native byte/write/read costs.

**Action-gap certificate.** The current API documents local delta-if-possible/otherwise-replacement behavior and fixed chunking; it does not provide a joint stateful planner for coupled fields/cuts. The 2-field/3-region witness has two legal histories with identical decoded rows but distinct coupled dictionary state/costs.

**Natural route and oracle.** Official NYC TLC Yellow Taxi Jan--Feb 2025 releases; categorical fields per official dictionary; Arrow stream reader plus schema and row/value/null digest.

**Full cost.** Serialized stream bytes; writer and reader CPU/wall/RSS; temporary allocations/bytes; time-to-first-batch and total decode latency. Include metadata and alignment padding.

**Fast Stage A killer.** Freeze Arrow commit/flags and two carrier hashes; encode the witness; test all current configuration arms; reject if candidate histories are already expressible or only a fixed chunk/delta setting, requires file/reader changes, or lacks a Pareto point after full costs.

**No-gain scope.** Stable dictionaries, single categorical field, one mandatory batch partition, or workloads where current delta/replacement path already reaches the same frontier. No superiority is claimed before Stage A.
