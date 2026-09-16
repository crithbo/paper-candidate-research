# Data-movement action-residual source / collision matrix

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE140-DATA-MOVEMENT-BOTTLENECK-ACTION-RESIDUAL-BREADTH` · **cutoff:** 2026-08-11.

| Family | Official current anchor | Strongest whole union / witness | Exact object, natural carrier and full-cost | Current result |
|---|---|---|---|---|
| Tokio | [Tokio upstream](https://github.com/tokio-rs/tokio) | runtime scheduler/I/O/work-steal/config; no whole action witness | observable task/I/O behavior; upstream runtime tests; task+queue+I/O+completion cost | `NOT_ADMITTED_UNFROZEN` |
| Seastar | [Seastar upstream](https://github.com/scylladb/scylla-seastar) | reactor/polling/buffer/future/cross-shard union; no whole action witness | request→response semantics; examples; receive+parse+process+send cost | `NOT_ADMITTED_UNFROZEN` |
| quiche | [quiche upstream](https://github.com/cloudflare/quiche) | `recv`/connection state/`send`/buffer/pacing union; verified coalesced descriptor sketch | same QUIC stream/ACK/loss semantics; HTTP/3 tests; frame+packet+socket+pacing cost | `NOT_ADMITTED_UNFROZEN` |
| Pulsar | [Pulsar upstream](https://github.com/apache/pulsar), [broker config](https://github.com/apache/pulsar/blob/master/conf/broker.conf), [releases](https://github.com/apache/pulsar/releases) | batch/entry/dispatch/buffer/cursor/ack union; joint descriptor sketch | topic/queue ordering/durability; integration traces; produce+persist+dispatch+ack cost | `NOT_ADMITTED_UNFROZEN` |
| OpenCL | [Khronos OpenCL registry](https://github.com/KhronosGroup/OpenCL-Registry) | command queue/event/memory object union; no whole action witness | command-graph result; conformance tests; enqueue+copy+kernel+event cost | `NOT_ADMITTED_UNFROZEN` |
| TVM runtime | [Apache TVM upstream](https://github.com/apache/tvm) | runtime allocator/device-copy/graph executor/schedule union; no whole action witness | model output; runtime tests; graph+alloc+copy+execute cost | `NOT_ADMITTED_UNFROZEN` |

## Collision and reality boundary

Wave133’s LAMMPS/GROMACS/LLVM/MLPerf/PostgreSQL/OpenFOAM N3 assumptions, Wave111 checkpoints, and prior S2 active/terminal objects are excluded. Current configuration APIs did not by themselves cause a drop. The two candidate-grade attempts were rejected only because their full action cannot yet preserve frozen QUIC protocol or Pulsar persistence/cursor semantics; the remaining four never supplied a minimum action-divergence witness.
