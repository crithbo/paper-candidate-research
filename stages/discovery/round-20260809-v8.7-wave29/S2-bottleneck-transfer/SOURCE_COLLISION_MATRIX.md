# Source / collision matrix — DISCOVERY-S2-20260809-V8.7-WAVE29

| Lineage | Candidate object considered | Strongest current union / direct subtractor | Collision classification | Decision |
|---|---|---|---|---|
| HyCache | multi-stage DNN preprocessing pipeline | partial memory/storage cache plus native caching | DIRECT_SUBTRACT | DROP: residual is admission/eviction controller. |
| IRHash | compiler build cache | Ccache/sccache/Bazel/Buck2 and IRHash | DIRECT_FATAL for wrapper framing | DROP. |
| ByteCheckpoint | PyTorch DCP native checkpoint and resharded load | DCP planners, readers/writers, async save, resharding; ByteCheckpoint | DIRECT_SUBTRACT | DROP: extension hook is not an action-gap certificate. |
| ODRP | remote paging with programmable RDMA | ODRP’s chained NIC primitives and client assistance | DIRECT_SUBTRACT | DROP: hardware-bound controller. |
| Juneberry | RDMA-backed Memcached/PMemKV request path | ordered queue / hardware ACK commit plus async execution | DIRECT_SUBTRACT | DROP: request scheduler only. |
| FlacIO | container runtime image service | runtime-image plus host page cache | SEARCH_BOUNDED_OPEN | DROP: no fixed current same-object native contract. |
| GogetaFS | deduplicating file system | logical-fingerprint-physical merged metadata | DIRECT_FATAL | DROP: claimed cross-stage action is the paper’s core. |
| GraCE | PyTorch compiled CUDA workload | CUDA Graph capture, Inductor fusion/options, GraCE | DIRECT_SUBTRACT | DROP: only configuration selector remains. |
| Syncopate | Triton multi-GPU kernel plus communication | chunk abstraction, chunk schedule, source transform | DIRECT_FATAL | DROP: proposed joint action already explicit. |
| VTC | DNN compiler/runtime | virtual tensors and data-movement elimination | SEARCH_BOUNDED_OPEN | DROP: insufficient fixed same-object union; no fair bridge. |
| MPK | multi-GPU inference mega-kernel | SM graph, in-kernel decentralized scheduler, fusion | DIRECT_FATAL | DROP: residual scheduler is internal core mechanism. |
| Obscura | pipeline-parallel training under memory constraint | transformation, recomputation, swapping, partition adjustment | DIRECT_FATAL | DROP: proposed joint optimization already present. |

## v8.7 current-upstream ledger

| Near-cutoff line | Frozen version | Docs/source semantics checked | Default/non-default paths | Contrary evidence | Outcome |
|---|---|---|---|---|---|
| DCP layout/reshard | PyTorch `v2.13.0` / `cf30153`, 2026-07-08; docs observed 2026-08-10 | `SavePlanner`, `LoadPlanner`, global/local plans, `ReadItem`, storage interfaces, async save | default file writer and planner; custom planners/storage, plan cache, async modes, safetensors | native load-time resharding and extension composition already exist | DROP, no absence claim carried forward. |
| GraCE capture residual | PyTorch `v2.13.0` / `cf30153`; docs observed 2026-08-10 | CUDA graph capture, `torch.compile`, Inductor options | default; `reduce-overhead`, `max-autotune`, no-cudagraph mode, `triton.cudagraphs`, guard/recompile paths | current APIs already expose capture/fusion and state their memory/dynamic limits | DROP, selector boundary. |

No other raw line is called a shortlist: none passed the earlier same-object,
strong-union, and finite-fidelity route gate, so no absence-based claim was
made about those projects.
