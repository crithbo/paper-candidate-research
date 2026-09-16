# Question cards — Source58 S2

## QC-S58-01 — BOLT code layout / unwind metadata

- Exact identity: fixed profiled ELF executable; identical instruction-level program behavior and stock unwinding result.
- Problem/RQ: whether a non-generic joint code-and-unwind constructor remains outside BOLT's full native action composition.
- Current source locus: LLVM BOLT documentation; an LLVM BOLT current primary-source search also reports that BOLT updates metadata associated with modified code, including DWARF and Linux ORC unwind information.
- Strongest objection and minimum falsifier: if the proposed joint construction is simply an available BOLT layout action together with its associated metadata update, it is absorbed.
- Full-cost boundary if it survived: profile ingest, binary rewriting CPU/RSS/temp bytes, executable size, stock unwind lookup and execution runtime.
- Audit: RQ complete; `RAW_REQUIRED=INCOMPLETE` because the sole proposed differentiator is directly covered by the current native action. Disposition `EXCLUDED_BEFORE_RAW__CURRENT_UNION_DIRECT_ABSORPTION`.

## QC-S58-02 — OpenMP target mapping / transfer construction

- Exact identity: fixed OpenMP program, target device, host/device values and map/attachment semantics; `libomptarget` is the stock endpoint.
- Current source locus: official LLVM OpenMP runtime document covers libomptarget/plugins, map atomicity, attach behavior, `LIBOMPTARGET_MAP_FORCE_ATOMIC` default `TRUE`, attach policy and other relevant non-default controls.
- Strongest objection/minimum falsifier: if proposed benefit comes from selecting map/attach/atomic policy or a runtime memory-manager threshold, it is a configuration/controller rather than a non-separable constructor.
- Full-cost boundary if it survived: map construction, allocation/copy, launch, synchronization, CPU/RSS/device bytes and end-to-end latency on a versioned OpenMP target corpus.
- Audit: RQ complete; `RAW_REQUIRED=INCOMPLETE`. The specified novelty form is a generic map/config composition, so disposition `EXCLUDED_BEFORE_RAW__GENERIC_CONFIG_CONTROLLER`.

## QC-S58-03 — Level Zero module construction

- Exact identity/RQ: fixed module input, target device and stock module semantic contract; ask about joint module link/load construction.
- Current source locus: official Level Zero v1.29.0 loader release `b77ced6` pins API/header/loader/validation scope, but not one implementation's compilation/linking action.
- Cheapest decisive route: a deterministic single official driver project plus a version-pinned action/config catalogue; this was not precommitted, so no conjunctive source route exists.
- Full-cost boundary if a future correctly scoped RQ existed: module build/link/load CPU/RSS/temp bytes, native binary bytes and first-use latency.
- Audit: RQ complete; `RAW_REQUIRED=INCOMPLETE`; queue status `LOCATOR_ONLY__RQ_BACKLOG`, no scientific negative inference.
