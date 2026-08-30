# Candidate-grade deep review

## D1 — HTSlib BAI/CSI index construction: `NOT_ADMITTED_UNFROZEN`

**Same-object contract.** Inputs are the same coordinate-sorted BAM/VCF records, BGZF data and region-query calls. Outputs must yield identical stock reader records/ordering and remain within the selected BAI/CSI compatibility contract.

**Current action union.** The formal BAI description already combines hierarchical bins, start/end virtual-offset chunks, joining nearby chunks to reduce seeks, and a linear index that prunes irrelevant chunks. CSI generalizes the bin scheme. These are not missing primitives; `min_shift`, depth and index format are current baseline actions.

**Action-divergence test.** A valid witness must construct two reader-accepted indices that differ by a complete HTSlib-specific algorithm and preserve all region answers, without merely choosing BAI/CSI parameters or a generic interval index. Such a witness and non-generic theorem were not frozen.

**Fair collision and full cost.** Strong subtractors are BAI/CSI/tabix executable configurations and generic hierarchical interval indexes. Latest primary direct construction work and the source-level current HTSlib builder/query/default-nondefault union remain unclosed. Future ledger: index build/query CPU-RSS-I/O latency, index bytes, BGZF virtual-offset accesses and exact result equality.

**Finite killer.** Within 72 hours pin HTSlib/samtools/tabix commits/options, create two native indexes on a small versioned BAM/VCF corpus, verify equal region results, and reject if the claimed action is bin parameter selection, chunk threshold control, external index or a method already in the full union.

**Decision.** `NOT_ADMITTED_UNFROZEN`; no absence claim or resource/readiness inference is made.
