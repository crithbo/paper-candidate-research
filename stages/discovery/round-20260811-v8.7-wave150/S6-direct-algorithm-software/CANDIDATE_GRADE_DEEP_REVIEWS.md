# Candidate-grade deep review — HDF5-CHUNK-INDEX-BOUNDED-RECOURSE-MAINTENANCE

## Same-object contract and current union

Freeze a chunked HDF5 dataset's values, dataspace, chunk dimensions, filter pipeline and HDF5 read results. The public current union is richer than a B-tree: `SINGLE`, implicit/no-index, fixed array, extensible array, v1 B-tree and v2 B-tree, with index choice tied to fixed/unlimited dimensions and extension; early, late and incremental allocation; logical chunk mapping; filter requirements; and file-space effects. Cache choice is intentionally not an action.

For a one-unlimited-dimension append trace, EA is already designed for precisely the claimed primitive mismatch: fixed depth for a given address space, 2--3 file operations per lookup, pre-balanced structure and on-demand instantiated blocks. For multi-unlimited dimensions, current type selection provides BT2. Hence merely substituting an index type is directly absorbed at creation.

## Tentative witness and why it does not admit an action gap

Tentative static witness: a one-unlimited time dimension with a small number of late writes into older chunk coordinates after a long append prefix. Two reader-equivalent physical histories could in principle differ in index metadata and chunk-record placement. But a complete bounded-recourse construction must also define whether and how the current library can legally rewrite the data-layout message, build a different index, relocate all chunk records, preserve filters/free-space state and retain crash-safe/reopen semantics.

This pass has not pinned the exact current `develop` source and all rewrite/conversion paths. Therefore the witness is not an action-divergence certificate. Claiming that native HDF5 lacks conversion would violate current-upstream reality; claiming a new migration without its full action semantics would violate same-object fidelity.

## Natural carrier, oracle, full cost and finite killer

Route: a versioned NASA LAADS VIIRS HDF5 product series, frozen by official product/version/time filename, plus an official append/backfill provenance trace if available. Native oracle: HDF5 reader materialized dataset digest, dataspace/type/filter metadata equality, `h5dump`-level structural comparison and reopen/read checks. Cost: file bytes and free-space metadata, write/read CPU and I/O, RSS, temporary rewrite space, filter CPU, rewrite amplification and time-to-first/read completion.

72-hour killer after any authorized Stage A: pin HDF5 commit/configure flags and a small official natural file/trace; enumerate all index creation/extension/maintenance/rewrite functions; construct the late-write witness; verify reader equivalence; reject if existing union directly performs the same conversion or if any candidate needs a changed format/reader, cache policy, or generic packing. No test was run here.

## Verdict

`NOT_ADMITTED_UNFROZEN`. This is not a negative result, resource limitation, missing implementation, or AI-readiness decision. The finite route is useful but needs exact current source/action closure before it can lawfully become a Stage 0 proposal.
