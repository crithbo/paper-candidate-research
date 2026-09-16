# Case b8k1

Cutoff: 2026-08-09. A fixed sorted key-value manifest is written through an
existing block-table format with a fixed per-file dictionary representation,
trainer, comparator, block size, and reader semantics. The baseline union
includes no dictionary, raw and trained per-file modes, legal byte/buffer/level
settings, and same-budget deterministic and random samples.

Candidate action: retain a bounded stream of representative fragments using a
sketch-based marginal-coverage invariant before passing them to the unchanged
trainer. A finite closure path pins writer/reader versions and public manifests,
verifies complete scans and checksums, then compares the retained set to frozen
reservoirs and an exact small-instance coverage ceiling with sample, training,
read, CPU, RSS, cache, I/O, and file bytes fully charged.
