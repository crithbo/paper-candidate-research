# Discovery question cards

## QC-S77-01 — GNU sort run/merge construction

- Exact public identity: GNU Coreutils 9.11 `sort`; fixed records/key/locale/stability/options and sorted-output semantics.
- Carrier: `IMPLEMENTATION_CARRIER_ONLY`; a versioned Coreutils test input would be needed for later execution.
- Same-object: same comparator and output ordering; changing sort keys, stability, input distribution assumptions or output format is excluded.
- Hypothesis: METHOD_ALGORITHM/N2, joint run boundaries/merge tree/temp-file placement with an exact output and I/O-memory-time Pareto guarantee.
- Full cost: comparison CPU/RSS, run formation, temporary bytes/I/O, file descriptors, merge passes, output bytes and wall time; no metrics were collected.

### Identity preflight

Bounded exact `registry.yaml`/`plan.md` terms `gnu sort`, `coreutils sort`, `external merge sort`, `sort merge` returned no five-field-exact registered identity. This is `NO_MATCH__NOT_NOVELTY_INFERENCE`. R60 and all listed held/terminal identities, including Mach-O compact-unwind and Go export-data, were not read or reopened.

### Current union, contrary and falsifier

- GNU Coreutils documentation fixes sorting/merging/comparison semantics and documents merge grouping when there are more than `nmerge` inputs, temporary files, `--temporary-directory`, `--parallel`, memory and stable-order controls.
- Thus native legal actions already include run sorting, multi-pass grouped merging, temporary placement and bounded parallelism under a fixed comparator. They do not prove a new residual.
- The direct contrary is the external sorting literature: ELSAR explicitly presents a parallel external sorting constructor; its learned distribution model changes the algorithmic premise and is not evidence of an unoccupied GNU-sort-specific residual.
- Any proposed general run/merge schedule on the fixed object is the generic external merge-sort/multiway merge kernel. A candidate depending on distribution learning, a changed comparator or changing temporary storage policy becomes a different information/cost contract or a controller.
- Cheapest falsifier: instantiate two valid run/merge trees for the same runs and comparator. If the difference is only grouping/merge order, it is generic external sorting; if it relies on different key/output/resource policy, same-object fails.

### Disposition

- RAW_REQUIRED audit: INCOMPLETE — no source-grounded non-generic target-specific discriminator survives.
- `EXCLUDED_BEFORE_RAW__CURRENT_EXTERNAL_SORT_UNION_PLUS_GENERIC_MULTIWAY_MERGE_KERNEL`.
- Structural result only; no scientific inference from absent implementation/result/resources/readiness and no closure queue.
