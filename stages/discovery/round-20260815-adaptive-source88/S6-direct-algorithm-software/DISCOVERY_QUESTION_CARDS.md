# Evidence-qualified question-card audit — Source88 S6

## QC-S88-01 — GNU Coreutils `sort` whole run/merge construction

**Object / oracle.** Fixed input bytes and order, locale, field/key comparator, reverse/stable/unique semantics and command options define the stock `sort` endpoint. The official manual specifies pair comparison in key order, last-resort line comparison, and how `--stable`/`--unique` alter tie behavior. Stock oracle: byte-for-byte output and exit/error behavior. Natural carrier: a versioned public text/CSV corpus.

**Proposed action.** Jointly choose run partitioning, merge fan-in, buffer allocation, temporary placement and worker count to optimize CPU, RSS, temp I/O/bytes and wall time while keeping exact output.

**Current union / subtractor.** Current executable options include sort/merge/check modes, multi-key and stable/unique semantics, `--batch-size` fan-in (default presently 16 but resource-bounded), `--buffer-size`, multiple `--temporary-directory` paths, and `--parallel` (default processor count capped at 8). The manual already states the merge fan-in/memory/temp-I/O tradeoff and parallel-memory tradeoff.

**Action survival.** Changing comparator/key/stable/unique semantics changes the output endpoint. Holding them fixed leaves only run generation, multiway external merge, thread/buffer/fan-in and temporary I/O scheduling—standard external sorting and multiway merge kernels, with the current native controls already exposing the principal cost dimensions. No target-specific semantic structure or non-generic guarantee remains.

**Falsifier / cost / finite route.** A two-equal-key input shows that changing stable/tie treatment changes output. A 72-hour StageA plan would pin a Coreutils release, compare current options against a same-output generic external merge baseline, and reject the topic unless a GNU-sort-specific action/guarantee survives. Full cost: sort CPU/RSS, temp bytes/I/O, output bytes, fan-in/file descriptors, thread cost and wall time. No experiment was run.

**Disposition.** `EXCLUDED_BEFORE_RAW__FIXED_SORT_ENDPOINT_LEAVES_CURRENT_OPTION_GRID_AND_GENERIC_EXTERNAL_SORT_MULTIPLE_MERGE_KERNEL_ONLY`. This is a structural generic-kernel finding, not a resource/result/readiness conclusion.
