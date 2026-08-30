# GPU-UVMPHASE — phase-aware unified-memory prefetch and migration

- Status: `DROP`
- Primary lane: CUDA memory runtime
- Discovery date: 2026-08-02

## Research question

Can phase classifications from public GPU workloads improve managed-memory page prefetch/replication decisions?

## Exact object and fair union

CUDA Unified Memory page migration/prefetch with public training/inference traces, compared against CUDA advised/prefetched memory and current UVM migration schedulers.

## Competing mechanisms

- Reactive fault-driven migration.
- Look-ahead/phase-aware prefetch.
- Generic migration queue prioritization.
- Preferred mechanism: none retained.

## Collision subtraction and decisive falsifier

After removing undocumented residency/fault assumptions, the candidate is generic page migration scheduling. Project history explicitly records that current UVM/migration work, including MSched, already saturates that core. A phase label only changes the predictor, not the action, guarantee, or cost model. DROP; it must not be revived by swapping a workload or predictor.

## Executable evidence path

CUDA managed memory and public workloads are obtainable, but a runnable experiment would be an ordinary scheduling comparison and cannot clear the academic gate.

## Dual-axis score

- Academic value: `32/70`
- AI executability bonus: `22/30`
- Total: `54/100`

## AI and researcher boundary

No further work authorized.
