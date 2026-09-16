# Candidate-grade deep review

## RocksDB BlockBasedTable restart/block/index/filter joint construction

**Status:** `NOT_ADMITTED_UNFROZEN` — no `PROPOSE_STAGE0`.

### Current-upstream reality check

The official format documentation confirms that BlockBasedTable is the default
SST format and that sorted KV pairs are partitioned into sequential data blocks;
metadata includes filter, index and other blocks, and the footer points to the
metaindex and index. Official index documentation distinguishes data and index
restart intervals, documents separator selection and two-level index behavior.
Official current release notes further show a current `kAuto` index type that
selects binary versus interpolation search per index block using a configurable
uniformity threshold. Thus an old “fixed index” reading would be false.

However, this desk review did not obtain a frozen source commit and exhaustive
enumeration of every builder/factory/option/configuration pathway. Nor did it
close whether existing partitioned/full filters, index choices, format versions,
or external same-object SST construction tools already express the proposed
joint plan. Accordingly there is no current-implementation absence claim.

### Same-object and strongest-union contract

The strongest comparator is not a single default. It is the current executable
RocksDB builder composition over all compatible table options and native
index/filter variants, with the same sorted KV manifest, comparator, compression
choice, cache/read budget, checksum policy and stock reader. It must be expanded
at a pinned commit to include defaults and non-default options. The desired
planner cannot use changed keys, values, ordering, reader, format, or an
unaccounted external compressor.

### Residual test

The two-output block/restart witness establishes only that multiple legal SST
representations exist. Existing partitioned index/filter construction already
coordinates parts of this design space, and the latest release exposes an
automatic index-selection decision. Without replayable enumeration of that
union and a direct primary-paper collision audit, no claim that a whole-plan DP
is outside the strongest composition is justified.

### Fidelity plan and killer

The finite plan described in `UNIQUE_OPPORTUNITY_FAMILIES.md` is executable in
principle, but it is not yet a closed fidelity plan: it begins with source pin,
producer option audit and same-object collision closure. This is the limited
reason for non-admission, rather than missing implementation, data, resources,
or a negative performance result.

### No-gain / stop predicates

Structural drop is required if a pinned current union can express the complete
joint action, or if all surviving benefit depends on options, changed reader
semantics, a generic solver, or uncharged construction/read cost. This package
does not label the family STOP and does not revive the terminal dictionary
sampling object.
