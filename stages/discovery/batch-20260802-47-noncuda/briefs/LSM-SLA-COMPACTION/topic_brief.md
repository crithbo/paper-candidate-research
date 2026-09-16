# LSM-SLA-COMPACTION
- Status: `DROP`; Primary lane: storage systems; Discovery date: 2026-08-02
## Research question
Can SLO-aware compaction scheduling limit tail latency?
## Exact object
LSM foreground reads/writes and background flush/compaction scheduling.
## Strongest fair baseline
SILK and HATS with the same I/O visibility and tail-SLO ledger.
## Current collision subtraction
SILK explicitly schedules writes/flushes/compactions for tail latency; HATS jointly schedules reads and compactions. Direct same-object collision.
## Decisive falsifier
Primary-source collision already establishes it.
## Dual-axis score
- Academic value: `45/70`; AI executability bonus: `25/30`; Total: `70/100`
