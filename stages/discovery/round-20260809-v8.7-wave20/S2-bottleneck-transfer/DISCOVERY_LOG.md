# Discovery log — DISCOVERY-S2-20260809-V8.7-WAVE20

## Scope and method

- Cutoff: 2026-08-09.  This package used only production discovery v2/v8.1,
  v8.6 fidelity-closure admission, v8.7 CURRENT_UPSTREAM_REALITY_CHECK, and
  baseline-residual-first.  The TLS-blocked two-axis v8.2r2 method was not
  used.
- Scope: same-final-object bottleneck transfer with a non-controller joint
  N1/N2 action.  Existing active, blocked, and terminal objects recorded in
  the registry/plan were excluded before search, including Parquet, LLVM
  bitcode, Git, RocksDB, CVC5, PB, COH, O4, and EGraph.
- Search used primary papers and first-party project documentation/source only.
  No benchmark, implementation, download, or experiment was run.

## Search and subtraction record

| Lineage searched | Fixed final object | Current mechanisms checked | Result |
| --- | --- | --- | --- |
| Wasmtime compile-to-instantiation | A validated WebAssembly module instantiated with the native Wasmtime semantics | AOT/serialized artifacts, compiler cache, parallel compilation, `InstancePre`, copy-on-write heap images, and on-demand/pooling allocation | DROP: the apparent residual is configuration/placement selection over existing points, or a wrapper around the existing instantiation pipeline; it is not a frozen new joint action. |
| GPU communication-overlap scheduling | Distributed accelerator training/inference iteration | FiCCO’s fine-grained DMA computation/communication schedule and FlashOverlap’s signaling/reordering mechanism | DROP: candidate schedules are directly within the current same-object scheduling/action space; a further selector would be a controller. |
| Index-construction to compressed query/access | Persistent index plus native query result | 2025–2026 primary-paper lineage and project sources screened | No retained exact object: no source-supported, union-external atomic action was fixed without changing the index/query guarantee or falling into a format/wrapper mechanism. |

## v8.7 upstream-reality check

The Wasmtime collision is a positive-presence check, not an implementation-absence
claim.  Therefore no unverified absence gap is carried into a proposal.  The
current official source page observed on 2026-08-09 exposes
`InstanceAllocationStrategy::{OnDemand, Pooling}`, `Config::new`,
`parallel_compilation`, the cache field, and the allocation strategy.  It states
that on-demand allocation is the default, while pooling is an available
feature-gated alternative; `Config::new` initializes cache as `None`, allocation
as `OnDemand`, and parallel compilation as enabled outside Miri.  The current
documentation also records feature- and target-dependent defaults.  This checks
both default and non-default configuration paths, so the line cannot be retained
by asserting that allocation, caching, or parallel compilation is absent.

## Decision

`COMPLETE_ZERO_PROPOSALS`.

This is a scientific zero result, not a resource or implementation failure:
the two concrete same-object lines either have their residual directly expressed
by the strongest current union or leave only a selector/wrapper.  The broad
index line never reached a fixed same-object action-gap certificate.  No topic
brief is emitted because none satisfies the admission gates; inventing a
fidelity plan or a Stage-A killer would improperly disguise a controller as N2.

## First-party / primary sources

- Wasmtime, [Fast Instantiation](https://docs.wasmtime.dev/examples-fast-instantiation.html), observed 2026-08-09.
- Wasmtime, [architecture documentation](https://docs.wasmtime.dev/contributing-architecture.html), observed 2026-08-09.
- Wasmtime, [current `config.rs` rendered source](https://docs.wasmtime.dev/api/src/wasmtime/config.rs.html), observed 2026-08-09.
- FiCCO authors, [FiCCO: Fine-Grained Compute-Communication Overlap for Efficient Distributed AI Training](https://arxiv.org/abs/2512.10236), primary preprint, observed 2026-08-09.
- FlashOverlap authors, [artifact record](https://zenodo.org/records/17201531), observed 2026-08-09.
