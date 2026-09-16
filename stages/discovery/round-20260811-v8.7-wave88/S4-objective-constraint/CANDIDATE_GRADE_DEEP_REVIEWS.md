# Candidate-grade deep reviews

## AEGONKV-GC — `DROP_DIRECT_ABSORPTION`

Exact object: a KV-separated LSM store with unchanged read/write semantics and a space-reclamation invariant. The primary source's SmartSSD GC offload, offload-friendly data structures and hardware/software logic already form a complete coupled constructor for throughput, tail latency and space. Fair union uses the same read/write/GC information and includes all device work; full cost is foreground I/O, GC I/O, CPU, SmartSSD resources, P99, throughput and space. Reweighting the three measures or choosing GC times is policy. A 20–50 workload/historical-GC witness would have to retain all semantics while lying outside this action space; none is frozen. Direct absorption only.

## PIPEANN-SSD — `DROP_DIRECT_ABSORPTION`

Exact object: fixed query/index and the same ANN quality target. PipeANN already jointly changes the best-first traversal to align with SSD behavior and relaxes strict compute/I/O ordering without sacrificing stated accuracy. The fair union includes that complete traversal construction and disk ANN comparators. Full cost contains index build/space, every SSD request, CPU, latency distribution and recall. Changing a search priority weight is not a fresh N2. A finite killer would execute 20–50 fixed query/index sets and require matching recall with a non-PipeANN atomic traversal; no such construction was identified. Direct absorption.

## SKYBRIDGE-STALE — `DROP_DIRECT_ABSORPTION`

Exact object: distributed cache update visibility with a fixed bounded-staleness deadline, while retaining availability and low latency. Skybridge already constructs an out-of-band real-time stream complementary to reliable asynchronous replication, specifically avoiding correlated failures. The full denominator is both replication paths, stream state/space, update visibility tail, service latency and availability. A “fair deadline” score or routing choice only selects within replication policy. A finite killer would audit 20–50 update traces against the same visibility deadline and require an alternative same-semantics stream action; none is frozen. Direct absorption.

## SPARS-RENDER — `DROP_DIRECT_ABSORPTION`

Exact object: rendering output and drawing order under a stable frame-rate deadline. SPARS already supplies the full coupled algorithm: in-order preparation yields self-contained tasks, out-of-order execution supplies parallelism, and in-order commit preserves correctness. Its primary quality is visual/drawing-order equivalence; its denominator includes frame deadline, CPU/power, task memory, parallelism and graphics-primitive budget. A different priority or deadline threshold is ordinary scheduling. A finite killer would compare 20–50 rendering traces at identical output/order and frame budget; no union-external atomic action is specified. Direct absorption.
