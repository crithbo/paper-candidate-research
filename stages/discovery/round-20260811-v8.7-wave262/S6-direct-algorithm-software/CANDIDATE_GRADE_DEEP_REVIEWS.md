# Candidate-grade depth red-team

Current Xapian material describes Glass as the current disk backend of B-tree tables, native block sizing, copy-on-write revisions, normal spare-space updates and compacted full-block output. Internal source documentation records `GlassTable`, `GlassCompact`, `compact()` and `split_root()`.

The action-divergence witness is legal but absorbed: native sequential construction and compaction already produce the two page-fill regimes. A proposed whole planner either replays that union or becomes generic B-tree page layout, directly covered by B-tree layout work rather than a Glass-specific guarantee. Finite falsifier: pin source, construct normal and compacted native indexes for one corpus, check stock result digests and full costs, and reject on replay/generic mechanism. Status: `STRUCTURAL_DROP`.
