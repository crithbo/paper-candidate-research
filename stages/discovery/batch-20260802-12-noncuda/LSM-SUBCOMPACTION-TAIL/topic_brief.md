# LSM-SUBCOMPACTION-TAIL — Tail-risk-aware subcompaction boundary selection

- **Lane / exact object:** RocksDB L0-to-L1/manual compaction subcompaction partitioning with the existing `max_subcompactions` mechanism and key-range boundaries.
- **Question / claim:** A boundary certificate that combines overlap density and tombstone skew can reduce p99 foreground-read interference at a fixed write-amplification cap, beyond merely choosing the number of subcompactions.
- **Natural input:** db_bench/YCSB plus publicly reproducible Zipf/update workloads and RocksDB event/IO traces.
- **Real action:** choose legal partition boundaries for an already selected compaction and current subcompaction count; do not claim automatic compaction cancellation or new scheduling APIs.
- **Baselines:** stock partitioning; equal-byte ranges; equal-key ranges; fixed-count sweep; offline optimal boundaries on captured compactions.
- **Full cost:** partition planning, key-range overlap, tombstone drops, write/read amplification, file metadata, CPU/IO contention, p50/p99 foreground reads.
- **Falsifier:** overlap+tombstone score must explain improvement versus byte-balanced boundaries at matched count and input files; if tail benefit vanishes after write-amplification cap, stop.
- **Evidence / collision:** RocksDB documents actual compaction and subcompaction behavior; this is a mechanism-specific extension, **SEARCH_BOUNDED_OPEN**.
- **Scores:** academic 56/70; AI 27/30; `AI_CORE_EXECUTABLE`, 0.84.
- **72-hour killer:** instrument 30 natural compactions under two distributions, compare matched-boundary policies and complete I/O accounting.

