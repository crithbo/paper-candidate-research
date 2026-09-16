# Xapian Glass closure

The exact object fixes corpus, analyzer, document IDs, terms, positions, values and stock Glass query results. A valid two-layout witness is ordinary incremental construction versus compaction: official Xapian material says normal updates leave spare room, whereas compaction writes sorted source tables with blocks as full as possible.

The full native union includes B-tree block-size and table encoding/compression choices, update behavior, splits/root growth, Glass compaction with `FULL`/legacy `FULLER`, and the postlist/docdata/termlist/position/value constructors. The candidate N2—a finite-state or Pareto joint planner for page fills/splits/posting boundaries—cannot be separated from native bulk construction/compaction without becoming generic B-tree layout. Status: `STRUCTURAL_DROP`; no brief.

A non-executed natural route would use a version-pinned public corpus, stock query/result digest oracle, and full indexing/compaction CPU/RSS/temp/bytes plus open/query/read cost.
