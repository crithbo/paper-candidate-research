# GPU-GDS-COFLOW — Slack-aware compressed-column GDS coflow selection

- Status: `PROPOSE_STAGE0`
- Primary lane: CUDA/GPU data-system runtime and I/O–compute co-optimization
- Discovery date: 2026-08-02

## Research question

For a fixed GPU Parquet scan with predicate filtering, can a policy jointly select per-row-group GDS batch membership, CUDA-stream placement, and compressed-column read order from predicted decode/selectivity/compute slack, improving end-to-end latency without changing query semantics or the total bytes read?

## Importance and group fit

cuDF exposes a real CUDA Parquet reader and GDS provides asynchronous batch and stream semantics. Their interaction creates a concrete queueing decision: a compressed column can be useful earlier as a predicate, yet batching it can delay a compute-critical column. The claim is about the *joint coflow decision*, not about GDS, Parquet decoding, or GPU decompression being new.

## Exact object

Frozen Stage-0 target: RAPIDS cuDF Parquet reads over public TPC-H Parquet data (scale 10 initially), using a fixed projection+selectivity query family; NVIDIA cuFile/GDS when available, with a same-semantics host-buffered asynchronous I/O fallback. Inputs, Parquet files, query text, row-group order, decompressor, GPU, filesystem, and storage placement must be frozen before evaluation.

## Strongest fair baseline

The fair union is: (1) cuDF's current Parquet reader/default compression path and low-memory controls, (2) GDS direct DMA, stream APIs, and fixed-overhead-amortizing batch APIs, (3) a work-conserving FIFO stream order, and (4) a clairvoyant offline ordering upper bound that has the same requests, bytes, decompression, and CUDA stream legality. Any candidate must also report the host-buffered async path; it cannot count CPU bounce-buffer avoidance as policy gain.

## Mechanism hypothesis

A slack-indexed policy will place a compressed row-group/column in a GDS batch only when its transfer-plus-decode completion can be hidden by already-ready GPU work and when early predicate availability can retire future requests. The cost ledger includes batch submission, DMA, decode, stream synchronization, decompressed bytes, and delayed compute; it forbids request dropping or semantic reordering of output.

## Competing mechanisms

- Mechanism A: fixed-size GDS batching in FIFO file order. Prediction: higher throughput only through submission-overhead amortization; no selectivity-dependent inversion.
- Mechanism B: predicate-first greedy ordering without batch/slack accounting. Prediction: helps selective queries but can create exposed I/O and decode bubbles.
- Mechanism C: offline same-cost ordering. Prediction: bounds any online policy and exposes whether queueing, rather than GDS itself, is the opportunity.
- Preferred mechanism and why: slack-aware coflow selection, because it makes a distinct decision over a documented GDS batch/stream API and is falsified if FIFO or predicate-first matches it after the complete ledger.

## Candidate paper claim

On a fixed public compressed-column scan family, selectivity and decode-time variation can create a non-dominated end-to-end latency/CPU-overhead frontier only when GDS batch composition and CUDA-stream order are decided together. Scope is one-GPU scan execution; it does not claim a new storage engine or GDS implementation.

## Current collision subtraction

GDS already supplies direct paths, fallback behavior, batching, and CUDA-stream integration. cuDF already reads Parquet and chooses supported decompression implementations. These are baseline capabilities. The search did not identify a source that makes the identical per-row-group, selectivity-aware *joint* batch-composition and stream-order decision under a same-byte, same-decoder coflow ledger; this is `SEARCH_BOUNDED_OPEN`, not proof of novelty.

## Decisive falsifier

Drop if, on the frozen public query family, either FIFO GDS batching or predicate-first greedy matches the candidate within 1% end-to-end latency while preserving CPU use, or if the candidate advantage disappears after counting all submission, synchronization, transfer, and decode time.

## Executable evidence path

### 72-hour first evidence

1. Reproduce cuDF Parquet scan and log row-group sizes, compression metadata, decode time, stream events, and query selectivity.
2. Implement a deterministic replay scheduler with FIFO, predicate-first, slack-aware, and offline upper-bound modes using the identical event ledger.
3. A killer witness requires one query pair with reversed optimal order caused by decode/selectivity slack, and a matched end-to-end improvement over both online baselines. Absence of such a witness is a STOP signal for this mechanism.

### AI core fraction and critical path

Estimated `ai_core_fraction: 0.72` (`AI_CORE_CONDITIONAL`). AI can obtain public TPC-H data, construct Parquet/query harnesses, parse traces, implement the replay/policies, and compare matched ledgers. A GDS-capable host/GPU is conditional; without it, the evidence ceiling is a semantics-preserving event replay and host-buffered async path, not a GDS performance claim.

### Semantics-preserving open alternatives

cuDF + public Parquet/TPC-H data provide the workload. If GDS hardware/filesystem support is absent, cuFile API semantics plus recorded asynchronous I/O events and a host-buffered path can test ordering logic but cannot establish direct-DMA throughput.

## Dual-axis score

- Academic value: `55/70` (importance 12, headroom 11, mechanism 16, generality 9, boundary 7)
- AI executability bonus: `24/30`
- Total: `79/100`

## AI and researcher boundary

AI may build and replay the open artifact. The researcher must authorize any production storage/GPU use and decide whether a simulator-only result warrants a stronger systems claim.
