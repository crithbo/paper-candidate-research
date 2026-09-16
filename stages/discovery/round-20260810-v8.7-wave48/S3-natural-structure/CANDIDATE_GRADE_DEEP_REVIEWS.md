# Candidate-grade deep reviews

These are admission investigations, not proposed candidates.  The disposition uses only `DROP`; implementation, resources, and AI readiness were not used as negative evidence.

## INFLUX-TSM-BLOCK-CUT — DROP

- Exact same-object/function: construct TSM files for the same ordered time-series points, readable with the official TSM path and returning the same points.
- Named natural structure: timestamp delta regularity and sustained value runs within natural monitoring series.
- Atomic proposed action: jointly choose legal TSM block boundaries and per-block timestamp/value codecs before writing; canonical oracle would be official reader round-trip plus byte-level decode equality.
- Strongest current union: InfluxDB's current storage-engine description specifies WAL, cache and TSM organization, grouping values by series key/time, and compression that exploits timestamp/value regularity.  This already spans the semantic writing path and its shape-sensitive representation choices.
- Six-dimensional residual test: decision rule (writer choice is already native); information (the writer sees the same ordered points); resource/complexity (any new planner adds scan/metadata cost); quality/guarantee (same decode semantics only); full cost (WAL/cache/write plus reads, not compressed bytes alone); generalization/no-gain (must hold across series, not a hand-picked run).
- Current-upstream reality record: inspected official v2 storage-engine documentation and the official `influxdata/influxdb` upstream repository at cutoff (the repository labels the v1.x/2.x line `master-1.x`; the current default branch is a distinct Arrow/Parquet line).  The source path is a contrary-reality record: no TSM absence is inferred from a branch that does not implement that engine.  This is positive evidence of native shape-aware compression, not an absence claim; no unsupported claim about unimplemented flags is made.
- Direct subtractor: a TSM writer that already selects encoding from timestamp/value shape.  The suggested boundary planner has no frozen atomic action outside that union, so it would currently be a tuning/reordering wrapper.
- Finite fidelity plan / killer: within 72 h, formally enumerate the legal block/codec action vocabulary from the writer and one reader-verified natural series; if every proposed action maps to existing writer encoding/block controls, STOP as direct absorption.  This is finite but does not rescue the present action gap.
- Structural-paper potential: `BELOW_Q2_STOP` on current evidence, because no union-external constructor remains.  Current-evidence readiness: source/documentation route is high; it did not influence the DROP.

## EXT4-EXTENT-PLACEMENT — DROP

- Exact same-object/function: place bytes of an unchanged file tree into a valid ext4 image, with identical file contents and metadata semantics; canonical oracle is ext4 readback plus `e2fsck` legality.
- Named natural structure: directory/package-tree locality and clustered file growth that yield contiguous logical regions.
- Atomic proposed action: jointly select free physical extents for a bounded batch of creates/extends while respecting ext4 allocation and metadata constraints.
- Strongest current union: ext4's native block/inode allocation policy and extent-tree representation already own physical placement; official documentation explicitly states that the allocator seeks within a block group to reduce fragmentation.
- Six-dimensional residual test: decision rule (native allocator owns placement); information (a batch planner would require future requests not available to the online allocator); resource/complexity (batch/global search and migration); quality/guarantee (preserving contents is insufficient if allocation/online guarantees change); full cost (allocation, metadata, writeback and reads); generalization/no-gain (must use untouched real trees).
- Current-upstream reality record: inspected current kernel ext4 overview and upstream `torvalds/linux` `fs/ext4/ext4.h` at cutoff.  The source enumerates mballoc's ordered allocation criteria (`CR_POWER2_ALIGNED` through `CR_ANY_FREE`) and debug controls (`DOUBLE_CHECK`, `EXT4FS_DEBUG`); no absence assertion is used.  The contrary evidence is the documentation's existing locality objective and the current source's native allocation search.
- Direct subtractor: ext4 allocator plus extent-tree merge/placement path.  A bounded offline planner changes the online information condition; a same-information local replacement collapses to allocator policy/tuning.
- Finite fidelity plan / killer: an ext4 image containing a small public package tree could be checked with `e2fsck`, but the first action-contract check fails: either it needs future batch information or is an allocator heuristic.  That is a finite structural killer, not an unrun experiment.
- Structural-paper potential: `BELOW_Q2_STOP`; current-evidence readiness: high for static/oracle definition, irrelevant to DROP.
