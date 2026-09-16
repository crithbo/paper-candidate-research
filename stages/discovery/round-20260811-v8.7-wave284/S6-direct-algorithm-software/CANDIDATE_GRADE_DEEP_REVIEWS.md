# Candidate-grade deep review

## D1 — LLVM indexed profile layout: `NOT_ADMITTED_UNFROZEN`

**Same-object contract.** Input fixes function/counter/context/value/MemProf facts. Output is an indexed instrumentation profile accepted by the stock reader and inducing the same frozen record queries and PGO-consumer semantics.

**Native-legal action witness.** Two writer constructions can in principle differ in hash-table bucket placement and serialized section offsets while regenerating every header offset and record reference; both must preserve version compatibility and reader acceptance. This is only a layout witness. It neither establishes a non-generic objective nor an N2 guarantee.

**Current strongest union.** LLVM's current docs establish that indexed profiles are produced by `llvm-profdata`, organize functions as an on-disk hash table, include profile-summary/function/MemProf/binary-id/temporal/vtable sections, and retain backward compatibility. The necessary source-level union remains to pin: merge, writer, reader, order, sparse, temporal, MemProf, compression and all options/defaults.

**Collision/residual check.** Current primary direct work on indexed instrumentation-profile constructors has not been fully closed. No claim is made that LLVM lacks a complete layout action or that a target-specific exact/FPT/Pareto/approximation theorem survives direct subtractors.

**Finite fidelity/killer.** In 72 hours, pin one LLVM commit and options; construct two reader-accepted outputs for a small versioned natural profile; compare `llvm-profdata` record output and a frozen PGO consumer; reject if a proposed difference is only generic hashing/compression/delta or current writer union already composes it. Full ledger: build/merge/read/query CPU-RSS-temp, output/delta bytes, consumer result and latency.

**Decision.** `NOT_ADMITTED_UNFROZEN`; unclosed source/collision evidence is not absence, STOP, or a negative inference from unavailable implementation/results/resources.
