# IVM-OUTERJOIN-LATE-REPAIR
- Status: `DROP`; Primary lane: incremental databases; Discovery date: 2026-08-02
## Research question
Can bounded late repair improve concurrent outer-join maintenance?
## Exact object
Concurrent outer-join IVM with auxiliary prestate selection.
## Strongest fair baseline
The same-budget auxiliary-table and Streaming-View union.
## Current collision subtraction
Overlaps the stopped `IVM-PRESTATE-COARSEN` object and lacks a new correctness/recovery invariant.
## Decisive falsifier
Auxiliary-state selection exactly expresses the candidate.
## Dual-axis score
- Academic value: `44/70`; AI executability bonus: `23/30`; Total: `67/100`
