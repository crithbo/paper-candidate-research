# Case z1p4

Cutoff: 2026-08-09. In an unmanaged pointer-based object heap with fixed epoch
accesses and fixed page-tiering backend, key/value results, updates, object
lifetime, pointer safety, page size, and a slowdown/SLO limit must remain
unchanged. Existing object hot/cold organization, SLO-aware reclamation policy,
and their same-information composition are required baselines.

Candidate action: choose movable-object page slots and migrations jointly under
page capacity, migration cost, pointer-safety, and SLO constraints. A finite
closure path is a trace-level reduced-epoch solver/replayer with explicit
mobility flags, exact small packing ceiling, and four same-information baseline
replays. Migration bytes, indirection, validation, metadata, CPU, faults/I/O,
and warm-up costs are mandatory; no production implementation or result exists.
