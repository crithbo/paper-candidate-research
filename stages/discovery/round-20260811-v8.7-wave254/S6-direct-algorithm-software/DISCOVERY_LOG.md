# Discovery log

## Scope and result

One depth-red-team review was performed for the fixed single-SST RocksDB
BlockBasedTable object. It is independent of the terminal dictionary-sampling
topic. Result: `COMPLETE_ZERO_PROPOSALS`.

## Evidence-led reasoning

1. Official format material establishes a legitimate whole-SST representation
   space: sorted entries can be divided into data blocks; index/filter/meta
   structures and footer handles are regenerated accordingly.
2. Official index and partitioned-index/filter materials show substantial
   existing same-object actions, including distinct restart controls and native
   two-level/partitioned mechanisms.
3. Current release material adds automatic per-index-block index-search choice;
   any candidate must therefore subtract current rather than historical defaults.
4. A joint boundary/restart/index/filter DP is a plausible **conditional** N2
   shape, but the present source and collision record cannot establish it is
   outside the complete current strongest composition.

## Decision

`NOT_ADMITTED_UNFROZEN` rather than DROP for the family. The missing work is
finite and auditable (commit pin, exhaustive action/config union, and direct
same-object collision audit), but not complete in this Discovery package. There
is no brief, no Stage0 request, no experiment, and no performance inference.

## Reproducibility boundary

All cited technical evidence is official RocksDB material or a primary paper.
The proposed natural route and 72h killer are plans only; no corpus was
downloaded and no candidate build or benchmark was run.
